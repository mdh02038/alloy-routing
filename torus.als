
sig VC {
    vlink: set Node->Node,
    priority: lone VC,
    reachable: set Node->Node
}
abstract sig Direction {
    members: set VC
}
one sig Left, Right extends Direction { }
sig Node {
    link: set Node
}


/* 4x8 Twisted Torus */
one sig N0_0, N0_1, N0_2, N0_3, N0_4, N0_5, N0_6, N0_7 extends Node {}
one sig N1_0, N1_1, N1_2, N1_3, N1_4, N1_5, N1_6, N1_7 extends Node {}
one sig N2_0, N2_1, N2_2, N2_3, N2_4, N2_5, N2_6, N2_7 extends Node {}
one sig N3_0, N3_1, N3_2, N3_3, N3_4, N3_5, N3_6, N3_7 extends Node {}

pred topo {
    link[N0_0] = N0_1 + N1_7 + N1_0 + N3_0
    link[N1_0] = N1_1 + N0_7 + N2_0 + N0_0
    link[N2_0] = N2_1 + N3_7 + N3_0 + N1_0
    link[N3_0] = N3_1 + N2_7 + N0_0 + N2_0

    link[N0_1] = N0_2 + N0_0 + N1_1 + N3_1
    link[N1_1] = N1_2 + N1_0 + N2_1 + N0_1
    link[N2_1] = N2_2 + N2_0 + N3_1 + N1_1
    link[N3_1] = N3_2 + N3_0 + N0_1 + N2_1

    link[N0_2] = N0_3 + N0_1 + N1_2 + N3_2
    link[N1_2] = N1_3 + N1_1 + N2_2 + N0_2
    link[N2_2] = N2_3 + N2_1 + N3_2 + N1_2
    link[N3_2] = N3_3 + N3_1 + N0_2 + N2_2

    link[N0_3] = N0_4 + N0_2 + N1_3 + N3_3
    link[N1_3] = N1_4 + N1_2 + N2_3 + N0_3
    link[N2_3] = N2_4 + N2_2 + N3_3 + N1_3
    link[N3_3] = N3_4 + N3_2 + N0_3 + N2_3

    link[N0_4] = N0_5 + N0_3 + N1_4 + N3_4
    link[N1_4] = N1_5 + N1_3 + N2_4 + N0_4
    link[N2_4] = N2_5 + N2_3 + N3_4 + N1_4
    link[N3_4] = N3_5 + N3_3 + N0_4 + N2_4

    link[N0_5] = N0_6 + N0_4 + N1_5 + N3_5
    link[N1_5] = N1_6 + N1_4 + N2_5 + N0_5
    link[N2_5] = N2_6 + N2_4 + N3_5 + N1_5
    link[N3_5] = N3_6 + N3_4 + N0_5 + N2_5

    link[N0_6] = N0_7 + N0_5 + N1_6 + N3_6
    link[N1_6] = N1_7 + N1_5 + N2_6 + N0_6
    link[N2_6] = N2_7 + N2_5 + N3_6 + N1_6
    link[N3_6] = N3_7 + N3_5 + N0_6 + N2_6

    link[N0_7] = N1_0 + N0_6 + N1_7 + N3_7
    link[N1_7] = N0_0 + N1_6 + N2_7 + N0_7
    link[N2_7] = N3_0 + N2_6 + N3_7 + N1_7
    link[N3_7] = N2_0 + N3_6 + N0_7 + N2_7

}
/* 8x8 Twisted Torus */
/*
one sig N0_0, N0_1, N0_2, N0_3, N0_4, N0_5, N0_6, N0_7 extends Node {}
one sig N1_0, N1_1, N1_2, N1_3, N1_4, N1_5, N1_6, N1_7 extends Node {}
one sig N2_0, N2_1, N2_2, N2_3, N2_4, N2_5, N2_6, N2_7 extends Node {}
one sig N3_0, N3_1, N3_2, N3_3, N3_4, N3_5, N3_6, N3_7 extends Node {}
one sig N4_0, N4_1, N4_2, N4_3, N4_4, N4_5, N4_6, N4_7 extends Node {}
one sig N5_0, N5_1, N5_2, N5_3, N5_4, N5_5, N5_6, N5_7 extends Node {}
one sig N6_0, N6_1, N6_2, N6_3, N6_4, N6_5, N6_6, N6_7 extends Node {}
one sig N7_0, N7_1, N7_2, N7_3, N7_4, N7_5, N7_6, N7_7 extends Node {}

pred topo {
    link[N0_0] = N0_1 + N1_7 + N1_0 + N7_0
    link[N1_0] = N1_1 + N0_7 + N2_0 + N0_0
    link[N2_0] = N2_1 + N3_7 + N3_0 + N1_0
    link[N3_0] = N3_1 + N2_7 + N4_0 + N2_0
    link[N4_0] = N4_1 + N5_7 + N5_0 + N3_0
    link[N5_0] = N5_1 + N4_7 + N6_0 + N4_0
    link[N6_0] = N6_1 + N7_7 + N7_0 + N5_0
    link[N7_0] = N7_1 + N6_7 + N0_0 + N6_0

    link[N0_1] = N0_2 + N0_0 + N1_1 + N7_1
    link[N1_1] = N1_2 + N1_0 + N2_1 + N0_1
    link[N2_1] = N2_2 + N2_0 + N3_1 + N1_1
    link[N3_1] = N3_2 + N3_0 + N4_1 + N2_1
    link[N4_1] = N4_2 + N4_0 + N5_1 + N3_1
    link[N5_1] = N5_2 + N5_0 + N6_1 + N4_1
    link[N6_1] = N6_2 + N6_0 + N7_1 + N5_1
    link[N7_1] = N7_2 + N7_0 + N0_1 + N6_1

    link[N0_2] = N0_3 + N0_1 + N1_2 + N7_2
    link[N1_2] = N1_3 + N1_1 + N2_2 + N0_2
    link[N2_2] = N2_3 + N2_1 + N3_2 + N1_2
    link[N3_2] = N3_3 + N3_1 + N4_2 + N2_2
    link[N4_2] = N4_3 + N4_1 + N5_2 + N3_2
    link[N5_2] = N5_3 + N5_1 + N6_2 + N4_2
    link[N6_2] = N6_3 + N6_1 + N7_2 + N5_2
    link[N7_2] = N7_3 + N7_1 + N0_2 + N6_2

    link[N0_3] = N0_4 + N0_2 + N1_3 + N7_3
    link[N1_3] = N1_4 + N1_2 + N2_3 + N0_3
    link[N2_3] = N2_4 + N2_2 + N3_3 + N1_3
    link[N3_3] = N3_4 + N3_2 + N4_3 + N2_3
    link[N4_3] = N4_4 + N4_2 + N5_3 + N3_3
    link[N5_3] = N5_4 + N5_2 + N6_3 + N4_3
    link[N6_3] = N6_4 + N6_2 + N7_3 + N5_3
    link[N7_3] = N7_4 + N7_2 + N0_3 + N6_3

    link[N0_4] = N0_5 + N0_3 + N1_4 + N7_4
    link[N1_4] = N1_5 + N1_3 + N2_4 + N0_4
    link[N2_4] = N2_5 + N2_3 + N3_4 + N1_4
    link[N3_4] = N3_5 + N3_3 + N4_4 + N2_4
    link[N4_4] = N4_5 + N4_3 + N5_4 + N3_4
    link[N5_4] = N5_5 + N5_3 + N6_4 + N4_4
    link[N6_4] = N6_5 + N6_3 + N7_4 + N5_4
    link[N7_4] = N7_5 + N7_3 + N0_4 + N6_4

    link[N0_5] = N0_6 + N0_4 + N1_5 + N7_5
    link[N1_5] = N1_6 + N1_4 + N2_5 + N0_5
    link[N2_5] = N2_6 + N2_4 + N3_5 + N1_5
    link[N3_5] = N3_6 + N3_4 + N4_5 + N2_5
    link[N4_5] = N4_6 + N4_4 + N5_5 + N3_5
    link[N5_5] = N5_6 + N5_4 + N6_5 + N4_5
    link[N6_5] = N6_6 + N6_4 + N7_5 + N5_5
    link[N7_5] = N7_6 + N7_4 + N0_5 + N6_5

    link[N0_6] = N0_7 + N0_5 + N1_6 + N7_6
    link[N1_6] = N1_7 + N1_5 + N2_6 + N0_6
    link[N2_6] = N2_7 + N2_5 + N3_6 + N1_6
    link[N3_6] = N3_7 + N3_5 + N4_6 + N2_6
    link[N4_6] = N4_7 + N4_5 + N5_6 + N3_6
    link[N5_6] = N5_7 + N5_5 + N6_6 + N4_6
    link[N6_6] = N6_7 + N6_5 + N7_6 + N5_6
    link[N7_6] = N7_7 + N7_5 + N0_6 + N6_6

    link[N0_7] = N1_0 + N0_6 + N1_7 + N7_7
    link[N1_7] = N0_0 + N1_6 + N2_7 + N0_7
    link[N2_7] = N3_0 + N2_6 + N3_7 + N1_7
    link[N3_7] = N2_0 + N3_6 + N4_7 + N2_7
    link[N4_7] = N5_0 + N4_6 + N5_7 + N3_7
    link[N5_7] = N4_0 + N5_6 + N6_7 + N4_7
    link[N6_7] = N7_0 + N6_6 + N7_7 + N5_7
    link[N7_7] = N6_0 + N7_6 + N0_7 + N6_7

}
*/


/* 4x4 Twisted Torus 
one sig N0_0, N0_1, N0_2, N0_3 extends Node {}
one sig N1_0, N1_1, N1_2, N1_3 extends Node {}
one sig N2_0, N2_1, N2_2, N2_3 extends Node {}
one sig N3_0, N3_1, N3_2, N3_3 extends Node {}

pred topo {
    link[N0_0] = N0_1 + N1_3 + N3_0 + N1_0
    link[N1_0] = N1_1 + N0_3 + N0_0 + N2_0
    link[N2_0] = N2_1 + N3_3 + N1_0 + N3_0
    link[N3_0] = N3_1 + N2_3 + N2_0 + N0_0

    link[N0_1] = N0_0 + N0_2 + N3_1 + N1_1
    link[N1_1] = N1_0 + N1_2 + N0_1 + N2_1
    link[N2_1] = N2_0 + N2_2 + N1_1 + N3_1
    link[N3_1] = N3_0 + N3_2 + N2_1 + N0_1 

    link[N0_2] = N0_1 + N0_3 + N3_2 + N1_2
    link[N1_2] = N1_1 + N1_3 + N0_2 + N2_2
    link[N2_2] = N2_1 + N2_3 + N1_2 + N3_2
    link[N3_2] = N3_1 + N3_3 + N2_2 + N0_2

    link[N0_3] = N0_2 + N1_0 + N3_3 + N1_3
    link[N1_3] = N1_2 + N0_0 + N0_3 + N2_3
    link[N2_3] = N2_2 + N3_0 + N1_3 + N3_3
    link[N3_3] = N3_2 + N2_0 + N2_3 + N0_3

}
*/
/* 4x4 Torus
one sig N0_0, N0_1, N0_2, N0_3 extends Node {}
one sig N1_0, N1_1, N1_2, N1_3 extends Node {}
one sig N2_0, N2_1, N2_2, N2_3 extends Node {}
one sig N3_0, N3_1, N3_2, N3_3 extends Node {}

pred topo {
    link[N0_0] = N0_1 + N0_3 + N3_0 + N1_0
    link[N1_0] = N1_1 + N1_3 + N0_0 + N2_0
    link[N2_0] = N2_1 + N2_3 + N1_0 + N3_0
    link[N3_0] = N3_1 + N3_3 + N2_0 + N0_0

    link[N0_1] = N0_0 + N0_2 + N3_1 + N1_1
    link[N1_1] = N1_0 + N1_2 + N0_1 + N2_1
    link[N2_1] = N2_0 + N2_2 + N1_1 + N3_1
    link[N3_1] = N3_0 + N3_2 + N2_1 + N0_1 

    link[N0_2] = N0_1 + N0_3 + N3_2 + N1_2
    link[N1_2] = N1_1 + N1_3 + N0_2 + N2_2
    link[N2_2] = N2_1 + N2_3 + N1_2 + N3_2
    link[N3_2] = N3_1 + N3_3 + N2_2 + N0_2

    link[N0_3] = N0_2 + N0_0 + N3_3 + N1_3
    link[N1_3] = N1_2 + N1_0 + N0_3 + N2_3
    link[N2_3] = N2_2 + N2_0 + N1_3 + N3_3
    link[N3_3] = N3_2 + N3_0 + N2_3 + N0_3

}
*/

/* 3x3 Torus
one sig N0_0, N0_1, N0_2 extends Node {}
one sig N1_0, N1_1, N1_2 extends Node {}
one sig N2_0, N2_1, N2_2 extends Node {}

pred topo {
    link[N0_0] = N0_1 + N0_2 + N1_0 + N2_0
    link[N1_0] = N1_1 + N1_2 + N0_0 + N2_0
    link[N2_0] = N2_1 + N2_2 + N1_0 + N0_0

    link[N0_1] = N0_0 + N0_2 + N1_1 + N2_1
    link[N1_1] = N1_0 + N1_2 + N0_1 + N2_1
    link[N2_1] = N2_0 + N2_2 + N1_1 + N0_1

    link[N0_2] = N0_0 + N0_1 + N1_2 + N2_2
    link[N1_2] = N1_0 + N1_1 + N0_2 + N2_2
    link[N2_2] = N2_0 + N2_1 + N1_2 + N0_2

}
*/

run {
    topo

   /*
    * partition vcs into 2 sets (Left and Right)
    */
    Direction.members = VC
    all disj d1, d2: Direction | no d1.members & d2.members
    /*
     * every connection (2 links) is split into a left and right direction
     */
    link = vlink[Direction.members]
    all disj d1, d2: Direction | no vlink[members[d1]] & vlink[members[d2]]
    all d: Direction, disj v1, v2: members[d] | vlink[v1] = vlink[v2]

    all disj n0, n1: Node | some vc: VC | n0->n1 in reachable[vc]
    all disj vc1, vc2: VC | vc1->vc2 in priority => reachable[vc2] = reachable[vc1].^(vlink[vc2])

    all vc: VC | no n: Node | n->n in ^(vlink[vc])
    no priority & ~priority
    all vc: VC| #VC=1 or vc in VC.(priority+~priority)


    all vc: VC | no vc.~priority => reachable[vc] = ^(vlink[vc]) + (iden & Node->Node)

    all disj n1, n2: Node | some
	vc1: VC 
	,vc2: VC-^priority.vc1 
        ,vc3: VC-^priority.vc2 
        ,vc4: VC-^priority.vc3 
        ,vc5: VC-^priority.vc4 
        ,vc6: VC-^priority.vc5 
	| n1->n2 in (iden+vlink[vc1]) 
	 .(iden+vlink[vc2])
         .(iden+vlink[vc3])
	 .(iden+vlink[vc4])
	 .(iden+vlink[vc5])
	 .(iden+vlink[vc6])
} for 64 but 4 VC





