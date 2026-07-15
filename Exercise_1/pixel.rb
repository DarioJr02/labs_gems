# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'

# The goal of this file is to learn and practice about ->
# - Sorbet static checker.

# 1. What does mean magic comments in this context?

class Pixel
  attr_accessor(:x, :y, :z)

  extend T::Sig

  sig { params(x: Float, y: Float, z: Float).void }
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  sig { returns(String) }
  def print_data
    return "x=#{@x} | y=#{@y}, | z=#{@z}"
  end

  sig { returns(Float) }
  def sqr_position
    @x *= 2
    @y *= 2
    @z *= 2
  end

  sig { params(name: String).returns(String) }
  def print_name(name)
    return name
  end
end

p1 = Pixel.new(1.3, 2.2, 'a'.ord.to_f)

p(p1)

puts(p1.print_data)
p1.sqr_position
puts(p1.print_data)

arr = p1.sqr_position
puts(arr)

name = p1.print_name("Dario")
puts(name)