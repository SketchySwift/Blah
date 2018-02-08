//
//  ChannelViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/25/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

	@IBOutlet weak var bgView: UIView!
	@IBOutlet weak var userImg: UIImageView!
	@IBOutlet weak var loginBtn: UIButton!
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
		NotificationCenter.default.addObserver(self, selector: #selector(ChannelViewController.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
	}
	
	@objc func userDataDidChange(_ notif: Notification) {
		if AuthService.instance.isLoggedIn {
			loginBtn.setTitle(UserDataService.instance.name, for: .normal)
			userImg.image = UIImage(named: UserDataService.instance.avatarName)
			bgView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
		} else {
			loginBtn.setTitle("Login", for: .normal)
			userImg.image = UIImage(named: "blahLogo")
			bgView.backgroundColor = .clear
		}
	}

	@IBAction func loginButtonPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_LOGIN, sender: nil)
	}
}
