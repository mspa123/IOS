
import SwiftUI

struct FoodListView: View {
    // Gebruikt een @StateObject om een instantie van FoodListViewModel te creëren en te beheren.
    // Deze instantie wordt gebruikt voor het beheren van de toestand en de logica van deze weergave.
    @StateObject var model = FoodListViewModel()
    
    var body: some View {
        // Zstack voor het op elkaar stappelen van fooditems.
        ZStack {
            NavigationView {
                List(model.foods) { food in
                    FoodRow(food: food)
                        .onTapGesture {
                            model.isShowingDetail = true
                            model.selectedFood = food
                    }
                }
                .navigationTitle("Foods")
                .disabled(model.isShowingDetail)
            }
            // Laadt foods in.
            .onAppear {
                model.getFoods()
            }
            // Operator als true is moet je achtergrond blurren anders blur op 0 zetten.
            .blur(radius: model.isShowingDetail ? 20: 0)
            
            // Toon een details als item is geselecteerd.
            if model.isShowingDetail {
                FoodDetailView(food: model.selectedFood!, isShowingDetail: $model.isShowingDetail)
            }
            // Toon laadscherm als data word opgehaald.
            if model.isLoading {
                LoadingView()
            }
        }
        // Toon alert op basis van het alertItem uit het Foodlistmodel
        .alert(item: $model.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
