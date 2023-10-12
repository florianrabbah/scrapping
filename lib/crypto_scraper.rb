require 'rspec'
require 'pry'
require 'json'
require 'dotenv'
require 'nokogiri'
require 'open-uri'

# Récupère la page HTML
url = "https://coinmarketcap.com/all/views/all/"
html = URI.open(url)

# Analyse le code HTML
doc = Nokogiri::HTML(html)


# XPath pour extraire le nom des cryptomonnaies
crypto_names = doc.xpath('//tbody//td[3]//p')

# XPath pour extraire le cours des cryptomonnaies
crypto_prices = doc.xpath('//tbody//td[5]//a[@data-btc]')

# Crée un array vide pour stocker les hashes
crypto_data = [{ "BTC" => 26,779.43 }, { "ETH" => 1,557.22 }]

# Parcourt les noms et les cours pour créer les hashes
crypto_names.each_with_index do |name, index|
  # Extrait le nom de la cryptomonnaie
  crypto_name = name.text.strip
  
  # Extrait le cours de la cryptomonnaie
  crypto_price = crypto_prices[index].text.strip
  
  # Crée un hash avec le nom et le cours de la cryptomonnaie
  crypto_hash = { crypto_name => crypto_price }
  
  # Ajoute le hash à l'array
  crypto_data << crypto_hash
end

# Affiche les noms et les cours des cryptomonnaies
crypto_data.each do |crypto|
  crypto.each do |name, price|
    puts "Nom : #{name} | Cours : #{price}"
  end
end