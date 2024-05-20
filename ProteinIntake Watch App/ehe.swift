//
//  ehe.swift
//  ProteinIntake Watch App
//
//  Created by Giventus Marco Victorio Handojo on 15/05/24.
//

import SwiftUI

struct ehe: View {
    @State var integer : Int = 0
    var body: some View {
        TabView{
            Text("Page 1")
            Text("Page 2")
            Text("Page 3")
        }
        .tabViewStyle(.carousel)
    }
}

#Preview {
    ehe()
}
