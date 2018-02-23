package aula08.prob02;

import javax.swing.*;
import javax.swing.tree.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;

public class Win1 extends JFrame {
	
	private JPanel painel = new JPanel();
	private PanelImage imagemPainel;
	private JButton buttonOpen = new JButton("Open BMP File Options");
	private File rootFile = new File("C:\\Users\\Paulo Vasconcelos\\eclipse-workspace\\P3");
	private JTree fileTree = CreateTree(rootFile);
	

		  
	MouseAdapter RatinhoDoDETI = new MouseAdapter() {
		
		@Override
		public void mouseClicked(MouseEvent e) {
			
			Object src = e.getSource();
			if (src.equals(fileTree)) {
				TreePath tp = fileTree.getPathForLocation(e.getX(), e.getY());
				if (tp != null) {
					System.out.println(tp.toString());
					//imagemPainel = new PanelImage();
				}
			}
			
		}
	};

	private static final long serialVersionUID = 1L;


	public static void main (String [] args) {
		new Win1();	
	}
	
	
	public Win1() {
		
		//FRAME
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(1280,720);
		
		//PAINEL
		painel.setBackground(Color.white);
		painel.setLayout(new BorderLayout());
		
		//TREE
		painel.add(fileTree, BorderLayout.WEST);
		fileTree.addMouseListener(RatinhoDoDETI);

		
		//IMAGE MENU BUTTON
		painel.add(buttonOpen, BorderLayout.SOUTH);
		buttonOpen.addMouseListener(RatinhoDoDETI);
		
		this.setContentPane(painel);
		this.setVisible(true);
		
	}
	
	
	public JTree CreateTree(File rootFile) {
		
		//Root Node
        DefaultMutableTreeNode rootNode = new DefaultMutableTreeNode(rootFile.getName());
        
        //Child Nodes
        JTree tree = new JTree(rootNode); 
        
        File[] childNodes = rootFile.listFiles();
        for(File file: childNodes){
        	int i = file.getName().lastIndexOf('.');
        	if (i > 0) {
        	    String extension = file.getName().substring(i+1);
        	    if(file.getName().substring(i+1).equals("bmp"))
        	    	rootNode.add(new DefaultMutableTreeNode(file));
            }
        }
        
        return tree;
	}
	
	
	
}