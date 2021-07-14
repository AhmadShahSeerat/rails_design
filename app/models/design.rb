class Design < ApplicationRecord

    

    def self.search(query)
        self.where("title like %?%", query)
    end

    def self.most_recent 
        self.order(created: :desc)
    end

    def uploaded_at
        self.created_at.to_date
    end


end
