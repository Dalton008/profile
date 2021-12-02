//
//  Profile.swift
//  Profile
//
//  Created by Magic Jammie on 12/2/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

struct Welcome: Decodable {
	let results: [Result]
}

struct Result: Decodable {
	let gender: String
	let name: Name
	let email: String
	let phone, cell: String
	let picture: Picture
	let dob: Dob
}

struct Dob: Decodable {
	let age: Int
}

struct Name: Decodable {
	let title, first, last: String
}

struct Picture: Decodable {
	let large, medium, thumbnail: String
}
