# class Artist
#   attr_accessor :name, :id
#
#   def initialize(attributes)
#     @name = attributes.fetch(:name)
#     @id = attributes.fetch(:id)
#   end
#
#   def self.all
#     returned_artists = DB.exec("SELECT * FROM artists;")
#     artists = []
#     returned_artists.each() do |artist|
#       name = artist.fetch("name")
#       id = artist.fetch("id").to_i
#       artists.push(Artist.new({:name => name, :id => id}))
#     end
#     artists
#   end
#
#   def save
#     result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
#     @id = result.first().fetch("id").to_i
#   end
#
#   def ==(artist_to_compare)
#     self.name() == artist_to_compare.name()
#     # this is just to demonstrate a point.  One would not want to do this regularly unless they had a very good reason to do so
#   end
#
#   def self.clear
#     DB.exec("DELETE FROM artists *;")
#   end
#
#   def self.find(id)
#     artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
#     name = artist.fetch("name")
#     id = artist.fetch("id").to_i
#     Artist.new({:name => name, :id => id})
#   end
#
#   def update(name)
#     @name = name
#     DB.exec("UPDATE artists SET name = '#{@name}' WHERE id = #{@id};")
#   end
#
#   def delete
#     DB.exec("DELETE FROM artists WHERE id = #{@id};")
#   end
#
#   def songs
#     Song.find_by_artist(self.id)
#   end
#
#   def update(attributes)
#     if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
#       @name = attributes.fetch(:name)
#       DB.exec("UPDATE artists SET name = '#{@name}' WHERE id = #{@id};")
#     end
#     album_name = attributes.fetch(:album_name)
#     if album_name != nil
#       album = DB.exec("SELECT * FROM albums WHERE lower(name)='#{album_name.downcase}';").first
#       if album != nil
#         DB.exec("INSERT INTO albums_artists (album_id, artist_id) VALUES (#{album['id'].to_i}, #{@id});")
#       end
#     end
#   end
# end
