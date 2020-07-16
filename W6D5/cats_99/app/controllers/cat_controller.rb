class CatController < ApplicationController
    

    def index
        @cats =  Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: cat_params[:id])
        if @cat  
            render :show
        else
            redirect_to cats_url
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @new_cat = Cat.new(cat_params)

        if @new_cat.save
            redirect_to cat_url
        else
            render :new
        end
    end

    def destroy
        @cat = cat
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :gender, :color, :birth_date, :description)
    end

end

