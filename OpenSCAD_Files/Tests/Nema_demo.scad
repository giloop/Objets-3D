include <MCAD/stepper.scad>
//include <MCAD/units.scad>
//include <MCAD/materials.scad>
// Demo, uncomment to show:
nema_demo();

module nema_demo(){
	for (size = [NemaShort, NemaMedium, NemaLong]) {
		translate([-100,size*100,0]) motor(Nema34, size, dualAxis=true);
		translate([0,size*100,0]) motor(Nema23, size, dualAxis=true);
		translate([100,size*100,0]) motor(Nema17, size, dualAxis=true);
		translate([200,size*100,0]) motor(Nema14, size, dualAxis=true);
		translate([300,size*100,0]) motor(Nema11, size, dualAxis=true);
		translate([400,size*100,0]) motor(Nema08, size, dualAxis=true);
	}
}
