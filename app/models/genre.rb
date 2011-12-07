class Genre < ActiveRecord::Base

  has_many :books

  def self.dropdown
    @all_genres = Genre.all
    @genres = []
    @all_genres.each do |gen|
      @genres << [gen.title, gen.id]
    end
    return @genres
  end

end
