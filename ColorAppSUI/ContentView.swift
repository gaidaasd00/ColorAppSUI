//
//  ContentView.swift
//  ColorAppSUI
//
//  Created by Алексей Гайдуков on 22.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()

    @FocusState private var focusField: Field?
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.3332323, blue: 0.13434223425)
                .ignoresSafeArea()
                .onTapGesture {
                    focusField = nil
                }
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                        .focused($focusField, equals: .red)
                    ColorSliderView(value: $green, color: .green)
                        .focused($focusField, equals: .green)
                    ColorSliderView(value: $blue, color: .blue)
                        .focused($focusField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: preViewsField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    private func nextField() {
        switch focusField {
        case .red:
            focusField = .blue
        case .green:
            focusField = .red
        case .blue:
            focusField = .green
        case .none:
            focusField = nil
        }
    }
        private func preViewsField() {
            switch focusField {
            case .red:
                focusField = .blue
            case .green:
                focusField = .red
            case .blue:
                focusField = .green
            case .none:
                focusField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
