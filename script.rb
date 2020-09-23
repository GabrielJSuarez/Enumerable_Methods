
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
end
