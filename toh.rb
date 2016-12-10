class TowerOfHanoi

	LEFT_TOWER   = 1
	MIDDLE_TOWER = 2
	RIGHT_TOWER  = 3

	def play
		good_input_received = false
		game_not_won = true
		quit_not_received = true
		puts "Hello Player!!"
		unless good_input_received
			puts "Please enter number of disks to play (number should be between 1 and 20) :"
			number_of_disks = gets.chomp.to_i
			while (! number_of_disks.is_a?(Integer)) || number_of_disks < 1 || number_of_disks > 20
				puts "Number is no good! Please enter again (number should be between 1 and 20) :"
				number_of_disks = gets.chomp.to_i
			end
			good_input_received = true
		end
		puts "Thanks, you'll be playing with #{number_of_disks} disks."
		puts "Now try to move all disks from left tower to right tower"
		weight_of_heaviest = number_of_disks * 2 - 1
		left_tower 	 = []
		middle_tower = []
		right_tower  = []
		number_of_disks.downto(1) { |item| left_tower << 2 * item - 1 }
		puts "Here is the current state of the game:"
		render(left_tower, middle_tower, right_tower, weight_of_heaviest)
		puts "Whenever, you want to see state again, please enter 'render'"
		puts "Unless you type 'quit' the game will continue and you have to select your move"
		puts "To select a move, please input two integers between 1 and 3 with a space in the middle"
		puts "1 is left tower, 2 is middle tower and 3 is the right tower"
		puts "For example to move from middle to left, please enter '2 1'"
		puts "Now lets start! Enter your move"
		while(game_not_won && quit_not_received)
			move_from_to = gets.chomp
			
			if check_input move_from_to
				if move_from_to == 'render'
					render(left_tower, middle_tower, right_tower, weight_of_heaviest)
					puts "Enter your next move"
				elsif move_from_to == 'quit'
					quit_not_received = false
					puts "Quitting game...Thanks for playing"
				else
					move_from_to_array = move_from_to.split(" ")
					number_of_disks_in_right_tower = move move_from_to_array[0].to_i, move_from_to_array[1].to_i, left_tower, middle_tower, right_tower
					if number_of_disks_in_right_tower == number_of_disks
						game_not_won = false
						puts "You won...Good job!"
						render(left_tower, middle_tower, right_tower, weight_of_heaviest)
					else
						puts "Enter your next move"
					end
				end
			else
				puts "Bad input received, please either type 'render' or 'quit' or two numbers with a space, like '2 1'"
			end
		end
	end

	def check_input (move_from_to_string)
		unless move_from_to_string == 'quit' || move_from_to_string == 'render' || move_from_to_string.split(" ").size == 2
			false
		else
			true
		end

	end

	def render(left_tower, middle_tower, right_tower, weight_of_heaviest)
		puts "########## LEFT TOWER ##########"
		puts
		left_tower.reverse.each_with_index do |item, index|
			str_to_print = "0" * item
			puts str_to_print.center(weight_of_heaviest, " ")
		end
		puts "########## MIDDLE TOWER ##########"
		puts
		middle_tower.reverse.each_with_index do |item, index|
			str_to_print = "0" * item
			puts str_to_print.center(weight_of_heaviest, " ")
		end
		puts "########## RIGHT TOWER ##########"
		puts
		right_tower.reverse.each_with_index do |item, index|
			str_to_print = "0" * item
			puts str_to_print.center(weight_of_heaviest, " ")
		end
	end

	def move(from_tower, to_tower, left_tower, middle_tower, right_tower)
		if from_tower == to_tower
			puts "Move not possible! Please select another move"
		else
			if from_tower == LEFT_TOWER && left_tower.size > 0
				disk = left_tower.pop
				if to_tower == MIDDLE_TOWER
					if check_move disk, middle_tower.last
						middle_tower << disk
					else
						left_tower << disk
					end
				else
					if check_move disk, right_tower.last
						right_tower << disk
					else
						left_tower << disk
					end
				end
			elsif from_tower == MIDDLE_TOWER && middle_tower.size > 0
				disk = middle_tower.pop
				if to_tower == LEFT_TOWER
					if check_move disk, left_tower.last
						left_tower << disk
					else
						middle_tower << disk
					end
				else
					if check_move disk, right_tower.last
						right_tower << disk
					else
						middle_tower << disk	
					end
				end
			elsif right_tower.size > 0
				disk = right_tower.pop
				if to_tower == RIGHT_TOWER
					if check_move disk, left_tower.last
						left_tower << disk
					else
						right_tower << disk
					end
				else
					if check_move disk, middle_tower.last
						middle_tower << disk
					else
						right_tower << disk
					end
				end
			else
				puts "Move not possible! Please select another move"
			end
		end
		right_tower.size
	end

	def check_move(from_weight, to_weight)
		unless from_weight.nil?
			unless to_weight.nil?
				if from_weight < to_weight
					true
				else
					puts "Move illegal! Please select another move"
					false
				end
			else
				true
			end
		else
			puts "Move not possible! Please select another move"
			false
		end
		
	end
end

game = TowerOfHanoi.new
game.play