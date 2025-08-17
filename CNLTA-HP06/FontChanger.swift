//
//  FontChanger.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 10/8/25.
//

import SwiftUI

struct FontChanger: View {
    @Binding var fontSize: CGFloat
    @State var fontBold: Bool = false
    
    
    var body: some View {
        
        
        HStack{
            Stepper(value: $fontSize, in: 8...72, step: 1) {
                Text("Font size: \(Int(fontSize))")
                    
            }
            .padding(5)
        }
        
    }
}

#Preview {
    FontChanger(fontSize: .constant(16))
}
