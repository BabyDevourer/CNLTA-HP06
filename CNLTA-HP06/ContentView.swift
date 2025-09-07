//
//  ContentView.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 22/6/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - STATE VARIABLES (Nguồn Chân Lý)
    
    // 1.
    @State var greetingMessage: String = "Chúc Mừng Năm Mới!"
    
    // 2.
    @State var selectedImageName: String = "birthdayConfetti"
    
    // 3.
    @State var selectedTextColor: Color = .white
    
    @State  var fontSize: CGFloat = 32
    @State var selectedFont: FontOption = defaultFontOptions.first!
    // MARK: - DATA (Dữ liệu cho các lựa chọn)
    let availableBackgrounds: [String] = ["birthdayConfetti", "happySmiles", "goldFrame", "flowerFrame"]
    let availableColors: [Color] = [.white, .black, .yellow, .pink, .green, Color(red: 0.1, green: 0.9, blue: 0.8)]
    
    
    // MARK: - BODY (Giao diện ứng dụng)
    
    var body: some View {
        VStack(spacing: 0) {
            
            // --- 1.DISPLAY AREA ---
            ZStack {
                
                Image(selectedImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350)
                    .clipped()
                    .cornerRadius(15)
                    .shadow(radius: 5)

                // Greet Message
                Text(greetingMessage)
                    .font(selectedFont.makeFont(fontSize))
                    .foregroundColor(selectedTextColor)
                    .multilineTextAlignment(.center)
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 3, x: 2, y: 2)
                    .frame(width: 350, height: 350)
                
            }
            .padding()
            
            
            SaveButton(
                imageName: selectedImageName,
                greetingMessage: greetingMessage,
                textColor: selectedTextColor,
                fontSize: fontSize
            )
            .padding(5)
            
            
            
            // --- 2. TOOLS AREA ---
            VStack(alignment: .leading, spacing: 16) {
                
                // 2.1. Text Maker
                MessageMaker(greetingMessage: $greetingMessage)
                
                Divider()
                
                // 2.2. Image chooser
                ImagePicker(selectedImageName: $selectedImageName)
                
                Divider()
                
                // 2.3. Choose colour
                ColourPicker(selectedTextColor: $selectedTextColor)
                
                // 2.4. Font Picker
                
                Picker("Kiểu chữ", selection: $selectedFont) {
                    ForEach(defaultFontOptions) { option in
                        Text(option.name)
                            .font(option.makeFont(16))
                            .tag(option)
                    }
                }
                .pickerStyle(.menu)

                Divider()

                // 2.5 Font Size Decder
                FontChanger(fontSize : $fontSize)
                
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
        // Background colour for app
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}


// MARK: - PREVIEW


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
