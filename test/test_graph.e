note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_GRAPH

create
	make

feature -- Test routines

	make
			-- New test routine
		do
			print ("Build undirected graph with STRINGs%N")
			test_build_undirected_graph_string

			print ("Build undirected graph with STRINGs and Labels%N")
			test_build_undirected_graph_string_with_labels

			print ("Build adj matrix undirected graph with STRINGs and Labels%N")
			test_build_undirected_matrix_graph_string_with_labels

			print ("Build adj matrix  graph with STRINGs and Labels%N")
			test_build_matrix_graph_string_with_labels

			print ("Build undirected graph with STRINGs and Labels Integer%N")
			test_build_undirected_graph_string_with_labels_integer
		end

	test_build_undirected_graph_string_with_labels
		local
			l_graph: LINKED_UNDIRECTED_GRAPH [STRING, STRING]
			l_bfs: BFS_WALKER [STRING, STRING]
			l_dfs: DFS_WALKER [STRING, STRING]
		do
				-- Create the graph
			create l_graph.make_simple_graph

				-- Put the nodes into the graph.

			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_node ("c")
			l_graph.put_node ("d")
				-- Put the nodes into the graph.
			l_graph.put_edge ("a", "b", "a-b")
			l_graph.put_edge ("a", "c", "a-c")
			l_graph.put_edge ("b", "c", "b-c")
			l_graph.put_edge ("c", "d", "c-d")

			check
				has_cycles: l_graph.has_cycles
			end

			l_graph.find_path ("a", "d")

			check
				has_path: l_graph.path_found
			end

			check
				four_nodes: l_graph.node_count = 4
			end
			check
				four_edges: l_graph.edge_count = 4
			end

			l_graph.search ("z")
			check
				not_exits: l_graph.off
			end

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

			across l_graph.path as ic loop
				if attached ic.item as l_item then
					print (l_item.out)
				end
			end

			across l_graph as ic loop
				print ("%NCurrent item: " + ic.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
			end

				-- BFS walker
			print ("%NBFS walker")
			create l_bfs.make (l_graph)
			from
				l_bfs.start
			until
				l_bfs.after
			loop
				print ("%NCurrent item: " + l_bfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_bfs.forth
			end
			across l_bfs as ic loop
				print ("%NCurrent item: " + ic.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
			end
			io.put_new_line

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

				-- DFS walker
			print ("%NDFS walker")
			create l_dfs.make (l_graph)
			from
				l_dfs.start
			until
				l_dfs.after
			loop
				print ("%NCurrent item: " + l_dfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_dfs.forth
			end
			print ("%N=============================%N")

			l_graph.prune_edge_between ("a", "b")
			l_graph.find_path ("a", "b")
			check
				not_has_edge: not l_graph.has_edge_between ("a", "b")
			end
		end

	test_build_undirected_matrix_graph_string_with_labels
		local
			l_graph: ADJACENCY_MATRIX_UNDIRECTED_GRAPH [STRING, STRING]
			l_bfs: BFS_WALKER [STRING, STRING]
			l_dfs: DFS_WALKER [STRING, STRING]
		do
				-- Create the graph
			create l_graph.make_simple_graph

				-- Put the nodes into the graph.

			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_node ("c")
			l_graph.put_node ("d")
				-- Put the nodes into the graph.
			l_graph.put_edge ("a", "b", "a-b")
			l_graph.put_edge ("a", "c", "a-c")
			l_graph.put_edge ("b", "c", "b-c")
			l_graph.put_edge ("c", "d", "c-d")

			check
				has_cycles: l_graph.has_cycles
			end

			l_graph.find_path ("a", "d")

			check
				has_path: l_graph.path_found
			end

			check
				four_nodes: l_graph.node_count = 4
			end
			check
				four_edges: l_graph.edge_count = 4
			end

			l_graph.search ("z")
			check
				not_exits: l_graph.off
			end

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

			across l_graph.path as ic loop
				if attached ic.item as l_item then
					print (l_item.out)
				end
			end

				-- BFS walker
			print ("%NBFS walker")
			create l_bfs.make (l_graph)
			from
				l_bfs.start
			until
				l_bfs.after
			loop
				print ("%NCurrent item: " + l_bfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_bfs.forth
			end
			io.put_new_line

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

				-- DFS walker
			print ("%NDFS walker")
			create l_dfs.make (l_graph)
			from
				l_dfs.start
			until
				l_dfs.after
			loop
				print ("%NCurrent item: " + l_dfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_dfs.forth
			end
			print ("%N=============================%N")

			l_graph.prune_edge_between ("a", "b")
			l_graph.find_path ("a", "b")
			check
				not_has_edge: not l_graph.has_edge_between ("a", "b")
			end
		end

	test_build_matrix_graph_string_with_labels
		local
			l_graph: ADJACENCY_MATRIX_GRAPH [STRING, STRING]
			l_bfs: BFS_WALKER [STRING, STRING]
			l_dfs: DFS_WALKER [STRING, STRING]
		do
				-- Create the graph
			create l_graph.make_symmetric_graph

				-- Put the nodes into the graph.

			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_node ("c")
			l_graph.put_node ("d")
				-- Put the nodes into the graph.
			l_graph.put_edge ("a", "b", "a-b")
			l_graph.put_edge ("a", "c", "a-c")
			l_graph.put_edge ("b", "c", "b-c")
			l_graph.put_edge ("c", "d", "c-d")

			check
				has_cycles: l_graph.has_cycles
			end

			l_graph.find_path ("a", "d")

			check
				has_path: l_graph.path_found
			end

			check
				four_nodes: l_graph.node_count = 4
			end
			check
				four_edges: l_graph.edge_count = 8
			end

			l_graph.search ("z")
			check
				not_exits: l_graph.off
			end

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

			across l_graph.path as ic loop
				if attached ic.item as l_item then
					print (l_item.out)
				end
			end

				-- BFS walker
			print ("%NBFS walker")
			create l_bfs.make (l_graph)
			from
				l_bfs.start
			until
				l_bfs.after
			loop
				print ("%NCurrent item: " + l_bfs.item)
				print ("%NNumber of in degree edges attached to item: " + l_graph.in_degree.out)
				print ("%NNumber of out degree edges attached to item: " + l_graph.out_degree.out)
				l_bfs.forth
			end
			io.put_new_line

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

				-- DFS walker
			print ("%NDFS walker")
			create l_dfs.make (l_graph)
			from
				l_dfs.start
			until
				l_dfs.after
			loop
				print ("%NCurrent item: " + l_dfs.item)
				print ("%NNumber of in degree edges attached to item: " + l_graph.in_degree.out)
				print ("%NNumber of out degree edges attached to item: " + l_graph.out_degree.out)

				l_dfs.forth
			end
			print ("%N=============================%N")

			l_graph.prune_edge_between ("a", "b")
			l_graph.find_path ("a", "b")
			check
				not_has_edge: not l_graph.has_edge_between ("a", "b")
			end
		end

	test_build_undirected_graph_string_with_labels_integer
		local
			l_graph: LINKED_UNDIRECTED_GRAPH [STRING, INTEGER_REF]
			l_bfs: BFS_WALKER [STRING, INTEGER_REF]
			l_dfs: DFS_WALKER [STRING, INTEGER_REF]
		do
				-- Create the graph
			create l_graph.make_simple_graph

				-- Put the nodes into the graph.

			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_node ("c")
			l_graph.put_node ("d")

				-- Put the nodes into the graph.
			l_graph.put_edge ("a", "b", 1)
			l_graph.put_edge ("a", "c", 2)
			l_graph.put_edge ("b", "c", 3)
			l_graph.put_edge ("c", "d", 4)

			check
				has_cycles: l_graph.has_cycles
			end

			l_graph.find_path ("a", "d")

			check
				has_path: l_graph.path_found
			end

			check
				four_nodes: l_graph.node_count = 4
			end
			check
				four_edges: l_graph.edge_count = 4
			end

			l_graph.search ("z")
			check
				not_exits: l_graph.off
			end

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

			across l_graph.path as ic loop
				if attached ic.item as l_item then
					print (l_item.out)
				end
			end

				-- BFS walker
			print ("%NBFS walker")
			create l_bfs.make (l_graph)
			from
				l_bfs.start
			until
				l_bfs.after
			loop
				print ("%NCurrent item: " + l_bfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_bfs.forth
			end
			io.put_new_line

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

				-- DFS walker
			print ("%NDFS walker")
			create l_dfs.make (l_graph)
			from
				l_dfs.start
			until
				l_dfs.after
			loop
				print ("%NCurrent item: " + l_dfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_dfs.forth
			end
			print ("%N=============================%N")
		end

	test_build_undirected_graph_string
		local
			l_graph: LINKED_UNDIRECTED_GRAPH [STRING, NONE]
			l_bfs: BFS_WALKER [STRING, NONE]
			l_dfs: DFS_WALKER [STRING, NONE]
		do
				-- Create the graph
			create l_graph.make_simple_graph

				-- Put the nodes into the graph.

			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_node ("c")
			l_graph.put_node ("d")

				-- Connect the nodes with the edges
			l_graph.put_unlabeled_edge ("a", "b")
			l_graph.put_unlabeled_edge ("a", "c")
			l_graph.put_unlabeled_edge ("b", "c")
			l_graph.put_unlabeled_edge ("c", "d")

			check
				has_cycles: l_graph.has_cycles
			end

			l_graph.find_path ("a", "d")

			check
				has_path: l_graph.path_found
			end

			check
				four_nodes: l_graph.node_count = 4
			end
			check
				four_edges: l_graph.edge_count = 4
			end

			l_graph.search ("z")
			check
				not_exits: l_graph.off
			end

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

			across l_graph.path as ic loop
				if attached ic.item as l_item then
					print (l_item.out)
				end
			end

				-- BFS walker
			print ("%NBFS walker")
			create l_bfs.make (l_graph)
			from
				l_bfs.start
			until
				l_bfs.after
			loop
				print ("%NCurrent item: " + l_bfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_bfs.forth
			end
			io.put_new_line

			l_graph.search ("a")
			check
				exits: not l_graph.off
			end

				-- DFS walker
			print ("%NDFS walker")
			create l_dfs.make (l_graph)
			from
				l_dfs.start
			until
				l_dfs.after
			loop
				print ("%NCurrent item: " + l_dfs.item)
				print ("%NNumber of edges attached to item: " + l_graph.degree.out)
				l_dfs.forth
			end
			print ("%N=============================")

		end

end

