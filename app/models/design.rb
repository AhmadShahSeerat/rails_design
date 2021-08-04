class Design < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :design_url, message: 'and design Url are not UNIQUE'}
    validates :description, presence: true
    validates :design_url, presence: true
    belongs_to :collage, optional: true # collage= COLLAGE OBJECT

    # accepts_nested_attributes_for :collage
    # collage_attributes=(attributes) 

    def uploaded_at
        self.created_at.to_date
    end

    def collage_attributes=(attributes)

        if !(attributes[:name].blank? || attributes[:description].blank?)
            self.collage = Collage.find_or_create_by(attributes)
        end
    end


    # validates :views, numericality: { less_than: 10 }
    # validate :too_many_designs, on: :create
    
    # custom validation called design url format
    # add validator that checks if the design_url ends with
    # .jpg
    # .jpeg
    # .png

    # def too_many_designs
    #     if design.all.length >= 10
    #         self.errors.add(:base, :invalid, message: "MY DATABASE IS FULL STOP CREATING designS")
    #     end
    # end
    
    
    # TODO: Refactor to scope method
    def self.search(query)
        self.where("title LIKE ?", "%#{query}%")
    end

    def self.most_recent
        self.order(created_at: :desc)
    end
end