import SwiftUI

struct FoodTabView: View {
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("house")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("favorite")
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodTabView()
        //Env object moet meegegeven worden aan favorite
            .environmentObject(Favorite())
    }
}
