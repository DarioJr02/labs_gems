# frozen_string_literal: true
# typed: true

# The goal of this file is to learn about ->
# - Type constructors.

require 'sorbet-runtime'

# Shape class
class Shape
  extend T::Sig

  # 1. Accesors.
  attr_accessor(:name, :x, :y, :z)

  # 2. Constructor.
  sig { params(x: Float, y: Float, z: Float, name: T.nilable(String)).void }
  def initialize(x, y, z, name = nil)
    @x = x
    @y = y
    @z = z
    @name = name # Or T.must(name).strip ==> Hidde to the video.
  end

  # 3. public methods

  sig { returns(T.nilable(String)) }
  def shape
    return nil if T.must(@name).strip.empty?

    return @name
  end
end

cube = Shape.new(3.4, 3.2, 3.4, ' d   ')

puts("My name is a #{cube.shape.class} type, and its ==> #{cube.shape}.")