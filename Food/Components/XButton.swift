import SwiftUI

struct XButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .frame(width: 46, height: 46)
                .imageScale(.small)
                .foregroundColor(.black)
        }
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton()
    }
}
