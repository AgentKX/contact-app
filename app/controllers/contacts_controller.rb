class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  
  def form
    render 'forms.html.erb'
  end

  def submitted
    @message = params[:id]
    render 'submitted.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    Contact.create(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      occupation: params[:occupation],
      fav_food: params[:fav_food],
    )
    render 'create.html.erb'
  end

def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render 'edit.html.erb'
  end


  def create
    render create.html.erb
  end

def update
  @
end




  def enter_num

    render 'enter_num.html.erb'
  end

  def num_result
    @guess = params[:num_result].to_i
    winning_number = 72
    if @guess == winning_number
      @game_message = "You won!"
    elsif @guess > winning_number
      @game_message = "You loose, too high"
    else @guess < winning_number
      @game_message = "You loose, too low"
    end
      render 'num_result.html.erb'
  end
end