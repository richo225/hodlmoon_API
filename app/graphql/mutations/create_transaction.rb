module Mutations
  class CreateTransaction < BaseMutation
    argument :process, String, required: true
    argument :amount, Float, required: true
    argument :price, Float, required: true
    argument :exchange_id, ID, required: true
    argument :coin_id, ID, required: true

    field :transaction, Types::TransactionType, null: false
    field :errors, [String], null: false

    def resolve(transaction_params)
      user = context[:current_user]

      raise GraphQL::ExecutionError, 'Authentication required' if user.blank?

      transaction = user.transactions.new(transaction_params)
      if transaction.save
        {
          transaction: transaction,
          errors: []
        }
      else
        {
          transaction: nil,
          errors: transaction.errors.full_messages
        }
      end
    end
  end
end
