import SwiftUI

// Een struct die UIViewRepresentable implementeert om een UIActivityIndicatorView in SwiftUI te gebruiken.
struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        // Stelt de kleur van de activiteitenindicator die rood is.
        activityIndicatorView.color = UIColor.brandPrimary
        // Start de animatie van de activiteitenindicator zodra de view geladen is.
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    // Deze functie wordt aangeroepen wanneer de view bijgewerkt moet worden met nieuwe data.
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                // Hele scherm word gevuld.
                .edgesIgnoringSafeArea(.all)
            
            // Voegt de ActivityIndicator toe aan het midden van de ZStack.
            ActivityIndicator()
        }
    }
}
