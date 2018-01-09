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

    current.out_edges.each do |edge|
      if edge.to_vertex.in_edges.empty?
        top.push(edge.to_vertex)
      end
      edge.destroy!
    end
    # p current
  end
  if vertices.length == sorted.length
    sorted
  else
    []
  end
end
