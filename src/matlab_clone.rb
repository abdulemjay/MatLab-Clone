=begin
Author: Jamiu Abdulmujeeb
MatLab Clone - A Ruby REPL(Read-Eval-Print-Loop) Console Application to Perform Array and Matrix Operations.
=end

module EmjayMatClone

require_relative 'matlab_clone_checker'
require 'colorize'

  class MatLabClone

    #the constructor
    def initialize
    end


    # class variables
    @@data_to_save=""
    @@separator="\n\n--------------------this is a new data----------------------------".yellow


    #defined methods in the specification
    def arr_create(arr_str)
      @result=""
      if array_confirm(arr_str) == true
        puts "Your Array is: ".yellow
        arr_str.split(" ").collect do |x| @result << " #{x}"
        end
        @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
        print @result.green
        @result.strip
      else
        raise 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
      end
    end



    def mat_create(mat_str)
      @result=""
      if mat_str.include? ";"
        puts "Your Matrix is: ".yellow
        mat_str.split(';').each { |x| @result << "\t#{x}\n" }
        print @result.green
        @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
        @result.strip
      end
    end

    

    def vector_zeros(rows,cols)
      @result=""
      if digit_confirm(rows) == false || digit_confirm(cols) == false
        raise 'Invalid number. Number of rows/columns invalid '.red
      elsif rows == "0" || cols == "0"
        raise 'Invalid. Number of rows or columns cannot be zero'.red   
      else
        puts "The Zero Matrix is: ".yellow
        rows.to_i.times do
          zero_mat = "\t"
          cols.to_i.times do
             zero_mat << " 0"
          end
          puts zero_mat.green
          @result << "#{zero_mat}\n"
        end
        @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
        @result.strip
      end
    end



    def mat_add(mat_str, number)
      if digit_confirm(number) == true
        puts "The New Array is: \t".yellow
        @result=""
        mat_str.split(';').each do |row|
          @total = ""
          row.split(" ").each do |cell|
            @total << (cell.to_i + number.to_i).to_s + " "
          end
          @result << "#{@total}\n"
          puts "\t#{@total}".green
        end
        @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
        @result.strip
      else
        raise 'Invalid matrix or number. Please try again'.red
      end
    end



    def mat_transpose(mat_str)
      @result=""
      puts "The Transpose of your Matrix is: \t".yellow
      row_length = mat_str.split(';').length
      for col in 0..row_length
        @total = ""
        for row in 0...row_length
          @total << mat_str.split(';')[row].split(' ')[col] + ' '
          row += 1
        end
        @result << "#{@total}\n"
        puts "\t#{@total}".green
        col += 1
      end
      @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
      @result.strip
    end



    def mat_inverse(mat_str)
      @result=""
      puts "The New matrix is: ".yellow
      k = mat_str.split(';')[0].split(' ')[0].to_i
      l = mat_str.split(';')[0].split(' ')[1].to_i
      m = mat_str.split(';')[1].split(' ')[0].to_i
      n = mat_str.split(';')[1].split(' ')[1].to_i
      det = (k * n) - (l * m)
      @result << "\t#{(k / det.to_f).round(2)}\t#{(-1 * m / det.to_f).round(2)}\n\t#{(-1 * l / det.to_f).round(2)}\t#{(n / det.to_f).round(2)}"
      print @result.green
      @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
      @result.strip
    end


    def mat_concat(mat_str1, mat_str2, operator)
      @result=""
      if operator==","
        hor_concat(mat_str1, mat_str2)
      elsif operator==";"
        ver_concat(mat_str1, mat_str2)
      else
        raise "Matrix cannot be concatenated, please use the right operator".red
      end
    end


    def hor_concat(mat_str1, mat_str2)
      puts "The New Array is: ".yellow
      lent = mat_str1.split(";").length
      for i in 0...lent
        @total = "\t"
        @total << mat_str1.split(";")[i] <<" " << mat_str2.split(";")[i]
        puts @total.green
        @result << "#{@total}\n"
      end
      @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
      @result.strip
    end


    def ver_concat(mat_str1, mat_str2)
      puts "The New Array is: ".yellow
      @total = ""
      mat_str1.split(';').each do |x|
        @total << "\t#{x}\n"
      end
      mat_str2.split(';').each do |y|
        @total << "\t#{y}\n"
      end
      @result << @total
      @@data_to_save << "\n#{@@separator}\n#{@result}\n saved at #{Time.new.inspect}.".yellow
      puts @result.green
      @result.strip
    end


    def save_output(save_command)
      if /^save (\w+).mat$/ =~ save_command
        if File.exist?(save_command.gsub!('save ', ''))
          File.open(save_command, 'a') do |file|
            file.puts @@data_to_save
            puts "The data has been saved".yellow
          end
        else
          new_file = File.new(save_command, 'w')
          new_file.syswrite(@@data_to_save)
          puts "The data has been saved".yellow
        end
      else
        raise 'Please save using this command: save filename.mat'.red
      end
    end



    def load_data(load_command)
      if /^load (\w+).mat$/ =~ load_command
        if File.exist?(load_command.gsub!('load ', ''))
          new_file = File.new(load_command, 'r')
          data = new_file.read
          puts data.to_s.green
        else
          puts 'File does not exist'.red
        end
      else
        raise 'Please load_data using this command: load_data filename.mat'.red
      end
    end

  end
end
