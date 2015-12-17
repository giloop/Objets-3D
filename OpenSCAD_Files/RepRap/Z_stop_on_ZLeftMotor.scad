use <MCAD/boxes.scad>
use <MCAD/triangles.scad>
use <MCAD/teardrop.scad>

thick = 4;
supportHeight = 38;
screwDiam = 3.5;
$fn= 50;

baseHeight = 3;
diamVis = 3; // M3 screw
xBase = 31+3*diamVis;


union() {
	blosVis(3*diamVis, diamVis, baseHeight);
	translate([31,0,0]) mirror() blosVis(3*diamVis, diamVis, baseHeight);
	#translate([-1.5*diamVis+0.5*xBase, 1.5*diamVis+4.5, 0.5*baseHeight]) 
		roundedBox([xBase, 5.5, baseHeight], 0.5*diamVis, true);
	// Tune translation
	translate([6, 1.5*diamVis+6.75, 0]) 
		rotate([90,0,0]) back();
}


module blosVis(length, diamHole, height) {
	 translate([0,0,0.5*height]) 
	 difference() {
			union() {
				roundedBox([length,length,height], 0.5*height, true);
				translate([0,0.5*length,0]) 
					cube([length,2*diamHole+1,height], true);
				#translate([0.5*length,0.5*length+diamHole+1,-0.5*height]) 
					rotate([0,0,-90]) 
					triangle(diamHole, 2*diamHole, height);
			}
			translate([0,0, -height]) cylinder(d=diamHole+0.1, h=3*height);
		}
};

module back() {
	endStopWidth = 19; // Holes distance in endstop module
	sideMargin = 3;
	minWidth = endStopWidth+diamVis+sideMargin*2;
	zTrans = 31;

	difference() {
		translate([0.5*minWidth,0.5*supportHeight,0.5*baseHeight]) 
				roundedBox([minWidth, supportHeight, thick], baseHeight, true);
		
		translate([sideMargin+diamVis/2, zTrans, -thick]) 
			//hull() {
			 	cylinder(d=diamVis+0.1, h=3*thick);
				//translate([0, -10, 0]) cylinder(d=diamVis+0.1, h=3*thick);
		//}
		translate([minWidth-(sideMargin+diamVis/2), zTrans, -thick]) 
			//hull() {
			 	cylinder(d=diamVis+0.1, h=3*thick);
				//translate([0, -10, 0]) cylinder(d=diamVis+0.1, h=3*thick);
		//}
	 	#translate([0.5*minWidth, 0.5*supportHeight, thick]) 
		rotate([0, 90, 90]) teardrop(0.3*minWidth, 3*thick, 90);
	}
};