//
//  ContentView.swift
//  FloatingTextInSwiftUI
//
//  Created by ramil on 02.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    var leftIcon: String? = nil
    var rightIcon: String? = nil
    var placeHolder: String? = nil
    
    @Binding var text: String
    @State private var isEditing = false
    @State private var edges = EdgeInsets(top: 0, leading: 45, bottom: 0, trailing: 0)
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                if(leftIcon != nil) {
                    Image(systemName: leftIcon ?? "person")
                        .foregroundColor(Color.secondary)
                }
                TextField(placeHolder ?? "", text: $text) { status in
                    DispatchQueue.main.async {
                        isEditing = status
                        if isEditing {
                            edges = EdgeInsets(top: 0, leading: 15, bottom: 60, trailing: 0)
                        } else {
                            edges = EdgeInsets(top: 0, leading: 45, bottom: 0, trailing: 0)
                        }
                    }
                }
                
                if(rightIcon != nil) {
                    Image(systemName: rightIcon ?? "person")
                        .foregroundColor(Color.secondary)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("border")))
            
            Text(placeHolder ?? "")
                .background(Color(UIColor.systemBackground))
                .foregroundColor(Color.secondary)
                .padding(edges)
                .animation(Animation.easeInOut(duration: 0.4), value: edges)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
