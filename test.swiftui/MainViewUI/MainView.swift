//
//  MainView.swift
//  test.swiftui

import SwiftUI

struct MainView: View {
    
    @StateObject
    var viewModel: MainViewModel
    
    @State private var showDetails = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    imageView(geometry)
                    HStack(spacing: 20) {
                        makeActionButton(viewModel.isLocked ? "Unlock" : "Lock") {
                            viewModel.toggleLockedButton()
                        }
                        .padding(.leading, 20)
                        makeActionButton("Open from top", disabled: viewModel.isLocked) {
                            showDetails = true
                        }
                        .disabled(viewModel.isLocked)
                        .padding(.trailing, 20)
                    }
                    Spacer()
                    makeActionButton("Open full") {
                    }
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                }
            }
            .zIndex(1)
            if showDetails {
                DetailsView(isPresented: $showDetails)
                    .transition(.move(edge: .top))
                    .zIndex(2)
            }
        }
        .animation(.easeOut, value: showDetails)
    }
    
    @ViewBuilder
    private func makeActionButton(
        _ title: String, 
        disabled: Bool = false,
        action: @escaping () -> ()
    ) -> some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 56)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(.indigo, lineWidth: 3)
                        if disabled {
                            Rectangle()
                                .background(Color.gray.opacity(0.3))
                        }
                    }
                )
        }
        .background(.blue)
        .cornerRadius(18)
    }
    
    @ViewBuilder
    private func imageView(_ geometry: GeometryProxy) -> some View {
        let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
        HStack {
            Spacer()
            Image("panda")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: screenHeight * 0.3, alignment: .leading)
                .clipped()
            Spacer()
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel(isLocked: false))
}
