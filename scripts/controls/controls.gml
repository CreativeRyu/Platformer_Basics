/// @description stellt die buffer Variablen für die Jump Funktionalität bereit

function controls_setup()
{
	/// @globalvar {Real} jump_buffer_time
	jump_buffer_time = 3;
	/// @globalvar {Real} is_jump_key_buffered
	is_jump_key_buffered = 0;
	/// @globalvar {Real} jump_key_buffer_timer
	jump_key_buffer_timer = 0;
}

function get_controls(){
	// Directions inputs
	/// @globalvar {Bool} left_key
	left_key = keyboard_check(ord("A")) + keyboard_check(vk_left) + gamepad_button_check(0, gp_padl);
	left_key = clamp(left_key, 0, 1)
	
	/// @globalvar {Bool} right_key
	right_key = keyboard_check(ord("D")) + keyboard_check(vk_right) + gamepad_button_check(0, gp_padr);
	right_key = clamp(right_key, 0, 1)
	
	// Action inputs
	/// @globalvar {Bool} jump_key_pressed
	jump_key_pressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0, gp_face1);
	
	/// @globalvar {Bool} jump_key
	jump_key = keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
	
	// Jump Key Buffering
	if (jump_key_pressed) {
		jump_key_buffer_timer = jump_buffer_time;
	}
	if (jump_key_buffer_timer > 0) {
		is_jump_key_buffered = 1;
		jump_key_buffer_timer--;
	} 
	else {
		is_jump_key_buffered = 0;
	}
}