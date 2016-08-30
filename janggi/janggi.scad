$fn=32;

module octagon(R, H){
	difference(){
		cylinder (h = H, r=R, center = true);
		
		difference(){
			translate([0,0,2.5])color([1,0,0])cylinder (h = H-1, r=R-3, center = true);
			translate([0,0,2.5])color([1,0,0])cylinder (h = H, r=R-5, center = true);
			}
		}
}

module elephant(){
    module top(){
        translate([0,0,1])cube([10,2,1], center=true);
        translate([0,0,1])cube([2,10,1], center=true);
        
        translate([5,0,1])cube([1,5,1], center=true);
        translate([-5,0,1])cube([1,5,1], center=true);
        
        translate([0,5,1])cube([5,1,1], center=true);
        translate([0,-5,1])cube([5,1,1], center=true);
    }
	difference(){
        octagon(10,4);
        scale([1,1,2])rotate([0,0,45/2])top();
	}
}

module horse(){
   module top(){
        translate([0,0,1])cube([10,2,1], center=true);
        translate([0,0,1])cube([2,10,1], center=true);
        
        translate([5,0,1])cube([1,5,1], center=true);
        translate([-5,0,1])cube([1,5,1], center=true);
        
        translate([0,5,1])cube([5,1,1], center=true);
        translate([0,-5,1])cube([5,1,1], center=true);
    }

	difference(){
		octagon(10,4);
		scale([0.5,0.5,2])rotate([0,0,45/2])top();
	}
}


octagon(25, 8);
//elephant();
//horse();