//
//  HeaderInputView.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 20.06.21.
//

import SwiftUI

struct HeaderInputView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var userImage: UIImage?
    
    @State private var showingImagePicker = false
    
    var body: some View {
        HStack(spacing: 8) {
            ImageSelectionView(image: $userImage) {
                showingImagePicker = true
            }
            VStack(spacing: 8) {
                TextField("Firstname", text: $firstName)
                TextField("Lastname", text: $lastName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $userImage)
        }
    }
}

private struct ImageSelectionView: View {
    @Binding var image: UIImage?
    let imagePickerSelected: () -> Void
    
    var body: some View {
        Button(action: imagePickerSelected, label: {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 96, height: 96)
                    .clipShape(Circle())
            } else {
                ZStack {
                    Circle()
                        .frame(width: 96, height: 96)
                        .foregroundColor(.gray)
                    Image(systemName: "camera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 32, maxHeight: 32)
                }
            }
        })
    }
}

struct HeaderInputView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderInputView(firstName: .constant("Test"), lastName: .constant("Lastname"), userImage: .constant(nil))
    }
}
