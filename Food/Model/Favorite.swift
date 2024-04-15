
import SwiftUI

final class Favorite: ObservableObject {
    
    @Published var items: [Food] = []
    
    func add(_ food: Food) {
        items.append(food)
    }
    
    func deleteItems(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
    
    var totalCalories: Int {
        items.reduce(0) { $0 + $1.calories}
    }
    
    var totalProtein: Int {
        items.reduce(0) { $0 + $1.protein}
    }
    
    var totalCarbs: Int {
        items.reduce(0) { $0 + $1.carbs}
    }
}
