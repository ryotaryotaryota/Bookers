class Room < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy
end
