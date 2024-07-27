//
//  ContentView.swift
//  WeSplit
//
//  Created by Cathleen Vu on 7/26/24.
//

import SwiftUI

// Shows the initial UI for the app.
// .padding() is Called a view modifier. It returns a new View with old data and new modifications.
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()  // Called a view modifier. It returns a new View with old data and new modifications.
    }
}

#Preview {
    ContentView()
}
