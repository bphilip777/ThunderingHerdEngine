# Goals:

- Compile shaders through build.zig instead of .bat or .sh files
- Be able to display a triangle - Done
- Be able to resize window - Done
- Be able to scale triangle to new window size
- Be able to load a model
- Create window from scratch (using sdl3)
- Create a surface from scratch (using sdl3)
- Play audio
- Swap between backends depending on mac/linux/windows
- Be able to scale/decrease scale
- Allow 2D + 3D models
- Be able to rotate
- Aim to create a game engine api from scratch

## SDL = large library to abstract details of implementing a game engine

- renderer = surface from glfw
- surface = 2d bit maps/images for loading pictures
- specific function for vulkan-style surfaces too
- should drop sdl + glfw b/c I only use them for a few calls - adding a large library to do the basics seems insane

## GLFW = small c library to handle windows/surfaces

- used glfw = smaller library for just creating window and surfaces

## GLAD/GLEW = small c library to handle
