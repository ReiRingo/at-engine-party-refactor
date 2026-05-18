shader_set(shd_wave);

shader_set_uniform_f(u_time, timer);
shader_set_uniform_f(u_speed, wave_speed);
shader_set_uniform_f(u_frequency, wave_freq);
shader_set_uniform_f(u_amplitude, wave_amp);

// Draw the flag sprite
draw_self();

shader_reset();