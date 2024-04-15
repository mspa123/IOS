import UIKit

final class Manager {
    static let shared = Manager()
    
    //cache voor het opslaan van afbeeldingen.
    private let cache = NSCache<NSString, UIImage>()
    
    // Base url
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // URL voor het fetchen van de food items.
    private let foodURL = baseURL + "appetizers"
    
    // Zorgt ervoor dat er geen andere instanties worden gemaakt.
    private init() {}
    
    // Asychrone methode voor het opahelen van data.
    func getFood(completed: @escaping (Result<[Food], FoodError>) -> Void) {
        
        // Check of url correct is. Anders laat foutmelding badurl ziet.
        guard let url = URL(string: foodURL) else {
            completed(.failure(.badURL))
            return
        }
        // Creeer en start een netwerk task om data op te halen.
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                print("URLSession error:1")
                completed(.failure(.notComplete))
                return
            }
            
            //Check of http status 200 is anders laat .badResponse zien.
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("URLSession error:2")
                completed(.failure(.badResponse))
                return
            }
            //Check of data ontvangen is anders .badData
            guard let data = data else {
                print("URLSession error:3")
                completed(.failure(.badData))
                return
            }
            // Decode de data in een FoodResponse object.
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(FoodResponse.self, from: data)
                // Roept completion handler aan dat het bij succes
                completed(.success(decodedResponse.request))
            } catch {
                // Roept completion handler aan als het faalt.
                completed(.failure(.badData))
            }
        }
        // Gaat door met netwerktaak.
        task.resume()
    }
    
    // Ophalebn van afbeelding van URL
    func image(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        //Maakt sleutel aan voor cache
        let cacheKey = NSString(string: urlString)
        
        //Controleer of image in de cache is.
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        // Check of url geldig is. Anders nill terug geven.
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        //Maak en start een netwerk taak voor het ophalen van een afbeelding.
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                //Geef nill terug als het ophalen mislukt.
                completed(nil)
                return
            }
            // Slaa afbeelding op in de cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        //Ga verder met netwerk taak.
        task.resume()
    }
}
