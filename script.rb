module Enumerable
  def my_each
    var = self.to_a
    return to_enum(:my_each) unless block_given?

    index = 0
    while index < var.length
      yield(var[index])
      index += 1
    end
    var
  end

  def my_each_with_index
    var = self.to_a
    return to_enum(:my_each) unless block_given?

    index = 0
    while index < var.length
      yield(var[index], index)
      index += 1
    end
    var
  end

  def my_select
    var = self.to_a
    new_arr = []
    return to_enum(:my_select) unless block_given?

    var.my_each do |x|
      new_arr.push(x) if yield(x) == true
    end
    new_arr
  end

  def my_all?(pattern = nil)
    var = self.to_a
    if block_given? == true
      var.my_select { |x| yield(x) }.length == var.length ? true : false
    elsif pattern != nil
      if pattern.class == Regexp
        var.my_select { |x| pattern.match(x) != nil }.length == var.length ? true : false
      elsif pattern.class == Integer
        var.my_select { |x| x == pattern}.length == var.length ? true : false
      else
        var.my_select { |x| x.class == pattern}.length == var.length ? true : false
      end
    else
      var.my_select { |x| x != nil && x != false }.length == var.length ? true : false
    end
  end

  def my_any?(pattern = nil)
    var = self.to_a
    if block_given? == true
      var.my_select { |x| yield(x) }.length.positive? ? true : false
    elsif pattern != nil
      if pattern.class == Regexp
        var.my_select { |x| pattern.match(x) != nil }.length.positive? ? true : false
      elsif pattern.class == Integer
        var.my_select { |x| x == pattern}.length.positive? ? true : false
      else
        var.my_select { |x| x.class == pattern}.length.positive? ? true : false
      end
    else
      var.my_select { |x| x != nil && x != false }.length.positive? ? true : false
    end
  end

  def my_none?(pattern = nil)
    var = self.to_a
    if block_given? == true
      var.my_select { |x| yield(x) }.length.zero? ? true : false
    elsif pattern != nil
      if pattern.class == Regexp
        var.my_select { |x| pattern.match(x) != nil }.length.zero? ? true : false
      elsif pattern.class == Integer
        var.my_select { |x| x == pattern}.length.zero? ? true : false
      else
        var.my_select { |x| x.class == pattern}.length.zero? ? true : false
      end
    else
      var.my_select { |x| x != nil && x != false }.length.zero? ? true : false
    end
  end

  def my_count(arg = nil)
    var = self.to_a
    if arg == nil
      return var.length unless block_given?
      var.my_select { |x| yield(x) }.length
    else 
      var.my_select { |x| x == arg }.length
    end
  end

  def my_map( proc = nil)
    var = self.to_a
    new_arr = []
    if proc != nil
      var.my_each do |x|
        new_arr.push(proc.call(x))
      end
    else
      return to_enum(:my_map) unless block_given?
      var.my_each do |x|
        new_arr.push(yield(x))
      end
    end
    new_arr
  end

  def my_inject(initial = nil, sym = nil)
    var = self.to_a
    count = initial

    if var.my_all? { |x| x.class == String }
      count = ''
    elsif var.my_all? { |x| x.class == Integer }
      count = initial
    else
      'no implicit conversion'
    end

    if initial != nil && sym != nil
      var.my_each do |x|
         count 
      end
      count
    elsif initial == nil && sym != nil

    elsif initial != nil && sym == nil
    
    else

    end

    
  end
end




