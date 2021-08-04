class CollagesController < ApplicationController
    layout 'studio', only: [:new, :edit, :create, :update]

    def new
        @collage = Collage.new
        # @collage.designs << design.new
        3.times{ @collage.designs.build } 
    end

    def edit
        @collage = Collage.find(params[:id])
    end

    def create
        @collage = Collage.new(collage_params)

        if @collage.save
            redirect_to collage_path(@collage)
        else
            render :new
        end
    end

    def index
        @collages = Collage.all
    end

    def show
        @collage = Collage.find(params[:id])

    end

    private

    def collage_params
        params.require(:collage).permit(:name, :description, designs_attributes: [:title, :description, :design_url])
    end

end
