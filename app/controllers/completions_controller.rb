# The completion controller is a basic RESTful controller that allow a logged-in user to edit the completed
# courses in their associated +completions+ table. They may add, remove and update courses and their associated
# grades. The controller also uses the autocomplete feature to aid the process of adding new courses to
# their history in a user-friendly manner.

class CompletionsController < ApplicationController
  def index
    @completions = Completion.where(user_id: current_user.id)
  end

  def new
    @completion = Completion.new
  end
  
  def show
    @completion = Completion.find(params[:id])
  end

  def edit
    @completion = Completion.find(params[:id])
  end

  def create
    @completion = Completion.new(params[:id])
  end

  def update
    @completion = Completion.find(params[:id])
    respond_to do |format|
      if @completion.update(params[:id])
        redirect_to @completion, notice: 'Completion was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @completion = Completion.find(params[:id])
    @completion.destroy
    redirect_to completions_url, notice: 'Completion was successfully destroyed.'
  end
end

