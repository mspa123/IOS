import SwiftUI

@main
struct FoodApp: App {
    
    var favorite = Favorite()
    
    var body: some Scene {
        WindowGroup {
            FoodTabView().environmentObject(favorite)
        }
    }
}
