//
//  APIManager.swift
//  Profile
//
//  Created by Magic Jammie on 12/2/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

class APIManagerImpl: APIManager {
	
	var onComplition: ((UserProfile) -> Void)?
	
	func getNewUser() {
		let urlString = "https://randomuser.me/api/"
		perforfmRequest(withURL: urlString)
	}
	
	private func perforfmRequest(withURL: String) {
		guard let url = URL(string: withURL) else { return }
		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: url) { data, response, error in
			if let data = data {
				if let currentUser = self.parseJSON(data: data) {
					self.onComplition?(currentUser)
				}
			}
		}
		task.resume()
	}

	private func parseJSON(data: Data) -> UserProfile? {
		let decoder = JSONDecoder()
		
		do {
			let currentUserData = try decoder.decode(Welcome.self, from: data)
			let currentUser = UserProfile(user: currentUserData)
			return currentUser
		} catch let DecodingError.dataCorrupted(context) {
			print(context)
		} catch let DecodingError.keyNotFound(key, context) {
			print("Key '\(key)' not found:", context.debugDescription)
			print("codingPath:", context.codingPath)
		} catch let DecodingError.valueNotFound(value, context) {
			print("Value '\(value)' not found:", context.debugDescription)
			print("codingPath:", context.codingPath)
		} catch let DecodingError.typeMismatch(type, context)  {
			print("Type '\(type)' mismatch:", context.debugDescription)
			print("codingPath:", context.codingPath)
		} catch {
			print("error: ", error)
		}
		return nil
	}
}
