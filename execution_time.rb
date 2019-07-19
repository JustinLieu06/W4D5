class ExecutionTime
  def my_min_nested(arr)
    min = arr[0]
    (0...arr.length).each do |i|
      (0...arr.length).each do |j|
        if arr[i] < min
          min = arr[i]
        end
      end
    end
    min
  end

  def my_min(arr)
    min = arr[0]
    (0...arr.length).each do |i|
      if arr[i] < min
        min = arr[i]
      end
    end
    min
  end

  def largest_contiguous_subsum(arr)
    sub_arrays = []
    i = 0
    while i < arr.length
      j = i
      while j < arr.length
        sub_arrays << arr[i..j]
        j += 1
      end
      i += 1
    end
    sub_arrays.map! {|sub_arr| sub_arr.sum}
    sub_arrays.max
  end

  def largest_contiguous_subsum_two(arr)
    array_max = arr.max
    return array_max if arr.all? { |ele| ele < 0}
    overall_sum = arr.first
    max_sum = arr.first
    arr[1..-1].each do |ele|
      if overall_sum + ele > max_sum
        max_sum = overall_sum + ele
      end
      
      if overall_sum + ele < 0
        overall_sum = 0
      end

      if overall_sum + ele > 0
        overall_sum += ele
      end
    end
    max_sum
  end
end

et = ExecutionTime.new
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p et.my_min_nested(list)
p et.my_min(list)

list_two = [2, 3, -6, 7, -6, 7]
p et.largest_contiguous_subsum(list_two)
p et.largest_contiguous_subsum_two(list_two)