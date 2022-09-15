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
    var user = UserVK()

    override func viewDidLoad() {
        super.viewDidLoad()
        let sdkInstance = VKSdk.initialize(withAppId: self.user.kVK_APP_ID)
        sdkInstance?.register(self)
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(true)
        if auth { showApp() }
    }
    
    @IBAction func authorize(_ sender: Any) {
        VKSdk.wakeUpSession(user.permissions, complete: { [self] (state, error) in
            if state == .authorized && error == nil && VKSdk.accessToken() != nil {
                print("Авторизация уже есть")
                self.user.userToken = VKSdk.accessToken().accessToken
                self.auth = true
                self.showApp()
            } else {
                VKSdk.authorize(user.permissions)
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
                print("Выход выполнен")
        } else {
            print("Ошибка")
            print("\(String(describing: result.error))")
        }
    }
    
    func showApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "ViewControllerApp") as! ViewControllerApp
        present(newVC, animated: true, completion: nil)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("vkSdkUserAuthorizationFailed")
    }
    
}
