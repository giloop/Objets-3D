use <MCAD/boxes.scad>
use <MCAD/triangles.scad>

diam = 24.5;
thick = 2;
height = 30;
screwDiam = 3.5;
$fn= 50;

union() {
	difference() {
		triangle(diam*2+thick, diam*2+thick, thick);
		translate([0.5*diam+thick,0.5*diam+thick,-thick]) cylinder(d=4, h=3*thick);
		translate([diam*2-thick, screwDiam*1.5+thick, -thick])  cylinder(d=screwDiam *1.5, h=3*thick);
		translate([screwDiam*1.5+thick, diam*2-thick, -thick])  cylinder(d=screwDiam *1.5, h=3*thick);
	};
	translate([diam*2-thick, screwDiam *1.5+thick, thick]) blocVis(screwDiam *1.5, 2*thick);
	translate([screwDiam *1.5+thick, diam*2-thick, thick]) blocVis(screwDiam *1.5, 2*thick);
	
	translate([0.5*diam+thick,0.5*diam+thick,thick]) 
		difference() {
			cylinder(d1=diam+2*thick, d2=diam+thick, h=height);
			cylinder(d=diam,h=height);
		}
}

module blocVis(diamVis, blocHeight) {
	difference() {
		roundedBox([3*diamVis,3*diamVis,blocHeight], 0.5*blocHeight, true);
		translate([0,0,-1.5*blocHeight]) cylinder(d=diamVis, h=3*blocHeight);
		cylinder(d=diamVis, d2=2*diamVis, h=0.5*blocHeight);
			
	}

}