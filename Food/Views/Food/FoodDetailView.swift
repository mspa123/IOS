import SwiftUI

struct FoodDetailView: View {
    // env object om favo om toegang te krijgen tot gedeelde favoinstellingen
    @EnvironmentObject var favorite: Favorite
    // food item dat getoond dient te worden.
    let food: Food
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            //Laadt en toont een image van het food item vanaf een externe api
            FoodRemoteImage(urlString: food.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)
                .border(Color.red)
            //Voor naam en descriptie
            VStack {
                Text(food.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(food.description)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding()
                // Horizontale stack voor kcal proteine en carbs
                HStack(spacing: 38) {
                    FoodInfo(title: "Calories", value: food.calories)
                    
                    FoodInfo(title: "Protein", value: food.protein)
                    
                    FoodInfo(title: "Carbs", value: food.carbs)
                }
            }
            //Spacer om space te maken tussen button
            Spacer()
            
            Button {
                favorite.add(food)
                isShowingDetail = false
            } label: {
                FoodButton(title: "$\(food.price, specifier: "%.2f") Add to Favorite")
            }
            
            .padding(.bottom, 30)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 20)
        // Plaats button op een andere view.
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XButton()
        }, alignment: .topTrailing)
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: MockData.sampelFood, isShowingDetail: .constant(true))
    }
}
