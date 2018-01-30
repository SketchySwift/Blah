//
//  CreateAccountViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/29/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

	@IBOutlet weak var signInBtn: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		signInBtn.roundCorners([.topRight, .bottomRight], radius: 30)
	}

	@IBAction func signInBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}
}
