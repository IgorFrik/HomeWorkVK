//
//  AppDelegate.swift
//  HomeWorkVK
//
//  Created by Igor Frik on 01.09.2022.
//

import UIKit
import VK_ios_sdk

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        VKSdk.initialize(withAppId: "51417093")?.uiDelegate = self
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        VKSdk.processOpen(url, fromApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String)
//        VKSdk.processOpen(url, fromApplication: [UIApplication.OpenURLOptionsKey.sourceApplication] as? String)
        return true
    }
}

extension AppDelegate: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        let vc = UIApplication.shared.keyWindow?.rootViewController
        if vc?.presentedViewController != nil {
            vc?.dismiss(animated: true, completion: {
                print("1")
                vc?.present(controller, animated: true, completion: {
                    print("2")
                })
            })
        } else {
            vc?.present(controller, animated: true, completion: {
                print("3")
            })
        }
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("vkSDKNeedCaptchaEnter")
    }
    
    
}
