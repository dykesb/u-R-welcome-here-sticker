library(tidyverse)
library(maps)
library(magick)
library(here)
library(hexSticker)

Rainbow_logo <- image_read(paste0(here("Rainbow-logo.png")))
Rainbow_logo <- image_crop(Rainbow_logo, "724x561+0+563")

white_left <- image_blank(100,700)
floor_image <- image_blank(724,139)
shifted_Rainbow_logo <- image_append(c(Rainbow_logo, floor_image), stack = TRUE)
white_right <- image_blank(1800,700)

left_combined <- image_annotate(image_append(c(white_image,shifted_Rainbow_logo)), 
                                "you", size = 280, font = "sans",
                                color = "white", location = "+50+304")

(welcome <- image_annotate(image_append(c(left_combined, white_right)), 
                          "welcome here", size = 280, font = "sans",
                          color = "white", location = "+1050+304"))

image_write(welcome, path = paste0(here("you-R-welcome-here.png")))
