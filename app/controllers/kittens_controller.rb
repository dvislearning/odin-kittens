class KittensController < ApplicationController
	def index
		@kittens = Kitten.all.order(created_at: :desc)
		respond_to do |format|
	        format.html # index.html.erb
	        format.xml  { render :xml => @kittens }
	        format.json { render :json => @kittens }
        end
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.create!(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten was created successfully"
			redirect_to kitten_path(@kitten)
		else
			flash.now[:danger] = "Your kitten could not be created."
			render 'new'
		end
	end

	def show
		@kitten = Kitten.find(params[:id])
		respond_to do |format|
	        format.html # show.html.erb
	        format.xml  { render :xml => @kitten }
	        format.json { render :json => @kitten }
        end		
	end

	def destroy
		Kitten.find(params[:id]).destroy
		flash[:success] = "Kitten Deleted.  Now, why would you want to do that?"
		redirect_to root_url
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten Updated Successfully!"
			redirect_to kitten_path(@kitten)
		else
			flash.now[:danger] = "Cannot Update Kitten"
			render 'edit'
		end
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, 
			:cuteness, :softness)
	end
end
