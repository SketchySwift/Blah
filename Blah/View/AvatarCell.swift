//
//  AvatarCell.swift
//  Blah
//
//  Created by Abdurrahman on 2/5/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

enum AvatarType {
	case dark
	case light
}

class AvatarCell: UICollectionViewCell {
	
	@IBOutlet weak var avatarImg: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func configureCell(index: Int, type: AvatarType) {
		if type == AvatarType.dark {
			avatarImg.image = UIImage(named: "dark\(index)")
			layer.backgroundColor = UIColor.white.cgColor
		} else {
			avatarImg.image = UIImage(named: "light\(index)")
			layer.backgroundColor = UIColor(red: 41.0/255.0, green: 41.0/255.0, blue: 41.0/255.0, alpha: 1).cgColor
		}
	}
	
	func setupView() {
		self.layer.backgroundColor = UIColor.white.cgColor
		self.layer.cornerRadius = 10
		self.clipsToBounds = true
	}
}
