class Book < ActiveRecord::Base

  belongs_to :genre
  has_many :readers
  has_many :users, :through => :readers

  has_attached_file :cover, :styles => { :medium => "300x400", :thumb => "100x200" }

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
