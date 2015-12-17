use <MCAD/triangles.scad>


// alternative printing position 
//translate([0, 0, 10]) rotate([0,-90,0])
rotate([-90,0,0])
union() {
    translate([10,-12.6, 0]) triangle(12.1, 12, 4);
    difference() {
        translate([6,-20, 2]) #cube([32,15,4], true);
        translate([-6,-23, -1]) #cylinder(r=3/2, h=6, $fn=20);
        translate([-6+24.3,-23, -1]) #cylinder(r=3/2, h=6, $fn=20);
    }
    
    translate([0,0, 34-11]) difference() {
        translate([0,-8, -6]) cube([20,15,34],true);
        #MicroServoSG90(0,[-90,0,0],1,2);
        translate([8,-8, -5.2]) cube([10,16,22.8],true);
        translate([6,-13, 7.2]) #cube([10,6,2],true);
    }
}/**/


/**
 * Tower Pro Micro Servo SG90
 *
 * @param vector position The position vector
 * @param vector rotation The rotation vector
 * @param boolean screws If defined then "screws" will be added and when the module is differenced() from something if will have holes for the screws
 * @param number cable_start : 0:no cable, 1: horizontal cable start 2:vertical cable start
 */
module MicroServoSG90(position, rotation, screws = 0, cable_start = 0)
{
	servoX = 12.4;
	servoY = 22.8;
	servoZ = 22.8;
	earsY = 32.3;

	translate(position) 
	{
		rotate(rotation) 
		{
			translate([0,-0.5*servoX,-16]) union() 
			{
				/* Box */ 
				translate([-0.5*servoX,0,0]) cube([servoX, servoY, servoZ], false); 
				
				/* Ears */
				translate([-0.5*servoX,-0.5*(earsY-servoY),16]) 
				{ 
					difference() {
						cube([servoX, earsY, 2.6], false);
						translate([servoX/2,earsY-2.5,-1]) cylinder(r=2.4/2, h=6, $fn=20);
						translate([servoX/2,2.5,-1]) cylinder(r=2.4/2, h=6, $fn=20);
						translate([servoX/2-0.5,earsY-2,-1]) cube([1,2,6]);
						translate([servoX/2-0.5,0,-1]) cube([1,2,6]);
					}
				}		
				/* Show Cable start */
				if (cable_start==1)  { #translate([-2,-6,4.5]) cube([4,6,1], false); } // horizontal
				if (cable_start==2)  { #translate([-2,-2,0]) cube([4,2,6], false); }   // Vertical

				/* Show screws */
				if (screws > 0) {
					translate([-0.5*servoX,-0.5*(earsY-servoY),16]) { 
						translate([servoX/2,earsY-2.5,-5]) #cylinder(r=2.4/2, h=8, $fn=20);
						translate([servoX/2,2.5,-5]) #cylinder(r=2.4/2, h=8, $fn=20);
					}
				}

				/* Top Gears */
				translate([0,servoX,servoZ])	   cylinder(d=5.6, h=4.5, $fn=50); 
				translate([0,0.5*servoX,servoZ])	cylinder(d=servoX, h=4.5, $fn=50);
				
				/* 	Axe */
				translate([0,0.5*servoX,servoZ])	cylinder(d=5, h=4.5+3 , $fn=50);
			}
		}
	}
}

