
// Cable holder

tableThick = 19;
clipThick = 3;
clipLength = 25;
cableDiam = 7;
holdLength = 2*cableDiam+clipThick;
yLength = 20;

// Position Clip to be printable
translate([0,0,0.5*yLength]) rotate([-90,0,0]) 
clip();

module clip() {
 // Base d'attache à la table
 difference() {
     union() 
     {
        // cube([clipLength, yLength, tableThick+clipThick*2], true);
        intersection() {
            roundedBox(clipLength,yLength,tableThick+clipThick*2,2);
            rotate([90,0,0]) 
                roundedBox(clipLength,tableThick+clipThick*2,yLength,2);            
        }
        
        // Plateau pour accrocher le cable
        //translate([holdLength,0,(tableThick+clipThick)*0.5]) 
        translate([0.5*holdLength+clipThick-0.5,0,(tableThick+clipThick)*0.5+cableDiam])  rotate([0,90,0]) 
        { 
            difference() {
                //cube([clipLength, yLength, clipThick], true);
                // plateau support
                intersection() {
                    roundedBox(holdLength, yLength, clipThick, 2);
                    translate([0,0,-0.5*clipThick]) rotate([0,90,0]) 
                    roundedBox(clipThick*2, yLength, holdLength,2);
                }
                /* Trous pour le cable */
                // v2
                translate([-1, 0, -(clipThick+5)/2])
                        rotate([0,10,0]) cylinder(h=clipThick+5,d=cableDiam+3, $fn=50);
                /* v1 : 
                hull() {
                    translate([0, -0.25*yLength, -clipThick/2])
                        cylinder(h=clipThick,d=cableDiam, $fn=50);
                    translate([0, 0.25*yLength, -clipThick/2])
                        cylinder(h=clipThick, d=cableDiam, $fn=50);
                } */ 
                #translate([-cableDiam, 0, 0.5*clipThick]) rotate([0,0,90])
                    cube([cableDiam+1, 0.5*yLength, clipThick], true);
            }
        }
    }
    translate([-1.1*clipThick,0,0]) cube([clipLength, yLength, tableThick], true);
    #translate([clipLength/2-clipThick,yLength/2,tableThick/2]) 
        rotate([90,0,0]) 
        cylinder(h=yLength,d=1.5, $fn=50);
    #translate([clipLength/2-clipThick,yLength/2,-tableThick/2]) 
        rotate([90,0,0]) 
        cylinder(h=yLength,d=1.5, $fn=50);
 }
}

module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
   }
}