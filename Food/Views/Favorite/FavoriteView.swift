import SwiftUI

struct FavoriteView: View {
    
    //EnvObj gebruikt om toegang te krijgen tot de favolijst van de gebruiker
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        //Maakt een lijst van favo items.
                        ForEach(favorite.items) { food in
                            FoodRow(food: food)
                        }
                        .onDelete(perform: favorite.deleteItems)
                    }
                    //Gebruikt gegroepeerde lijst
                    .listStyle(InsetGroupedListStyle())
                    
//                    Button {
//                        print("tapped")
//                    } label: {
//                        FoodButton(title: "Add to favorite")
//                    }
//                    .padding(.bottom, 20)
                    
                    HStack(spacing: 38) {
                        FoodInfo(title: "Calories", value: favorite.totalCalories)
                        FoodInfo(title: "Protein", value: favorite.totalProtein)
                        FoodInfo(title: "Carbs", value: favorite.totalCarbs)
                    }
                    .padding(.bottom, 30)
                }
                if favorite.items.isEmpty {
                    EmptyState(message: "U heeft nog geen lijst met favorieten!!")
                }
            }
            .navigationTitle("Favorite")
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let previewFavorite = Favorite()
        FavoriteView().environmentObject(previewFavorite)
    }
}
