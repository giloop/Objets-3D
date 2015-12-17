use <Write.scad>

// Main Params
diamBottle = 50;
diamPip = 10;
// Other Params
height = 5;
thick = 5;
$fn = 100; // circle resolution

// Make thing happen
union() {

	// Bottle clip
	difference() {
		cylinder(h=height, r=0.5*(diamBottle+thick));
		cylinder(h=height, r=.5*diamBottle);
		translate([-.5*diamBottle, 0, 0]) cylinder(h=height, r=0.5*diamBottle);

	}

	// Pipe clip
	translate([0.5*(diamBottle+diamPip+thick), 0, 0])
	difference() {
		cylinder(h=height, r=0.5*(diamPip+thick));
		cylinder(h=height, r=.5*diamPip);
		translate([.5*diamPip, 0, 0]) cylinder(h=height, r=0.5*diamPip);
	}
}
