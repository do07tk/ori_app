class Like < ApplicationRecord

  # Assosiacion
  belongs_to :user
  belongs_to :tweet
  
end
