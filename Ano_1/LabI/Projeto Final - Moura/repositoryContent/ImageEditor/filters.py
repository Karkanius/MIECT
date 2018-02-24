#encoding=utf-8

import os
from PIL import Image
from ImageEditor.effects import *

##################################################
### Filters functions - compound basic effects ###
##################################################

def old_photo(im):
    """Option 21 - Creates old and aged photo"""
    width, height = im.size

    # apply sepia to im
    im = sepia(im)

    # inrease contrast to compensate blend (maintains yellowish feel)
    im = saturation(im, 1.1)

    # apply 1 px radius blur (old photos where not that sharp)
    im = blur(im, 2)

    # open old photo texture
    im2 = Image.open("ImageEditor/textures/texture_old_film.jpg")

    # blend im and im2
    im = blend(im, im2, 0.8)
    return im


def pencil_draw(im):
    """Option 22 - Creates pencil drawn image"""
    width, height = im.size

    # apply black and white and blur to image
    im = black_white(im)
    im = blur(im, 2)

    # get edges to reinforce final drawing edges
    new_im = is_edge(im, 22)

    # open pencil drawing textures
    # hard pencil texture
    im2 = Image.open("ImageEditor/textures/texture_pencil1.jpg")
    if width < height:
        im2 = rotate(im2)
    # soft pencil texture
    im3 = Image.open("ImageEditor/textures/texture_pencil2.jpg")
    if width < height:
        im3 = rotate(im3)

    # overlap edge with soft pencil texture
    new_im = overlap_edge(im2, new_im)

    # blend above texture with hard pencil to soften edges
    new_im = blend(new_im, im3, 0.7)

    # blend with image
    im = blend(im, new_im, 0.7)

    return im


def color_draw(im):
    """Option 23 - Creates pencil drawn image"""
    width, height = im.size

    # soft pencil texture circular motion
    im2 = Image.open("ImageEditor/textures/texture_pencil4.jpg")
    if width < height:
        im2 = rotate(im2)
    # soft pencil texture random 
    im3 = Image.open("ImageEditor/textures/texture_pencil2.jpg")
    if width < height:
        im3 = rotate(im3)
    # hard pencil texture diagonal
    im4 = Image.open("ImageEditor/textures/texture_pencil1.jpg")
    if width < height:
        im4 = rotate(im4)

    #reduce color palette of image (like pencil coloring)
    im = change_3bpp(im)
    new_im2 = Image.new(im.mode, im.size)
    new_im3 = Image.new(im.mode, im.size)
    new_im4 = Image.new(im.mode, im.size)

    # blend textures with color (creates sharp colored scribles)
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            p2 = im2.getpixel( (x,y) )
            if p2[0]+p2[1]+p2[2] < 550:
                new_im2.putpixel( (x,y), blend_pixel(im, im2, x, y, 0.7))
            else:
                new_im2.putpixel( (x,y), (255, 255, 255) )

    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            p3 = im3.getpixel( (x,y) )
            if p3[0]+p3[1]+p3[2] < 550:
                new_im3.putpixel( (x,y), blend_pixel(im, im3, x, y, 0.7))
            else:
                new_im3.putpixel( (x,y), (255, 255, 255) )

    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            p4 = im4.getpixel( (x,y) )
            if p4[0]+p4[1]+p4[2] < 550:
                new_im4.putpixel( (x,y), blend_pixel(im, im3, x, y, 0.7))
            else:
                new_im4.putpixel( (x,y), (255, 255, 255) )

    # reduce color palette even further for 2 bottom layers (this will create a bit more color depth)
    new_im2 = change_2bpp(new_im2)
    new_im3 = change_2bpp(new_im3)

    # blend the two soft pencil textures
    new_im = blend(new_im2, new_im3, 0.5)

    # overlap hard pencil texture (mantains color better than a second blending)
    new_im = overlap_edge(new_im, new_im4)

    return new_im


def circles_black(im):
    """Option 24 - Creates mosaic and apply dotted grid"""

    # resize to create pixelated image
    im = resize_wh(im, 58, 44) 
    # resize to math pixel blocks size to dots size
    im = resize_nearest(im, 638, 484)
    # call function to draw dots
    im = draw_dots(im, 0)
    # resize to mandatory project image size
    im = resize_wh(im, 640, 480)

    return im


def circles_white(im):
    """Option 25 - Creates mosaic and apply dotted grid"""

    # resize to create pixelated image
    im = resize_wh(im, 58, 44)
    # resize to math pixel blocks size to dots size
    im = resize_nearest(im, 638, 484)
    # call function to draw dots
    im = draw_dots(im, 255)
    # resize to mandatory project image size
    im = resize_wh(im, 640, 480)

    return im


def cartoon(im):
    """Option 27 - Not used in project. The objective was to crete a cartoonized photo by forcing similar color to same palette color"""
    """At the moment teh effect is very similar to decreasing bpp. Further ideas include working im "HSV" mode"""

    # Create new image with edges only (in black)
    new_im = Image.new(im.mode, im.size)
    new_im = is_edge(im, 17)
    width, height = new_im.size

    # creates new color palette evenly distributed for all values
    cartoon_palette = [(255,255,255)]
    diff = 25
    x, y, z = 0, 0, 0
    while x < 255:
        y = 0
        while y < 255:
            z = 0
            while z < 255:
                cartoon_palette.append((x, y, z))
                z = z+diff
            y = y+diff
        x = x+diff
    
    # personalized palettes
        # extended cartoon
    #cartoon_palette = [(0,0,0),(255,255,255),(29,66,138),(165,74,62),(194,107,41),(122,164,221),(249,166,148),(254,182,114),(178,128,44),(189,107,41),(147,147,54),(29,79,145),(39,153,137),(146,27,75),(95,33,103),(255,211,129),(254,182,114),(230,234,124),(91,169,221),(97,216,209),(241,123,163),(185,132,194),(0,118,192),(299,106,84),(245,130,32),(253,183,29),(245,130,32),(205,220,41),(30,118,189),(31,187,177),(207,25,113),(131,55,149)]
        # pastel
    #cartoon_palette = [(0,0,0),(255,255,255),(141,182,199),(193,179,142),(200,198,191),(202,159,146),(249,205,151),(227,217,176),(177,194,122),(178,226,137),(81,192,191),(89,173,208),(112,149,225),(159,163,227),(201,147,212),(209,141,178),(241,195,208)]
        # personal picks of multiple tone variants
    #cartoon_palette = [(0,0,0),(255,255,255),(202,0,42),(255,17,0),(25,66,0),(216,31,42),(252,61,50),(255,88,79),(219,78,78),(226,110,110),(241,179,179),(219,48,130),(255,8,127),(255,56,152),(255,113,181),(228,35,157),(231,161,176),(219,119,141),(251,212,185),(251,294,153),(254,168,119),(255,195,77),(255,159,0),(255,129,0),(255,43,0),(255,211,25),(254,226,62),(255,255,0),(18,173,42),(99,209,62),(144,245,0),(18,230,3),(185,255,77),(15,245,145),(53,98,68),(75,140,97),(13,26,129),(51,64,189),(0,75,255),(0,0,255),(150,177,210),(47,86,233),(45,100,245),(47,141,255),(51,171,249),(52,204,255),(110,255,255),(48,129,238),(110,193,248),(84,22,180),(112,39,195),(185,76,225),(228,0,224),(236,71,233),(244,147,242),(126,46,31),(152,80,60),(213,196,161),(185,156,107),(133,87,35),(87,65,47),(121,96,76),(219,202,105),(64,79,36),(102,141,60),(234,195,184),(217,168,143),(240,211,165),(219,173,114),(237,0,38),(91,91,91),(212,212,212),(255,208,141)]

    # list of tuples of pixels
    im_list = []
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            im_list.append((p[0],p[1],p[2]))
    print ("Done - Creating list of image pixels")

    # list for new image pixels
    new_im_list = []

    for i in range(len(im_list)): # for each pixel in original list

        # find the predominant channel (highest value) in each pixel, and order them
        r = im_list[i][0]
        g = im_list[i][1]
        b = im_list[i][2]
        rgb = cartoon_palette[0]
        big1 = 0
        big2 = 1
        big3 = 2
        if r >= b and b >= g:
            big2 = 2
            big3 = 1
        elif g >= r and r >= b:
            big1 = 1
            big2 = 0
        elif g >= b and b >= r:
            big1 = 1
            big2 = 2
            big3 = 0
        elif b >= r and r >= g:
            big1 = 2
            big2 = 0
            big3 = 1
        elif b >= g and g >= r:
            big1 = 2
            big3 = 0

        # inicial diference between original pixel and palette alternatives for substituting its color, to be decreased when comparing ahead
        diff1 = 255
        diff2 = 255
        diff3 = 255

        # loop given pixel to compare with every color in palette
        for j in range(len(cartoon_palette)):
            # find the most similar color and append it to new image list
            if (abs(im_list[i][big1]-cartoon_palette[j][big1]+im_list[i][big2]-cartoon_palette[j][big2])<=diff1+diff2 and abs(im_list[i][big1]-cartoon_palette[j][big1]) <= diff1) and (abs(im_list[i][big2]-cartoon_palette[j][big2]) <= diff2) and (abs(im_list[i][big3]-cartoon_palette[j][big3]) <= diff3):
                diff1 = abs(im_list[i][big1]-cartoon_palette[j][big1])
                diff2 = abs(im_list[i][big2]-cartoon_palette[j][big2])
                diff3 = abs(im_list[i][big3]-cartoon_palette[j][big3])
                rgb = cartoon_palette[j]
        new_im_list.append(rgb)

    # create new image from new image list
    i=0
    while i<len(new_im_list):
        for x in range(width):
            for y in range(height):
                im.putpixel( (x,y), (new_im_list[i]))
                i = i+1
    print ("Done - Putting pixels to new image")

    return new_im
            