//
//  ChannelViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/25/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

	@IBOutlet weak var loginBtn: UIButton!
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
	}

	@IBAction func loginButtonPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_LOGIN, sender: nil)
	}
}
