library(tidyverse)
library(maps)
library(magick)
library(hexSticker)

Rainbow_logo <- image_read(here::here("Rainbow-logo.png"))
Rainbow_logo <- image_crop(Rainbow_logo, "724x561+0+563")

blank_left <- image_blank(200,560)
blank_right <- image_blank(4000,560)

(left_combined <- image_annotate(image_append(c(blank_left,Rainbow_logo)), 
                                "u", size = 555, font = "sans",
                                color = "white", location = "+50+46"))

(welcome <- image_annotate(image_append(c(left_combined, blank_right)), 
                          "welcome here", size = 555, font = "sans",
                          color = "white", location = "+1000+46"))

image_write(welcome, path = here::here("u-R-welcome-here.png"))
