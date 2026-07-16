# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'

# The goal of this file is to continue learning about ->
# - Sorbet statick checker.

# class Person
class Profession
  extend T::Sig

  attr_accessor(:name, :age, :id, :role)

  attr_reader(:salary)

  sig { params(name: String, age: Integer, id: Integer, role: String, salary: Float).void }
  def initialize(name, age, id, role, salary = 0.0)
    @name = { 'Name' => name }
    @age = { 'Age' => age }
    @id = { 'ID' => id }
    @role = { 'Role' => role }
    @salary = { 'Salary' => salary }

    # Internal Logic exec
    salary_calc
  end

  private

  def salary_calc
    @salary['Salary'] = case @role['Role']
                        when 'Web Developer'
                          100
                        when 'Game Developer'
                          200
                        when 'Compiler Developer'
                          500
                        else
                          0
                        end
  end

  public

  sig { void }
  def resume
    msg = "My name is #{@name['Name']}, i'm #{@age['Age']}, i work as a freelancer #{@role['Role']} and i earn around #{@salary['Salary']}€ per job." # rubocop:disable Layout/LineLength
    puts(msg)
  end
end

dev = Profession.new('Juan', 25, 1, 'Compiler Developer')

puts(dev.salary)
dev.resume
