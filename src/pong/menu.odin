package pong

import rl "vendor:raylib"

screen_w: f32
screen_h: f32
screen_cx: f32
screen_cy: f32
button_bounds: rl.Rectangle
BUTTON_SPACING :: 10.0

menu_draw :: proc(using g: ^Game) {
	using rl

	{ 	// Draw
		BeginDrawing()
		defer EndDrawing()

		ClearBackground(BLACK)
		DrawTextureRec(battle_bg.texture, {0, 0, screen_w, screen_h}, {}, WHITE)

		// Draw The buttons
		GuiButton(button_bounds, "Hello")

		when ODIN_DEBUG do DrawFPS(0, 0)
	}
}

menu_update :: proc(using g: ^Game) {
	using rl
	screen_w = f32(GetScreenWidth())
	screen_h = f32(GetScreenHeight())
	screen_cx = screen_w / 2
	screen_cy = screen_h / 2

	button_bounds.width = screen_w / 3
	button_bounds.height = screen_h / 10
	button_bounds.x = screen_cx - button_bounds.width / 2
	button_bounds.y = screen_cy - button_bounds.height / 2
}
