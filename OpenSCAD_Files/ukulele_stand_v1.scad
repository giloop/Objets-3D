/* Params */

Ukulele_neck_width = 36; // Ukulele neck width
Guitar_stand_width = 50; // Guitar stand width
Guitar_stand_depth = 35; // Guitar stand depth 

Rounded_bevel_width = 6; 

// Which 
Stand_type = "Guitar Stand adaptor";  // ["Guitar Stand adaptor", "Wall mount"]

/* Computed vars */
cubX = 14+1;
cubY = Guitar_stand_depth;
cubZ = 14+1;
transX = 0.5*Ukulele_neck_width+1; // 1mm space on each side
cutX = 0.5*(Guitar_stand_width-Ukulele_neck_width);
cutZ = cubZ/2;
cutY = cubX-cutX;

/* Make Thing Happen */	
translate([0,0,cubZ]) rotate([0, 180, 0]) 
if (Stand_type == "Guitar Stand adaptor") {
	// Guitar adaptor : 
	difference() {
		union() {
			translate([transX, 0, 0]) side();
			translate([-transX, 0, 0]) mirror([1,0,0]) side();
			back(true);
		}
		// add Z bevel on back part
		translate([transX, 0,-cutZ]) rotate([0,0,-45]) cube([cubZ*2,cubZ*2,cubZ]);
		mirror() translate([transX, 0,-cutZ]) rotate([0,0,-45]) cube([cubZ*2,cubZ*2,cubZ]);
	}
} 
else 
{ 
	// wall mounted : thicken back and add a screw hole
	difference() {
		union() {
			translate([transX, 0, 0]) side();
			translate([-transX, 0, 0]) mirror([1,0,0]) side();
			back(false);
			
		}
		// Make hole for a screw (should be enough)
		translate([0,0,cubZ/2]) rotate([90,0,0]) 
			cylinder(h = cubY, r=2.4, $fn=20, center=true);
		translate([0,8,cubZ/2]) rotate([90,0,0]) 
			cylinder(h = cubY/2, r=4.8, $fn=20, center=true);
	}
}

// Part Modules
module side() { 
	sCubeS = [cubX, cubY, cubZ];
	difference() {
		cube(sCubeS);
		translate([cutX,0,-cutZ]) cube(sCubeS);
		sideProfile();
	}
}

module back(cutBack) { 
	backX = 2*(cubX+transX);
	alpha = asin(transX);
	overlapY = 4; // amount of circle overlapping cube
	/* Search the circle radius to reach overlap and width
	// R = a*b*c / (4S), where a,b,c are the edge triangle, S surf triangle
	// a*b = transX^2 * overlapY^2 , c = (2*transX)^2
	radius = (4* pow(transX,4) * pow(overlapY,2)) /(4*(transX*2*overlapY));
	*/
	rotX = atan(Rounded_bevel_width/cubZ); // not rounded here just bevelled
	
	translate([0,cutX,0])
	mirror([0,1,0])
	difference() {
		translate([-backX/2,0,0]) cube([backX, cubX, cubZ]);
		/*rotate([-rotX,0,0]) */
		linear_extrude(height = 3*cubZ, center = true, convexity = 10, twist = 0)
		polygon(points=[[-transX-Rounded_bevel_width,0],[transX+Rounded_bevel_width,0],[0,overlapY]], 
				 paths= [[0,1,2]]);
		if (cutBack) { translate([-backX/2,cutX,-cutZ]) cube([backX, cubX, cubZ]); }
	}
	//
	// translate([0, -radius+overlapY,0]) cylinder(r=radius, h=2*cubZ, $fn=100);
	/*difference() {
		cube(sCube, center=true);
		translate([12.5,0,-8]) cube(sCube, center=true);
		rotate([0, 35, 0]) translate([-22.5,0,0]) cube(sCube, center=true);
		translate([0,34,-8]) cube([30, 8, 20], center=true);
		translate([0,-34,-8]) cube([30, 8, 20], center=true);
	}*/
}

module sideProfile() {
	translate([Rounded_bevel_width,0,0])
	mirror()
	difference() {
		cube([cubX, cubY, cubZ]);
		translate([0,0.5*cubY,0]) rotate([90,0,0]) 
			scale([Rounded_bevel_width/cubZ, 1, 1]) cylinder(r=cubZ, h=cubY*2, center=true, $fn=20);
	}
}

