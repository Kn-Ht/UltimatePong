package assets

import rl "vendor:raylib"

random_color :: proc(min: rl.Color, max: rl.Color) -> rl.Color {
	rand_u8 :: #force_inline proc(min: u8, max: u8) -> u8 {
		return min < max ? u8(rl.GetRandomValue(i32(min), i32(max))) : min
	}
	return {
		rand_u8(min[0], max[0]),
		rand_u8(min[1], max[1]),
		rand_u8(min[2], max[2]),
		rand_u8(min[3], max[3]),
	}
}

//************************************************************************************************//
// Generator functions

GenImgType :: enum {
	Menu,
	Battle,
}

// Generator implementations
@(private)
generate_image_battle :: proc() -> (img: rl.RenderTexture) {
	WIDTH: i32 : 100
	HEIGHT: i32 : 100

	img = rl.LoadRenderTexture(WIDTH, HEIGHT)
	BG_COLOR :: rl.Color{20, 20, 20, 255}

	rl.BeginDrawing()
	defer rl.EndDrawing()

	rl.BeginTextureMode(img)
	defer rl.EndTextureMode()

	rl.ClearBackground(BG_COLOR)

	// Draw pixels at intervals
	for y in 0 ..< HEIGHT {
		for x in 0 ..< WIDTH {
			color := random_color({40, 40, 40, 200}, {40, 40, 40, 255})
			if x % 4 + y % 4 == 0 do rl.DrawPixel(x, y, color)
		}
	}

	// Draw diagonal lines
	DIAG_COLOR :: rl.Color{50, 50, 50, 255}
	for y in 0 ..< HEIGHT {
		for x in 0 ..< WIDTH {
			if x == y || x == WIDTH - 1 - y do rl.DrawPixel(x, y, DIAG_COLOR)
		}
	}

	return
}

@(private)
generate_image_menu :: proc() -> (img: rl.RenderTexture) {
	WIDTH: i32 : 400
	HEIGHT: i32 : 200

	img = rl.LoadRenderTexture(WIDTH, HEIGHT)
	sky_color := random_color({0, 0, 50, 255}, {0, 10, 80, 255})

	rl.BeginDrawing()
	defer rl.EndDrawing()

	rl.BeginTextureMode(img)
	defer rl.EndTextureMode()

	rl.ClearBackground(rl.GREEN)

	return
}

// Generate Background image
generate_image :: #force_inline proc(type: GenImgType) -> rl.RenderTexture {
	switch type {
	case .Menu:
		return generate_image_menu()
	case .Battle:
		return generate_image_battle()
	}
	unreachable()
}
