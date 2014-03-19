require './lib/doctors'
require './lib/patients'
require 'pg'
DB = PG.connect(:dbname => 'doctor_office')

def main_menu
  puts "Hello!!!! Welcome to the doctor office scheduler!!!"
  puts "Engineered by Apple in California!!!"
  puts "---------------------------------------------------"
  puts "Press D to add a new doctor"
  puts "Press V to view list of all doctors at this office"
  puts "Press R to remove a doctor"
  puts "Press X to quit"
  main_response = gets.chomp.upcase
  case main_response
  when "D"
    new_doctor
  when "V"
    puts "Here is a list of all your doctors:"
    doctor_list
  when "R"
    remove_doctor
  when "X"
    puts "Smell 'ya later!!!"
  end
end

def new_doctor
  puts "Enter doctor's name:"
  puts "--------------------"
  input = gets.chomp
  new_doctor = Doctor.new(input)
  new_doctor.save
  puts "#{new_doctor.name} has been saved."
  puts "----------------------------------"
  puts "Press P to add a patient to #{new_doctor.name}'s patient list"
  puts "Press L to list doctors"
  puts "Press D to add another doctor"
  puts "Press M to return to the main menu"
  main_menu
end

def doctor_list
  Doctor.list_doctors.each_with_index do |doctor, index|
    puts "#{index+1}. #{doctor['name']}"
  end
  main_menu
end

def remove_doctor
  puts "Enter the index of the doctor you want to remove"
  puts "------------------------------------------------"
  Doctor.list_doctors.each_with_index do |doctor, index|
    puts "#{index+1}. #{doctor['name']}"
    end
  puts "------------------------------------------------"
  input = gets.chomp
  Doctor.list_doctors.each_with_index do |doctor, index|
    if doctor['id'].to_i == input.to_i-1
      puts "#{doctor['name']} has been deleted"
      doctor.delete
    end
  end
  main_menu
end

main_menu
