//
//  LoginViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/28/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

	}

	@IBAction func closeBtnPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func registerBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
	}
}
