note
	description: "External (dfs or bfs) iteration cursor for {GRAPH}."
	date: "$Date$"
	revision: "$Revision$"

class
	GRAPH_ITERATION_CURSOR2 [G -> HASHABLE, L]

inherit

	ITERATION_CURSOR [G]

create
	make

feature {NONE} -- Initialization

	make (g: GRAPH [G, L])
			-- Create a new iteration cursor that is walking on `g'. The starting position
			-- of the walker is the current node of the graph.
		require
			non_void: g /= Void
			graph_not_off: not g.off
		do
			graph := g
			create_dispenser
			first_node := g.cursor
			create visited_nodes.make (g.node_count)
			start
		ensure
			item_set: item = g.item
		end

feature -- Access

	first_node: detachable GRAPH_CURSOR [G, L]
			-- Current node cursor
		note
			option: stable
		attribute
		end


	graph: detachable GRAPH [G, L]
			-- The graph the iterator is processing
		note
			option: stable
		attribute
		end

	item: G
			-- Current graph node
		do
			check attached graph as l_graph then
				Result := l_graph.item
			end
		end

	index_cursor: INTEGER
			-- Index of current position

feature -- Status report

	after: BOOLEAN

	is_empty: BOOLEAN = False

feature -- Cursor movement

	start
			-- Move the cursor back to the start
		do
			if graph /= Void and then
				dispenser /= Void and then
				visited_nodes /= Void
			then
				index_cursor := 1
				visited_nodes.wipe_out
				visited_nodes.put (True, graph.node_identity)
				dispenser.wipe_out
				dispenser.extend (item)
				after := False
			end
		end

	forth
			-- Move the cursor to the next item
		local
			cursor: like graph.cursor
		do
			if visited_nodes /= Void and then
				dispenser /= Void and then
				first_node /= Void and then
				graph /= Void
			then
				if dispenser.is_empty then
					after := True
						-- Restore current node cursor.
					graph.go_to (first_node)
				else
					from
					until
						(not visited_nodes.has (graph.node_identity)) or
						dispenser.is_empty
					loop
						graph.search (dispenser.item)
						dispenser.remove
						across graph.neighbors as ic loop
							if not visited_nodes.has (ic.item) then
								dispenser.extend (ic.item)
							end
						end
					end
					after := visited_nodes.has (graph.node_identity)
					if not after then
						visited_nodes.put (True, graph.node_identity)
						index_cursor := index_cursor + 1
					else
							-- Restore current node cursor.
						graph.go_to (first_node)
					end
				end
			end
		end

feature {NONE} -- Implementation

	dispenser: detachable DISPENSER [G]
			-- Storage of items that need to be processed
		note
			option: stable
		attribute
		end

	visited_nodes: detachable HASH_TABLE [BOOLEAN, HASHABLE]
			-- Provides fast lookup for already processed nodes
		note
			option: stable
		attribute
		end

	create_dispenser
			-- Create the dispenser
			--		as a queue for the BFS Walker
			--		as a stask for a DFS walker
		do
			if graph /= Void then
				if graph.is_depth_first then
					create {LINKED_STACK [G]} dispenser.make
				else
					create {LINKED_QUEUE [G]} dispenser.make
				end
				dispenser.compare_objects
			end

		end

end
