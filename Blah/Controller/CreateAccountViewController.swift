//
//  CreateAccountViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/29/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var userImg: UIImageView!
	
	@IBOutlet weak var signInBtn: UIButton!
	
	// Variables
	var avatarName = "profileDefault"
	var avatarColor = "[0.5, 0.5, 0.5, 1]"
	
	override func viewDidLoad() {
        super.viewDidLoad()
		signInBtn.roundCorners([.topRight, .bottomRight], radius: 30)
	}

	@IBAction func registerAccountPressed(_ sender: Any) {
		guard let email = emailTextField.text, emailTextField.text != "" else { return }
		
		guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
		
		guard let name = usernameTextField.text, usernameTextField.text != "" else { return }
		
		AuthService.instance.registerUser(email: email, password: password) { (success) in
			if success {
				AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
					if success {
						AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
							if success {
								print(UserDataService.instance.name, UserDataService.instance.avatarName)
								self.performSegue(withIdentifier: UNWIND, sender: nil)
							}
						})
					}
				})
			}
		}
		
	}
	
	@IBAction func pickAvatarPressed(_ sender: Any) {
	
	}
	
	@IBAction func pickBgColorPressed(_ sender: Any) {
	
	}
	
	@IBAction func closeBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
}
