module Types
  class MutationType < Types::BaseObject
    field :create_transaction,
          mutation: Mutations::CreateTransaction,
          description: 'Create a new transaction'
  end
end
