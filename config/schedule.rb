# frozen_string_literal: true

every 1.day do
  rake 'coins:update_db'
end
