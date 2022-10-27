//
//  Buttons.swift
//  Calculator-iOS
//
//  Created by Madison Isfan on 10/26/22.
//

import Foundation
import SwiftUI


struct GrayButton: ViewModifier {
    //let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(.gray)
            .cornerRadius(40)
            .foregroundColor(.black)
            .font(.system(size: 40))
        
    }
}

struct DarkGrayButton: ViewModifier {
   // let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            //.frame(width: width, height: 80, alignment: .center)
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(Color(red: 49 / 255, green: 49 / 255, blue: 49 / 255))
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 40))
        
    }
}

struct OrangeButton: ViewModifier {
    //let width: CGFloat
    
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(.orange)
            .cornerRadius(40)
            .foregroundColor(.white)
            .font(.system(size: 40))
    }
}

