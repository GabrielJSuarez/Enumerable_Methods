
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

end
