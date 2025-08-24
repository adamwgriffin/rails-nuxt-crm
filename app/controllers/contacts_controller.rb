class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  def index
    @contacts = Contact.all_paginated(params)
  end

  def create
    @contact = Contact.create!(contact_params)

    render status: :created
  end

  def update
    @contact.update!(contact_params)

    head :ok
  end

  def destroy
    @contact.destroy!
  end

  private
    def set_contact
      @contact = Contact.find(params.expect(:id))
    end

    def contact_params
      params.expect(contact: [ :first_name, :middle_name, :last_name, :birthday, :notes ])
    end
end
