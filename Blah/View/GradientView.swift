//
//  GradientView.swift
//  Blah
//
//  Created by Abdurrahman on 1/25/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

	@IBInspectable var topColor: UIColor = #colorLiteral(red: 0.431372549, green: 0.4666666667, blue: 0.7960784314, alpha: 1) {
		didSet {
			self.setNeedsLayout()
		}
	}
	
	@IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.2509803922, green: 0.3098039216, blue: 0.431372549, alpha: 1) {
		didSet {
			self.setNeedsLayout()
		}
	}
	
	override func layoutSubviews() {
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
		gradientLayer.startPoint = CGPoint(x: 0, y: 0)
		gradientLayer.endPoint = CGPoint(x: 1, y: 1)
		gradientLayer.frame = self.bounds
		self.layer.insertSublayer(gradientLayer, at: 0)
	}
}

extension UIView {
	func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}
}
