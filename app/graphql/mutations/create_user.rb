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
    end
  end
end