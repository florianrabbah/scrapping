# crypto_scraper_spec.rb

require 'rspec'
require_relative '../crypto_scraper' # Remplace 'crypto_scraper' par le nom de ton fichier principal

RSpec.describe 'CryptoScraper' do
  # Ajoute tes exemples de tests ici
  RSpec.describe 'CryptoScraper' do
    describe '#scrape_crypto_data' do
      it 'returns a non-empty array' do
        # Exécute la méthode scrape_crypto_data
        result = scrape_crypto_data
  
        # Vérifie que le résultat est un array non vide
        expect(result).to be_an(Array)
        expect(result).not_to be_empty
      end
  
      it 'returns a non-empty array' do
        # Exécute la méthode scrape_crypto_data
        result = scrape_crypto_data
  
        # Vérifie que chaque élément de l'array est un hash avec les clés et les valeurs attendues
        result.each do |crypto|
          expect(crypto).to be_a(Hash)
          expect(crypto.keys).to include('Nom', 'Cours')
          expect(crypto['Nom']).to be_a(String)
          expect(crypto['Cours']).to match(/\d+(\.\d+)?/) # Vérifie que le cours est un nombre
        end
      end
    end
  end
end