# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Building a small seed ..."

puts "  - Destroying actual data ..."

Explorer.destroy_all
Artist.destroy_all

puts "    DONE"

puts "  - Creating 1 explorer ..."

explorer = Explorer.new(email: "adrien@gmail.com", password: "azerty", first_name: "Adrien", last_name: "Fort", nickname: "ad12")

explorer.save!

puts "    DONE"

puts "  - Creating 3 artists ..."

pnl = Artist.new(email: "pnl@gmail.com", password: "azerty", name: "PNL")
ninho = Artist.new(email: "ninho@gmail.com", password: "azerty", name: "ninho")
mac_miller = Artist.new(email: "macmiller@gmail.com", password: "azerty", name: "Mac Miller")

pnl.save!
ninho.save!
mac_miller.save!

puts "    DONE"

puts "  - Creating 3 fan_artists"

fan_explorer_pnl = FanArtist.new(explorer: explorer, artist: pnl)
fan_explorer_ninho = FanArtist.new(explorer: explorer, artist: ninho)
fan_explorer_mac_miller = FanArtist.new(explorer: explorer, artist: mac_miller)

fan_explorer_pnl.save!
fan_explorer_ninho.save!
fan_explorer_mac_miller.save!

puts "    DONE"

puts "  - Creating 5 albums ..."

dans_la_legende = Album.new(meaning: "J'voyage j'fume j'revis", name: "Dans la légende", artist: pnl)
deux_freres = Album.new(meaning: "Deux frères, deux fauves, le M", name: "Deux Frères", artist: pnl)
mils_3_0 = Album.new(meaning: "J'ai toujours aimé les previlèges", name: "M.I.L.S 3.0", artist: ninho)
mils_2_0 = Album.new(meaning: "Mes ennemis sont mes meilleurs amis", name: "M.I.L.S 2.0", artist: ninho)
circles = Album.new(meaning: "I wanna go flex", name: "Circles", artist: mac_miller)

file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")
dans_la_legende.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/jpg')
file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")
deux_freres.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/jpg')
file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")
mils_3_0.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/jpg')
file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")
mils_2_0.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/jpg')
file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")
circles.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/jpg')

dans_la_legende.save!
deux_freres.save!
mils_3_0.save!
mils_2_0.save!
circles.save!

puts "    DONE"

puts "  - Creating 5 fan_albums"

fan_explorer_dans_la_legend = FanAlbum.new(explorer: explorer, album: dans_la_legende)
fan_explorer_deux_freres = FanAlbum.new(explorer: explorer, album: deux_freres)
fan_explorer_mils_3_0 = FanAlbum.new(explorer: explorer, album: mils_3_0)
fan_eplorer_mils_2_0 = FanAlbum.new(explorer: explorer, album: mils_2_0)
fan_explorer_circles = FanAlbum.new(explorer: explorer, album: circles)

fan_explorer_dans_la_legend.save!
fan_explorer_deux_freres.save!
fan_explorer_mils_3_0.save!
fan_eplorer_mils_2_0.save!
fan_explorer_circles.save!

puts "    DONE"

puts "  - Creating 10 songs ..."

onizuka = Music.new(name: "Onizuka", album: dans_la_legende)
humain = Music.new(name: "Humain", album: dans_la_legende)
audd = Music.new(name: "Au DD", album: deux_freres)
zoulou_tchaing = Music.new(name: "Zoulou Tchaing", album: deux_freres)
filon = Music.new(name: "Filon", album: mils_3_0)
privileges = Music.new(name: "Privilèges", album: mils_3_0)
fendi = Music.new(name: "Fendi", album: mils_2_0)
bavard = Music.new(name: "Bavard", album: mils_2_0)
woods = Music.new(name: "Woods", album: circles)
blue_world = Music.new(name: "Blue World", album: circles)

onizuka.save!
humain.save!
audd.save!
zoulou_tchaing.save!
filon.save!
privileges.save!
fendi.save!
bavard.save!
woods.save!
blue_world.save!

puts "    DONE"

puts "  - Creating 6 fan_musics"

fan_explorer_onizuka = FanMusic.new(explorer: explorer, music: onizuka)
fan_explorer_humain = FanMusic.new(explorer: explorer, music: humain)
fan_explorer_filon = FanMusic.new(explorer: explorer, music: filon)
fan_explorer_privileges = FanMusic.new(explorer: explorer, music: privileges)
fan_explorer_bavard = FanMusic.new(explorer: explorer, music: bavard)
fan_explorer_woods = FanMusic.new(explorer: explorer, music: woods)

fan_explorer_onizuka.save!
fan_explorer_humain.save!
fan_explorer_filon.save!
fan_explorer_privileges.save!
fan_explorer_bavard.save!
fan_explorer_woods.save!

puts "    DONE"

puts "  - Creating 1 playlist ..."

playlist = Playlist.new(name: "Killing me softly", explorer: explorer)
file = open("#{Rails.root.to_s}/app/assets/images/default-playlist-picture.jpg")
playlist.photo.attach(io: file, filename: 'default-playlist-picture.png', content_type: 'image/jpg')

playlist.save!

puts "    DONE"

puts "  - Creating 5 playlist_musics ..."

playlist_woods = PlaylistMusic.new(playlist: playlist, music: woods)
playlist_blue_world = PlaylistMusic.new(playlist: playlist, music: blue_world)
playlist_fendi = PlaylistMusic.new(playlist: playlist, music: fendi)
playlist_audd = PlaylistMusic.new(playlist: playlist, music: audd)
playlist_zoulou_tchaing = PlaylistMusic.new(playlist: playlist, music: zoulou_tchaing)

playlist_woods.save!
playlist_blue_world.save!
playlist_fendi.save!
playlist_audd.save!
playlist_zoulou_tchaing.save!

puts "    DONE"

puts "FINISHED !"
