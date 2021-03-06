class ContactsController < ApplicationController
 
  def index
    @contacts = Contact.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    contact = Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      occupation: params[:occupation],
      fav_food: params[:fav_food],
      latitude: coordinates[1],
      longitude: coordinates[0],
      user_id: current_user.id
    )
    flash[:success] = "New contact created!"
    redirect_to "/contacts/#{contact.id}"
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render 'show.html.erb'
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render 'edit.html.erb'
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      occupation: params[:occupation],
      fav_food: params[:fav_food]
    )
    flash[:success] = "Contact updated!"
    redirect_to "/contact/#{@contact.id}"
  end

  def destroy
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.destroy
    flash[:warning] = "Contact deleted!"
    redirect_to "/contacts"
  end
end 

#   
#   def enter_num

#     render 'enter_num.html.erb'
#   end

#   def num_result
#     @guess = params[:num_result].to_i
#     winning_number = 72
#     if @guess == winning_number
#       @game_message = "You won!"
#     elsif @guess > winning_number
#       @game_message = "You loose, too high"
#     else @guess < winning_number
#       @game_message = "You loose, too low"
#     end
#       render 'num_result.html.erb'
#   end
# end