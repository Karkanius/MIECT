from PIL import Image, ImageDraw, ImageFont
from PIL import ExifTags
import math
import sys
import ImageEditor.text_write_styles
#coding: utf-8

#text split----------------------------------------------------------------------------------------------------
def text_split(text):
    line1, line2 = "", ""
    words = text.split(" ")
    for i in range(0, len(words)):
        if(i<=len(words)//2):
            line1 = line1+words[i]+" "
        else:
            line2 = line2+words[i]+" "

    return line1, line2

#line redimention----------------------------------------------------------------------------------------------
def line_redm(line, fnt, f, letter_type):
    line_width, line_height = fnt.getsize(line)
    if(line_width > 590): # line bigger than the foto
            #line size redimention
            while(line_width>590):
                f = f*0.95
                fnt = ImageFont.truetype(letter_type, int(f))
                line_width, line_height = fnt.getsize(line)

    return int(f)



#text redimention, borders, write-------------------------------------------------------------------------------
def text_editor(im, text, pos, style):

    width, height = im.size
    margin=25
    #text position in height
    pos = pos.lower()
    if(pos == "center"):
        bottomText = 260 #height//2 + 40
    elif(pos == "top"):
        bottomText = margin + 70
    elif(pos == "mix"):
        bottomText = margin + 60
    else:
        pos="bottom"
        bottomText = height-25 #bottom by default
        spacing=0 #space between lines

   # get a font
    if(style=="meme"):
        f=80
        letter_type = "ImageEditor/fonts/Anton-Regular.ttf"#arial, impact, C:\Windows\Font\Candara, C:\Windows\Font\calibri.ttf, C:\Windows\Font\comic.ttf ;
    else:
        f=40
        letter_type = "ImageEditor/fonts/Ubuntu-Regular.ttf"
        if(style=="solid snap"):
            factor = 0
        else:
            style = "solid snap"
            factor = 0.5
            
    fnt = ImageFont.truetype(letter_type, f)

    #convert to lowercase
    text = text.lower()
    text_width, text_height = fnt.getsize(text)

    line1, line2 = "", ""
    #text bigger than the foto----------------------------------------------------------------------------------
    if(text_width>590):
        line1, line2 = text_split(text)


        line1_width, line1_height = fnt.getsize(line1)

        #LINE1--------------------------------------------------------------

        #redimention line1
        f1 = line_redm(line1, fnt, f, letter_type)
        fnt1 = ImageFont.truetype(letter_type, f1)

        line1_width, line1_height = fnt1.getsize(line1)

        #ascend line1
        if(pos=="bottom"):
            bottomText = bottomText - line1_height - 20#+ (line1_height//2)
        if(pos=="center"):
            bottomText = bottomText - line1_height + 40# - (line1_height//2)

        #black border & write
        if(style=="meme"):
            im =  ImageEditor.text_write_styles.meme(im, margin, bottomText+(line1_height//2), fnt1, line1)
        #black line and write
        else:
            im =  ImageEditor.text_write_styles.snap(im, margin, bottomText-50, fnt1, line1, factor)

        #LINE2--------------------------------------------------------------

        #redimention line2
        f2 = line_redm(line2, fnt, f, letter_type)
        fnt2 = ImageFont.truetype(letter_type, f2)
        line2_width, line2_height = fnt2.getsize(line2)

        #black border & write
        if(style=="meme"):
            if(pos=="mix"):
                spacing = height - (bottomText+line2_height)#(line2_height + margin)
            elif(pos=="bottom"):
                spacing = 20
            else:
                spacing = line1_height//2
            im =  ImageEditor.text_write_styles.meme(im, margin, bottomText+line2_height+spacing, fnt2, line2)
        #black line and write
        else:
            position =  bottomText-50
            if(pos=="mix"):
                spacing = height-margin-40-position
            else:
                spacing = line2_height + 4
            im =  ImageEditor.text_write_styles.snap(im, margin, position+spacing, fnt2, line2, factor)#line2_height+4 pq da shape

    #text fits the foto----------------------------------------------------------------------------------
    else:
        if(pos=="mix"):
            line1, line2 = text_split(text)

            line1_width, line1_height = fnt.getsize(line1)

            line2_width, line2_height = fnt.getsize(line2)

            if(style=="meme"):
                spacing = height -  margin
                #black border & write
                im =  ImageEditor.text_write_styles.meme(im, margin, bottomText+(line1_height//2), fnt, line1)
                im =  ImageEditor.text_write_styles.meme(im, margin, spacing, fnt, line2)
            else:
                spacing = height - (line2_height + margin)
                im =  ImageEditor.text_write_styles.snap(im, margin, bottomText, fnt, line1, factor)
                im =  ImageEditor.text_write_styles.snap(im, margin, spacing, fnt, line2, factor)

        else:
            if(style=="meme"):
                #black border & write
                im =  ImageEditor.text_write_styles.meme(im, margin, bottomText, fnt, text)
            else:
                im =  ImageEditor.text_write_styles.snap(im, margin, bottomText-50, fnt, text, factor)
    return im
