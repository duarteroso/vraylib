module rcore

import raylib

// Initialize window and OpenGL context
pub fn init_window(width int, height int, title string) {
	C.InitWindow(width, height, title.str)
}

// Close window and unload OpenGL context
pub fn close_window() {
	C.CloseWindow()
}

// Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
pub fn window_should_close() bool {
	return C.WindowShouldClose()
}

// Check if window has been initialized successfully
pub fn is_window_ready() bool {
	return C.IsWindowReady()
}

// Check if window is currently fullscreen
pub fn is_window_fullscreen() bool {
	return C.IsWindowFullscreen()
}

// Check if window is currently hidden (only PLATFORM_DESKTOP)
pub fn is_window_hidden() bool {
	return C.IsWindowHidden()
}

// Check if window is currently minimized (only PLATFORM_DESKTOP)
pub fn is_window_minimized() bool {
	return C.IsWindowMinimized()
}

// Check if window is currently maximized (only PLATFORM_DESKTOP)
pub fn is_window_maximized() bool {
	return C.IsWindowMaximized()
}

// Check if window is currently focused (only PLATFORM_DESKTOP)
pub fn is_window_focused() bool {
	return C.IsWindowFocused()
}

// Check if window has been resized last frame
pub fn is_window_resized() bool {
	return C.IsWindowResized()
}

// Check if one specific window flag is enabled
pub fn is_window_state(flag raylib.ConfigFlag) bool {
	return C.IsWindowState(u32(flag))
}

// Set window configuration state using flags (only PLATFORM_DESKTOP)
pub fn set_window_state(flags raylib.ConfigFlag) {
	C.SetWindowState(u32(flags))
}

// Clear window configuration state flags
pub fn clear_window_state(flags raylib.ConfigFlag) {
	C.ClearWindowState(u32(flags))
}

// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
pub fn toggle_fullscreen() {
	C.ToggleFullscreen()
}

// Toggle window state: borderless windowed (only PLATFORM_DESKTOP)
pub fn toggle_borderless_windowed() {
	C.ToggleBorderlessWindowed()
}

// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
pub fn maximize_window() {
	C.MaximizeWindow()
}

// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
pub fn minimize_window() {
	C.MinimizeWindow()
}

// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
pub fn restore_window() {
	C.RestoreWindow()
}

// Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)
pub fn set_window_icon(image raylib.Image) {
	C.SetWindowIcon(image)
}

// Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)
pub fn set_window_icons(images &raylib.Image, count int) {
	C.SetWindowIcons(images, count)
}

// Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)
pub fn set_window_title(title string) {
	C.SetWindowTitle(&char(title.str))
}

// Set window position on screen (only PLATFORM_DESKTOP)
pub fn set_window_position(x int, y int) {
	C.SetWindowPosition(x, y)
}

// Set monitor for the current window
pub fn set_window_monitor(monitor int) {
	C.SetWindowMonitor(monitor)
}

// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
pub fn set_window_min_size(width int, height int) {
	C.SetWindowMinSize(width, height)
}

/*

// Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
pub fn SetWindowMaxSize(width int, height int)

// Set window dimensions
pub fn SetWindowSize(width int, height int)

// Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
pub fn SetWindowOpacity(opacity f32)

// Set window focused (only PLATFORM_DESKTOP)
pub fn SetWindowFocused()

// Get native window handle
pub fn GetWindowHandle() voidptr

// Get current screen width
pub fn GetScreenWidth() int

// Get current screen height
pub fn GetScreenHeight() int

// Get current render width (it considers HiDPI)
pub fn GetRenderWidth() int

// Get current render height (it considers HiDPI)
pub fn GetRenderHeight() int

// Get number of connected monitors
pub fn GetMonitorCount() int

// Get current connected monitor
pub fn GetCurrentMonitor() int

// Get specified monitor position
pub fn GetMonitorPosition(monitor int) Vector2

// Get specified monitor width (current video mode used by monitor)
pub fn GetMonitorWidth(monitor int) int

// Get specified monitor height (current video mode used by monitor)
pub fn GetMonitorHeight(monitor int) int

// Get specified monitor physical width in millimetres
pub fn GetMonitorPhysicalWidth(monitor int) int

// Get specified monitor physical height in millimetres
pub fn GetMonitorPhysicalHeight(monitor int) int

// Get specified monitor refresh rate
pub fn GetMonitorRefreshRate(monitor int) int

// Get window position XY on monitor
pub fn GetWindowPosition() Vector2

// Get window scale DPI factor
pub fn GetWindowScaleDPI() Vector2

// Get the human-readable, UTF-8 encoded name of the specified monitor
pub fn GetMonitorName(monitor int) &char

// Set clipboard text content
pub fn SetClipboardText(const_text &char)

// Get clipboard text content
pub fn GetClipboardText() &char

// Enable waiting for events on EndDrawing(), no automatic event polling
pub fn EnableEventWaiting()

// Disable waiting for events on EndDrawing(), automatic events polling
pub fn DisableEventWaiting()

// Cursor-related functions

// Shows cursor
pub fn ShowCursor()

// Hides cursor
pub fn HideCursor()

// Check if cursor is not visible
pub fn IsCursorHidden() bool

// Enables cursor (unlock cursor)
pub fn EnableCursor()

// Disables cursor (lock cursor)
pub fn DisableCursor()

// Check if cursor is on the screen
pub fn IsCursorOnScreen() bool

// Drawing-related functions

// Set background color (framebuffer clear color)
pub fn ClearBackground(color Color)

// Setup canvas (framebuffer) to start drawing
pub fn BeginDrawing()

// End canvas drawing and swap buffers (double buffering)
pub fn EndDrawing()

// Begin 2D mode with custom camera (2D)
pub fn BeginMode2D(camera Camera2D)

// Ends 2D mode with custom camera
pub fn EndMode2D()

// Begin 3D mode with custom camera (3D)
pub fn BeginMode3D(camera Camera3D)

// Ends 3D mode and returns to default 2D orthographic mode
pub fn EndMode3D()

// Begin drawing to render texture
pub fn BeginTextureMode(target RenderTexture2D)

// Ends drawing to render texture
pub fn EndTextureMode()

// Begin custom shader drawing
pub fn BeginShaderMode(shader Shader)

// End custom shader drawing (use default shader)
pub fn EndShaderMode()

// Begin blending mode (alpha, additive, multiplied, subtract, custom)
pub fn BeginBlendMode(mode int)

// End blending mode (reset to default: alpha blending)
pub fn EndBlendMode()

// Begin scissor mode (define screen area for following drawing)
pub fn BeginScissorMode(x int, y int, width int, height int)

// End scissor mode
pub fn EndScissorMode()

// Begin stereo rendering (requires VR simulator)
pub fn BeginVrStereoMode(config VrStereoConfig)

// End stereo rendering (requires VR simulator)
pub fn EndVrStereoMode()

// VR stereo config functions for VR simulator

// Load VR stereo config for VR simulator device parameters
pub fn LoadVrStereoConfig(device VrDeviceInfo) VrStereoConfig

// Unload VR stereo config
pub fn UnloadVrStereoConfig(config VrStereoConfig)

// Shader management functions

// Load shader from files and bind default locations
pub fn LoadShader(const_vsFileName &char, const_fsFileName &char) Shader

// Load shader from code strings and bind default locations
pub fn LoadShaderFromMemory(const_vsCode &char, const_fsCode &char) Shader

// Check if a shader is ready
pub fn IsShaderReady(shader Shader) bool

// Get shader uniform location
pub fn GetShaderLocation(shader Shader, const_uniformName &char) int

// Get shader attribute location
pub fn GetShaderLocationAttrib(shader Shader, const_attribName &char) int

// Set shader uniform value
pub fn SetShaderValue(shader Shader, locIndex int, const_value voidptr, uniformType int)

// Set shader uniform value vector
pub fn SetShaderValueV(shader Shader, locIndex int, const_value voidptr, uniformType int, count int)

// Set shader uniform value (matrix 4x4)
pub fn SetShaderValueMatrix(shader Shader, locIndex int, mat Matrix)

// Set shader uniform value for texture (sampler2d)
pub fn SetShaderValueTexture(shader Shader, locIndex int, texture Texture2D)

// Unload shader from GPU memory (VRAM)
pub fn UnloadShader(shader Shader)

// Screen-space-related functions

// Get a ray trace from mouse position
pub fn GetMouseRay(mousePosition Vector2, camera Camera) Ray

// Get camera transform matrix (view matrix)
pub fn GetCameraMatrix(camera Camera) Matrix

// Get camera 2d transform matrix
pub fn GetCameraMatrix2D(camera Camera2D) Matrix

// Get the screen space position for a 3d world space position
pub fn GetWorldToScreen(position Vector3, camera Camera) Vector2

// Get the world space position for a 2d camera screen space position
pub fn GetScreenToWorld2D(position Vector2, camera Camera2D) Vector2

// Get size position for a 3d world space position
pub fn GetWorldToScreenEx(position Vector3, camera Camera, width int, height int) Vector2

// Get the screen space position for a 2d camera world space position
pub fn GetWorldToScreen2D(position Vector2, camera Camera2D) Vector2

// Timing-related functions

// Set target FPS (maximum)
pub fn SetTargetFPS(fps int)

// Get time in seconds for last frame drawn (delta time)
pub fn GetFrameTime() f32

// Get elapsed time in seconds since InitWindow()
pub fn GetTime() f64

// Get current FPS
pub fn GetFPS() int

// Custom frame control functions
// NOTE: Those functions are intended for advance users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To a that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL

// Swap back buffer with front buffer (screen drawing)
pub fn SwapScreenBuffer()

// Register all input events
pub fn PollInputEvents()

// Wait for some time (halt program execution)
pub fn WaitTime(seconds f64)

// Random values generation functions

// Set the seed for the random number generator
pub fn SetRandomSeed(seed u32)

// Get a random value between min and max (both included)
pub fn GetRandomValue(min int, max int) int

// Load random values sequence, no values repeated
pub fn LoadRandomSequence(count u32, min int, max int) &int

// Unload random values sequence
pub fn UnloadRandomSequence(sequence &int)

// Misc. functions

// Takes a screenshot of current screen (filename extension defines format)
pub fn TakeScreenshot(const_fileName &char)

// Setup init configuration flags (view FLAGS)
pub fn SetConfigFlags(flags u32)

// Open URL with default system browser (if available)
pub fn OpenURL(const_url &char)

// NOTE: Following functions implemented in module [utils]
//------------------------------------------------------------------

// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
pub fn TraceLog(logLevel int, const_text &char, ...)

// Set the current threshold (minimum) log level
pub fn SetTraceLogLevel(logLevel int)

// Internal memory allocator
pub fn MemAlloc(size u32) voidptr

// Internal memory reallocator
pub fn MemRealloc(ptr voidptr, size u32) voidptr

// Internal memory free
pub fn MemFree(ptr voidptr)

// Set custom callbacks
// WARNING: Callbacks setup is intended for advance users

// Set custom trace log
pub fn SetTraceLogCallback(callback TraceLogCallback)

// Set custom file binary data loader
pub fn SetLoadFileDataCallback(callback LoadFileDataCallback)

// Set custom file binary data saver
pub fn SetSaveFileDataCallback(callback SaveFileDataCallback)

// Set custom file text data loader
pub fn SetLoadFileTextCallback(callback LoadFileTextCallback)

// Set custom file text data saver
pub fn SetSaveFileTextCallback(callback SaveFileTextCallback)

// Files management functions

// Load file data as byte array (read)
pub fn LoadFileData(const_fileName &char, dataSize &int) &u8

// Unload file data allocated by LoadFileData()
pub fn UnloadFileData(data &u8)

// Save data to file from byte array (write), returns true on success
pub fn SaveFileData(const_fileName &char, data voidptr, int dataSize) bool

// Export data to code (.h), returns true on success
pub fn ExportDataAsCode(const_data &u8, dataSize int, const_fileName &char) bool

// Load text data from file (read), returns a '\0' terminated string
pub fn LoadFileText(const_fileName &char) &char

// Unload file text data allocated by LoadFileText()
pub fn UnloadFileText(text &char)

// Save text data to file (write), string must be '\0' terminated, returns true on success
pub fn SaveFileText(const_fileName &char, text &char) bool

//------------------------------------------------------------------

// File system functions

// Check if file exists
pub fn FileExists(const_fileName &char) bool

// Check if a directory path exists
pub fn DirectoryExists(const_dirPath &char) bool

// Check file extension (including point: .png, .wav)
pub fn IsFileExtension(const_fileName &char, const_ext &char) bool

// Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
pub fn GetFileLength(const_fileName &char) int

// Get pointer to extension for a filename string (includes dot: '.png')
pub fn GetFileExtension(const_fileName &char) &char

// Get pointer to filename for a path string
pub fn GetFileName(const_filePath &char) &char

// Get filename string without extension (uses static string)
pub fn GetFileNameWithoutExt(const_filePath &char) &char

// Get full path for a given fileName with path (uses static string)
pub fn GetDirectoryPath(const_filePath &char) &char

// Get previous directory path for a given path (uses static string)
pub fn GetPrevDirectoryPath(const_dirPath &char) &char

// Get current working directory (uses static string)
pub fn GetWorkingDirectory() &char

// Get the directory of the running application (uses static string)
pub fn GetApplicationDirectory() &char

// Change working directory, return true on success
pub fn ChangeDirectory(const_dir &char) bool

// Check if a given path is a file or a directory
pub fn IsPathFile(const_path &char) bool

// Load directory filepaths
pub fn LoadDirectoryFiles(const_dirPath &char) FilePathList

// Load directory filepaths with extension filtering and recursive directory scan
pub fn LoadDirectoryFilesEx(const_basePath &char, const_filter &char, scanSubdirs bool) FilePathList

// Unload filepaths
pub fn UnloadDirectoryFiles(files FilePathList)

// Check if a file has been dropped into window
pub fn IsFileDropped() bool

// Load dropped filepaths
pub fn LoadDroppedFiles() FilePathList

// Unload dropped filepaths
pub fn UnloadDroppedFiles(files FilePathList)

// Get file modification time (last write time)
pub fn GetFileModTime(const_fileName &char) i64

// Compression/Encoding functionality

// Compress data (DEFLATE algorithm), memory must be MemFree()
pub fn CompressData(const_data &u8, dataSize int, compDataSize &int) &u8

// Decompress data (DEFLATE algorithm), memory must be MemFree()
pub fn DecompressData(const_compData &u8, compDataSize int, dataSize &int) &u8

// Encode data to Base64 string, memory must be MemFree()
pub fn EncodeDataBase64(const_data &u8, dataSize int, outputSize &int) &char

// Decode Base64 string data, memory must be MemFree()
pub fn DecodeDataBase64(const_data &u8, outputSize &int) &u8

// Automation events functionality

// Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
pub fn LoadAutomationEventList(const_fileName &char) AutomationEventList

// Unload automation events list from file
pub fn UnloadAutomationEventList(list &AutomationEventList)

// Export automation events list as text file
pub fn ExportAutomationEventList(list AutomationEventList, const_fileName &char) bool

// Set automation event list to record to
pub fn SetAutomationEventList(list &AutomationEventList)

// Set automation event internal base frame to start recording
pub fn SetAutomationEventBaseFrame(frame int)

// Start recording automation events (AutomationEventList must be set)
pub fn StartAutomationEventRecording()

// Stop recording automation events
pub fn StopAutomationEventRecording()

// Play a recorded automation event
pub fn PlayAutomationEvent(event AutomationEvent)

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard

// Check if a key has been pressed once
pub fn IsKeyPressed(key int) bool

// Check if a key has been pressed again (Only PLATFORM_DESKTOP)
pub fn IsKeyPressedRepeat(key int) bool

// Check if a key is being pressed
pub fn IsKeyDown(key int) bool

// Check if a key has been released once
pub fn IsKeyReleased(key int) bool

// Check if a key is NOT being pressed
pub fn IsKeyUp(key int) bool

// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
pub fn GetKeyPressed() int

// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
pub fn GetCharPressed() int

// Set a custom key to exit program (default is ESC)
pub fn SetExitKey(key int)

// Input-related functions: gamepads

// Check if a gamepad is available
pub fn IsGamepadAvailable(gamepad int) bool

// Get gamepad internal name id
pub fn GetGamepadName(gamepad int) &char

// Check if a gamepad button has been pressed once
pub fn IsGamepadButtonPressed(gamepad int, button int) bool

// Check if a gamepad button is being pressed
pub fn IsGamepadButtonDown(gamepad int, button int) bool

// Check if a gamepad button has been released once
pub fn IsGamepadButtonReleased(gamepad int, button int) bool

// Check if a gamepad button is NOT being pressed
pub fn IsGamepadButtonUp(gamepad int, button int) bool

// Get the last gamepad button pressed
pub fn GetGamepadButtonPressed() int

// Get gamepad axis count for a gamepad
pub fn GetGamepadAxisCount(gamepad int) int

// Get axis movement value for a gamepad axis
pub fn GetGamepadAxisMovement(gamepad int, axis int) f32

// Set internal gamepad mappings (SDL_GameControllerDB)
pub fn SetGamepadMappings(const_mappings &char) int

// Input-related functions: mouse

// Check if a mouse button has been pressed once
pub fn IsMouseButtonPressed(button int) bool

// Check if a mouse button is being pressed
pub fn IsMouseButtonDown(button int) bool

// Check if a mouse button has been released once
pub fn IsMouseButtonReleased(button int) bool

// Check if a mouse button is NOT being pressed
pub fn IsMouseButtonUp(button int) bool

// Get mouse position X
pub fn GetMouseX() int

// Get mouse position Y
pub fn GetMouseY() int

// Get mouse position XY
pub fn GetMousePosition() Vector2

// Get mouse delta between frames
pub fn GetMouseDelta() Vector2

// Set mouse position XY
pub fn SetMousePosition(x int, y int)

// Set mouse offset
pub fn SetMouseOffset(offsetX int, offsetY int)

// Set mouse scaling
pub fn SetMouseScale(scaleX f32, scaleY f32)

// Get mouse wheel movement for X or Y, whichever is larger
pub fn GetMouseWheelMove() f32

// Get mouse wheel movement for both X and Y
pub fn GetMouseWheelMoveV() Vector2

// Set mouse cursor
pub fn SetMouseCursor(cursor int)

// Input-related functions: touch

// Get touch position X for touch point 0 (relative to screen size)
pub fn GetTouchX() int

// Get touch position Y for touch point 0 (relative to screen size)
pub fn GetTouchY() int

// Get touch position XY for a touch poindex int (relative to screen size)
pub fn GetTouchPosition(index int) Vector2

// Get touch point identifier for given index
pub fn GetTouchPointId(index int) int

// Get number of touch points
pub fn GetTouchPointCount() int

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------

// Enable a set of gestures using flags
pub fn SetGesturesEnabled(flags u32)

// Check if a gesture have been detected
pub fn IsGestureDetected(gesture u32) bool

// Get latest detected gesture
pub fn GetGestureDetected() int

// Get gesture hold time in milliseconds
pub fn GetGestureHoldDuration() f32

// Get gesture drag vector
pub fn GetGestureDragVector() Vector2

// Get gesture drag angle
pub fn GetGestureDragAngle() f32

// Get gesture pinch delta
pub fn GetGesturePinchVector() Vector2

// Get gesture pinch angle
pub fn GetGesturePinchAngle() f32

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------

// Update camera position for selected mode
pub fn UpdateCamera(camera &Camera, mode int)

// Update camera movement/rotation
pub fn UpdateCameraPro(camera &Camera, movement Vector3, rotation Vector3, zoom f32)

*/
