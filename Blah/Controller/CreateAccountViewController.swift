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
	@IBOutlet weak var bgView: UIView!
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	
	@IBOutlet weak var signInBtn: UIButton!
	
	// Variables
	var avatarName = "profileDefault"
	var avatarColor = "[0.5, 0.5, 0.5, 1]"
	var bgColor: UIColor?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		signInBtn.roundCorners([.topRight, .bottomRight], radius: 30)
		bgView.layer.cornerRadius = bgView.frame.size.width / 2
		setupView()
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if UserDataService.instance.avatarName != "" {
			userImg.image = UIImage(named: UserDataService.instance.avatarName)
			avatarName = UserDataService.instance.avatarName
			if avatarName.contains("light") && bgColor == nil {
				bgView.backgroundColor = UIColor(red: 41.0/255.0, green: 41.0/255.0, blue: 41.0/255.0, alpha: 1)
			} else if avatarName.contains("dark") && bgColor == nil {
				bgView.backgroundColor = .white
			}
		}
	}

	@IBAction func registerAccountPressed(_ sender: Any) {
		spinner.isHidden = false
		spinner.startAnimating()
		
		guard let email = emailTextField.text, emailTextField.text != "" else { return }
		
		guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
		
		guard let name = usernameTextField.text, usernameTextField.text != "" else { return }
		
		AuthService.instance.registerUser(email: email, password: password) { (success) in
			if success {
				AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
					if success {
						AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
							if success {
								self.spinner.isHidden = true
								self.spinner.stopAnimating()
								self.performSegue(withIdentifier: UNWIND, sender: nil)
								NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
							}
						})
					}
				})
			}
		}
		
	}
	
	@IBAction func pickAvatarPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
	}
	
	@IBAction func pickBgColorPressed(_ sender: Any) {
		let r = CGFloat(arc4random_uniform(255)) / 255
		let g = CGFloat(arc4random_uniform(255)) / 255
		let b = CGFloat(arc4random_uniform(255)) / 255
		
		bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
		avatarColor = "[\(r), \(b), \(g), 1]"
		
		UIView.animate(withDuration: 0.3) {
			self.bgView.backgroundColor = self.bgColor
		}
	}
	
	@IBAction func closeBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}

	func setupView() {
		spinner.isHidden = true
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
}
