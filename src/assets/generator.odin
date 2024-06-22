package assets

import rl "vendor:raylib"

BG_IMG_WIDTH: i32 : 100
BG_IMG_HEIGHT: i32 : 100

random_color :: proc(min: rl.Color, max: rl.Color) -> rl.Color {
	rand_u8 :: #force_inline proc(min: u8, max: u8) -> u8 {
		return min < max? u8(rl.GetRandomValue(i32(min), i32(max))) : min
	}
	return {
		rand_u8(min[0], max[0]),
		rand_u8(min[1], max[1]),
		rand_u8(min[2], max[2]),
		rand_u8(min[3], max[3]),
	}
}

// Generate Background image
generate_background_image :: proc() -> (img: rl.RenderTexture) {
	img = rl.LoadRenderTexture(BG_IMG_WIDTH, BG_IMG_HEIGHT)
	COLOR: rl.Color : {20, 20, 20, 255}

	rl.BeginDrawing()
	defer rl.EndDrawing()

	rl.BeginTextureMode(img)
	defer rl.EndTextureMode()

	rl.ClearBackground(COLOR)

	// Draw pixels at intervals
	for y in 0 ..< BG_IMG_HEIGHT {
		for x in 0 ..< BG_IMG_WIDTH {
            color := random_color({40, 40, 40, 200}, {40, 40, 40, 255})
			if x % 4 + y % 4 == 0 do rl.DrawPixel(x, y, color)
		}
	}

	// Draw diagonal lines
	DIAG_COLOR :: rl.Color{50, 50, 50, 255}
	for y in 0 ..< BG_IMG_HEIGHT {
		for x in 0 ..< BG_IMG_WIDTH {
			if x == y || x == BG_IMG_WIDTH - 1 - y do rl.DrawPixel(x, y, DIAG_COLOR)
		}
	}
	// TODO other diagonal lines


	return
}
