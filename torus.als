
sig VC {
    vlink: set Node->Node,
    priority: lone VC,
    reachable: set Node->Node
}
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
 link = vlink[VC]
 all disj vc1, vc2: VC | no vlink[vc1] & (vlink[vc2])
 //all disj n0, n1: Node | some vc: VC | n0->n1 in *(vlink[vc]).*(vlink[vc.priority])
 all disj n0, n1: Node | some vc: VC | n0->n1 in reachable[vc]
 all vc: VC | no n: Node | n->n in ^(vlink[vc])
 no priority & ~priority
 all vc: VC| #VC=1 or vc in VC.(priority+~priority)


 all disj vc1, vc2: VC | (some vc1 and vc1->vc2=priority) => reachable[vc2] = ^(reachable[vc1].*(vlink[vc2]))
 all vc: VC | no vc.~priority => reachable[vc] = ^(vlink[vc]) + (iden & Node->Node)
} for 9 but 4 VC



