rows=4;
columns=8;
twist = true;

puts "/* #{rows}x#{columns} Torus */\n"

rcoords = *(0...rows)
ccoords = *(0...columns)
rcoords.each do |r|
    puts( "one sig " +
	  ccoords.map { |c| "N#{r}_#{c}" }.join(", ") +
	  " extends Node {}" )
end

puts "\npred topo {"
ccoords.each do |c|
    rcoords.each do |r|
	neighbors = []
	if( twist && c == columns-1 ) 
	    neighbors.push [ r^1, (c+1)%columns ]
	else
	    neighbors.push [ r, (c+1)%columns ]
	end
	if( twist && c == 0 ) 
	    neighbors.push [ r^1, (c-1)%columns ]
	else
	    neighbors.push [ r, (c-1)%columns ]
	end
	neighbors.push [ (r+1)%rows, c ]
	neighbors.push [ (r-1)%rows, c ]
        puts( "    link[N#{r}_#{c}] = " + neighbors.map{ |x,y| "N#{x}_#{y}" }.join(" + ") );
    end
    puts ("\n")
end

#    link[N0_0] = N0_1 + N0_3 + N3_0 + N1_0
#    link[N1_0] = N1_1 + N1_3 + N0_0 + N2_0
#    link[N2_0] = N2_1 + N2_3 + N1_0 + N3_0
#    link[N3_0] = N3_1 + N3_3 + N2_0 + N0_0
#
#    link[N0_1] = N0_0 + N0_2 + N3_1 + N1_1
#    link[N1_1] = N1_0 + N1_2 + N0_1 + N2_1
#    link[N2_1] = N2_0 + N2_2 + N1_1 + N3_1
#    link[N3_1] = N3_0 + N3_2 + N2_1 + N0_1 
#
#    link[N0_2] = N0_1 + N0_3 + N3_2 + N1_2
#    link[N1_2] = N1_1 + N1_3 + N0_2 + N2_2
#    link[N2_2] = N2_1 + N2_3 + N1_2 + N3_2
#    link[N3_2] = N3_1 + N3_3 + N2_2 + N0_2
#
#    link[N0_3] = N0_2 + N0_0 + N3_3 + N1_3
#    link[N1_3] = N1_2 + N1_0 + N0_3 + N2_3
#    link[N2_3] = N2_2 + N2_0 + N1_3 + N3_3
#    link[N3_3] = N3_2 + N3_0 + N2_3 + N0_3
#
puts "}"
