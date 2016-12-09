def play_tower_of_hanoi
	# good_input_received = false
	# puts "Hello Player!!"
	# unless good_input_received
	# 	puts "Please enter number of disks to play (number should be between 1 and 20) :"
	# 	number_of_disks = gets.chomp.to_i
	# 	while (! number_of_disks.is_a?(Integer)) || number_of_disks < 1 || number_of_disks > 20
	# 		puts "Number is no good! Please enter again (number should be between 1 and 20) :"
	# 		number_of_disks = gets.chomp.to_i
	# 	end
	# 	good_input_received = true
	# end
	number_of_disks = 5
	weight_of_heaviest = number_of_disks * 2 - 1
	left_tower 	 = []
	middle_tower = []
	right_tower  = []
	number_of_disks.downto(1) { |item| left_tower << 2 * item - 1 }
	puts "########## LEFT TOWER ########## "
	left_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	puts "########## MIDDLE TOWER ########## "
	middle_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	puts "########## RIGHT TOWER ########## "
	right_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	move 1, 3, left_tower, middle_tower, right_tower
	puts "########## LEFT TOWER ########## "
	left_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	puts "########## MIDDLE TOWER ########## "
	middle_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	puts "########## RIGHT TOWER ########## "
	right_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	move 1, 3, left_tower, middle_tower, right_tower
	puts "########## LEFT TOWER ########## "
	left_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	puts "########## MIDDLE TOWER ########## "
	middle_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
	puts "########## RIGHT TOWER ########## "
	right_tower.reverse.each_with_index do |item, index|
		str_to_print = "0" * item
		puts str_to_print.center(weight_of_heaviest, " ")
	end
end

def move(from_tower, to_tower, left_tower, middle_tower, right_tower)
	if from_tower == 1
		disk = left_tower.pop
		if to_tower == 2
			middle_tower << disk
		else
			right_tower << disk
		end
	elsif from_tower == 2
		disk = middle_tower.pop
		if to_tower == 1
			left_tower << disk
		else
			right_tower << disk
		end
	else
		disk = right_tower.pop
		if to_tower == 1
			left_tower << disk
		else
			middle_tower << disk
		end
	end
end

play_tower_of_hanoi