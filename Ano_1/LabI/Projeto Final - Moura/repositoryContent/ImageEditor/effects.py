#encoding=utf-8

from PIL import Image
import math

#####################################
### Basic Image Edition Functions ###
#####################################

""" This file contains all the effects that apply one single visual change to the image.
    The objective is to make as much effects as possible by manipulationg pixels directly,
    avoiding as much as possible to use Pillow library of custom effects.
    Still, Pillow functions will be left commented for comparison purposes."""


def thumbnail(im):
    """Auxiliar function - creates 50x50 thumbnail with top and bottom transparent margins"""
    im = resize_wh(im,50,38)
    im.convert("RGBA")
    new_im = Image.new("RGBA", (50,50))
    new_im.putalpha(0)
    width, height = new_im.size
    for x in range(width):
        for y in range(height):
            if y > 6 and y < 45:
                p = im.getpixel( (x,y-7) )
                new_im.putpixel( (x,y), (p[0], p[1], p[2]) )
    return new_im


def standard_format(im, option):
    """Auxiliar function - resizes and crops all received images to meet project specifications (using biggest area possible) - 640x480"""
    width, height = im.size
    # if image as the correct ratio, keeps same orientation
    if option == 1:
        if width > height:
            dimension = (640, 480)
        else:
            dimension = (480, 640)
        im = im.resize(dimension, resample = Image.LANCZOS)
        im.convert("RGB")
        return im
    # if image has incorrect ratio, keeps same orientation
    if option == 2:
        ratio = float(width/height)
        if (width >= height):
            if ratio < float(4/3):
                new_height = width*3/4
                im = crop(im, 0, int((height-new_height)/2), width, int((height+new_height)/2))
            if ratio > float(4/3):
                new_width = height*4/3
                im = crop(im, int((width-new_width)/2), 0, int((width+new_width)/2), height)
            im = resize_wh(im, 640, 480)
        else:
            if ratio < float(3/4):
                new_height = width*4/3
                im = crop(im, 0, int((height-new_height)/2), width, int((height+new_height)/2))
            if ratio > float(3/4):
                new_width = height*3/4
                im = crop(im, int((width-new_width)/2), 0, int((width+new_width)/2), height)
            im = resize_wh(im, 480, 640)
        return im


def resize_wh(im, width, height):
    """Auxiliar function - Resizes image to new width and height. Avoids calculating dimention in each effect"""
    dimension = ( int(width), int(height) )
    im = im.resize(dimension, resample = Image.LANCZOS)
    return im


def resize_nearest(im, width, height):
    """Auxiliar function - Resizes image to new width and height."""
    dimension = ( int(width), int(height) )
    im = im.resize(dimension, resample = Image.NEAREST)
    return im


def crop(im, left, top, right, bottom):
    """Auxiliar function - Crops image in box in given coordinates"""
    # Pillow alernative: im = im.crop( (left, upper, right, lower) )
    width, height = im.size
    new_width = right - left
    new_height = bottom - top
    new_im = Image.new(im.mode, (new_width, new_height))
    for x in range(left, right):
        for y in range(top, bottom):
            p = im.getpixel( (x,y) )
            new_im.putpixel( (x-left, y-top), (p[0], p[1], p[2]) )
    return new_im


def rotate(im):
    """Option 2 - Rotates image counterclockwise the given degrees."""
    # Pillow alernative: im = im.rotate(angle, resample = Image.LANCZOS, expand = True)
    width, height = im.size
    new_im = Image.new("RGB", (height, width))
    for x in range(width):
        for y in range (height):
            p = im.getpixel( (x,y) )
            new_im.putpixel( (height-y-1,x), (p[0], p[1], p[2]) )
    return new_im


def contrast(im, factor):
    """Option 3 and 4 - Changes contrast."""
    #new_im = Image.new("YCbCr", im.size) # this won't work
    im.convert("YCbCr")
    new_im = im
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            py = min(255,int((p[0] - 128) * factor) + 128)
            pb = p[1]
            pr = p[2]
            new_im.putpixel( (x,y), (py, pb, pr) )
    new_im = new_im.convert("RGB")
    return new_im


def saturation(im, factor):
    """Option 5 and 6 - Brighten or darkens image."""
    #new_im = Image.new("YCbCr", im.size) # this won't work
    im.convert("YCbCr")
    new_im = im
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            py = p[0]
            pb = min(255,int((p[1] - 128) * factor) + 128)
            pr = min(255,int((p[2] - 128) * factor) + 128)
            new_im.putpixel( (x,y), (py, pb, pr) )
    im.convert("RGB")
    new_im = new_im.convert("RGB")
    return new_im


def luminosity(im, factor):
    """Option 7 and 8 - Brighten or darkens image."""
    #new_im = Image.new("YCbCr", im.size) # this won't work
    im.convert("YCbCr")
    new_im = im
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            py = min(255, int(p[0] * factor)) # [0] is the Y channel
            new_im.putpixel( (x,y), (py, p[1], p[2]) )
    new_im = new_im.convert("RGB")
    return new_im


def change_2bpp(im):
    """Option 9 - Chages bpp. At the moment only to 4bpp."""
    new_im = Image.new(im.mode, im.size)
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            r = p[0] & 0b11000000
            g = p[1] & 0b11000000
            b = p[2] & 0b11000000
            new_im.putpixel( (x,y), (r,g,b) )
    return new_im


def change_3bpp(im):
    """Auxiliar function - Chages bpp. At the moment only to 4bpp."""
    new_im = Image.new(im.mode, im.size)
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            r = p[0] & 0b11100000
            g = p[1] & 0b11100000
            b = p[2] & 0b11100000
            new_im.putpixel( (x,y), (r,g,b) )
    return new_im


def gaussian_grid(radius):
    """Auxiliar function - Creates kernel table to calculate Gaussian Blur in Blur function"""
    """ website used to understand concept of gaussian kernel table: http://homepages.inf.ed.ac.uk/rbf/HIPR2/gsmooth.htm"""
    diameter = 2*radius +1

    # Creates empty 2D list/table to cuse as convolution table with image pixels
    kernel = []
    for i in range(diameter):
        kernel.append([])

    # Calculates gaussian values with distance to the center of kernel (sigma = radius, for simplicity)
    # Optmized only to radiu 2 blur (5x5 kernel box), different sigma values woud be needed to adjust
    total = 0 # used to normalize values in the end
    xtemp = 0 # use to "change" indexes to [0 - upto - radius - downto - 0]
    for x in range(diameter):
        if x <= radius:
            ytemp = 0
            for y in range(diameter):
                if y <= radius:
                    kernel[x].append(round((1/(2*math.pi*2))*(math.e**((math.pow(xtemp,2)+math.pow(ytemp,2))/(2*2))),2))
                    total = total + kernel[x][y]
                    if ytemp < radius:
                        ytemp = ytemp +1
                if y > radius:
                    ytemp = ytemp -1
                    kernel[x].append(round((1/(2*math.pi*2))*(math.e**((math.pow(xtemp,2)+math.pow(ytemp,2))/(2*2))),2))
                    total = total + kernel[x][y]
            if xtemp < radius:
                xtemp = xtemp +1
        if x > radius:
            xtemp = xtemp -1
            ytemp = 0
            for y in range(diameter):
                if y <= radius:
                    kernel[x].append(round((1/(2*math.pi*2))*(math.e**((math.pow(xtemp,2)+math.pow(ytemp,2))/(2*2))),2))
                    total = total + kernel[x][y]
                    if ytemp < radius:
                        ytemp = ytemp +1
                if y > radius:
                    ytemp = ytemp -1
                    kernel[x].append(round((1/(2*math.pi*2))*(math.e**((math.pow(xtemp,2)+math.pow(ytemp,2))/(2*2))),2))
                    total = total + kernel[x][y]

               
    # Normalizes values of gaussian distribuition kernel table to sum 1 (to use as 100% percentage)
    for x in range(diameter):
        for y in range(diameter):
            kernel[x][y] = kernel[x][y]/total

    # separete vertical and horizontal component of kernel (witch are equal due gaussian to gaussian distribution)
    # sweeping the image separatly by each dimention reduces number of calculations, increases speed
    linearKernel = []
    for i in range(diameter):
        linearKernel.append(math.sqrt(kernel[i][i]))

    return linearKernel


def blur(im, radius):
    """Option 10 - Blurs image. The greater the radius, the blurrier the image."""
    # Pillow alernative: im = im.filter(ImageFilter.GaussianBlur(radius = radius))

    kernel = gaussian_grid(radius)
    diameter = 2*radius -1 # diameter of gaussian kernel
    width, height = im.size
    new_im = Image.new(im.mode, im.size) # to the first pass of the linearKernel
    new_im2 = Image.new(im.mode, im.size) # to the second and last pass of the linearKernel

    for x in range(radius, width-radius):
        for y in range(height):
            #for each pixel, loop again to get horizontal neighbour pixels
            i = 0
            tR, tG, tB = 0, 0, 0 # variables to calculate total of each pixel channel
            for x2 in range(x-radius, x+radius+1):
                p = im.getpixel( (x2, y) )
                tR = tR + p[0]*kernel[i]
                tG = tG + p[1]*kernel[i]
                tB = tB + p[2]*kernel[i]
                i = i+1
            # assign new values for pixel but in new_im so theres no contamination
            r = int(tR)
            g = int(tG)
            b = int(tB)
            new_im.putpixel((x,y), (r, g, b)) # put p in new image (original stays the same)
               
    for x in range(width):
        for y in range(radius, height-radius):
            #for each pixel, loop again to get vertical neighbour pixels
            i = 0
            tR, tG, tB = 0, 0, 0
            for y2 in range(y-radius, y+radius+1):
                p = new_im.getpixel( (x, y2) )
                tR = tR + p[0]*kernel[i]
                tG = tG + p[1]*kernel[i]
                tB = tB + p[2]*kernel[i]
                i = i+1
            r = int(tR)
            g = int(tG)
            b = int(tB)
            new_im2.putpixel((x,y), (r, g, b))

    return new_im2  


def negative(im):
    """Option 11 - Creates negative image."""
    width, height = im.size
    new_im = Image.new(im.mode, im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            r = 255 - p[0]
            g = 255 - p[1]
            b = 255 - p[2]
            new_im.putpixel((x,y), (r, g, b))
    return new_im


def black_white(im):
    """Option 12 - Creates black and white (grayscale) image."""
    width, height = im.size
    new_im = Image.new("L", im.size)

    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            l = int((p[0]*0.299) + (p[1]*0.587) + (p[2]*0.144))
            new_im.putpixel( (x,y), (l) )
    new_im = new_im.convert("RGB")
    return new_im
    # folowing code would convert directly in jpg format, did not test in other formats
    # im = im.convert("L")
    # return im


def sepia(im):
    """Option 13 - Creates sepia image."""
    new_im = Image.new(im.mode, im.size)
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel( (x,y) )
            r = int(0.189*p[0] + 0.769*p[1] + 0.393*p[2])
            g = int(0.168*p[0] + 0.686*p[1] + 0.349*p[2])
            b = int(0.131*p[0] + 0.534*p[1] + 0.272*p[2])
            new_im.putpixel( (x,y), (r, g, b) )
    return new_im


def is_edge(im, diff):
    """Option 14 - Detects edges of image, returns white background with black edges"""
    #converter imagem e criar nova imagem base
    new_im = im.convert("YCbCr")
    width, height = im.size
    new_im2 = Image.new(new_im.mode, new_im.size)
    
    for x in range(width):
        for y in range (height):
            p = new_im.getpixel( (x, y) )
            # checks pixel neighbours, except for 1st and last pixel of width and height
            # if pixel is edge, changes it to black
            changed = False
            # garantees that border is white, because no comparison can be made
            if x == 0 or x == width-1 or y == 0 or y == height-1:
                new_im2.putpixel( (x,y), (255, 128, 128) )
            # checks pixel neighbours, except for 1st and last pixel of width and height
            if x < width-1 and y < height-1 and x > 0 and y > 0:
                # avoids checking next pixel if change was already determined
                while changed == False:
                    # checks up and down
                    for vx in range(-1, 1):
                        for vy in [-1, 1]:
                            p2 = new_im.getpixel( (x + vx, y + vy) )
                            if abs(p[0]- p2[0]) > diff:
                                new_im2.putpixel( (x,y), (0, 128, 128) )
                                changed = True
                    # checks left and right
                    for vx in [-1,1]:
                        p2 = new_im.getpixel( (x + vx, y) )
                        if abs(p[0]- p2[0]) > diff:
                            new_im2.putpixel( (x,y), (0, 128, 128) )
                            changed = True
                    # if pixel is not edge, change to white
                    if changed == False:
                        new_im2.putpixel( (x,y), (255, 128, 128) )
                        changed = True  

    new_im = new_im2.convert("RGB")
    return new_im


def overlap_edge(im1, im2):
    """Auxiliar function"""
    
    # Special case if the image is thumbnail - because of list of thumbnails creation
    if im2.size == (50,50):
        im1 = resize_wh(im1, 50, 50)

    im2.convert("RGB")
    width, height = im1.size
    for x in range(width):
        for y in range(height):
            p2 = im2.getpixel( (x,y) )
            if p2[0]+p2[1]+p2[2] != 765: # different than white
                im1.putpixel( (x,y), (p2[0], p2[1], p2[2]) )
    return im1


def blend(im1, im2, alpha):
    """Auxiliar function - Blends two images pixel by pixel"""
    width, height = im1.size
    new_im = Image.new(im1.mode, im1.size)
    im2 = resize_wh(im2, width, height)

    for x in range(width):
        for y in range(height):
            p1 = im1.getpixel( (x,y) )
            p2 = im2.getpixel( (x,y) )
            r = int(p1[0]*alpha + p2[0]*(1-alpha))
            g = int(p1[1]*alpha + p2[1]*(1-alpha))
            b = int(p1[2]*alpha + p2[2]*(1-alpha))
            new_im.putpixel( (x,y), (r, g, b))
    return new_im


def blend_pixel(im1, im2, x, y, alpha):
    """Auxiliar function - Blends two images pixel by pixel"""
    width, height = im1.size

    p1 = im1.getpixel( (x,y) )
    p2 = im2.getpixel( (x,y) )
    r = int(p1[0]*alpha + p2[0]*(1-alpha))
    g = int(p1[1]*alpha + p2[1]*(1-alpha))
    b = int(p1[2]*alpha + p2[2]*(1-alpha))
    return (r,g,b)


def water_mark(im1, im2, start_x, start_y, f):
    """Auxiliar function - reates watermark of image2 in image1"""
    #start -> onde comeca a marca dagua
    #f -> grau de transparencia
    width, height = im1.size
    for x in range(width):
        for y in range(height):
            p1 = im1.getpixel((x+start_x, y+start_y))
            p2 = im2.getpixel((x, y))
            if(p2[3] == 0):
                continue

            r = int(p1[0]*(1-f)+p2[0]*f)
            g = int(p1[1]*(1-f)+p2[1]*f)
            b = int(p1[2]*(1-f)+p2[2]*f)

            im1.putpixel((x, y), (r, g, b, p[1]))

            im2.save(fname2 + "-marcaAgua.jpg")


def get_factor(x, y, xref, yref):
    """Auxiliar function"""
    distance = math.sqrt( pow(x-xref, 2) + pow(y-yref, 2))
    distance_to_edge = math.sqrt(pow(xref, 2) + pow(yref, 2))

    return 1-(distance/distance_to_edge) #Percentagem


def draw_dots(im, bw):
    """Auxiliar function to --Circles Filter--"""
    width, height = im.size
    i = 5
    while i <= width-5:
        j = 5
        while j <= height-5:
            for x in range (i-5, i+5+1):
                for y in range (j-5, j+5+1):
                    if math.sqrt(math.pow((i-x),2) + math.pow((j-y),2)) >= 5:
                        p = im.getpixel( (x,y) )
                        r = bw
                        g = bw
                        b = bw
                        im.putpixel( (x,y), (r, g, b) )
            j = j +11
        i = i + 11

    return im