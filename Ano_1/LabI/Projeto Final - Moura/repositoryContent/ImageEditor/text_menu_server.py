#encoding=utf-8

import sys
import os
import time
from PIL import ExifTags, Image
from ImageEditor.textEditor import *
from ImageEditor.imageMenu import *
from ImageEditor.effects import standard_format

def menu_server(path, text, position, style, im=None):
    if im == None:
        im = prepare_image(path)

    return(text_editor(im, text, position, style))


# def prepare_image(path):
#     im = Image.open(path)
#     width, height = im.size # by default (tags may exist, but not contain width and height)
#     # tries to get correct width and height from image info
#     try:
#         tags = im._getexif()
#         for k,v in tags.items():
#             #print (str(ExifTags.TAGS[k])+" : "+str(v))
#             if k == "ExifImageWidth":
#                 width = v
#             if k == "ExifImageHeight":
#                 height = v
#     except:
#         pass

#     # formats image to standard, if image does not meet project specifications and option is not to create thumbnails
#     if (width/height) == (4/3) or (width/height) == (4/3):
#         im = standard_format(im,1)
#     else:
#         im = standard_format(im,2)
#     return im

# if __name__ == "__main__":
#     menu_server(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
