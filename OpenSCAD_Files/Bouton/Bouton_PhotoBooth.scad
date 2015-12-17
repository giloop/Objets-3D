/* OpenSCAD module to create cylinder with chamfers 
	Gilles Gonon - http://gilles.gonon.free.fr/
	Creation date - 06/03/2015
	License : GNU GPL
*/

/* Bouton
color("blue") { 
	translate([0,0,0]) 
	difference() {
		union() {
			cylinder_chamfer(10,10);
			cylinder(r=12,h=2, $fn=100);
		}
		translate([0,-7,-1]) cylinder(r=2.3,h=2.5, $fn=50);
		translate([0,7,-1]) cylinder(r=2.3,h=2.5, $fn=50);
	}
} */
/* Box */
translate([0,0,12]) rotate([0,180,0]) 
	difference() {	
		translate([0,0,6]) cube([50, 50, 12], center=true);
		translate([0,0,4]) cube([30, 44, 11], center=true);
		translate([0,0,4]) cube([44, 30, 11], center=true);
		cylinder(r=10.2,h=30);
		translate([20,20,-1]) cylinder(r=1.1,h=8, $fn=100);
		translate([-20,20,-1]) cylinder(r=1.1,h=8, $fn=100);
		translate([20,-20,-1]) cylinder(r=1.1,h=8, $fn=100);
		translate([-20,-20,-1]) cylinder(r=1.1,h=8, $fn=100);
	}

module cylinder_chamfer(r,h,chamfer_size=2, chamfer_angle=45, bBoth=true) {
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
