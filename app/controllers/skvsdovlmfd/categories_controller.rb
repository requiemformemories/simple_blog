class Skvsdovlmfd::CategoriesController < Skvsdovlmfd::ApplicationController
  
    def index
      @categories = Category.all
    end
    
    def new
      @category = Category.new
    end
    
    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "The category is saved successfully!"
        redirect_to skvsdovlmfd_categories_path
      else
        render :action => :new
      end
    end
    
    def edit
      @category = Category.find(params[:id])
    end
    
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:notice] = 'The category is updated successfully'
        redirect_to skvsdovlmfd_categories_path
      end
    end
    
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      flash[:notice] = "The category is deleted successfully"
      redirect_to skvsdovlmfd_categories_path
    end
    
    private
    def category_params
      params.require(:category).permit(:name)
    end
    
end
