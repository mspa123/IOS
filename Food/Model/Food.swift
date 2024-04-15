import Foundation

//Defineer de structuur voor food items die decodeable is voor JSON decoding en identifiable voor unieke identificatie in de swiftviews
struct Food: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct FoodResponse: Decodable {
    let request: [Food]
}

struct MockData {
    //Mockdata die ik als eerst invoer voor de preview
    static let sampelFood = Food(id: 001, name: "test Food one", description: "Description", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let sampelFoodTwo = Food(id: 002, name: "test Food two", description: "Description", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let sampelFoodTree = Food(id: 003, name: "test Food tree", description: "Description", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)

    
    static let foods = [sampelFood, sampelFood, sampelFood, sampelFood]
    static let favoriteItems = [sampelFood, sampelFoodTwo, sampelFoodTree]
}
