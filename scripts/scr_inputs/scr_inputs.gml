function RecognizePressedInput(input) {
	var output=false
	switch (input) {
		case INPUT.UP:
			output=keyboard_check_pressed(vk_up);
		break;
		
		case INPUT.LEFT:
			output=keyboard_check_pressed(vk_left);
		break;
		
		case INPUT.DOWN:
			output=keyboard_check_pressed(vk_down);
		break;
		
		case INPUT.RIGHT:
			output=keyboard_check_pressed(vk_right);
		break;
		
		case INPUT.CONFIRM:
			output=keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
		break;
		
		case INPUT.CANCEL:
			output=keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);
		break;
		
		case INPUT.SPECIAL:
			output=keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control);
		break;
	}

	return output
}

function InputPressed(input) {
	if (global.input_delay <= 0 && RecognizePressedInput(input)) {
		global.input_delay=2
		return true	
	}
	return false
}

function InputPressedCheck(input)
{
	switch (input) {
		case INPUT.UP:
			return keyboard_check(vk_up);
		case INPUT.LEFT:
			return keyboard_check(vk_left);
		case INPUT.DOWN:
			return keyboard_check(vk_down);
		case INPUT.RIGHT:
			return keyboard_check(vk_right);
		case INPUT.CONFIRM:
			return keyboard_check(ord("Z")) || keyboard_check(vk_end);
		case INPUT.CANCEL:
			return keyboard_check(ord("X")) || keyboard_check(vk_shift);
		case INPUT.SPECIAL:
			return keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control);
	}
	return false;
}
