# simple LRU cache using array: O(n)
class LRUCache
    def initialize(max_size = 4)
        @max_size = max_size 
        @store = []
    end

    def count
      # returns number of elements currently in cache
      @store.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      @store.delete(el) if @store.include?(el)
      @store.shift if count == @max_size
      @store.push(el)
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @store 
    end

  end

