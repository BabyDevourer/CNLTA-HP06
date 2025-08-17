//
//  Message.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 10/8/25.
//

import SwiftUI


struct MessageMaker: View {
    
    @Binding var greetingMessage: String
    
    
    var body: some View {
        
        Text("Lời chúc của bạn")
            .font(.headline)
            
        
        TextField("Nhập lời chúc vào đây...", text: $greetingMessage)
            .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    MessageMaker(
        greetingMessage: .constant("Chúc Mừng Năm Mới!")
    )
}
