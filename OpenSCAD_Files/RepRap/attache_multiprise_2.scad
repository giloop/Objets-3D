// Attache pour multiprise côté carré
d = 52.5;
tot_h = 39.5;
thick = 3;
height = 8;
base = 10;
plug_diam = 39;
difference() {
	union() {
		// Top
		translate([0, -d/2-thick, 0]) cube([thick, d+2*thick, height], center=false);
		translate([thick, -d/2, 0]) cube([3, d, 2], center=false);

		// Sides
		translate([0, d/2, 0]) cube([tot_h+thick, thick, height], center=false);
		mirror([0,1,0]) translate([0, d/2, 0]) cube([tot_h+thick, thick, height], center=false);

		// Base for screws
		translate([tot_h, d/2, 0]) cube([thick, base, height]);
		mirror([0,1,0]) translate([tot_h, d/2, 0]) cube([thick, base, height]);
	};

	// Round plug shape
	translate([-1,0,plug_diam/2+height-3])
		rotate([0, 90, 0]) cylinder(h=thick+1,r=plug_diam/2,$fn=50);

	// Screw holes
	translate([tot_h-0.5, d/2+thick+0.45*(base-thick), 0.5*height])
		rotate([0, 90, 0])
		cylinder(h=thick+1,r=1.5,$fn=50);
	mirror([0,1,0]) translate([tot_h-0.5, d/2+thick+0.45*(base-thick), 0.5*height])
		rotate([0, 90, 0])
		cylinder(h=thick+1,r=1.5,$fn=50);
};

