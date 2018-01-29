//
//  CustomTextfield.swift
//  Blah
//
//  Created by Abdurrahman on 1/28/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import Foundation
class CustomTextfield: UITextField {
	
	let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
	
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
