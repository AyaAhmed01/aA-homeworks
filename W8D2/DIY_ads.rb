class Stack
    attr_reader :stack
    def initialize
        @stack = []
    end

    def push(el)
      # adds an element to the stack
        stack.unshift(el)
    end

    def pop
      # removes one element from the stack
      stack.shift
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      stack.first
    end
end

class Queue
    attr_reader :queue 
    def initialize
        @queue = []
    end

    def enqueue(el)
        queue.push(el)
    end

    def dequeue
      queue.shift 
    end

    def peek
      # returns, but doesn't remove, the top element in the queue
      queue.first
    end
end

class Map
    attr_reader :map 

    def initialize
        @map = Array.new {Array.new(2)}
    end

    def is_key?(key)
        idx = nil 
        map.each_with_index do |pair, i|
            idx = i if pair.first == key 
        end
        idx 
    end

    def set(key, val)
        idx = is_key?(key)
        if idx 
            map[idx][1] = val 
        else
            map.push([key, val])
        end
    end

    def get(key)
        idx = is_key?(key)
        return map[idx].last if idx 
        nil
    end

    def delete(key)
        idx = is_key?(key)
        map.delete_at(idx) if idx 
    end

    def show
        p map 
    end
end



