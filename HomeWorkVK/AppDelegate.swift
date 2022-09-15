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
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    private func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        VKSdk.processOpen(url as URL, fromApplication: sourceApplication)
        return true
    }
}

extension AppDelegate: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        let vc = UIApplication.shared.keyWindow?.rootViewController
        if vc?.presentedViewController != nil {
            vc?.dismiss(animated: true, completion: {
                print("hide current modal cotroller if presents")
                vc?.present(controller, animated: true, completion: {
                    print("SFSafariViewController opened to login through a browser1")
                })
            })
        } else {
            vc?.present(controller, animated: true, completion: {
                print("SFSafariViewController opened to login through a browser2")
            })
        }
    }
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("vkSdkNeedCaptchaEnter")
    }
    
}
