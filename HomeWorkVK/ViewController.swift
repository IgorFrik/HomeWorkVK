//
//  ViewController.swift
//  HomeWorkVK
//
//  Created by Igor Frik on 01.09.2022.
//

import UIKit
import VK_ios_sdk

class ViewController: UIViewController {
    var auth = false
    var user = VKNetworking()

    override func viewDidLoad() {
        super.viewDidLoad()
        let sdkInstance = VKSdk.initialize(withAppId: self.user.kVK_APP_ID)
        sdkInstance?.register(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if auth {
            showApp()
        }
    }
    
    func shareVK() {
        let share = VKShareDialogController()
        share.text = "Hello VK"
        self.present(share, animated: true, completion: nil)
    }

    @IBAction func authorize(_ sender: Any) {
        VKSdk.wakeUpSession(["email"], complete: { [self] (state, error) in
            if state == .authorized && error == nil && VKSdk.accessToken() != nil {
                print("Авторизация уже есть")
                self.user.userToken = VKSdk.accessToken().accessToken
                self.auth = true
                shareVK()
//                self.showApp()
            } else {
                VKSdk.authorize(["email"])
//                shareVK()
                print("Нужна авторизация")
            }
        })
    }
}

extension ViewController: VKSdkDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if result.token != nil && result.error == nil {
            self.user.userToken = result.token.accessToken
            self.auth = true
            print("Вход выполнен")
        } else {
            print("Ошибка: \(String(describing: result.error))")
        }
    }
    
    func showApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "ViewControllerApp") as! ViewControllerApp
        present(newVC, animated: true, completion: nil)
        newVC.userToken = self.user.userToken
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("vkSDKUserAuthorizationFaled")
    }
}
