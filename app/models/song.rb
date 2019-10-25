class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name:name)
  end

  def genre_id
    genre ? genre.id : nil
  end

  def genre_name
    genre ? genre.name : nil
  end

  def notes=(notes)
    notes.each do |n|
      unless n.empty?
        note = Note.find_or_create_by(content:n)
        self.notes << note
      end
    end
  end

  def note_contents=(array)
    array.each do |n|
      unless n.empty?
        note = Note.find_or_create_by(content:n)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map do |n|
      n.content
    end
  end

end
