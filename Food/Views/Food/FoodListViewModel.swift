import SwiftUI
//Published wordt gebruikt om data synchroom met UI aan te passen.
final class FoodListViewModel: ObservableObject {
    @Published var foods: [Food] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedFood: Food?
    
    //all ui main should be on the main thread
    // functie haal alle fooditems op.
    func getFoods() {
        isLoading = true
        Manager.shared.getFood { result in
            DispatchQueue.main.async {
                // Zet laden op false zodat laadscherm later niet getoond word.
                // Laad alles items uit api
                self.isLoading = false
                switch result {
                case .success(let foods):
                    self.foods = foods
                //Gaat fout laat error message zien.
                case .failure(let error):
                    switch error {
                    case .badData:
                        self.alertItem = AlertContext.badData
                        
                    case .badURL:
                        self.alertItem = AlertContext.badURL
                        
                    case .badResponse:
                        self.alertItem = AlertContext.badResponse
                        
                    case .notComplete:
                        self.alertItem = AlertContext.notComplete
                    }
                }
            }
        }
    }
}
