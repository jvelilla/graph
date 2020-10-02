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
			l_graph.prune_edge (l_graph.edges.at (1))
			assert ("Has 1 edges", l_graph.edge_count = 1)
		end

end

