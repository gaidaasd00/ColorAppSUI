//
//  TextView.swift
//  ColorAppSUI
//
//  Created by Алексей Гайдуков on 22.09.2022.
//

import SwiftUI

struct TextView: View {
    let value: Double
    
    var body: some View {
        Text(value.formatted())
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(value: 128)
    }
}
