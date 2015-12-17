r = 28.7;
tot_h = 34;
r_in = 28.2;
scal_fact = 28.2/28.7;
thick = 3;
height = 8;
r_out = r+2*thick;
difference() {
	union() {
		// Base for screws
		translate([tot_h-r/2-thick, -(r_in+thick)/2-height-1, 0]) cube([thick, height+2, height]);
		mirror([0,1,0]) translate([tot_h-r/2-thick, -(r_in+thick)/2-height-1, 0]) cube([thick, height+2, height]);
		// Borders rect cubes
		difference() {
			translate([0, -(r_in/2+thick), 0]) cube([tot_h-r/2, (r_in+2*thick), height], center=false);
			translate([0, -r_in/2, 0]) cube([(tot_h-r/2+10), (r_in), height], center=false);
		};
		
		// Border top cylinder
		scale([1, scal_fact, 1])
			difference() {
				cylinder(h=height,r=r_out/2,$fn=50);
				cylinder(h=height,r=r/2,$fn=50);
				translate([0, -(r_out+1)/2, 0]) cube([(r_out+1), 2*(r_out+1), height], center=false);
			};
	};


	mirror([0,1,0]) translate([tot_h-r/2-thick-1, -(r_in+thick)/2-0.66*height, 0.5*height])
		rotate([0, 90, 0])
		cylinder(h=2*thick+1,r=1.5,$fn=50);

	translate([tot_h-r/2-thick-1, -(r_in+thick)/2-0.66*height, 0.5*height])
		rotate([0, 90, 0])
		cylinder(h=2*thick+1,r=1.5,$fn=50);
};

