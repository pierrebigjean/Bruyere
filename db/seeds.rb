# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

# DELETING THE SEEDS
puts "Cleaning db"
puts "🗑  Deleting all assets"
User.destroy_all
# Plant.destroy_all
Location.destroy_all
Ownership.destroy_all
puts "Done!"

# CREATING USER
puts 'Creating a user'
user = User.new(email: "pierrebigjean@gmail.com", password: "123456")
user.save!
puts "Done!"

# CREATING PLANTS
def plantscrapper(plant_name, category)
  url = "https://www.aujardin.info/plantes/#{plant_name}.php"

  height = 0
  exposure = ""
  description = ""
  image = ""
  nickname = ""

  begin
    html_file = URI.open(url, redirect: false).read
  rescue OpenURI::HTTPError
    height = 0
    exposure = ""
    description = ""
    image = ""
    nickname = ""    
    p "HTTP error: #{plant_name}"
  rescue URI::InvalidURIError
    p "Encoding error: #{plant_name}"
  else
    html_doc = Nokogiri::HTML(html_file)
    # p html_doc.search('.bgDark')[1]
    # html_doc.search('.bgDark').each_with_index do |nokogiri, index|
    #   if nokogiri.children.text == "Hauteur"
    #     nokogiri
    #   end
    # end
    image = html_doc.search('.galerieItem').attr("src").text
    height = html_doc.search('.bgDark').first(5).last.children.last.text.strip
    exposure = html_doc.search('.bgLight').first(6).last.children[-2].text.strip
    description = html_doc.search('p').first(12).join(" ")
    nickname = html_doc.search('h1').first.text
    Plant.create(name: plant_name, height: height, exposure: exposure, description: description, image: image, nickname: nickname, category: category)
  end

end

def plants
  aujardin = {
    intérieures: "https://www.aujardin.info/plantes/encyclopedie-jardin-tropical.php",
    # arbres_arbustes_ete: "https://www.aujardin.info/plantes/arbres-arbustes-ete.php",
    # arbres_arbustes_printemps: "https://www.aujardin.info/plantes/arbres-arbustes-printemps.php",
    aromatiques: "https://www.aujardin.info/plantes/aromatiques-condimentaires-officinales.php",
    # balcon: "https://www.aujardin.info/plantes/encyclopedie-balcon.php",
    # bassin: "https://www.aujardin.info/plantes/encyclopedie-bassin.php",
    # cactus: "https://www.aujardin.info/plantes/encyclopedie-cactus.php",
    # champignons: "https://www.aujardin.info/champignons/",
    # feuillage: "https://www.aujardin.info/plantes/encyclopedie-jardin-feuillage.php",
    # fleurs_ete: "https://www.aujardin.info/plantes/encyclopedie-jardin-ete.php",
    # fleurs_printemps: "https://www.aujardin.info/plantes/encyclopedie-jardin-printemps.php",
    # fleurs_automne: "https://www.aujardin.info/plantes/encyclopedie-jardin-automne.php",
    # fleurs_hiver: "https://www.aujardin.info/plantes/encyclopedie-jardin-hiver.php",
    # fleurs_vivaces_ete: "https://www.aujardin.info/plantes/fleurs-vivaces-ete.php",
    # fleurs_vivaces_printemps: "https://www.aujardin.info/plantes/fleurs-vivaces-printemps.php",
    # haies: "https://www.aujardin.info/plantes/encyclopedie-haies.php",
    # jardin_sud: "https://www.aujardin.info/plantes/encyclopedie-jardin-sud.php",
    # orchidee: "https://www.aujardin.info/plantes/encyclopedie-orchidees.php",
    # palmier: "https://www.aujardin.info/plantes/palmiers-bananiers-cycas.php",
    # potager: "https://www.aujardin.info/plantes/encyclopedie-potager.php",
    # sauvage: "https://www.aujardin.info/plantes/sauvages.php",
    # verger: "https://www.aujardin.info/plantes/encyclopedie-verger.php"
  }

  plants = {}

  aujardin.each do |category, url|
    plant_names = []
    begin
      html_file = URI.open(url).read
    rescue OpenURI::HTTPError
      plants = {}
    else
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.scientifique').children.each do |plant_name|
        if plant_name.text.strip.include?(" ")
          plant_names << plant_name.text.strip.gsub(" ", "_").downcase
          plant_names << plant_name.text.strip.gsub(" ", "-").downcase
        else
          plant_names << plant_name.text.strip.downcase
        end
      end
    end
    plants[category.to_s.capitalize] = plant_names
  end

  return plants
end

plants

puts "creating plants"
plants.each do |category, plantnames|
  p "#{category} : #{plantnames.length}"
  plantnames.each do |plantname|
    unless plantname.include?("-x")
        plantscrapper(plantname, category)
    end
  end
end

puts "deleting duplicates"
Plant.all.each do |plant|
  Plant.order("id desc").where(name: plant.name).drop(1).each { |w| w.delete }
end

puts "Done!"
