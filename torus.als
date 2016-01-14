
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

/*
    all disj n1, n2: Node, 
	vc1: VC 
	,vc2: VC-^priority.vc1 
        ,vc3: VC-^priority.vc2 
        ,vc4: VC-^priority.vc3 
	| n1->n2 in vlink[vc1] 
	 .*(vlink[vc2])
         .*(vlink[vc3])
	 .*(vlink[vc4])
*/
} for 9 but 4 VC





