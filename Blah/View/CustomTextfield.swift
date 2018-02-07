//
//  CustomTextfield.swift
//  Blah
//
//  Created by Abdurrahman on 1/28/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import Foundation

@IBDesignable
class CustomTextfield: UITextField {
	
	let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
	
	@IBInspectable var placeholderTxt: String = "placeholder" {
		didSet {
			self.placeholder = placeholderTxt
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.attributedPlaceholder = NSAttributedString(string: placeholderTxt, attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.25)])
	}
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, padding)
	}
	
	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, padding)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return UIEdgeInsetsInsetRect(bounds, padding)
	}
}
