module Mutations
  class CreateUser < Mutations::BaseMutation
    null true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :address, String, required: true
    argument :postcode, String, required: true
    argument :city, String, required: true
    argument :country, String, required: true
    field :errors, [String], null: false
    type Types::UserType
    def resolve(**attributes)
      user = User.create!(attributes)
  
      # if user.save
      #   # Successful creation, return the created object with no errors
      #   {
      #     user: user,
      #     errors: [],
      #   }
      # else
      #   # Failed save, return the errors to the client
      #   {
      #     comment: nil,
      #     errors: user.errors.full_messages
      #   }
      # end
    end
  end
end