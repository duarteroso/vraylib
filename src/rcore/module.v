module rcore

import raylib

pub fn init_window(width int, height int, title string) {
	C.InitWindow(width, height, title.str)
}

pub fn close_window() {
	C.CloseWindow()
}