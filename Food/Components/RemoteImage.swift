import SwiftUI


final class ImageLoader: ObservableObject{
    //Gepubliceerde eigenschape die geladen afbeeldingen opslaat
    @Published var image: Image? = nil
    
    // Func om afbeeldingen te laden vanaf url
    func load(fromURLString urlString: String) {
        //Roep de manager aan om afbeelding asynch in te laden
        Manager.shared.image(fromURLString: urlString) {uiImage in
            guard let uiImage = uiImage else { return }
            //Zorg erovor dat het op de main thread word uitgevoerd.
            DispatchQueue.main.async {
                // Converteer de geladen UIImage naar een SwiftUI Image en sla het op.
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct StandardImage: View {
    var image: Image?
    
    var body: some View {
        //Als image bestaat maak het aanpasbaar. Als het nill is gewbruik anders placeholder.
        image?.resizable() ?? Image("image-placeholder").resizable()
    }
}

struct FoodRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    //Toon het geladen image of een placeholder.
    
    var body: some View {
        //Op het begin is de image null maar na de netwerkcall word de image opgevuld met de api image.
        StandardImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString)}
    }
}
