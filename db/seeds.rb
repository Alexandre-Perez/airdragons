# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

puts "Destroying existing database"

User.destroy_all
Dragon.destroy_all

puts "destroy finished"

puts "Creating new database"

drogon = Dragon.create!(
  name: "Drogon",
  description: "Drogon est l'un des trois dragons nés dans la Mer Dothrak,
  plaine d'Essos ainsi surnommée pour son étendue. Il est nommé d'après Drogo,
  le mari décédé de Daenerys Targaryen. Il se distingue par ses écailles noires et ses ailes rougeâtres.
  Il est le plus grand et le plus féroce de la portée, il semble être le plus puissant des trois Dragons.
  Drogon n'hésite pas à protéger farouchement Daenerys.",
  address: "93200, Saint-Denis"
)

file = URI.open("https://sfractus-images.cleo.media/unsafe/208x0:1744x1536/641x0/images/Drogon_163.jpg")
drogon.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
drogon.save!

12.times do
  dragon = Dragon.new(
    name: Faker::Movies::HowToTrainYourDragon.dragon,
    description: Faker::Fantasy::Tolkien.poem,
    address: Faker::Address.country
  )

  file = URI.open("https://source.unsplash.com/random/?dragon")
  dragon.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  dragon.save!
end

# Ailes

ailes = Dragon.create!(
  name: "Ailes de Mort",
  description: "Aile de mort ( Angl.  Deathwing), autrefois connu sous le nom de Neltharion le Gardeterre,
  était l'un des cinq Dragons que le Panthéon avait doté du pouvoir d'immortalité, dans l'espoir qu'ils protègent le monde de toutes interférences.
  Neltharion l'aspect de la terre a toujours été loyal à sa reine, Alexstrasza la Porteuse de Vie, ainsi qu'à ses
  compagnons : Ysera la Maîtresse des Rêves, Malygos la Main de la Magie et Nozdormu le Maître du Temps. Neltharion
   combattit avec vaillance aux côtés de ses frères draconiques durant la guerre des Anciens, jusqu'à finalement les
   repousser.",
  address: "3 Rue François Bouché, 13013 Marseille"
)

file = URI.open("https://static1.millenium.org/article_old/upload/deathwing_cataclysm_3.jpg")
ailes.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
ailes.save!

# Smaug

smaug = Dragon.create!(
  name: "Smaug",
  description: "Smaug le Doré est un dragon appartenant au légendaire de l'écrivain britannique J. R. R. Tolkien et intervenant dans son roman Le Hobbit (1937), dont il est le principal antagoniste. À l'époque où se situe l'action du roman, il vit dans les salles de la Montagne Solitaire, (également connu sous son nom sindarin d'Erebor) en Terre du Milieu, dont il avait dans le passé chassé les anciens occupants, les Nains d'Erebor, pour s'approprier leurs richesses, après avoir détruit la ville de Dale,
  située au pied de cette montagne et peuplée par des Hommes. Inquiet du retour de Sauron en Terre du Milieu,
  le mage Gandalf s'interroge sur le rôle que pourrait jouer Smaug dans les plans de conquête de Sauron.
  C'est au même moment qu'il reçoit la visite du Nain Thorin venu chercher conseil afin de récupérer son héritage perdu.
  Gandalf propose d'arranger une rencontre entre la compagnie de Thorin et le hobbit Bilbo Baggins
  (également Bilbon Sacquet ou Bilbo Bessac)Note 1. C'est ainsi que s'organise la Quête d'Erebor qui permettra de rendre aux Nains les trésors qui leur appartiennent,
  tout en libérant le nord du Rhovanion de l'influence du dragon. Malgré la mort de Thorin, la quête est un succès, Smaug étant abattu d'une flèche tirée par le capitaine Bard,
  lors de son assaut sur la ville d'Esgaroth, et le royaume Nain d'Erebor étant rétabli.",
  address: "Le Mont-Saint-Michel"
)

file = URI.open("https://cdn.vox-cdn.com/thumbor/YuQbc3tO6qaXEDWpeWyi_oP5NP8=/144x0:1764x1080/1400x1400/filters:focal(144x0:1764x1080):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/45818832/the_hobbit_the_desolation_of_smaug_1920x1080_by_sachso74-d7sr1wl.0.0.jpg")
smaug.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
smaug.save!

# Toothless

toothless = Dragon.create!(
  name: "Toothless",
  description: "Krokmou est le seul Furie Nocturne observé à ce jour dans la franchise.
  Son apparence physique est donc tout ce qui peut être étudié pour en apprendre davantage sur l'anatomie du Furie Nocturne.
  Il a des écailles d'un noir de jais qui recouvrent tout son corps, ses flancs présentant de petites taches claires ressemblant à celles d'une raie manta.
  Krokmou possède deux paires d'ailes (une paire principale et une paire plus petite près de la base de la queue).
  La première paire lui permet d'effectuer un décollage vertical.
  Derrière, se trouve de petites ailes qui facilitent le vol plané.",
  address: "45200 Montargis"
)

file = URI.open("https://i.pinimg.com/originals/d7/67/e5/d767e5cb6e86ec741149cb373b0e16d8.jpg")
toothless.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
toothless.save!

puts "finished"
