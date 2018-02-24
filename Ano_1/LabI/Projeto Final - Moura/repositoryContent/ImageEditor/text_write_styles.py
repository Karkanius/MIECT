# -*- coding: cp1252 -*-
from PIL import Image, ImageDraw, ImageFont
#from PIL import ExifTags
#coding: utf-8

#black border & write-----------------------------------------------------------------------------------------
def meme(im, margin, bottomText, fnt, text):
    #PIL.ImageDraw.Draw.text(xy, text, fill=None, font=None, anchor=None, spacing=0, align="left")

    d = ImageDraw.Draw(im)
    d.text((margin+1,bottomText-101), text, fill=(0, 0,0, 255), font=fnt)
    d.text((margin-1,bottomText-101), text, fill=(0, 0,0, 255), font=fnt)
    d.text((margin+1,bottomText-100), text, fill=(0, 0,0, 255), font=fnt)
    d.text((margin-1,bottomText-100), text, fill=(0, 0,0, 255), font=fnt)
    d.text((margin  ,bottomText-99 ), text, fill=(0, 0,0, 255), font=fnt)
                        
    d.text((margin,bottomText-100), text, fill=(255, 255, 255, 255), font=fnt)

    return im

#black line---------------------------------------------------------------------------------------------------
def intensity(im, shape_dim, bottomText, factor):
    new_im = im.convert("YCbCr")
    width, height = shape_dim

    #print bottomText, height, bottomText-height
    end = bottomText+height+2
    if(end>480):
        end=480
    print (end)
    for x in range(width):
        for y in range(bottomText-2, bottomText+height+2):
            pixel = new_im.getpixel((x, y))
            py = min(255, int(pixel[0] * factor))
            new_im.putpixel((x, y), (py, pixel[1], pixel[2]))
    #new_im.show()
    new_im = new_im.convert("RGB")
    return new_im

#black line & write-----------------------------------------------------------------------------------------
def snap(im, margin, bottomText, fnt, text, factor):

    im_width, im_height = im.size
    text_width, text_height = fnt.getsize(text)


    shape_dim = (int(im_width) , int(text_height) )

    im = intensity(im,shape_dim, bottomText, factor)
        
    d = ImageDraw.Draw(im)

    d.text((margin,bottomText), text, fill=(255, 255, 255, 1), font=fnt)# don't know why the letters are pink
    
    return im
