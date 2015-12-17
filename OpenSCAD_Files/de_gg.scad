
Lcube = 150; // Cube size in mm
Rround = 10; // rounded radius
// edgeProfile(Lcube,Rround);
roundedCube(Lcube,Rround);

module roundedCube(L,R) 
{
	difference()	{
			cube(L, center = true);
			cube(L-20, center = true);
			for (rot = [ [0, 0, 0], [1, 0, 0], [0, 1, 0] ]) {
				rotate(90, rot)
					for (p = [[+1, +1, 0], [-1, +1, 90], [-1, -1, 180], [+1, -1, 270]]) {
						translate([ p[0]*L/2, p[1]*L/2, 0 ])
							rotate(p[2], [0, 0, 1])
								edgeProfile(L,R);
					}
			}
	}
}

module edgeProfile(L,R)
{
	render(convexity = 2) difference() {
		cube([2*R, 2*R, L+50], center = true);
		translate([-R, -R, 0])
			cylinder(h = L-2*R, r = R, center = true);
		translate([-R, -R, +L/2-R])
			sphere(r = R);
		translate([-R, -R, -(+L/2-R)])
			sphere(r = R);
	}
}

