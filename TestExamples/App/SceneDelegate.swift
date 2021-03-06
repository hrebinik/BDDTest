//
//  SceneDelegate.swift
//  TestExamples
//
//  Created by Anton Panteleimenko on 07.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = SignUpViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

