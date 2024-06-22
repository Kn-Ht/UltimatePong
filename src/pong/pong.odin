package pong

import "../assets"
import "core:time"
import rl "vendor:raylib"

Pong :: struct {
	should_close: bool,
	screen_w:     i32,
	screen_h:     i32,
	fonts:        assets.Fonts,
	battle_bg:    rl.RenderTexture,
}

pong :: proc() -> (p: Pong) {
	p.should_close = false
	p.screen_w = 800
	p.screen_h = 600
	return
}

// Open window and load assets
init :: proc(using p: ^Pong, flags: rl.ConfigFlags) {
    // Seed random
    rl.SetRandomSeed(u32(time.now()._nsec))

    // Open window
	rl.SetConfigFlags(flags)
	rl.InitWindow(screen_w, screen_h, "Ultimate Pong")

	// Load assets
	fonts = assets.load_fonts()
    battle_bg = assets.generate_background_image()
}

// Close window
close :: proc(using p: ^Pong) {
    using rl

	// Free assets
	assets.unload_fonts(&fonts)
    UnloadRenderTexture(battle_bg)

	CloseWindow()
}

free :: proc(using p: ^Pong) {

}

update :: proc(using p: ^Pong) {
	using rl
	should_close |= WindowShouldClose()
}

draw :: proc(using p: ^Pong) {
	using rl

	{ 	// Draw
		BeginDrawing()
		defer EndDrawing()

		ClearBackground(BLACK)
        DrawTextureRec(battle_bg.texture, {0, 0, f32(GetScreenWidth()), f32(GetScreenHeight())}, {}, WHITE)

		when ODIN_DEBUG do DrawFPS(0, 0)
	}
}
