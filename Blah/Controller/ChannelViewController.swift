//
//  ChannelViewController.swift
//  Blah
//
//  Created by Abdurrahman on 1/25/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
	}

}
