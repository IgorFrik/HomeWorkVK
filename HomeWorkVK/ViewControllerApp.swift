//
//  ViewControllerApp.swift
//  HomeWorkVK
//
//  Created by Igor Frik on 11.09.2022.
//

import UIKit
import VK_ios_sdk

class ViewControllerApp: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    func shareVK() {
        let share = VKShareDialogController()
        share.text = "Test VK"
        self.present(share, animated: true, completion: nil)
        self.dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        shareVK()
        self.dismiss(animated: true)
    }
}
