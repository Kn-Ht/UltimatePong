use macroquad::{miniquad::window::screen_size, prelude::*};

fn window() -> Conf {
    Conf {
        window_title: "Ultimate Pong".to_owned(),
        window_width: 800,
        window_height: 600,
        ..Default::default()
    }
}

#[macroquad::main(window)]
async fn main() {
    let mut ball_pos = Vec2::new(40.0, 40.0);
    let mut ball_v = Vec2::new(100.0, 100.0);
    let ball_radius = 5.0;

    let mut screen_w: f32;
    let mut screen_h: f32;
    let mut dt: f32;

    loop {
        dt = get_frame_time();
        (screen_w, screen_h) = screen_size();

        clear_background(DARKGRAY);
        if ball_pos.x + ball_radius >= screen_w || ball_pos.x - ball_radius <= 0.0 {
            ball_v.x *= -1.0;
        }
        if ball_pos.y + ball_radius >= screen_h || ball_pos.y - ball_radius <= 0.0 {
            println!("A");
            ball_v.y = -ball_v.y;
            println!("{ball_v:?}");
        }
        ball_pos.x += ball_v.x * dt;
        ball_pos.y += ball_v.y * dt;
        draw_circle(ball_pos.x, ball_pos.x, ball_radius, WHITE);

        next_frame().await;
    }
}
