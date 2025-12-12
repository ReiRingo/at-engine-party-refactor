function InputPressed(input)
{
	switch (input)
	{
		case INPUT.UP:
			return keyboard_check_pressed(vk_up);
		case INPUT.LEFT:
			return keyboard_check_pressed(vk_left);
		case INPUT.DOWN:
			return keyboard_check_pressed(vk_down);
		case INPUT.RIGHT:
			return keyboard_check_pressed(vk_right);
		case INPUT.CONFIRM:
			return keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
		case INPUT.CANCEL:
			return keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);
		case INPUT.SPECIAL:
			return keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control);
	}
	return false;
}
function InputPressedCheck(input)
{
	switch (input)
	{
		case INPUT.UP:
			return keyboard_check(vk_up);
		case INPUT.LEFT:
			return keyboard_check(vk_left);
		case INPUT.DOWN:
			return keyboard_check(vk_down);
		case INPUT.RIGHT:
			return keyboard_check(vk_right);
		case INPUT.CONFIRM:
			return keyboard_check(ord("Z")) || keyboard_check(vk_enter);
		case INPUT.CANCEL:
			return keyboard_check(ord("X")) || keyboard_check(vk_shift);
		case INPUT.SPECIAL:
			return keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control);
	}
	return false;
}