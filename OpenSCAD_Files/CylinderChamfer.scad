/* OpenSCAD module to create cylinder with chamfers 
	Gilles Gonon - http://gilles.gonon.free.fr/
	Creation date - 02/01/2015
	License : GNU GPL
*/



module cylinder_chamfer(r,h,chamfer_size=1, chamfer_angle=45, top_style="none", bottom_style="none") {
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


module cut_cylinder_chamfer(r,h,chamfer_size=1, chamfer_angle=45, bBoth=true) {
	r_cone = r + chamfer_size;
	h_cone = tan(chamfer_angle) * r_cone;
	
	union() {
		cylinder(r=r,h=h, $fn=100);
		cylinder(r1=r_cone, r2=0, h=h_cone, $fn=100);
		if (bBoth==true) {
			translate([0,0,h-h_cone]) 
				cylinder(r1=0, r2=r_cone, h=h_cone, $fn=100);
		}
	}
}

