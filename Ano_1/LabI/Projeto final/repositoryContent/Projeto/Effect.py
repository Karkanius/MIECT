# encoding: utf-8

from PIL import Image, ImageFilter, ImageOps, ImageChops
import math


class Effect(object):

    # efeito que coloca a imagem com as cores negativas
    def invert_effect(self, im, caminho, width, height):

        for x in xrange(width):
            for y in xrange(height):
                p = im.getpixel((x, y))
                r = 255 - p[0]
                g = 255 - p[1]
                b = 255 - p[2]
                im.putpixel((x, y), (r, g, b))
        im.save(caminho)

    def gray_effect(self, im, caminho, width, height):
        # fazer efeito com tons de cinza

        new_im = Image.new("L", im.size)

        for x in xrange(width):
            for y in xrange(height):
                p = im.getpixel((x, y))
                l = int(p[0] * 0.2 + p[1] * 0.4 + p[2] * 0.4)
                new_im.putpixel((x, y), l)
        new_im.convert("RGB").save(caminho)

    def sepia_effect(self, im, caminho, width, height):
        # fazer efeito sepia

        for x in xrange(width):
            for y in xrange(height):
                p = im.getpixel((x, y))
                r = int(0.189*p[0] + 0.769*p[1] + 0.393*p[2])
                g = int(0.168*p[0] + 0.686*p[1] + 0.349*p[2])
                b = int(0.131*p[0] + 0.534*p[1] + 0.272*p[2])
                im.putpixel((x, y), (r, g, b))
        im.filter(ImageFilter.DETAIL).save(caminho)

    def old_effect(self, im, caminho, width, height):
        aux = Image.open("bases/base4.jpg")

        aux = aux.resize((width, height), Image.ANTIALIAS)
        brown = 255, 228, 181
        black = 0, 0, 0

        image = Image.blend(im, aux, 0.7)
        new_image = image.convert("YCbCr")

        for x in xrange(width):
            for y in xrange(height):
                p = new_image.getpixel((x, y))
                f = self.get_factor(x, y, width / 2, height / 2)
                py = min(255, int(p[0] * f))
                new_image.putpixel((x, y), (py, p[1], p[2]))

        grayscale = ImageOps.grayscale(new_image)
        new_image = ImageOps.colorize(grayscale, black, brown)
        new_image.point(lambda z: z*1.5).save(caminho)

    def get_factor(self, x, y, xref, yref):
        distance = math.sqrt(pow(x-xref, 2) + pow(y-yref, 2))
        distance_to_edge = math.sqrt(pow(xref, 2) + pow(yref, 2))
        return 1-(distance/distance_to_edge)

    def quadrupled_image_effect(self, im, caminho, width, height):

        black = 0, 0, 0
        red = 231, 87, 87

        aux = im.resize((int(math.floor(width/2)), int(math.floor(height/2))), Image.ANTIALIAS)
        grayscale = ImageOps.grayscale(aux)
        aux2 = ImageOps.colorize(grayscale, black, red)

        for x in xrange(width/2):
            for y in xrange(height/2):
                p = aux.getpixel((x, y))

                pixel = aux2.getpixel((x, y))

                r = int(0.168*p[0] + 0.686*p[1] + 0.349*p[2])
                g = int(0.131*p[0] + 0.534*p[1] + 0.272*p[2])
                b = int(0.189*p[0] + 0.769*p[1] + 0.393*p[2])
                im.putpixel((x, y), (r, g, b))                                  # lado superior esquerdo
                im.putpixel((x+width/2, y), (r, b, g))                          # lado superior direito
                im.putpixel((x+width/2, y+height/2), (g, r, b))                 # lado inferior direito
                im.putpixel((x, y+height/2), (pixel[0], pixel[1], pixel[2]))    # lado inferior esquerdo
        im.save(caminho)

    def blended_effect(self,im, caminho, width, height):
        aux = Image.open("bases/base16.jpg")

        aux = aux.resize((width, height), Image.ANTIALIAS)

        Image.blend(im, aux, 0.3).save(caminho)

    def black_white_effect(self, im, caminho):
        im.convert("1").save(caminho)

    def satured_effect(self, im, caminho, width, height):
        im = im.convert("YCbCr")
        f = 0.5

        for x in xrange(width):
            for y in xrange(height):
                p = im.getpixel((x, y))
                pb = min(255, int((p[1] - 128) * f) + 128)
                pr = min(255, int((p[2] - 128) * f) + 128)
                im.putpixel((x, y), (p[0], pb, pr))

        im.save(caminho)

    def composite_effect(self, im, caminho):
        r, g, b = im.split()

        Image.merge("RGB", (g, g, b)).save(caminho)

    def add_effect(self, im, caminho):
        aux = Image.open("bases/base14.jpg").resize(im.size)
        ImageChops.add(im, aux).save(caminho)

    def receiver(self, caminho, efeito):
        try:
            im = Image.open(caminho)
            width, height = im.size

            efeito = int(efeito)

            if efeito == 10:
                self.invert_effect(im, caminho, width, height)
            elif efeito == 9:
                self.gray_effect(im, caminho, width, height)
            elif efeito == 8:
                self.sepia_effect(im, caminho, width, height)
            elif efeito == 7:
                self.old_effect(im, caminho, width, height)
            elif efeito == 6:
                self.quadrupled_image_effect(im, caminho, width, height)
            elif efeito == 5:
                self.blended_effect(im, caminho, width, height)
            elif efeito == 4:
                self.black_white_effect(im, caminho)
            elif efeito == 3:
                self.satured_effect(im, caminho, width, height)
            elif efeito == 2:
                self.composite_effect(im, caminho)
            elif efeito == 1:
                self.add_effect(im, caminho)
            else:
                print "Efeito inválido!"
        except IOError:
            print "Não foi possível carregar a imagem"

    def __init__(self):
        pass
