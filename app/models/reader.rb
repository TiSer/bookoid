class Reader < ActiveRecord::Base
  
  belongs_to :user  # foreign key - user_id
  belongs_to :book  # foreign key - book_id

  scope :find_by_user_and_book, lambda { |book_id, user_id| where(:book_id => book_id, :user_id => user_id) }

end
