note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	LINKED_GRAPH_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_prune_edge_simple_graph
		local
			l_graph: LINKED_GRAPH [STRING, STRING]
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


	test_prune_edge_simple_graph_2
		local
			l_graph: LINKED_GRAPH [STRING, STRING]
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

	test_prune_edge_symmetric_graph
		local
			l_graph: LINKED_GRAPH [STRING, STRING]
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

	test_prune_edge_multi_graph
		local
			l_graph: LINKED_GRAPH [STRING, STRING]
		do
				-- Create the graph
			create l_graph.make_multi_graph

				-- Put the nodes into the graph.
			l_graph.put_node ("a")
			l_graph.put_node ("b")
			l_graph.put_unlabeled_edge ("a", "b")
			l_graph.put_unlabeled_edge ("a", "b")
			assert ("Has edge a-b", l_graph.has_edge_between ("a", "b"))
			assert ("Has 2 edges", l_graph.edge_count = 2)
			if attached l_graph.edges.at (1) as l_edge then
				l_graph.prune_edge (l_edge)
				assert ("Has 1 edges", l_graph.edge_count = 1)
			end
		end

end

