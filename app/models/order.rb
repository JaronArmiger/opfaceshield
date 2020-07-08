class Order < ApplicationRecord
	# associations
	belongs_to :account

	#validations
	validates :num_shields, presence: true,
							numericality: { only_integer: true,
											less_than_or_equal_to: 999 }
	validates :num_adjusters, presence: true,
							  numericality: { only_integer: true,
											less_than_or_equal_to: 999 }
	validates :message, presence: true, length: { maximum: 140 }

end
