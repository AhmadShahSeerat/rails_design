class DesignsController < ApplicationController
    before_action :find_collage, only: [:index, :new, :create]

    def search
        @designs = Design.search(params[:title])
        render :index
    end

    def most_recent
        @designs = Design.most_recent
    end

    def index
        if @collage
            @designs = @collage.designs
        else
            @designs = Design.all
        end
    end
    
    def show
        @design = Design.find_by(id: params[:id])
        @design.update(views: @design.views+1) 
    end
    
    def new
        if @collage
            @design = @collage.designs.build
        else
            @design = Design.new
            @design.build_collage
        end

        render layout: 'studio'
    end

    def create
        # if @collage
        #     @design = @collage.designs.build(design_params)
        # else
        #     @design = design.new(design_params)
            
        # end
        @design = Design.new(design_params)
        # What is happening on line 26?
        # creating new design based on params I set.
        # self.send("#{k}=", value)
        if @design.save
            if @collage
                redirect_to collage_designs_path(@collage)
            else
                redirect_to design_path(@design)
            end
        else
            # implement some error handling
            # If it doesnt save
            # @design.errors
            # TODO: add some flash messaging
            
            render :new, layout: "studio"
        end
    end

    def edit
        @design = design.find_by(id: params[:id] )
        render layout: 'studio'
    end

    def update
        @design = Design.find_by(id: params[:id])
        @design.update(design_params)

        if @design.valid?
            redirect_to design_path(@design)
        else
            #TODO: ERROR MESSAGES
            render :edit, layout: 'studio'
        end
    end

    def destroy
        #TODO: DRY THIS UP BRO
        @design = design.find_by(id: params[:id])
        @design.destroy
        redirect_to designs_path
    end

    private
    #Strong Params
    def design_params
        params.require(:design).permit(:title, :description, :design_url, :collage_id, collage_attributes: [:name, :description])
    end

    def find_collage
        @collage = Collage.find_by_id(params[:collage_id])
        #@collage = Collage.find(params[:collage_id]) # will error if id does not exist
    end
end