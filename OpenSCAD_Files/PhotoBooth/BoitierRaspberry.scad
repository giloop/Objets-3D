x = 150;
y = 100;
z1 = 30;
z2 = 80;
diam = 2;
thick = 2;
// Rasberry pi dimensions
rpiX = 85;
rpiY = 56;
rpiXHole1 = 3.5;
rpiXHole2 = 3.5+58;
rpiHoleDiam = 2.75;


translate([rpiX,y+thick, thick]) rotate([0,0,180]) import (file = "RaspberryPiBplus.stl");

#roundedBox(x,y,z1,z2,diam);

/* Bottom part of box */

module roundedBox(sizX,sizY,sizZ1,sizZ2,dRound)
{
// Rounded Box
hull() {
    // Base
    translate([0,0,0]) sphere(d=dRound, $fn=50);
    translate([sizX,0,0]) sphere(d=dRound, $fn=50);    
    translate([sizX,sizY,0]) sphere(d=dRound, $fn=50);    
    translate([0,sizY,0]) sphere(d=dRound, $fn=50);    
    // Top
    translate([0,0,sizZ1]) sphere(d=dRound, $fn=50);
    translate([sizX,0,sizZ1]) sphere(d=dRound, $fn=50);    
    translate([sizX,sizY,sizZ2]) sphere(d=dRound, $fn=50);    
    translate([0,sizY,sizZ2]) sphere(d=dRound, $fn=50);    
    
};
}