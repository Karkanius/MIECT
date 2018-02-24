#encoding=utf-8

import sys
from PIL import Image
from ImageEditor.imageMenu import *
from ImageEditor.effects import *


menu = """
    ----------------------------------------
    Select the effect you want to apply:

    SIMPLE EDITS
    1  - (For server only) Returns std format image and dic of eddited thumbs 
    2  - Rotate
    3  - More contrast
    4  - Less contrast
    5  - More saturation
    6  - Less saturation
    7  - More luminosity
    8  - Less luminosity
    9  - Reduce palette (bpp)
    10 - Blur (2 px radius)
    11 - Negative
    12 - Black and White
    13 - Sepia
    14 - Edge detection (black edge, white background)

    FILTERS
    21 - Old photo
    22 - Pencil drawing
    23 - Color drawing
    24 - Circles black
    25 - Circles white

    CONTROLS
    0  - SAVE IMAGE and CLOSE
    ----------------------------------------
    """


def get_file():
    """Creates image object from sys.argv or from console. Returns image and filename"""
    try:
        if (len(sys.argv) >= 2):
            filename = sys.argv[1]
            im = Image.open(filename)
            return (im, filename)
        else:
            filename = input("\nWhat file do you want to edit? : ")
            im = Image.open(filename)
            return (im, filename)
    except (IOError):
        print ("\nFile " + filename + " does not exist")
        exit(0)


def get_menu_option():
    """Reads menu option from sys.argv or console. Returns choosen option"""
    try:
        if (len(sys.argv) >= 3):
            op = sys.argv[2]
            return op
        else:
            op = int(input("Option: "))
            return op
    except (ValueError):
        print ('\nInvalid option. Option should be a number')


def main():
    print ("------------------------------")
    print ("100CÉREBROS - SIMPLE IMAGE EDITOR")

    option = 0
    im, filename = get_file()
    new_im = prepare_image(filename)

    while option != -1: # runs indefinitely. Saving the final edited image exits the program directly.
        
        print(menu)
        option = get_menu_option()
        new_im = run_option(None, option, None, new_im)
        new_im.show()


#Run the program
main()
