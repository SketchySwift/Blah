//
//  ChatViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/25/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

	// Outlets
	@IBOutlet weak var menuBtn: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
	}

}
