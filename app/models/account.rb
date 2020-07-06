class Account < ApplicationRecord
	# associations
	belongs_to :user
	has_many :addresses, dependent: :destroy
	has_many :orders, dependent: :destroy

	accepts_nested_attributes_for :addresses

	# validations
	validates :phone_number, presence: true,
							 length: { is: 10 }, 
							 numericality: true
	validates :institution_name, presence: true
	validates :institution_type, presence: true
	validates :contact_first_name, presence: true
	validates :contact_last_name, presence: true
end
