import SwiftUI

struct FoodButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        HStack {
            ZStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
            }
        }
    }
}

struct FoodButton_Previews: PreviewProvider {
    static var previews: some View {
        FoodButton(title: "test title")
    }
}
