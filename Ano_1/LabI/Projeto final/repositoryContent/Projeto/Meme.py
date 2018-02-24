# encoding: utf-8
from PIL import Image, ImageDraw, ImageFont


class Meme(object):

    def receiver(self, caminho, text_up, text_down, arg, gray): # deve receber o caminho para o ficheiro local e texto
        if len(text_up) > 25 or len(text_down) > 25:
            print"Length of text is bigger than expected"
        else:
            self.meme_generator(caminho, text_up.upper(), text_down.upper(), arg, gray)

    def meme_generator(self, fname, text_up, text_down, arg, gray):
        shaded = False

        im = Image.open(fname)
        width, height = im.size

        if gray:
            im = Image.open(Effect.gray_effect(im, fname, width, height))

        draw = ImageDraw.Draw(im)

        font = ImageFont.truetype("impact.ttf", width/12)

        text_size = font.getsize(text_up)
        text_size2 = font.getsize(text_down)

        if arg == 0 or arg == 7:
            solid = False
        else:
            solid = True

        if arg == 1:
            color = "green"
        elif arg == 2:
            color = "orange"
        elif arg == 3:
            color = "yellow"
        elif arg == 4:
            color = (0, 0, 128)
        elif arg == 5:
            color = "gray"
        elif arg == 6:
            color = (95, 2, 31)
        elif arg == 7:
            shaded = True
    # -----------------------------------
        if solid:
            if text_down != "":
                draw.rectangle(((0, height / 16), (width, height / 16 + text_size[1]+5)),
                               fill="black")  # draw a box behind the top text
            draw.rectangle(((0, height - width / 16 - height / 8), (width,
                            height - width / 16 - height / 8 + width / 12+5)), fill=color)
        else:
            print "Your answer is not valid. Please answer with y/n or yes/no"

        if shaded:
            if text_down == "":
                #  text down
                draw.text((width/2 - text_size[0]/2, height - width/16 - height/8 - 2), text_up, (0, 0, 0), font=font)
                draw.text((width/2 - text_size[0]/2 + 2, height - width/16 - height/8), text_up, (0, 0, 0), font=font)
                draw.text((width/2 - text_size[0]/2, height - width/16 - height/8 + 2), text_up, (0, 0, 0), font=font)
                draw.text((width/2 - text_size[0]/2 - 2, height - width/16 - height/8), text_up, (0, 0, 0), font=font)
            else:
                #  text up
                draw.text((width / 2 - text_size[0] / 2, height / 16 - 2), text_up, (0, 0, 0), font=font)
                draw.text((width / 2 - text_size[0] / 2 + 2, height / 16), text_up, (0, 0, 0), font=font)
                draw.text((width / 2 - text_size[0] / 2, height / 16 + 2), text_up, (0, 0, 0), font=font)
                draw.text((width / 2 - text_size[0] / 2 - 2, height / 16), text_up, (0, 0, 0), font=font)
                # text down caso haja text up
                draw.text((width/2 - text_size2[0]/2, height - width/16 - height/8 - 2), text_down, (0, 0, 0), font=font)
                draw.text((width/2 - text_size2[0]/2 + 2, height - width/16 - height/8), text_down, (0, 0, 0), font=font)
                draw.text((width/2 - text_size2[0]/2, height - width/16 - height/8 + 2), text_down, (0, 0, 0), font=font)
                draw.text((width/2 - text_size2[0]/2 - 2, height - width/16 - height/8), text_down, (0, 0, 0), font=font)

        if text_down != "":
            draw.text((width/2 - text_size[0]/2, height/16), text_up, (255, 255, 255), font=font)
            draw.text((width/2 - text_size2[0]/2, height - width/16 - height/8), text_down, (255, 255, 255), font=font)
        else:
            draw.text((width/2 - text_size[0]/2, height - width/16 - height/8), text_up, (255, 255, 255), font=font)
        im.save(fname)

    def __init__(self):
        pass
