//
//  ImagePicker.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 10/8/25.
//

import SwiftUI

struct ImagePicker: View {
    let availableBackgrounds: [String] = ["birthdayConfetti", "happySmiles", "goldFrame", "flowerFrame"]
    @Binding var selectedImageName: String
    
    
    var body: some View {
        Text("Chọn ảnh nền")
            .font(.headline)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(availableBackgrounds, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 60)
                        .cornerRadius(8)
                        .overlay(
                            // Thêm viền nếu ảnh này đang được chọn
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: selectedImageName == imageName ? 3 : 0)
                        )
                        .onTapGesture {
                            // Khi chạm vào ảnh, cập nhật state
                            self.selectedImageName = imageName
                        }
                }
            }
        }

    }
    
    
}

#Preview {
    ImagePicker(selectedImageName: .constant("birthdayConfetti"))
}
