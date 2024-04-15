import SwiftUI

struct FoodRow: View {
    // Food item dat dient getoond te worden per row.
    let food: Food
    var body: some View {
        // HStack voor het horizontaal alignen
        HStack {
            FoodRemoteImage(urlString: food.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(6)
            //Verticaal alignen in de row met naam en prijs
            VStack(alignment: .leading, spacing: 3) {
                Text(food.name)
                    .font(.title3)
                    .fontWeight(.bold)
                //Specifier toegevoegd voor 2 nullen achter de komma
                Text("$\(food.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            //padding toegevoegd om wat ruimte te geven.
            .padding()
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: MockData.sampelFood)
    }
}
