//
//  SceneDelegate.swift
//  Versus-iOS
//
//  Created by Yago Marques on 04/03/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        
        let rootView = UIHostingController(rootView: VersusIOSRoot())
        let navigationController = UINavigationController(rootViewController: rootView)
        
        window.rootViewController = navigationController
        
        self.window = window
    }

}

