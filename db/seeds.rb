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
Plant.destroy_all
Location.destroy_all
Ownership.destroy_all
puts "Done!"

# CREATING USER
puts 'Creating a user'
user = User.new(email: "pierrebigjean@gmail.com", password: "123456")
user.save!
puts "Done!"

# CREATING PLANTS

def plantscrapper(plant_name)
  url = "https://www.aujardin.info/plantes/#{plant_name}.php"

  height = 0
  exposure = ""
  description = ""

  begin
    html_file = URI.open(url, redirect: false).read
  rescue OpenURI::HTTPError
    height = 0
    exposure = ""
    description = ""
  rescue URI::InvalidURIError
    p "Encoding error here"
  else
    html_doc = Nokogiri::HTML(html_file)
    height = html_doc.search('.bgDark').first(5).last.children.last.text
    exposure = html_doc.search('.bgLight').first(6).last.children[-2].text.strip
    description = html_doc.search('p').first(12).join(" ")
    Plant.create(name: plant_name, height: height, exposure: exposure, description: description)
  end
end

def plantnames
  aujardin = {
    arbres_arbustes_ete: "https://www.aujardin.info/plantes/arbres-arbustes-ete.php",
    arbres_arbustes_printemps: "https://www.aujardin.info/plantes/arbres-arbustes-printemps.php",
    aromatique: "https://www.aujardin.info/plantes/aromatiques-condimentaires-officinales.php",
    balcon: "https://www.aujardin.info/plantes/encyclopedie-balcon.php",
    bassin: "https://www.aujardin.info/plantes/encyclopedie-bassin.php",
    cactus: "https://www.aujardin.info/plantes/encyclopedie-cactus.php",
    champignons: "https://www.aujardin.info/champignons/",
    feuillage: "https://www.aujardin.info/plantes/encyclopedie-jardin-feuillage.php",
    fleurs_ete: "https://www.aujardin.info/plantes/encyclopedie-jardin-ete.php",
    fleurs_printemps: "https://www.aujardin.info/plantes/encyclopedie-jardin-printemps.php",
    fleurs_automne: "https://www.aujardin.info/plantes/encyclopedie-jardin-automne.php",
    fleurs_hiver: "https://www.aujardin.info/plantes/encyclopedie-jardin-hiver.php",
    fleurs_vivaces_ete: "https://www.aujardin.info/plantes/fleurs-vivaces-ete.php",
    fleurs_vivaces_printemps: "https://www.aujardin.info/plantes/fleurs-vivaces-printemps.php",
    haies: "https://www.aujardin.info/plantes/encyclopedie-haies.php",
    jardin_tropical: "https://www.aujardin.info/plantes/encyclopedie-jardin-tropical.php",
    jardin_sud: "https://www.aujardin.info/plantes/encyclopedie-jardin-sud.php",
    orchidee: "https://www.aujardin.info/plantes/encyclopedie-orchidees.php",
    palmier: "https://www.aujardin.info/plantes/palmiers-bananiers-cycas.php",
    potager: "https://www.aujardin.info/plantes/encyclopedie-potager.php",
    sauvage: "https://www.aujardin.info/plantes/sauvages.php",
    verger: "https://www.aujardin.info/plantes/encyclopedie-verger.php"
  }
  
  plant_names = []

  aujardin.values.each do |url|
    begin
      html_file = URI.open(url).read
    rescue OpenURI::HTTPError
      plant_names = []
    else
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.scientifique').children.each do |plant_name|
        plant_names << plant_name.text.strip.gsub(" ", "_").downcase
      end
    end
  end

  return plant_names
end

plantnames

puts "creating plants"
plantnames.each do |plant_name|
  unless plant_name.include?("-x")
      plantscrapper(plant_name)
  end
end
puts "Done!"
