﻿note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	ADJACENCY_MATRIX_GRAPH_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_weighted_graph
		local
			l_graph: ADJACENCY_MATRIX_GRAPH [STRING, STRING]
		do
				-- Create the graph
			create l_graph.make_simple_graph

				-- Put the nodes into the graph.
			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_edge ("a", "b", "a-b")
			assert ("Has edge a-b", l_graph.has_edge_between ("a", "b"))
			l_graph.prune_edge_between ("a", "b")
			assert ("Not has edge a-b", not l_graph.has_edge_between ("a", "b"))
		end

	test_weighted_graph_2
		local
			l_graph: ADJACENCY_MATRIX_GRAPH [STRING, STRING]
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
			assert ("Has edge a-b", l_graph.has_edge_between ("a", "b"))
			l_graph.prune_edge_between ("a", "b")
			assert ("Not has edge a-b", not l_graph.has_edge_between ("a", "b"))
			l_graph.find_path ("a", "b")
			assert ("Found", not l_graph.path_found)
		end

	test_graph_iterator
		local
			l_graph: ADJACENCY_MATRIX_GRAPH [STRING, STRING]
			l_dfs: ARRAYED_LIST [STRING]
			l_dfs_result: ARRAYED_LIST [STRING]
			l_bfs: ARRAYED_LIST [STRING]
			l_bfs_result: ARRAYED_LIST [STRING]
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

			l_graph.search ("a")

				-- By default depth first search
			create l_dfs.make (4)
			across l_graph as ic loop
				l_dfs.force (ic.item)
			end
			create l_dfs_result.make_from_array (<<"a", "c", "b", "d">>)
			l_dfs_result.compare_objects
			assert ("Expected all dfs items ", ∀ i: l_dfs ¦ l_dfs_result.has (i))

				-- Set breadth first
			l_graph.iterate_breadth_first
			create l_bfs.make (4)
			across l_graph as ic loop
				l_bfs.force (ic.item)
			end

			create l_bfs_result.make_from_array (<<"a", "b", "c", "d">>)
			l_bfs_result.compare_objects
			assert ("Expected all dfs items ", ∀ i: l_bfs ¦ l_bfs_result.has (i))

			create l_dfs.make (4)
			across l_graph as ic loop
					-- Set breadth first
				l_graph.iterate_breadth_first
				create l_bfs.make (4)
				across l_graph as ic2 loop
					l_bfs.force (ic2.item)
				end
				l_dfs.force (ic.item)
			end
			l_dfs_result.compare_objects
			assert ("Expected all dfs items ", ∀ i: l_dfs ¦ l_dfs_result.has (i))

			l_bfs_result.compare_objects
			assert ("Expected all dfs items ", ∀ i: l_bfs ¦ l_bfs_result.has (i))

		end

	test_weighted_edge_symmetric_graph
		local
			l_graph: ADJACENCY_MATRIX_GRAPH [STRING, STRING]
		do
				-- Create the graph
			create l_graph.make_symmetric_graph

				-- Put the nodes into the graph.
			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_edge ("a", "b", "a-b")
			assert ("Has edge a-b", l_graph.has_edge_between ("a", "b"))
			assert ("Has edge b-a", l_graph.has_edge_between ("b", "a"))
			l_graph.prune_edge_between ("a", "b")
			assert ("Not has edge a-b", not l_graph.has_edge_between ("a", "b"))
			assert ("has edge a-b", not l_graph.has_edge_between ("b", "a"))
		end

end

