//
//  Constants.swift
//  Blah
//
//  Created by Abdurrahman on 1/27/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://blahchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = ""
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
	"Content-Type": "application/json; charset=utf-8"
]
