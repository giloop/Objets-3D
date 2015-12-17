
difference() {
	union() {
		cylinder(h=40, d1=70, d2=21);
		translate([0,0,40]) cylinder(h=10, d=21);
	}
	translate([0,0,-4]) cylinder(h=40, d1=70, d2=18);
	cylinder(h=55, d=18);
}