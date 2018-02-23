package aula07.prob02;
import java.io.*;

public class Apl2 {

	public static void main(String[] args) throws FileNotFoundException, IOException {
		
		String name = "Figura";
		File file = new File ("Figura.bmp");
		RandomAccessFile ra = new RandomAccessFile(file, "r");
		Bitmap bmp = new Bitmap (ra);
		ra.close();
		
		saveAsRawFile(name, bmp);
		resize(file, bmp);

	}
	
	
	public static void saveAsRawFile(String name, Bitmap bitmap) throws FileNotFoundException, IOException {
		
		RandomAccessFile ra = new RandomAccessFile(name+".raw","rw");
		ra.seek(0);
		ra.write(bitmap.data);
		ra.close();
		
	}
	
	
	public static void resize (File file, Bitmap bitmap) throws FileNotFoundException, IOException {
        
        RandomAccessFile ra = new RandomAccessFile(file, "rw");
        int imgHeight = bitmap.bitmapInfoHeader.height/2;
        int imgWidth = bitmap.bitmapInfoHeader.width/2;
        
        Pixel[][] original = new Pixel[bitmap.bitmapInfoHeader.width][bitmap.bitmapInfoHeader.height];
        Pixel[][] newImg = new Pixel[imgWidth][imgHeight];
        
        ra.seek(0);
        ra.writeByte((short) bitmap.bitmapFileHeader.type);
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapFileHeader.offBits+imgHeight*imgWidth*bitmap.bitmapInfoHeader.bitCount/8));
        ra.writeShort(Short.reverseBytes(bitmap.bitmapFileHeader.reserved1));
        ra.writeShort(Short.reverseBytes(bitmap.bitmapFileHeader.reserved2));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapFileHeader.offBits));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapInfoHeader.size));
        ra.writeInt(Integer.reverseBytes(imgWidth));
        ra.writeInt(Integer.reverseBytes(imgHeight));
        ra.writeShort(Short.reverseBytes(bitmap.bitmapInfoHeader.planes));
        ra.writeShort(Short.reverseBytes(bitmap.bitmapInfoHeader.bitCount));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapInfoHeader.compression));
        ra.writeInt(Integer.reverseBytes(0));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapInfoHeader.xPelsPerMeter));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapInfoHeader.yPelsPerMeter));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapInfoHeader.clrUsed));
        ra.writeInt(Integer.reverseBytes(bitmap.bitmapInfoHeader.clrImportant));
        
        if (bitmap.rgbQuad != null)
                if (bitmap.rgbQuad.length>0)
                        ra.write(bitmap.rgbQuad);
        
        for(int i=0; i<bitmap.bitmapInfoHeader.height; i++) {
        	for(int j=0; j<bitmap.bitmapInfoHeader.width; j++) {
        		short b = Short.reverseBytes(ra.readShort());
    			short g = Short.reverseBytes(ra.readShort());
    			short r = Short.reverseBytes(ra.readShort());
    			original[j][i] = new Pixel(r,g,b);
        	}
        }
        
        for(int i=0; i<imgHeight; i++) {
        	for(int j=0; j<imgWidth; j++) {
        		newImg[j][i] = original[2*j][2*i];
        	}
        }
        
        
        ra.seek(bitmap.bitmapFileHeader.offBits);
        
        for(int i=0; i<imgHeight; i++) {
        	for(int j=0; j<imgWidth; j++) {
        		ra.writeShort(Short.reverseBytes(newImg[j][i].getBlue()));
        		ra.writeShort(Short.reverseBytes(newImg[j][i].getGreen()));
        		ra.writeShort(Short.reverseBytes(newImg[j][i].getRed()));
        	}
        }
        
        ra.close();
	
	}

}