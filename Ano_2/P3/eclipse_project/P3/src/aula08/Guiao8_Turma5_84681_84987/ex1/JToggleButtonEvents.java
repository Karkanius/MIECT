package G8.ex1;

//JToggleButtonEvents.java
//

import java.awt.*;
import java.awt.event.*;

public class JToggleButtonEvents extends Frame implements WindowListener,ActionListener{
//public static void main(String[] args) {
// JToggleButton jtb = new JToggleButton("Press Me");
//
// jtb.addActionListener(new ActionListener( ) {
//   public void actionPerformed(ActionEvent ev) {
//     System.out.println("ActionEvent!");
//   }
// });
// jtb.addItemListener(new ItemListener( ) {
//   public void itemStateChanged(ItemEvent ev) {
//     System.out.println("ItemEvent!");
//   }
// });
// jtb.addChangeListener(new ChangeListener( ) {
//   public void stateChanged(ChangeEvent ev) {
//     System.out.println("ChangeEvent!");
//   }
// });
// JFrame f = new JFrame( );
// f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
// Container c = f.getContentPane( );
// c.setLayout(new FlowLayout( ));
// c.add(jtb);
// f.pack( );
// f.setVisible(true);
//}
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TextField text = new TextField(20);
     Button b;
     private int numClicks = 0;

     public static void main(String[] args) {
    	 JToggleButtonEvents myWindow = new JToggleButtonEvents("My first window");
             myWindow.setSize(350,100);
             myWindow.setVisible(true);
     }

     public JToggleButtonEvents(String title) {

             super(title);
             setLayout(new FlowLayout());
             addWindowListener(this);
             b = new Button("Click me");
             add(b);
             add(text);
             b.addActionListener(this);
     }

     public void actionPerformed(ActionEvent e) {
             numClicks++;
             text.setText("Button Clicked " + numClicks + " times");
     }

     public void windowClosing(WindowEvent e) {
             dispose();
             System.exit(0);
     }

     public void windowOpened(WindowEvent e) {}
     public void windowActivated(WindowEvent e) {}
     public void windowIconified(WindowEvent e) {}
     public void windowDeiconified(WindowEvent e) {}
     public void windowDeactivated(WindowEvent e) {}
     public void windowClosed(WindowEvent e) {}
}
