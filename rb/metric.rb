class Metric

	def initialize (match_string)
		@values = Array.new
		@match_string = match_string
	end

	def add(val)
		@values << val
	end

	def length
		@values.length
	end

	def string
		@match_string
	end

	def p50(arr)
		if (arr.length == 0) then return 0 end
		#puts "got #{arr}, will be returning index #{(arr.length / 2.0).floor}"
		return arr[(arr.length / 2.0).floor]
	end
	
	def p95(arr)
		#puts "got #{arr}, returning index #{arr.length - (arr.length/20.0).floor - 1}"
		if (arr.length == 0) then return 0 end
		return arr[arr.length - (arr.length/20.0).floor - 1]
	end
	
	def mean(arr)
		if (arr.length == 0) then return 0 end
		total = 0
		arr.each do |index|
			total = total + index
		end
		total / Float(arr.length)
	end

end
