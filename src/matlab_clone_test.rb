require 'codeclimate-test-reporter'
CodeClimate::TestReporter.configure do |config|
  # the root of your Rails application relative to the repository root
  config.path_prefix = "src"
  # config.git_dir = "https://github.com/abdulemjay/MatLab-Clone.git" #the relative or absolute location of your git root compared to where your tests are run
  config.git_dir = `git rev-parse --show-toplevel`.strip
end
CodeClimate::TestReporter.start



require_relative 'matlab_clone'

RSpec.describe "MatLab Clone" do
  caller = EmjayMatClone::MatLabClone.new()

  context 'method arr_create' do
    it 'should return an the right array' do
      expect(caller.arr_create("1 2 3 4")).to eq "1 2 3 4"
    end

    it 'should return error for string array' do
      expect {caller.arr_create('d e h')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
    end

    it 'should return error for string and number array' do
      expect {caller.arr_create('d 4 h')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
    end

    it 'should return error for unformatted number array' do
      expect {caller.arr_create('3 4   5')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
    end

    it 'should return error for wrong array input' do
      expect {caller.arr_create('2 3 4;5 6 7')}.to raise_error 'Invalid string entered. Please enter a valid string e.g 2 3 4'.red
    end
  end


  context "mat_create method" do                 
    it "should return the matrix input" do
      expect(caller.mat_create("1 2;3 4")).to eq "1 2\n\t3 4"
    end
  end


  context 'method vector_zeros' do                 
    it 'should return error for rows = 0' do
      expect {caller.vector_zeros('0','3')}.to raise_error 'Invalid. Number of rows or columns cannot be zero'.red
    end

    it 'should return error for columns = 0' do
      expect {caller.vector_zeros('4','0')}.to raise_error 'Invalid. Number of rows or columns cannot be zero'.red
    end

    it 'should return error for non-digit input for rows' do
      expect {caller.vector_zeros('r','5')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
    end

    it 'should return error for non-digit input for colums' do
      expect {caller.vector_zeros('5','e')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
    end

    it 'should return the vector zeros' do
      expect(caller.vector_zeros('3','5')).to eq "0 0 0 0 0\n\t 0 0 0 0 0\n\t 0 0 0 0 0"
    end

     it 'should return error for non-digit input for rows' do
      expect {caller.vector_zeros('r','5')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
    end

    it 'should return error for non-digit input for colums' do
      expect {caller.vector_zeros('5','e')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
    end
  end


  context 'method matrix addition' do        
    it "checks if scalar number is valid" do
      expect(caller.mat_add("1 2;3 4", "5")).to eq "6 7 \n8 9"
    end

    it "checks if scalar number is valid" do
      expect {caller.mat_add("1 2;3 4", "v")}.to raise_error 'Invalid matrix or number. Please try again'.red
    end  
  end


  context 'method matrix transpose' do          
    it "computes the transpose of the matrix" do
      expect(caller.mat_transpose("1 2 3;4 5 6")).to eq "1 4 \n2 5 \n3 6"
    end
  end


  context 'method matrix inverse' do         
    it "computes the inverse of a 2-by-2 matrix" do
      expect(caller.mat_inverse("1 2;4 5")).to eq "-0.33\t1.33\n\t0.67\t-1.67"
    end
  end


  context 'method matrix concatenate' do          
    it "concatenates two similar matrices horizontally" do
      expect(caller.mat_concat("1 2;3 4", "6 7;8 9", ",")).to eq "1 2 6 7\n\t3 4 8 9"
    end

    it "concatenates two similar matrices vertically" do
      expect(caller.mat_concat("1 2;3 4", "6 7;8 9", ";")).to eq "1 2\n\t3 4\n\t6 7\n\t8 9"
    end

    it "raises error for wrong operator" do
      expect {caller.mat_concat("1 2;3 4", "6 7;8 9", ".")}.to raise_error "Matrix cannot be concatenated, please use the right operator".red
    end
  end


  context 'method save_data' do
    it 'should check for if file exist' do
      expect(caller.save_output("save testfile.mat")).to eq nil
      #expect {caller.save_output("save testfile.mat")}.to change {caller.save_output("save testfile.mat")}.from(4).to(3)
    end

    it 'should check for if file exist' do
      expect(caller.save_output("save testfileff.mat")).to eq nil
      #expect {caller.save_output("save testfile.mat")}.to change {caller.save_output("save testfile.mat")}.from(4).to(3)
    end

    it 'should check for incorrect command format' do
      expect {caller.save_output('save new.ma')}.to raise_error 'Please save using this command: save filename.mat'.red
    end

    it 'should check for incorrect command format' do
      expect {caller.save_output('savenew.ma')}.to raise_error 'Please save using this command: save filename.mat'.red
    end
  end


  context 'method load_data' do
    it 'should check for if file exist' do
      expect(caller.load_data("load testfile.mat")).to eq nil
      #expect {caller.save_output("save testfile.mat")}.to change {caller.save_output("save testfile.mat")}.from(4).to(3)
    end

    it 'should check for if file exist' do
      expect(caller.load_data("load testfileff.mat")).to eq nil
      #expect {caller.save_output("save testfile.mat")}.to change {caller.save_output("save testfile.mat")}.from(4).to(3)
    end

    it 'should check for incorrect command format' do
      expect {caller.load_data('load new.ma')}.to raise_error 'Please load_data using this command: load_data filename.mat'.red
    end

    it 'should check for incorrect command format' do
      expect {caller.load_data('loadnew.ma')}.to raise_error 'Please load_data using this command: load_data filename.mat'.red
    end    
  end

end
