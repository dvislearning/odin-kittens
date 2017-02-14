class Kitten < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates :age, presence: true, :inclusion => 1..30
	validates :cuteness, presence: true, :inclusion => 1..10
	validates :softness, presence: true, :inclusion => 1..10
end
