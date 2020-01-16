module Enumerable
  def my_each
    size = self.size
    index = 0

    while index < size

      yield(self[index])
      index += 1

    end
  end

  def my_each_with_index
    size = self.size
    index = 0

    while index < size

      yield(self[index], index)
      index += 1

    end
  end

  def my_select
    new_array = []

    my_each do |element|
      new_array.push(element) if yield(element)
    end

    new_array
  end

  def my_all(val = nil)
    all_true = true

    if block_given?

      my_each do |element|
        all_true = false unless yield(element)
      end

    elsif val

      my_each do |element|
        all_true = false unless element == val
      end

    else

      my_each do |element|
        all_true = false unless element
      end

    end

    all_true
  end

  def my_any(val = nil)
    any = false

    if block_given?

      my_each do |element|
        any = true if yield(element)
      end

    elsif val

      my_each do |element|
        any = true if element == val
      end

    else

      my_each do |element|
        any = true if element
      end

    end

    any
  end

  def my_none(val = nil)
    none = true

    if block_given?

      my_each do |element|
        none = false if yield(element)
      end

    elsif val

      my_each do |element|
        none = false if element == val
      end

    else

      my_each do |element|
        none = false if element
      end

    end

    none
  end

  def my_count(val = nil)
    total = 0

    if block_given?

      my_each do |element|
        total += 1 if yield(element)
      end

    elsif val

      my_each do |element|
        total += 1 if element == val
      end

    else

      total = length

    end

    total
  end

  def my_map(my_proc = nil)
    new_array = []

    if my_proc

      my_each do |element|
        new_array.push(my_proc.call(element))
      end

    else

      my_each do |element|
        new_array.push(yield(element))
      end

    end

    new_array
  end

  def my_inject(init = nil, proc = nil)
    if init && block_given?

      my_each do |element|
        init = yield(init, element)
      end

    elsif init.nil? && block_given?

      init = self[0]

      my_each_with_index do |element, index|
        init = yield(init, element) unless index.zero?
      end

    else

      my_each do |element|
        init = proc.to_proc.call(init, element)
      end

    end

    init
  end
end

def multiply_els(array)
  array.my_inject { |b, element| b * element }
end

puts multiply_els([2, 4, 5])
