package pong

import "../assets"
import "core:time"
import rl "vendor:raylib"

Pong :: struct {
	screen_w: i32,
	screen_h: i32,
	game:     Game,
}

pong :: proc(width, height: i32) -> (p: Pong) {
	p.screen_w = width
	p.screen_h = height
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
	game = game_init()
}

// Close window
close :: proc(using p: ^Pong) {
	using rl

	// Free assets
	game_free(&game)
	CloseWindow()
}

free :: proc(using p: ^Pong) {

}

update :: #force_inline proc(using p: ^Pong) {
	game_update(&game)
}

draw :: #force_inline proc(using p: ^Pong) {
	game_draw(&game)
}
