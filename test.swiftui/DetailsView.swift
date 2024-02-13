//
//  DetailsView.swift
//  test.swiftui
//

import SwiftUI

struct DetailsView: View {
    
    @Binding
    var isPresented: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("panda")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, alignment: .leading)
                    .clipped()
            }
            .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .background {
                                Circle()
                                    .foregroundStyle(.gray)
                                    .frame(width: 32, height: 32)
                            }
                    }
                    .frame(width: 32, height: 32)
                    .padding(.all, 20)
                }
                Spacer()
            }
            
        }
        
    }
}
