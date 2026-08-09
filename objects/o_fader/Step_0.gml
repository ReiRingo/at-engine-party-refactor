timer++
alpha_current = lerp(alpha_start,alpha_end,timer/duration)
if (timer>=duration)
	instance_destroy()