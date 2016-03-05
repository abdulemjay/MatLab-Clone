require 'codeclimate-test-reporter'
CodeClimate::TestReporter.configure do |config|
  config.path_prefix = "src" #the root of your Rails application relative to the repository root
  #config.git_dir = "https://github.com/sheyooo/andela-project.git" #the relative or absolute location of your git root compared to where your tests are run
  config.git_dir = `git rev-parse --show-toplevel`.strip
end
CodeClimate::TestReporter.start



require_relative 'matlab_clone'

RSpec.describe "MatLab Clone" do
  caller = EmjayMatClone::MatLabClone.new()

    context 'method arr_create' do

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
      
      it 'should return an the right array' do
        expect(caller.arr_create("1 2 3 4")).to eq "1 2 3 4"
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
    
    end

    context 'method load_data' do  
            
      it 'should check for incorrect command format' do
        expect {caller.load_data('load_data new.ma')}.to raise_error 'Please load_data using this command: load_data filename.mat'.red
      end

      it 'should check for incorrect command format' do
        expect {caller.load_data('load_datanew.ma')}.to raise_error 'Please load_data using this command: load_data filename.mat'.red
      end

      it 'should return error for non-digit input for rows' do
        expect {caller.vector_zeros('r','5')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
      end

      it 'should return error for non-digit input for colums' do
        expect {caller.vector_zeros('5','e')}.to raise_error 'Invalid number. Number of rows/columns invalid '.red
      end
    
    end

end
