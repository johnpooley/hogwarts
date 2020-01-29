require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student.rb')
also_reload('./models/*')




get "/students" do
  @students=Student.all
  erb(:students)
end


get '/students/new' do
  erb(:new_student)
end

post '/students' do
  @student=Student.new(params)
  @student.save
  erb(:success)
end
