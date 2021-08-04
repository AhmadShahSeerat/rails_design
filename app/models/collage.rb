class Collage < ApplicationRecord
    has_many :designs
    validates :name, presence: true
    accepts_nested_attributes_for :designs, reject_if: proc { |attributes| attributes['title'].blank? || attributes['description'].blank? || attributes['design_url'].blank? }
end