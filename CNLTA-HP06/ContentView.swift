//
//  ContentView.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 22/6/25.
//

import SwiftUI

// Đây là file duy nhất bạn cần để chạy MVP này.
// Toàn bộ logic và giao diện được đặt ở đây để dễ dàng bắt đầu.

struct ContentView: View {
    
    // MARK: - STATE VARIABLES (Nguồn Chân Lý)
    // @State sẽ khiến giao diện tự động cập nhật khi các giá trị này thay đổi.
    
    // 1. Lời chúc người dùng nhập
    @State var greetingMessage: String = "Chúc Mừng Năm Mới!"
    
    // 2. Tên ảnh nền đang được chọn (phải khớp với tên trong Assets)
    @State var selectedImageName: String = "birthdayConfetti"
    
    // 3. Màu chữ đang được chọn
    @State var selectedTextColor: Color = .white
    
    @State  var fontSize: CGFloat = 32
    // MARK: - DATA (Dữ liệu cho các lựa chọn)
    // Trong MVP, chúng ta hardcode các lựa chọn này.
    
    let availableBackgrounds: [String] = ["birthdayConfetti", "happySmiles", "goldFrame", "flowerFrame"]
    let availableColors: [Color] = [.white, .black, .yellow, .pink, .green, Color(red: 0.1, green: 0.9, blue: 0.8)]
    
    
    // MARK: - BODY (Giao diện ứng dụng)
    
    var body: some View {
        VStack(spacing: 0) {
            
            // --- 1. VÙNG XEM TRƯỚC THIỆP ---
            // ZStack cho phép xếp chồng các View lên nhau.
            ZStack {
                // Lớp dưới cùng: Ảnh nền
                Image(selectedImageName)
                    .resizable()
                    .scaledToFill() // Lấp đầy khung, có thể bị cắt
                    .frame(height: 350)
                    .clipped() // Cắt phần ảnh thừa
                    .cornerRadius(15)
                    .shadow(radius: 5)

                // Lớp trên: Lời chúc
                Text(greetingMessage)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(selectedTextColor)
                    .multilineTextAlignment(.center)
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 3, x: 2, y: 2) // Thêm bóng để chữ dễ đọc
                
            }
            .padding()

            
            // --- 2. VÙNG ĐIỀU KHIỂN ---
            VStack(alignment: .leading, spacing: 16) {
                
                // 2.1. Nhập lời chúc
                MessageMaker(greetingMessage: $greetingMessage)
                
                Divider()
                
                // 2.2. Chọn ảnh nền
                ImagePicker(selectedImageName: $selectedImageName)
                
                Divider()
                
                // 2.3. Chọn màu chữ
                ColourPicker(selectedTextColor: $selectedTextColor)
                
                // Font Changer
                FontChanger(fontSize : $fontSize)
                
                
            }
            .padding(.horizontal)
            
            Spacer() // Đẩy tất cả các control lên trên
        }
        .background(Color(.systemGray6).ignoresSafeArea()) // Màu nền cho toàn bộ màn hình
    }
}


// MARK: - PREVIEW
// Dùng để xem trước trong Xcode Canvas

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
