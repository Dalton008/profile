//
//  UserProfile.swift
//  Profile
//
//  Created by Magic Jammie on 12/2/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

struct UserProfile {
	
	let gender: String
	let name: String
	let email: String
	let phone: String
	let picture: String
	let age: Int
	
	init(user: Welcome) {
		gender = user.results[0].gender
		name = "\(user.results[0].name.title) \(user.results[0].name.first) \(user.results[0].name.last)"
		email = user.results[0].email
		phone = user.results[0].phone
		picture = user.results[0].picture.large
		age = user.results[0].dob.age
	}
}
