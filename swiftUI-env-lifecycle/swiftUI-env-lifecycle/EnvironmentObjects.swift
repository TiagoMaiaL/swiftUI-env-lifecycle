//
//  EnvironmentObjects.swift
//  swiftUI-env-lifecycle
//
//  Created by Knowledge Temple on 27/10/22.
//

import Combine
import Foundation
import UIKit

final class EnvA: ObservableObject {
    // Scenario 4: Retain cycle between environemnt objects and view references.
    var someView: UIView?
}
final class EnvB: ObservableObject {}
