//
//  MainRouter.swift
//  QuotesWidgetDemoApp
//
//  Created by max kryuchkov on 20.06.2022.
//

import UIKit

struct MainRouter {
    
    static var rootViewController: UIViewController? {
        for scene in UIApplication.shared.connectedScenes where scene.activationState == .foregroundActive {
            let rootViewController = ((scene as? UIWindowScene)?.delegate as? UIWindowSceneDelegate)?.window??.rootViewController
            return rootViewController
        }
        return nil
    }
}
