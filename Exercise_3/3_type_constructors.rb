# frozen_string_literal: true
# typed: true

# The goal of this file is to learn about ->
# - Type constructors.

require 'sorbet-runtime'

# Pixel class
class Pixel
  extend T::Sig

  # 1. Accesors.
  attr_accessor(:x, :y, :z)

  # 2. Constructor.
  sig { params(x: Float, y: Float, z: Float).void }
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end
end
