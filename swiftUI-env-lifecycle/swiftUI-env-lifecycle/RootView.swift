//
//  RootView.swift
//  swiftUI-env-lifecycle
//
//  Created by Knowledge Temple on 27/10/22.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        ZStack {
            Color.green
            
            VStack {
                Text("Root SwiftUI view")
                LeakingView()
            }
        }
    }
}
