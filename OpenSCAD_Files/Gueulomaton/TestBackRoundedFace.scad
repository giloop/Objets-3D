
backFace(20,20,4,2);

module backFace(x,y,z,rad){
    union() {
       translate([0,0,z/4]) roundedBox(x,y,z/2,rad);
       hull() {
            translate([-x/2+rad, y/2-rad,z/2]) sphere(r=rad, $fn=100);
            translate([ x/2-rad, y/2-rad,z/2]) sphere(r=rad, $fn=100);
            translate([-x/2+rad,-y/2+rad,z/2]) sphere(r=rad, $fn=100);
            translate([ x/2-rad,-y/2+rad,z/2]) sphere(r=rad, $fn=100);
       }
   }
}


module roundedBox(x,y,z,rad){
	hull() {
        translate([-x/2+rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([ x/2-rad, y/2-rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([-x/2+rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
        translate([ x/2-rad,-y/2+rad,-z/2]) cylinder(h=z,r=rad, $fn=100);
   }
}