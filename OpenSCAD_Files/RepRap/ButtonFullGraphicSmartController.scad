// Making a button for the RepRap lcd Smart Controller
/* Main Params */
base_length = 13.6;
base_width = 8;
base_height = 4;
total_height = 7;
reduced_width = 5.6;

/* Computed params */
reduced_length = base_length-(base_width-reduced_width);
// Y Translation for reduced part
red_y_trans = 0.5*(base_width-reduced_width);
red_x_trans = 0; // 2*(base_length-reduced_length);

// Make this thing happen
union() {
	// Base shape
	button_shape(base_length, base_width, base_height);
	// Reduced part
	translate([red_x_trans, red_y_trans,0]) button_shape(reduced_length, reduced_width,total_height);
}


module button_shape(l,w,h) {
	l_cub = l-w;
	cube([l_cub, w, h]);
	translate([0,0.5*w,0]) cylinder(h=h, r=0.5*w, $fn=30);
	translate([l_cub,0.5*w,0]) cylinder(h=h, r=0.5*w, $fn=30);
}