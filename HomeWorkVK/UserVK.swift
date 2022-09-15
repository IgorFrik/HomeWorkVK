//
//  UserVK.swift
//  HomeWorkVK
//
//  Created by Igor Frik on 15.09.2022.
//

import Foundation
import VK_ios_sdk

class UserVK {
    let kVK_APP_ID = "51417093"
    let permissions = NSArray(objects: "email", "wall") as [AnyObject]
    var userToken = ""
}
