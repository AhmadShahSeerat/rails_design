class DesignsController < ApplicationController

    def most_recent
        @designs = Design.most_recent
    end

    def index 
       @designs = Design.all 
    end
    
    def show 
        @design = Design.find_by(id: params[:id])
    end

end
 
