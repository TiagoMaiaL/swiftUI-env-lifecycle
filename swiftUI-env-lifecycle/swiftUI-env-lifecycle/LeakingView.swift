//
//  LeakingView.swift
//  swiftUI-env-lifecycle
//
//  Created by Knowledge Temple on 28/10/22.
//

import Foundation
import SwiftUI

final class LeakingUIView: UIView {
    private var retainingClosure: (() -> ())!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        retainingClosure = {
            // Scenario 3: Having a retain cycle in a UIView.
            self.backgroundColor = .red
        }
        retainingClosure()
    }
}

struct LeakingView: UIViewRepresentable {
    func makeUIView(context: Context) -> LeakingUIView {
        LeakingUIView()
    }
    
    func updateUIView(_ uiView: LeakingUIView, context: Context) {}
}
