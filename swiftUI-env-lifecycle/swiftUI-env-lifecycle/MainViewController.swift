//
//  MainViewController.swift
//  swiftUI-env-lifecycle
//
//  Created by Knowledge Temple on 27/10/22.
//

import SwiftUI
import UIKit

class MainViewController: UIViewController {
    var rootViewHostingController: UIHostingController<AnyView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Layout
    
    private func setupUI() {
        guard rootViewHostingController == nil else {
            return
        }
        
        setupRootView()
        setupRemoveButton()
    }
    
    private func setupRemoveButton() {
        let removeButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Remove RootView from UI", for: .normal)
            button.setTitleColor(.tintColor, for: .normal)
            button.addTarget(self, action: #selector(self.releaseRootView), for: .touchUpInside)
            return button
        }()
        
        view.addSubview(removeButton)
        
        NSLayoutConstraint.activate([
            removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupRootView() {
        let hostingController = UIHostingController(
            rootView: AnyView(
                RootView()
                    .environmentObject(EnvA())
                    .environmentObject(EnvB())
            )
        )
        guard let hostingView = hostingController.view else { return }
        
        view.addSubview(hostingView)
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        addChild(hostingController)
        hostingController.didMove(toParent: self)
        
        rootViewHostingController = hostingController
    }
    
    // MARK: Releasing View
    
    @objc private func releaseRootView() {
        guard let rootViewHostingController,
              let hostingView = rootViewHostingController.view else {
            return
        }
        
        rootViewHostingController.removeFromParent()
        hostingView.removeFromSuperview()
        
        // Scenario 2: Keep holding a reference to the hosting controller.
        //self.rootViewHostingController = nil
    }
}
