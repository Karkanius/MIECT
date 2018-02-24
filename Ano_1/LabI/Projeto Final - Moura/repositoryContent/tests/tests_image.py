#encoding=utf-8

import os
from PIL import Image
import effects
import filters 

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

#FILTERS-----------------------------------------------------------------------------------
def test_OldFoto():
    im = Image.open("ribeira_porto.png")
    im = filters.old_photo(im)
    
    im2 = Image.open("testOldFoto.png")

    assert isSameIm(im, im2)

def test_PencilDraw():#erro
    im = Image.open("ribeira_porto.png")
    im = filters.pencil_draw(im)
    im.save("testPencilDraw.png", quality = 100)
    im2 = Image.open("testPencilDraw.png")

    assert isSameIm(im, im2)

def test_ColorDraw():#erro
    im = Image.open("ribeira_porto.png")
    im = filters.color_draw(im)
    im.save("testColorDraw.png", quality = 100)
    im2 = Image.open("testColorDraw.png")

    assert isSameIm(im, im2)

def test_Circles():
    im = Image.open("ribeira_porto.png")
    im = filters.circles(im)
    im.save("testCircles.png", quality = 100)
    im2 = Image.open("testCircles.png")

    assert isSameIm(im, im2)

def test_Cartoon():
    im = Image.open("ribeira_porto.png")
    im = filters.cartoon(im)
    im.save("testCartoon.png", quality = 100)
    im2 = Image.open("testCartoon.png")

    assert isSameIm(im, im2)


    
    
