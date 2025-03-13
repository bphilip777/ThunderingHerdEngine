# Goals:

- Converted vulkan fns from dynamic lib to static lib - 1.4 provides static libs rather than dynamic at least for ARM64 arch
- Compile shaders through build.zig instead of .bat or .sh files - Done
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

## SDL

- used a lot with custom game engines
- used here to create window + surface
- intend to drop support in the future

## GLFW = small c library to handle windows/surfaces

- smaller library containing fns to create windows + surfaces cross-platform + handle events
- annoying to build - also intend to drop

## GLAD/GLEW = small c library to handle

- additional libraries combined with above two to provide extra features
- GLAD = handles extensions across platforms
- GLEW = handles loading vulkan functions across platforms

## Implement Vericidiums Optimizations to Improve Game Performance
