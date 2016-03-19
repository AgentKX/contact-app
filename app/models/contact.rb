class Contact < ActiveRecord::Base
  def contacts_list
    contacts.split(', ')
  end

    def description_list
    description.split('. ')
  end

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
end

