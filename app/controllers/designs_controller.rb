class DesignsController < ApplicationController


    def most_recent
        @designs = Design.most_recent #this is a custom route
    end

    def index #restful route for all designs
        if params[:search]
@designs = Design.search(params[:search])
        else 
       @designs = Design.all 
        end
    end
    
    def new
        @design = Design.new
    end



    def create
  

        # Design.create(params[:design]####lets say if i put this and want to create a new design with 
        # params this will give me forbiddenattributeError which means i cant give all attributes 
        # allow them to set my attributes to whatever they want for example the attribute 
        # of view i dont want them to be able to change the view like 1 million
 
        # Design.create(params.require(:design).permit(:title, :design_url, :description)) # now this one
        # does not give us the same error because we exactly told our line of code that we allow our new
        #design to be able to set and change the attributes of these params namely mentioned.
        # and there is another way to do this, and that is the to add a helper method of private method 
        # lower in this controller and tell them exactly what we said here the strong params and let 
        # this create method just copy the object from the private method. 
        #it will be as below::: and remember these are called strong params
        
        @design = Design.new(design_params)
        if @design.save
            redirect_to design_path(@design)

        else 
            #implement some error messages and
            #maybe will do some flash messages 
            #so if @image doesnt save then it has error in it and that error comes from validations in models
            render :new
        end
    end

    def edit 
        @design = Design.find_by(id: params[:id])
    end

    def update 
        @design = Design.find_by(id: params[:id])
        @design.update(designs_params)

        if @design.valid?
            redirect_to design_path(@design)
        else
            #todo some error messages here 
            render :edit 
        end
    end

    def show 
        @design = Design.find_by(id: params[:id])
    end

  

    def destroy 
        #will do DRY later on first want to build based 
        @design = Design.find_by(id: params[:id])
        @design.destroy
        redirect_to designs_path 
    end

    private 

    def designs_params   #they are strong_params i just named it design_params

        params.require(:design).permit(:title, :design_url, :description)
    end

end
 
