// Player Behaviour
/// @description  get Player Input
get_controls();

// Calculate Move Direction
move_direction = right_key - left_key;
horizontal_speed = move_direction * move_speed;

// Horizontal Collision before move commitment
if(place_meeting(x + horizontal_speed, y, obj_wall)) {
	// damit bei Stillstand kein Abstand von 1 oder 2 Pixeln zum Kollisionsobjekt übrig bleibt
	while(!place_meeting(x + sign(horizontal_speed), y, obj_wall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}

x += horizontal_speed;

// Vertical Movement
// gravition zum vertical speed hinzufügen
vertical_speed += gravy;

// Reset and prepare Jumping Variables
if is_grounded
{
	jump_count = 0;
	jump_speed = -4;
}
else 
{
	if jump_count == 0 {jump_count = 1;}
}

if is_on_tramp(x, y + 1, obj_tramp)
{
	jump_speed += tramp_acceleration
}

if jump_count > 1
{
	jump_speed = -4;
}

// Jump Initialization
if(is_jump_key_buffered and jump_count < jump_max)
{
	is_jump_key_buffered = false;
	jump_key_buffer_timer = 0;
	
	// Erhöhe die Nummer der durchgeführten Sprünge
	jump_count++;
	
	// Set jump hold timer
	jump_hold_timer = jump_hold_frames;
}

// Sprung unterbrechen wenn der Jump Button los gelassen wird
if !jump_key
{
	jump_hold_timer = 0;
}

// Jump based on the timer holding button
if jump_hold_timer > 0 
{
	vertical_speed = jump_speed;

	jump_hold_timer--;
}

// Vertical Collision

// Cap Falling Speed
if vertical_speed > terminal_velocity {vertical_speed = terminal_velocity};

if(place_meeting(x, y + vertical_speed, obj_wall)) 
{
	while(!place_meeting(x, y + sign(vertical_speed), obj_wall)) 
	{
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
}

// Current Tramp Collision not finished
if(place_meeting(x, y + vertical_speed, obj_tramp)) {
	while(!place_meeting(x, y + sign(vertical_speed), obj_tramp)) {
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
}

// Check if Player is on ground
if vertical_speed >= 0 && place_meeting(x, y + 1, [obj_wall, obj_tramp])
{
	is_grounded = true;
}
else
{
	is_grounded = false;
}

y += vertical_speed