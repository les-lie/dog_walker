class DogsController < ApplicationController
	before_action :find_dog, only: [:show, :edit, :update, :destroy]

	def index
		@dog = Dog.all.order("created_at DESC")
	end

	def show
	end

	def new
		@dog = Dog.new
	end

	def create
		@dog = Dog.new(dog_params)
		if @dog.save
			redirect_to @dog, notice: "New Dog Saved Sucessfully! Woof!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @dog.update(dog_params)
			redirect_to @dog
		else
			render 'edit'
		end
	end

	def destroy
		@dog.destroy
		redirct_to root_path, notice: "Sucessfully removed Dog. See ya, Dog!"
	end

	private

	def dog_params
		params.require(:dog).permit(:name, :description)
	end
	def find_dog
		@dog = Dog.find(params[:id])
	end
end
