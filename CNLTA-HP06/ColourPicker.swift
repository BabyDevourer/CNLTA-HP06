//
//  ColourPicker.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 10/8/25.
//

import SwiftUI

struct ColourPicker: View {
    
    @Binding var selectedTextColor: Color
    
    let availableColors: [Color] = [.white, .black, .yellow, .pink, .green, Color(red: 0.1, green: 0.9, blue: 0.8)]
    
    
    var body: some View {
        
        Text("Chọn màu chữ")
            .font(.headline)
        
        HStack(spacing: 20) {
            ForEach(availableColors, id: \.self) { color in
                Circle()
                    .fill(color)
                    
                    .frame(width: 40, height: 40)
                    .overlay(
                        // Thêm vòng tròn nếu màu này đang được chọn
                        Circle()
                            .stroke(Color.blue, lineWidth: selectedTextColor == color ? 3 : 0)
                    )
                
                    .onTapGesture {
                        // Khi chạm vào màu, cập nhật state
                        self.selectedTextColor = color
                    }
            }
        }
    }
}


#Preview {
    ColourPicker(selectedTextColor: .constant(.white))
}
