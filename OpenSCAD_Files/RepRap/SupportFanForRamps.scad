use <MCAD/teardrop.scad>

Lx = 45;
Ly = 120;
Lbase = 30;
thick = 4;
fanX = 32.5;
dVentilo = 38;
union() {
    // Partie haute et longue, allongée 
    difference() { 
        roundedBox(Lx,Ly,thick,5);
        // Trou pour la ventilation + vis
       translate([0,0.5*(Ly-dVentilo)-3,-thick])  {
            //translate([0,0.5*(Ly-dVentilo)-10,0]) cylinder(h=2*thick, d=dVentilo);
            // Ventilation
            cylinder(h=2*thick, d=dVentilo);
            // 4 Vis 
            translate([-0.5*fanX,0.5*fanX, 0]) cylinder(h=2*thick,d=4, $fn=50);
            translate([0.5*fanX,0.5*fanX, 0]) cylinder(h=2*thick,d=4, $fn=50);
            translate([-0.5*fanX,-0.5*fanX, 0]) cylinder(h=2*thick,d=4, $fn=50);
            translate([0.5*fanX,-0.5*fanX, 0]) cylinder(h=2*thick,d=4, $fn=50);
        }
        //translate([-0.5*fanX,0,-thick]) hull() { 
                
        //        translate([0,0.45*Ly-fanX,0]) cylinder(h=2*thick,d=4, $fn=50);
        //    };
        /*translate([0.5*fanX,0,-thick]) hull() { 
                translate([0,0.45*Ly-fanX-15,0]) cylinder(h=2*thick,d=4, $fn=50);
                translate([0,0.45*Ly,0]) cylinder(h=2*thick,d=4, $fn=50);
            };
        
        // 
        translate([0,0.45*Ly-fanX-15,-thick]) hull() {
            translate([0,0.5*(Ly-dVentilo)-10,0]) cylinder(h=2*thick, d=dVentilo);
            translate([0,0.5*(Ly-dVentilo)-12,0]) cylinder(h=2*thick, d=dVentilo);
        }*/
            
        // Goutte pour avoir un peu moins de matière
        #translate([0, -0.2*Ly, 0]) rotate([0, 90, 90]) 
            teardrop(0.3*Lx, 2*thick, 90);
    }
    // base au sol (vertical)
    translate([0,-(Ly-thick)/2,(Lbase-thick)/2]) rotate([90,0,0]) 
    difference() { 
        // Base
        roundedBox(Lx+20,Lbase,thick,5);
        // Trou pour utiliser moins de matière
        #translate([0, 0.5*Lbase,-thick]) cylinder(h=2*thick,r=0.3*Lx, $fn=50);
        // Trous des vis
        #translate([0.5*Lx,0.25*Lbase, -thick]) cylinder(h=thick*2, d=4, $fn=50);
        #translate([-0.5*Lx,0.25*Lbase, -thick]) cylinder(h=thick*2, d=4, $fn=50);
    };

}


module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
   }
}