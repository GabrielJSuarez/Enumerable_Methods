
module Enumerable
    def my_each(array)
        index = 0
        while index < array.length
            yield(array[index])
            index += 1
        end
        array
    end
    
    def my_each_with_index(array)
        index = 0
        while index < array.length
          yield(array[index], index)
          index += 1
        end
      array
    end

    def my_select(array)
        new_arr = []
        my_each(array) do |x|
          new_arr.push(x) if yield(x) == true
        end
        new_arr
    end
    
    def my_all?(array)
        p my_select(array) { |x| yield(x) }.length == array.length ? true : false
    end

    def my_any?(array)
        p my_select(array) { |x| yield(x) }.length.positive? ? true : false
    end
    
    def my_none?(array)
        p my_select(array) { |x| yield(x) }.length.length.zero? ? true : false
    end
    
    def my_count(array, idx = 0)
        index = idx
    
        if block_given? == true
          my_select(array) { |x| yield(x) }.length
    
        else
          array.length - index
        end
    end
    
    def my_map_block(array)
        new_arr = []
        my_each(array) do |x|
            new_arr.push(yield(x))
        end
        p new_arr
    end
    
end
