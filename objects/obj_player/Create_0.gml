// Controls Setup
controls_setup();

// Movement Variables
move_direction = 0;
move_speed = 3;
horizontal_speed = 0;
vertical_speed = 0;

// Jumping Variables

gravy = 0.275;
terminal_velocity = 5;
jump_speed = -4;

// Multiple Jumps

is_grounded = false;

jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames = 15;

// Trampoline
tramp_acceleration = -2;