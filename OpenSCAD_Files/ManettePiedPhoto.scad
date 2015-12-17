use <MCAD/triangles.scad>

x = 20;
y = x;
z = 40;
rad = 4; 
radInt = 3.9;
wallThick = 4;
screwHead = 10;
screwD = 5;


difference() {
    hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r1=rad, r2=rad/2, $fn=50);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r1=rad, r2=rad/2, $fn=50);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r1=rad, r2=rad/2, $fn=50);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r1=rad, r2=rad/2, $fn=50);
   }
        
   #translate([0,0, -5]) cylinder(h=2*z,r=radInt, $fn=50);
};

module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=50);
   }
}