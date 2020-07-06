class Order < ApplicationRecord
	# associations
	belongs_to :account
	has_and_belongs_to_many :addresses

	#validations
	validates :num_shields, presence: true,
							numericality: { only_integer: true,
											less_than_or_equal_to: 999 }
	validates :num_adjusters, presence: true,
							  numericality: { only_integer: true,
											less_than_or_equal_to: 999 }
	validates :message, presence: true, length: { maximum: 140 }
end
