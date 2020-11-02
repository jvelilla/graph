note
	description: "External (dfs or bfs) iteration cursor for {GRAPH}."
	date: "$Date$"
	revision: "$Revision$"

class
	GRAPH_ITERATION_CURSOR [G -> HASHABLE, L]

inherit

	ITERATION_CURSOR [G]

create
	make

feature -- Initialization

	make (g: GRAPH [G, L])
			-- Create a new walker that is walking on `g'. The starting position
			-- of the walker is the current node of the graph.
		require
			non_void: g /= Void
			graph_not_off: not g.off
		do
			graph := g
			first_node := g.cursor
			create_dispenser
			create visited_nodes.make (g.node_count)
			start
		ensure
			item_set: item = g.item
		end

feature {NONE} -- Initialization

feature -- Access

	graph: detachable GRAPH [G, L]
			-- The graph the walker is processing
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

feature -- Measurement

feature -- Status report

	after: BOOLEAN

	is_empty: BOOLEAN = False

feature -- Cursor movement

	start
			-- Move the cursor back to the start
		do
			if graph /= Void and then
				dispenser /= Void and then
				visited_nodes /= Void and then
				first_node /= Void
			then
				graph.go_to (first_node)
				index_cursor := 1
				visited_nodes.wipe_out
				visited_nodes.put (True, graph.node_identity)
				dispenser.wipe_out
				add_targets_to_dispenser
				after := False
			end
		end

	forth
			-- Move the cursor to the next item
		do
			if visited_nodes /= Void and then
				dispenser /= Void and then
				graph /= Void
			then
				if dispenser.is_empty then
					after := True
				else
					from
						graph.go_to (dispenser.item)
							----- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG -----
						debug ("walker")
							print ("WALKER: am at item `")
							print (graph.item)
							print ("'%N")
						end
							----- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG -----
						dispenser.remove
					until
						(not visited_nodes.has (graph.node_identity)) or
						dispenser.is_empty
					loop
						graph.go_to (dispenser.item)
							----- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG -----
						debug ("walker")
							print ("WALKER: am at item `")
							print (graph.item)
							print ("'%N")
						end
							----- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG -----
						dispenser.remove
					end
					after := visited_nodes.has (graph.node_identity)
					if not after then
						visited_nodes.put (True, graph.node_identity)
						add_targets_to_dispenser
						index_cursor := index_cursor + 1
					end
				end
			end
		end

	finish
			-- Move the cursor to the last item
		do
			from
				start
			until
				after or next_will_be_after
			loop
				forth
			end
		end

feature {NONE} -- Implementation

	first_node: detachable GRAPH_CURSOR [G, L]
			-- Node to start the walk on
		note
			option: stable
		attribute
		end

	dispenser: detachable DISPENSER [GRAPH_CURSOR [G, L]]
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
			-- Create the dispenser as a queue for the BFS
		do
			if graph /= Void then
				if graph.is_depth_first then
					create {LINKED_STACK [GRAPH_CURSOR [G, L]]} dispenser.make
				else
					create {LINKED_QUEUE [GRAPH_CURSOR [G, L]]} dispenser.make
				end
			end
		end

	add_targets_to_dispenser
			-- Add all targets of the current node to the dispenser
		require
			not_off_graph: attached graph as l_graph implies not l_graph.off
		do
			if graph /= Void and then
				dispenser /= Void
			then
				from
					graph.start
				until
					graph.exhausted
				loop
					dispenser.extend (graph.target_cursor)
					graph.left
				end
			end
		end

	next_will_be_after: BOOLEAN
			-- Will the next forth result in an after ?
			-- (all items in the dispenser are already visited)
		local
			oldpos: GRAPH_CURSOR [G, L]
			linear: LINEAR [GRAPH_CURSOR [G, L]]
		do
			if visited_nodes /= Void and then
				graph /= Void and then
				dispenser /= Void
			then
				oldpos := graph.cursor
				linear := dispenser.linear_representation
				Result := True
				from
					linear.start
				until
					linear.after or not Result
				loop
					graph.go_to (linear.item)
					if
						not visited_nodes.has (graph.node_identity)
					then
						Result := False
					end
				end
				graph.go_to (oldpos)
			end
		end

end
