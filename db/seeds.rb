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
Watering.destroy_all
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
  flowering = ""
  rusticity = ""

  begin
    html_file = URI.open(url, redirect: false).read
  rescue OpenURI::HTTPError
    height = 0
    exposure = ""
    description = ""
    image = ""
    nickname = ""
    flowering = ""
    rusticity = ""    
    # p "HTTP error: #{plant_name}"
  rescue URI::InvalidURIError
    # p "Encoding error: #{plant_name}"
  else
    html_doc = Nokogiri::HTML(html_file)
    image = html_doc.search('.galerieItem').attr("src").text
    html_doc.search('.bgDark').each do |dark|
      case dark.children.first.text.strip
      when "Hauteur"
        height = dark.children.last.text.strip
      end
      case dark.children.first(2).last.text.strip
      when "Rusticité"
        rusticity = dark.children[-2].text.strip
      end
      case dark.children.first(2).last.text.strip
      when "Exposition"
        exposure = dark.children[-2].text.strip
      end
      if dark.children.text.strip.include?("Floraison")
        flowering = dark.children.text.gsub("Floraison", "").strip
      end
    end
    html_doc.search('.bgLight').each do |light|
      case light.children.first.text.strip
      when "Hauteur"
        height = light.children.last.text.strip
      end
      case light.children.first(2).last.text.strip
      when "Rusticité"
        rusticity = light.children[-2].text.strip
      end
      case light.children.first(2).last.text.strip
      when "Exposition"
        exposure = light.children[-2].text.strip
      end
      if light.children.text.strip.include?("Floraison")
        flowering = light.children.text.gsub("Floraison", "").strip
      end
    end
    # height = html_doc.search('.bgDark').first(5).last.children.last.text.strip
    # exposure = html_doc.search('.bgLight').first(6).last.children[-2].text.strip
    description = html_doc.search('p').first(12).join(" ")
    nickname = html_doc.search('h1').first.text
    Plant.create(name: plant_name, height: height, exposure: exposure, description: description, image: image, nickname: nickname, category: category, flowering: flowering, rusticity: rusticity)
  end

end

def plants
  aujardin = {
    aromatiques: "https://www.aujardin.info/plantes/aromatiques-condimentaires-officinales.php",
    intérieures: "https://www.aujardin.info/plantes/encyclopedie-jardin-tropical.php",
    verger: "https://www.aujardin.info/plantes/encyclopedie-verger.php",
    potager: "https://www.aujardin.info/plantes/encyclopedie-potager.php",
    champignons: "https://www.aujardin.info/champignons/",
    arbres_arbustes_ete: "https://www.aujardin.info/plantes/arbres-arbustes-ete.php",
    arbres_arbustes_printemps: "https://www.aujardin.info/plantes/arbres-arbustes-printemps.php",
    # balcon: "https://www.aujardin.info/plantes/encyclopedie-balcon.php",
    bassin: "https://www.aujardin.info/plantes/encyclopedie-bassin.php",
    cactus: "https://www.aujardin.info/plantes/encyclopedie-cactus.php",
    # feuillage: "https://www.aujardin.info/plantes/encyclopedie-jardin-feuillage.php",
    fleurs_ete: "https://www.aujardin.info/plantes/encyclopedie-jardin-ete.php",
    fleurs_printemps: "https://www.aujardin.info/plantes/encyclopedie-jardin-printemps.php",
    fleurs_automne: "https://www.aujardin.info/plantes/encyclopedie-jardin-automne.php",
    fleurs_hiver: "https://www.aujardin.info/plantes/encyclopedie-jardin-hiver.php",
    fleurs_vivaces_ete: "https://www.aujardin.info/plantes/fleurs-vivaces-ete.php",
    fleurs_vivaces_printemps: "https://www.aujardin.info/plantes/fleurs-vivaces-printemps.php",
    haies: "https://www.aujardin.info/plantes/encyclopedie-haies.php",
    # jardin_sud: "https://www.aujardin.info/plantes/encyclopedie-jardin-sud.php",
    orchidées: "https://www.aujardin.info/plantes/encyclopedie-orchidees.php",
    palmiers: "https://www.aujardin.info/plantes/palmiers-bananiers-cycas.php",
    sauvages: "https://www.aujardin.info/plantes/sauvages.php",
  }

  plants = {}

  aujardin.each do |category, url|
    if category.to_s.include?("fleurs")
      category = "fleurs"
    elsif category.to_s.include?("arbres")
      category = "arbres"
    end
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
    plants[category.to_s.capitalize.gsub("_", " ")] = plant_names
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
