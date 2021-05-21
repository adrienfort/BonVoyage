require 'faker'
require 'open-uri'

puts "Building a huge seed ..."

puts "  - Destroying actual data ..."
Explorer.destroy_all
Artist.destroy_all
puts "    DONE"

# puts "  - Creating 25 explorers ..."
# 1.upto(25) do |i|
#   puts "    creating explorer n°#{i}"
#   explorer = Explorer.new(email: Faker::Internet.unique.email,
#                           password: "azerty",
#                           first_name: Faker::Name.first_name,
#                           last_name: Faker::Name.last_name,
#                           nickname: Faker::FunnyName.unique.name)
#   explorer.save!
# end
# puts "    DONE"

# puts "  - Creating 15 artists ..."
# 1.upto(15) do |i|
#   puts "    creating artist n°#{i}"
#   artist = Artist.new(email: Faker::Internet.unique.email,
#                       password: "azerty",
#                       name: Faker::Artist.unique.name)
#   artist.save!
# end
# puts "    DONE"

# puts "  - Creating fan_artists ..."
# Explorer.all.each do |explorer|
#   Artist.all.each do |artist|
#     bool = Faker::Boolean.boolean
#     if (bool == true)
#       puts "    creating fan_artist between explorer #{explorer.id} and artist #{artist.id}"
#       fan_artist = FanArtist.new(explorer: explorer, artist: artist)
#       fan_artist.save!
#     end
#   end
# end
# puts "    DONE"

# puts "  - Creating 1 album per artist ..."
# Artist.all.each_with_index do |artist, index|
#   puts "    creating album n°#{index}"
#   album = Album.new(meaning: Faker::Quote.jack_handey,
#                     name: Faker::Music.album,
#                     artist: artist)
#   file = URI.open("https://picsum.photos/200")
#   album.photo.attach(io: file, filename: "album_photo.jpg")
#   album.save!
# end
# puts "    DONE"

# puts "  - Creating fan_albums ..."
# Explorer.all.each do |explorer|
#   Album.all.each do |album|
#     bool = Faker::Boolean.boolean
#     if (bool == true)
#       puts "    creating fan_album between explorer #{explorer.id} and album #{album.id}"
#       fan_album = FanAlbum.new(explorer: explorer, album: album)
#       fan_album.save!
#     end
#   end
# end
# puts "    DONE"

# puts "  - Creating 1 music per albums ..."
# Album.all.each_with_index do |album, index|
#   puts "    creating music n°#{index}"
#   file = open("#{Rails.root.to_s}/app/assets/audios/default-audio.mp3")
#   music = Music.new(name: Faker::Music::Phish.song, album: album)
#   music.audio_file.attach(io: file, filename: "default-audio-music-name", content_type: "audio/mpeg")
#   music.save!
# end
# puts "    DONE"

# puts "  - Creating fan_musics ..."
# Explorer.all.each do |explorer|
#   Music.all.each do |music|
#     bool = Faker::Boolean.boolean
#     if (bool == true)
#       puts "    creating fan_music between explorer #{explorer.id} and music #{music.id}"
#       fan_music = FanMusic.new(explorer: explorer, music: music)
#       fan_music.save!
#     end
#   end
# end
# puts "    DONE"

# puts "  - Creating plays"
# Music.all.each do |music|
#   nb = rand(1..30)
#   1.upto(nb) do |i|
#     puts "    creating play n°#{i} for music #{music.id}"
#     date = Faker::Date.between(from: 10.days.ago, to: Date.today)
#     play = Play.new(music: music)
#     play.created_at = date
#     play.save!
#   end
# end
# puts "  DONE"

puts "  - Creating presentation explorer ..."
adrien = Explorer.new(email: "adrien@gmail.com",
                      password: "azerty",
                      first_name: "Adrien",
                      last_name: "Fort",
                      nickname: "ad12")
adrien.save!
puts "  DONE"

puts "  - Creating presentation artist ..."
juca = Artist.new(email: "pnl@gmail.com", password: "azerty", name: "PNL")
juca.save!
puts "    DONE"

puts "  - Creating presentation albums ..."
puts "    creating album n°1"
album = Album.new(meaning: "",
                  name: "",
                  artist: juca)
file = URI.open("")
album.photo.attach(io: file, filename: "album_photo.jpg")
album.save!
puts "  DONE"

puts "  - Creating presentation musics ..."
puts "    creating music n°1"
file = open("#{Rails.root.to_s}/app/assets/audios/default-audio.mp3")
music = Music.new(name: "", album: album)
music.audio_file.attach(io: file, filename: "default-audio-music-name", content_type: "audio/mpeg")
music.save!
puts "    creating music n°2"
file = open("#{Rails.root.to_s}/app/assets/audios/default-audio.mp3")
music = Music.new(name: "", album: album)
music.audio_file.attach(io: file, filename: "default-audio-music-name", content_type: "audio/mpeg")
music.save!
puts "    creating music n°3"
file = open("#{Rails.root.to_s}/app/assets/audios/default-audio.mp3")
music = Music.new(name: "", album: album)
music.audio_file.attach(io: file, filename: "default-audio-music-name", content_type: "audio/mpeg")
music.save!
puts "    creating music n°4"
file = open("#{Rails.root.to_s}/app/assets/audios/default-audio.mp3")
music = Music.new(name: "", album: album)
music.audio_file.attach(io: file, filename: "default-audio-music-name", content_type: "audio/mpeg")
music.save!
puts "    creating music n°5"
file = open("#{Rails.root.to_s}/app/assets/audios/default-audio.mp3")
music = Music.new(name: "", album: album)
music.audio_file.attach(io: file, filename: "default-audio-music-name", content_type: "audio/mpeg")
music.save!
puts "  DONE"

puts "  - Creating presentation plays ..."
album.musics.each do |music|
  nb = rand(1..50)
  1.upto(nb) do |i|
    puts "    creating play n°#{i} for music #{music.id}"
    date = Faker::Date.between(from: 10.days.ago, to: Date.today)
    play = Play.new(music: music)
    play.created_at = date
    play.save!
  end
end
puts "  DONE"

puts "  - Creating presentation fan_artists"
puts "  - creating fan_artist n°1"
fan_artist = FanArtist.new(explorer: adrien, artist: Artist.all.first)
fan_artist.save!
puts "  - creating fan_artist n°2"
fan_artist = FanArtist.new(explorer: adrien, artist: Artist.all.last)
fan_artist.save!
puts "  - creating fan_artist n°3"
fan_artist = FanArtist.new(explorer: adrien, artist: juca)
fan_artist.save!
puts "  DONE"

puts "  - Creating presentation fan_albums"
puts "    creating fan_album n°1"
fan_album = FanAlbum.new(explorer: adrien, album: Album.all.first)
fan_album.save!
puts "    creating fan_album n°2"
fan_album = FanAlbum.new(explorer: adrien, album: Album.all.last)
fan_album.save!
puts "  DONE"

puts "  - Creating presentation fan_musics"
puts "    creating fan_music n°1"
fan_music = FanMusic.new(explorer: adrien, music: Music.all[5])
fan_music.save!
puts "    creating fan_music n°2"
fan_music = FanMusic.new(explorer: adrien, music: Music.all[6])
fan_music.save!
puts "    creating fan_music n°3"
fan_music = FanMusic.new(explorer: adrien, music: Music.all[7])
fan_music.save!
puts "    creating fan_music n°4"
fan_music = FanMusic.new(explorer: adrien, music: Music.all[8])
fan_music.save!
puts "    creating fan_music n°5"
fan_music = FanMusic.new(explorer: adrien, music: Music.all[9])
fan_music.save!
puts "    creating fan_music n°6"
fan_music = FanMusic.new(explorer: adrien, music: Music.all[9])
fan_music.save!
puts "  DONE"

puts "  - Creating presentation playlist ..."
playlist = Playlist.new(name: "Killing me softly", explorer: adrien)
file = open("#{Rails.root.to_s}/app/assets/images/default-playlist-picture.jpg")
playlist.photo.attach(io: file, filename: 'default-playlist-picture.png', content_type: 'image/jpg')
playlist.save!
puts "    DONE"

puts "  - Creating presentation playlist_musics ..."
puts "    creating playlist_music n°1"
playlist_music = PlaylistMusic.new(playlist: playlist, music: Music.all[5])
playlist_music.save!
puts "    creating playlist_music n°2"
playlist_music = PlaylistMusic.new(playlist: playlist, music: Music.all[6])
playlist_music.save!
puts "    creating playlist_music n°3"
playlist_music = PlaylistMusic.new(playlist: playlist, music: Music.all[7])
playlist_music.save!
puts "    creating playlist_music n°4"
playlist_music = PlaylistMusic.new(playlist: playlist, music: Music.all[8])
playlist_music.save!
puts "    creating playlist_music n°5"
playlist_music = PlaylistMusic.new(playlist: playlist, music: Music.all[9])
playlist_music.save!
puts "    DONE"

Faker::UniqueGenerator.clear

puts "FINISHED !"
