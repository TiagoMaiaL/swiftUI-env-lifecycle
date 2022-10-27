//
//  MainViewController.swift
//  swiftUI-env-lifecycle
//
//  Created by Knowledge Temple on 27/10/22.
//

import SwiftUI
import UIKit

class MainViewController: UIViewController {
    var rootView: AnyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView = AnyView(
            RootView()
                .environmentObject(EnvA())
                .environmentObject(EnvB())
        )
    }
}
