pixel_x = input('image x in pixel')
pixel_y = input('image y in pixel')
resolution = input('resolution in m')
start_x_in_pixel = input('start_x_in_pixel')
start_y_in_pixel = input('start_y_in_pixel')

print('start x in m = {}'.format(-start_x_in_pixel*resolution))
print('start y in m = {}'.format((start_y_in_pixel-pixel_y)*resolution))