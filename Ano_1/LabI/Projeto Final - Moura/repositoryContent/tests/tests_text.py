# encoding=utf-8

# Performs several unitary tests on modules imageEditor, imageMenu, effects,
# filters, memes, etc...
# Usage: python -m pytest -v tests.py.

import pytest
from PIL import Image, ImageDraw, ImageFont
import textEditor, text_write_styles

def isSameIm(im1, im2):
    im1_w, im1_h = im1.size
    im2_w, im2_h = im2.size
    isEqual = True
    if(im1_w == im2_w and im1_h == im2_h):
        for x in range(im1_w):
            for y in range(im1_h):
                pixel1 = im1.getpixel((x, y))
                pixel2 = im2.getpixel((x, y))
                if(not(pixel1 == pixel2)):
                    isEqual = False
    return isEqual

#TEXT EDITOR-----------------------------------------------------------------------------------------
def test_TextSplit():
    print("testing text split without space")
    line1, line2 = textEditor.text_split("hello")
    assert line1 == "he"
    assert line2 == "llo"
    print("testing text split with space")
    line3, line4 = textEditor.text_split("hello world")
    print (line3, line4)
    assert line3 == "hello world "
    assert line4 == ""

def test_LineRedm():
    print("testing line redimension")
    line = "otorrinolaringologista"
    f = 80
    letter_type = "Anton-Regular.ttf"
    fnt = ImageFont.truetype(letter_type, f)
    f1 = textEditor.line_redm(line, fnt, f, letter_type)
    f2 = 65
    assert f1 == f2

#im1.save("i3_testSnap_bottom.png", quality = 100)    
def test_TextEditor_Meme_top():
    im = Image.open("i3.png")
    text = "hello"
    im1 = textEditor.text_editor(im, text, "top", "meme")
    im2 = Image.open("i3_testMeme_top.png")
    
    assert isSameIm(im1, im2)

def test_TextEditor_Meme_center():
    im = Image.open("i3.png")
    text = "hello"
    im1 = textEditor.text_editor(im, text, "center", "meme")
    im2 = Image.open("i3_testMeme_center.png")
    
    assert isSameIm(im1, im2)
    
def test_TextEditor_Meme_bottom():
    im = Image.open("i3.png")
    text = "hello"
    im1 = textEditor.text_editor(im, text, "bottom", "meme")
    im2 = Image.open("i3_testMeme_bottom.png")
    
    assert isSameIm(im1, im2)

def test_TextEditor_Meme_mix():
    im = Image.open("i3.png")
    text = "such a beautifull woman"
    im1 = textEditor.text_editor(im, text, "mix", "meme")
    im2 = Image.open("i3_testMeme_mix.png")
    
    assert isSameIm(im1, im2)

def test_TextEditor_Snap_top():
    im = Image.open("i3.png")
    text = "hello"
    im1 = textEditor.text_editor(im, text, "top", "snap")
    im2 = Image.open("i3_testSnap_top.png")
    
    assert isSameIm(im1, im2)

def test_TextEditor_Snap_center():
    im = Image.open("i3.png")
    text = "hello"
    im1 = textEditor.text_editor(im, text, "center", "snap")
    im2 = Image.open("i3_testSnap_center.png")
    
    assert isSameIm(im1, im2)

def test_TextEditor_Snap_bottom():
    im = Image.open("i3.png")
    text = "hello"
    im1 = textEditor.text_editor(im, text, "bottom", "snap")
    im2 = Image.open("i3_testSnap_bottom.png")
    
    assert isSameIm(im1, im2)

def test_TextEditor_Snap_mix():
    im = Image.open("i3.png")
    text = "this is a realy beautifull picture of a beautifull woman"
    im1 = textEditor.text_editor(im, text, "mix", "snap")
    im2 = Image.open("i3_testSnap_mix.png")
    
    assert isSameIm(im1, im2)
#TEXT WRITE STYLES-----------------------------------------------------------------------------------

def test_meme():
    im = Image.open("i3.png")
    margin = 25
    bottomText = 95
    fnt = ImageFont.truetype("ImageEditor/fonts/Anton-Regular.ttf", 80)
    text = "hello"

    im1 = text_write_styles.meme(im, margin, bottomText, fnt, text)
    im2 = Image.open("i3_testmeme.png")
    
    assert isSameIm(im1, im2)

# erro isSameIm(<PIL.Image.Image image mode=RGB size=640x480 at 0x1E5430E9400>, <PIL.JpegImagePlugin.JpegImageFile image mode=RGB size=640x480 at 0x1E5430E9550>)
def test_intensity():
    im = Image.open("i3.png")
    bottomText = 95
    shape_dim = (640,37)
    im1 = text_write_styles.intensity(im, shape_dim, bottomText)
    im2 = Image.open("i3_testintensity.png")
    
    assert isSameIm(im1, im2)
    

def test_snap():
    im = Image.open("i3.png")
    margin = 25
    bottomText = 95
    fnt = ImageFont.truetype("ImageEditor/fonts/Ubuntu-Regular.ttf", 40)
    text = "hello"

    im1 = text_write_styles.snap(im, margin, bottomText, fnt, text)
    im2 = Image.open("i3_testsnap.png")
    
    assert isSameIm(im1, im2)

#TEXT EDITOR MAIN-----------------------------------------------------------------------------------

    
