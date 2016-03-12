require_relative 'src/matlab_clone'


caller = EmjayMatClone::MatLabClone.new
menu=true

while menu
  puts "\n\n...........................................................................................................".yellow
  puts "Welcome! A Matlab Clone Application for Performing Array and Matrix Operations by JAMIU, Abdulmujeeb(Emjay)".yellow
  puts "...........................................................................................................".yellow
  puts "....................................Press 1 - To create an Array...........................................".yellow
  puts "..................................Press 2 - To create an X-Y Matrix........................................".yellow
  puts "...............................Press 3 - To create an X-Y Vector of ZEROS..................................".yellow
  puts ".................................Press 4 - To add a Matrix and a Number....................................".yellow
  puts "......................Press 5 - To transpose a matrix using the apostrophe operator........................".yellow
  puts "................................Press 6 - To find the inverse of a matrix..................................".yellow
  puts "..................................Press 7 - To concatenate two matrices....................................".yellow
  puts "............................Press 8 - To save data output from your operation..............................".yellow
  puts "...............................Press 9 - To load data from your saved files................................".yellow
  puts "....................................Press 10 - To exit the application.....................................".yellow

  choice = gets.chomp
  case choice

    when "1"
      puts 'Input in this format: "1 2 3 4" to create an Array'.yellow
      arr_str = gets.chomp
      caller.arr_create(arr_str)

    when "2"
      puts 'Input in this format to create a Matrix: "1 2 3;4 5 6;7 8 9"'.yellow
      mat_str = gets.chomp
      caller.mat_create(mat_str)

    when "3"
      puts "How many rows?".yellow
      rows = gets.chomp
      puts "How many columns?".yellow
      cols = gets.chomp
      dim = rows, cols
      caller.vector_zeros(dim)

    when "4"
      puts 'Please enter the matrix in this format: "1 2 3;4 5 6;7 8 9"'.yellow
      mat_str = gets.chomp
      puts "Please enter the number you want to add to the matrix".yellow
      number = gets.chomp
      caller.mat_add(mat_str, number)

    when "5"
      puts 'Please enter the matrix in this format: "1 2 3;4 5 6;7 8 9"'.yellow
      mat_str = gets.chomp
      caller.mat_transpose(mat_str)

    when "6"
      puts "Note: The Array can only calculate for 2-by-2 matrix inverse for now".yellow
      puts 'Please enter the matrix in this format: "1 2;3 4"'.yellow
      mat_str = gets.chomp
      caller.mat_inverse(mat_str)
    
    when "7"
      puts 'Please enter the first matrix in this format: "1 2 3;4 5 6;7 8 9"'.yellow
      mat_str1 = gets.chomp
      puts 'Please enter the second matrix in this format: "1 2 3;4 5 6;7 8 9"'.yellow
      mat_str2 = gets.chomp
      puts 'For horizontal concatenation, enter "," | For Vertical concatenation, enter ";"'.yellow
      operator=gets.chomp
      caller.mat_concat(mat_str1, mat_str2, operator)

    when "8"
      puts 'Please enter the command in this format to save data: "save filename.mat"'.yellow
      save_command=gets.chomp
      caller.save_output(save_command)

    when "9"
      puts 'Please enter the command in this format to load data: "load filename.mat"'.yellow
      load_command=gets.chomp
      caller.load_data(load_command)

    when "10"
      puts "Good bye!!!"
      menu = false

    else
      puts puts "Please enter a valid number between 1 and 9 to select an option from the menu".yellow


  end
end
