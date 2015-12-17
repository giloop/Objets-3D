use <Writescad/write.scad>

/*translate([0,0,0])
#cylinder(r=20,h=40);

writecylinder("rotate=90",[0,0,0],20,40,rotate=90);

writecylinder("rotate = 30,east = 90",[0,0,0],20,40,space=1.2,rotate=30,east=90);

writecylinder("ccw = true",[0,0,0],20,40,face="top",ccw=true);

writecylinder("middle = 8",[0,0,0],20,40,h=3,face="top",middle=8);

writecylinder("face = top",[0,0,0],20,40,face="top");

writecylinder("east=90",[0,0,0],20,40,h=3,face="top",east=90);

writecylinder("west=90",[0,0,0],20,40,h=3,face="top",ccw=true,west=90);
*/

difference() {
	cylinder(r=20,h=40);
	translate([0,0,0]) union() {
		writecylinder("-  +",[0,0,0],20,40, h=8, t=3,face="bottom"); 
		writecylinder("Difficulte",[0,0,0],20,40,h=6, t=3, face="bottom",ccw=true,font="knewave.dxf");
	}
}
