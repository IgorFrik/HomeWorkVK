//
//  VKNetworking.swift
//  HomeWorkVK
//
//  Created by Igor Frik on 10.09.2022.
//

import Foundation
import VK_ios_sdk
import Alamofire

class VKNetworking {
    static let shared = VKNetworking()
    let kVK_APP_ID = "51417093"
    let permissions = NSArray(objects: "email", "wall", "photos") as [AnyObject]
    var userToken = ""
    var userEmail = String()
    
    func vkLogin(comletion: @escaping (Bool) -> ()) {
        VKSdk.wakeUpSession(self.permissions, complete: { (state, error) in
            if state == .authorized && error == nil && VKSdk.accessToken() != nil {
                print("VK authorized")
                comletion(true)
            } else if state == .initialized {
                print("VK initialized")
                VKSdk.authorize(self.permissions)
            } else {
                if error != nil {
                    print(error!)
                }
                comletion(false)
            }
        })
    }
}
