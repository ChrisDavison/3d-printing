H=10;
L=10;
W=10;
S=5;
D=3;

// --------------------------------
// --------------------------------
// --------------------------------

//board();
//pawnGrid();

translate([0,0*(H+S),0])rook();
translate([0,1*(H+S),0])knight();
translate([0,2*(H+S),0])bishop();
translate([0,3*(H+S),0])queen();
translate([0,4*(H+S),0])king();
translate([0,5*(H+S),0])bishop();
translate([0,6*(H+S),0])knight();
translate([0,7*(H+S),0])rook();
translate([H+S,0,0])pawnRow();

// --------------------------------
// --------------------------------
// --------------------------------

module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
}


// Complex pieces
module king(){
	union(){
	cube([H,H,H*2]);
	translate([0,0,2*H])prism(H,H/2,H);
	translate([0,H,2*H])prism(H,-H/2,H);
}
}

module queen(){  
	union(){
	cube([H,H,2*H]); 

	translate([0,H/2,2*H])prism(H,H/2,H);
	translate([H,H/2,2*H])rotate([0,0,180])prism(H,H/2,H);
	}
}


// Simple pieces
module pawn(){ cube([H,H,H]); }
module rook(){ cube([H,H,2*H]); }
module knight(){ 
	union(){
	cube([H,H,H]); 
	translate([0,0,H])cube([H,H/2,H]);
	}
}
module bishop(){
	union(){
	cube([H,H,H]);
	translate([0,0,H])prism(H,H,H);
	}
}

// Chess board
module pawnRow(){
	translate([0,0,0])pawn();
	translate([0,H+S,0])pawn();
	translate([0,2*(H+S),0])pawn();
	translate([0,3*(H+S),0])pawn();
	translate([0,4*(H+S),0])pawn();
	translate([0,5*(H+S),0])pawn();
	translate([0,6*(H+S),0])pawn();
	translate([0,7*(H+S),0])pawn();
}

module pawnGrid(){
	translate([0,0,0])pawnRow();
	translate([H+S,0,0])pawnRow();
	translate([2*(H+S),0,0])pawnRow();
	translate([3*(H+S),0,0])pawnRow();
	translate([4*(H+S),0,0])pawnRow();
	translate([5*(H+S),0,0])pawnRow();
	translate([6*(H+S),0,0])pawnRow();
	translate([7*(H+S),0,0])pawnRow();
}

module board(){
	difference(){
		translate([-S,-S,H-2])cube([8*(H+S)+2*S,8*(H+S)+2*S,3]);
     	pawnGrid();
   }
}

