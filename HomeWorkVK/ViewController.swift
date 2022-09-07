//
//  ViewController.swift
//  HomeWorkVK
//
//  Created by Igor Frik on 01.09.2022.
//

import UIKit
import VK_ios_sdk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func authorize(_ sender: Any) {
        VKSdk.authorize(["email"])
    }
}

