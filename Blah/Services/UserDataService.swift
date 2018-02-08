//
//  UserDataService.swift
//  Blah
//
//  Created by Abdurrahman on 1/31/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import Foundation

class UserDataService {
	
	static let instance = UserDataService()
	
	public private(set) var id = ""
	public private(set) var avatarColor = ""
	public private(set) var avatarName = ""
	public private(set) var email = ""
	public private(set) var name = ""

	func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
		self.id = id
		self.avatarColor = color
		self.avatarName = avatarName
		self.email = email
		self.name = name
	}
	
	func setAvatarName(avatarName: String) {
		self.avatarName = avatarName
	}
	
	func returnUIColor(components: String) -> UIColor {
		let scanner = Scanner(string: components)
		let skip = CharacterSet(charactersIn: "[], ")
		let comma = CharacterSet(charactersIn: ",")
		scanner.charactersToBeSkipped = skip
		
		var r, g, b, a: NSString?
		
		scanner.scanUpToCharacters(from: comma, into: &r)
		scanner.scanUpToCharacters(from: comma, into: &g)
		scanner.scanUpToCharacters(from: comma, into: &b)
		scanner.scanUpToCharacters(from: comma, into: &a)
		
		let defaultColor = UIColor.white
		
		guard let rUnwrapped = r else { return defaultColor }
		guard let gUnwrapped = g else { return defaultColor }
		guard let bUnwrapped = b else { return defaultColor }
		guard let aUnwrapped = a else { return defaultColor }
		
		let rFloat = CGFloat(rUnwrapped.doubleValue)
		let gFloat = CGFloat(gUnwrapped.doubleValue)
		let bFloat = CGFloat(bUnwrapped.doubleValue)
		let aFloat = CGFloat(aUnwrapped.doubleValue)
		
		let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
		
		return newUIColor
	}
	
}
