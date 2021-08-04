# NOTES 
 
 * VALIDATIONS: 
 Where can we validate?

  MODELS: MOSTLY HERE. 

  VIEWS: lets say we want to add it here, in form_with <%= f.lable :description, required: true %>
  
  CONTROLLERS: in controller        def create 
                                     @design = Design.new(design_params)
                                     if params[:description] == "" 
                                     render :whatever






