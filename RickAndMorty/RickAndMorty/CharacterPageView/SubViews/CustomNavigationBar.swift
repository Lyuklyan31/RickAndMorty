import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(.arrowBack)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                }
                
                Text("Character Page")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding()
            
            Rectangle()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundColor(.whiteForStroke)
                .padding(.bottom, 10)
        }
        .frame(height: 40)
        .padding(.top)
    }
}

#Preview {
    CustomNavigationBar()
}
