//
//  LeakingView.swift
//  swiftUI-env-lifecycle
//
//  Created by Knowledge Temple on 28/10/22.
//

import Foundation
import SwiftUI

final class SubUIView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .red
    }
}

struct SubView: UIViewRepresentable {
    @EnvironmentObject
    private var envA: EnvA
    
    func makeUIView(context: Context) -> SubUIView {
        let subView = SubUIView()
        // Scenario 4: Retain cycle between environemnt objects and view references.
        envA.someView = subView
        return subView
    }
    
    func updateUIView(_ uiView: SubUIView, context: Context) {}
}
