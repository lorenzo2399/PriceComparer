class Callerdummy

    def cerca
        response = HTTParty.get('https://dummyjson.com/products')
        if response.code == 200
            risposta = JSON.parse(response.body)
         return risposta
        else
             puts "Errore nella richiesta HTTP: #{response.code} #{response.message}"
        end 
    end
end