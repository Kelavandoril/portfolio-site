class ContactsController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  def index
    @contacts = Contact.all
  end
end
