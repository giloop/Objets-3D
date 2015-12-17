// Mushroom button
base_r = 30;
base_h = 20;
top_r = 45;

hull() {
	// Top
	translate([0,0,0])
	difference() {
		sphere(top_r);
		translate([0,0,-top_r+base_h]) cylinder(r=top_r+1, h=2*top_r, $fn=50, center=true);
	};
	
	// Base
	cylinder(r=base_r, h=base_h, $fn=50);
	
	// 45° Cone to make it printable
	//cone_h = 
}

