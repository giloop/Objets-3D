/* Params */
neckWidth = 36; // Ukulele neck width
standWidth = 50; // Guitar stand width
standDepth = 35; // Guitar stand depth 

// Computed vars

transVal = 12.5+1+0.5*neckWidth;

// Make Thing Happen
rotate([0,180,0])
difference() {
	union() {
		translate([transVal, 7.5, 0]) side();
		translate([-transVal, 7.5, 0]) mirror([1,0,0]) side();
		translate([0, 35-12.5, 0]) rotate([0,0,90]) back();
	}
	translate([-transVal,22.5,-8]) rotate([0, 0, 45]) cube([30,20,20], center=true);
	translate([transVal,22.5,-8]) rotate([0, 0, 45]) cube([20,30,20], center=true);
}

// Part Modules
module side() { 
	sCubeS = [25, 45, 20];
	difference() {
		cube(sCube, center=true);
		translate([10,0,-8]) cube(sCube, center=true);
		rotate([0, 40, 0]) translate([-22.5,0,0]) cube(sCube, center=true);
		translate([0,35,-8]) cube([30, 25, 20], center=true);
	}
}

module back() { 
	sCubeB = [25, 70, 20];
	difference() {
		cube(sCube, center=true);
		translate([12.5,0,-8]) cube(sCube, center=true);
		rotate([0, 35, 0]) translate([-22.5,0,0]) cube(sCube, center=true);
		translate([0,34,-8]) cube([30, 8, 20], center=true);
		translate([0,-34,-8]) cube([30, 8, 20], center=true);
	}
}

