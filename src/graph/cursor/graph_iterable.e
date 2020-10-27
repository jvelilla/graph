note
	description: "Structure that can be iterated over using `across...loop...end'."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	GRAPH_ITERABLE [G -> HASHABLE]


inherit
	ITERABLE [G]

feature -- Access

	new_cursor: GRAPH_ITERATION_CURSOR [G]
			-- Fresh cursor associated with current structure
		deferred
		end
end


