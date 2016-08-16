module SixDegrees
  # A class for breadth first search
  class BFS
    def search(start, finish, symbol)
      queue = []
      current_node = start
      while current_node
        return true if current_node == finish
        queue = current_node.send(symbol) + queue
        current_node = queue.pop
      end
      false
    end
  end
end
