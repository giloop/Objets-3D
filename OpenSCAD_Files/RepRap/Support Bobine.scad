use <MCAD/teardrop.scad>;

/* Parameters */

spool_diameter = 50;
axis_diameter = 9;
bearing_diameter = 22.1;
bearing_height = 7;
total_height = 15;

external_diameter = spool_diameter + 15;

add_teardrop_holes = false; // [true,false]

/* Make this thing happen */
difference() {
	union(){
		cylinder_chamfer(external_diameter/2, 5, 1, 45, true);
		cylinder_chamfer(spool_diameter/2, total_height, 1.5, 45, false);
	}
	// Cut central axis	with chamfers
	cut_cylinder_chamfer(r=axis_diameter/2, h=total_height,chamfer_size=1,
		 chamfer_angle=45, bBoth=true);
	translate([0,0,total_height+0.001]) 
		rotate([180, 0, 0]) 
		cut_cylinder_chamfer(r=bearing_diameter/2, h=bearing_height+2, 
								chamfer_size=1,chamfer_angle=45, bBoth=false);
	if (add_teardrop_holes == true) {
		for (i = [0:3]) {
			rotate([0,0,90*i]) 
				translate([0,14,total_height*.5]) 
				rotate([0,-90,0]) 
				teardrop(5, total_height+4, 90);
		}
	}
}

module cylinder_chamfer(r,h,chamfer_size=1, chamfer_angle=45, bBoth=true) {
	r_cone = r + ((h-chamfer_size) / tan(chamfer_angle));
	h_cone = tan(chamfer_angle) * r_cone;
	
	intersection() {
		cylinder(r=r,h=h, $fn=100);
		cylinder(r1=r_cone, r2=0, h=h_cone, $fn=100);
		if (bBoth==true) {
			translate([0,0,h-h_cone]) 
				cylinder(r1=0, r2=r_cone, h=h_cone, $fn=100);
		}
	}
}


module cut_cylinder_chamfer(r,h,chamfer_size=1, chamfer_angle=45, bBoth=true) {
	r_cone = r + chamfer_size;
	h_cone = tan(chamfer_angle) * r_cone;
	
	union() {
		cylinder(r=r,h=h, $fn=100);
		cylinder(r1=r_cone, r2=0, h=h_cone, $fn=100);
		if (bBoth==true) {
			translate([0,0,h-h_cone]) 
				cylinder(r1=0, r2=r_cone, h=h_cone, $fn=100);
		}
	}
}

