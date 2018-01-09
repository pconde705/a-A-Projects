require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top.push(vertex)
    end
  end

  until top.empty?
    current = top.pop
    sorted.push(current)
    edges = current.out_edges.dup
    # Store a reference of the edges, iterate over the references, and delete those, so as not to disrupt
    # the element in your array

    edges.each do |edge|
      if edge.to_vertex.in_edges.length <= 1
        top.push(edge.to_vertex)
      end
      edge.destroy!
    end

  end
  if vertices.length == sorted.length
    sorted
  else
    []
  end
end
