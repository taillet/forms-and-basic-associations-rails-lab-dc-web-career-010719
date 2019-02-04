class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # attr_reader :genre_name, :artist_name


  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by(name: name)
    self.artist = @artist
  end

  def genre_name
    self.genre[:name]
  end

  def artist_name
    @artist ? @artist.name : nil
  end

  def note_contents=(notes)
    if notes != ""
     notes.reject {|note| note == ""}.each do |content|
       self.notes.build(content: content)
     end
end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
