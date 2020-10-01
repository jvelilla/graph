note
	description: "Regression tests reproducing application state of a previous execution."
	author: "Testing tool"

class
	LINKED_GRAPH_TEST
	
inherit
	EQA_EXTRACTED_TEST_SET

feature -- Test routines

	test_prune_edge_between
		note
			testing: "type/extracted"
			testing: "covers/{LINKED_UNDIRECTED_GRAPH}.prune_edge_between"
		do
			run_extracted_test (agent {LINKED_UNDIRECTED_GRAPH [!STRING_8, !STRING_8]}.prune_edge_between, ["#1", "#2", "#3"])
		end

feature {NONE} -- Access

	context: ARRAY [TUPLE [type: TYPE [ANY]; attributes: TUPLE; inv: BOOLEAN]]
			-- <Precursor>
		do
			Result := <<
				[{LINKED_UNDIRECTED_GRAPH [!STRING_8, !STRING_8]}, [
						"border_nodes",  "#4",
						"current_node",  "#5",
						"exhausted",  True,
						"history_stack",  "#6",
						"inactive_nodes",  "#7",
						"index_of_element",  "#8",
						"internal_edges",  "#9",
						"is_simple_graph",  True,
						"is_symmetric_graph",  False,
						"merge_succeeded",  False,
						"node_count",  {INTEGER_32} 4,
						"node_list",  "#10",
						"object_comparison",  True,
						"path_found",  True,
						"path_impl",  "#11"
					], False],
				[{STRING_8}, [
						"a"
					], False],
				[{STRING_8}, [
						"b"
					], False],
				[{INVERSE_HEAP_PRIORITY_QUEUE [!NODE [!STRING_8, !STRING_8]]}, [
						"area",  "#12",
						"object_comparison",  False
					], False],
				[{LINKED_GRAPH_NODE [!STRING_8, !STRING_8]}, [
						"distance",  {REAL_64} 2147483647.0,
						"edge_list",  "#13",
						"item",  "#14",
						"processed",  False
					], False],
				[{ARRAYED_STACK [!GRAPH_CURSOR [!STRING_8, !STRING_8]]}, [
						"area_v2",  "#15",
						"index",  {INTEGER_32} 0,
						"object_comparison",  False
					], False],
				[{ARRAYED_SET [INTEGER_32]}, [
						"area_v2",  "#16",
						"index",  {INTEGER_32} 0,
						"object_comparison",  False
					], False],
				[{HASH_TABLE [INTEGER_32, !STRING_8]}, [
						"capacity",  {INTEGER_32} 5,
						"content",  "#17",
						"control",  {INTEGER_32} 8,
						"count",  {INTEGER_32} 4,
						"deleted_item_position",  {INTEGER_32} -1,
						"deleted_marks",  "#18",
						"found_item",  {INTEGER_32} 0,
						"has_default",  False,
						"hash_table_version_64",  False,
						"ht_deleted_item",  {INTEGER_32} 0,
						"ht_lowest_deleted_position",  {INTEGER_32} 2147483645,
						"indexes_map",  "#19",
						"item_position",  {INTEGER_32} 0,
						"iteration_position",  {INTEGER_32} 4,
						"keys",  "#20",
						"object_comparison",  False
					], False],
				[{ARRAYED_LIST [LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"area_v2",  "#21",
						"index",  {INTEGER_32} 1,
						"object_comparison",  True
					], False],
				[{ARRAY [LINKED_GRAPH_NODE [!STRING_8, !STRING_8]]}, [
						"area",  "#22",
						"lower",  {INTEGER_32} 1,
						"object_comparison",  False,
						"upper",  {INTEGER_32} 4
					], False],
				[{TWO_WAY_LIST [LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"active",  "#23",
						"after",  False,
						"before",  True,
						"count",  {INTEGER_32} 2,
						"first_element",  "#23",
						"last_element",  "#24",
						"object_comparison",  False
					], False],
				[{SPECIAL [!NODE [!STRING_8, !STRING_8]]}, [
					], False],
				[{TWO_WAY_CIRCULAR [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"internal_exhausted",  False,
						"list",  "#25",
						"object_comparison",  False,
						"starter",  {INTEGER_32} 2
					], False],
				[{STRING_8}, [
						"b"
					], False],
				[{SPECIAL [!GRAPH_CURSOR [!STRING_8, !STRING_8]]}, [
					], False],
				[{SPECIAL [INTEGER_32]}, [
					], False],
				[{SPECIAL [INTEGER_32]}, [
						{INTEGER_32} 1, {INTEGER_32} 2, {INTEGER_32} 3, {INTEGER_32} 4
					], False],
				[{SPECIAL [BOOLEAN]}, [
						False, False, False, False
					], False],
				[{SPECIAL [INTEGER_32]}, [
						{INTEGER_32} 3, {INTEGER_32} -1, {INTEGER_32} 0, {INTEGER_32} 1, {INTEGER_32} 2,
						{INTEGER_32} -1
					], False],
				[{SPECIAL [!STRING_8]}, [
						"#26", "#14", "#27", "#28"
					], False],
				[{SPECIAL [LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"#29", "#30", "#31"
					], False],
				[{SPECIAL [LINKED_GRAPH_NODE [!STRING_8, !STRING_8]]}, [
						"#32", "#5", "#33", "#34"
					], False],
				[{BI_LINKABLE [LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#29",
						"right",  "#24"
					], False],
				[{BI_LINKABLE [LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#31",
						"left",  "#23"
					], False],
				[{TWO_WAY_LIST [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"active",  "#35",
						"after",  False,
						"before",  False,
						"count",  {INTEGER_32} 1,
						"first_element",  "#35",
						"last_element",  "#35",
						"object_comparison",  False
					], False],
				[{STRING_8}, [
						"a"
					], False],
				[{STRING_8}, [
						"c"
					], False],
				[{STRING_8}, [
						"d"
					], False],
				[{LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]}, [
						"end_node",  "#27",
						"internal_end_node",  "#33",
						"internal_start_node",  "#32",
						"is_directed",  False,
						"label",  "#36",
						"start_node",  "#26"
					], False],
				[{LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]}, [
						"end_node",  "#27",
						"internal_end_node",  "#33",
						"internal_start_node",  "#5",
						"is_directed",  False,
						"label",  "#37",
						"start_node",  "#14"
					], False],
				[{LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]}, [
						"end_node",  "#28",
						"internal_end_node",  "#34",
						"internal_start_node",  "#33",
						"is_directed",  False,
						"label",  "#38",
						"start_node",  "#27"
					], False],
				[{LINKED_GRAPH_NODE [!STRING_8, !STRING_8]}, [
						"distance",  {REAL_64} 2147483647.0,
						"edge_list",  "#39",
						"item",  "#26",
						"processed",  False
					], False],
				[{LINKED_GRAPH_NODE [!STRING_8, !STRING_8]}, [
						"distance",  {REAL_64} 2147483647.0,
						"edge_list",  "#40",
						"item",  "#27",
						"processed",  False
					], False],
				[{LINKED_GRAPH_NODE [!STRING_8, !STRING_8]}, [
						"distance",  {REAL_64} 2147483647.0,
						"edge_list",  "#41",
						"item",  "#28",
						"processed",  False
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#30"
					], False],
				[{STRING_8}, [
						"a-c"
					], False],
				[{STRING_8}, [
						"b-c"
					], False],
				[{STRING_8}, [
						"c-d"
					], False],
				[{TWO_WAY_CIRCULAR [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"internal_exhausted",  False,
						"list",  "#42",
						"object_comparison",  False,
						"starter",  {INTEGER_32} 1
					], False],
				[{TWO_WAY_CIRCULAR [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"internal_exhausted",  False,
						"list",  "#43",
						"object_comparison",  False,
						"starter",  {INTEGER_32} 1
					], False],
				[{TWO_WAY_CIRCULAR [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"internal_exhausted",  False,
						"list",  "#44",
						"object_comparison",  False,
						"starter",  {INTEGER_32} 1
					], False],
				[{TWO_WAY_LIST [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"active",  "#45",
						"after",  False,
						"before",  False,
						"count",  {INTEGER_32} 2,
						"first_element",  "#46",
						"last_element",  "#45",
						"object_comparison",  False
					], False],
				[{TWO_WAY_LIST [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"active",  "#47",
						"after",  False,
						"before",  False,
						"count",  {INTEGER_32} 3,
						"first_element",  "#47",
						"last_element",  "#48",
						"object_comparison",  False
					], False],
				[{TWO_WAY_LIST [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"active",  "#49",
						"after",  False,
						"before",  False,
						"count",  {INTEGER_32} 1,
						"first_element",  "#49",
						"last_element",  "#49",
						"object_comparison",  False
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#29",
						"left",  "#46"
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#50",
						"right",  "#45"
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#29",
						"right",  "#51"
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#31",
						"left",  "#51"
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#31"
					], False],
				[{LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]}, [
						"end_node",  "#14",
						"internal_end_node",  "#5",
						"internal_start_node",  "#32",
						"is_directed",  False,
						"label",  "#52",
						"start_node",  "#26"
					], False],
				[{BI_LINKABLE [!LINKED_GRAPH_EDGE [!STRING_8, !STRING_8]]}, [
						"item",  "#30",
						"left",  "#47",
						"right",  "#48"
					], False],
				[{STRING_8}, [
						"a-b"
					], False]
			>>
		end

end
