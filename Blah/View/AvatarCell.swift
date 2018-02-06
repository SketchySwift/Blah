//
//  AvatarCell.swift
//  Blah
//
//  Created by Abdurrahman on 2/5/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
	
	@IBOutlet weak var avatarImg: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func setupView() {
		self.layer.backgroundColor = UIColor.white.cgColor
		self.layer.cornerRadius = self.layer.frame.size.width / 2
		self.clipsToBounds = true
	}
}
