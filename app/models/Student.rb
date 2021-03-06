require 'tty-prompt'

class Student < ActiveRecord::Base

  has_many :reservations
  has_many :yogaclasses, through: :reservations
  has_many :instructors, through: :reservations


  # def self.log_in
  #     system "clear"
  #     studentInfo = TTY::Prompt.new.ask("Enter Username: ")
  #     user_found = Student.all.find_by(name: studentInfo)
  #       if !user_found
  #         puts "\nSorry, that username doesn't exist."
  #         # # binding.pry
  #         # prompt.select ("Sorry, that username doesn't exist.") do |menu|
  #         # menu.choice "Try Again", -> {log_in} 
  #         # menu.choice "Go Back", -> {main_menu}
  #         # end 
  #         sleep 2
  #         studentInfo = self.register
  #         user_found = Student.all.find_by(name: studentInfo)
  #         if Student.all.exclude?(studentInfo)
  #       else
  #         puts "\nLog In Successful\n"
  #         print "\nTaking you to Main Menu > > >"
  #         sleep 1
  #       end
  #       user_found
  #   end

  def self.register
    system "clear"
      puts "
      \n
      \n
      ╦═╗╔═╗╔═╗╦╔═╗╔╦╗╔═╗╦═╗
      ╠╦╝║╣ ║ ╦║╚═╗ ║ ║╣ ╠╦╝
      ╩╚═╚═╝╚═╝╩╚═╝ ╩ ╚═╝╩╚═                                                   
      \n
      \n"
    studentInfo = TTY::Prompt.new.ask("Create a new Username:")
    levelInfo =  TTY::Prompt.new.ask("What is your yoga level?\n(Beginner - Intermediate - Advanced)")
    
    if Student.find_by(name: studentInfo)
     puts "Sorry, that username is already taken!"
    else
      Student.create(name: studentInfo, level: levelInfo)
    end
  end



end