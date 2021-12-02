//
//  MainView.swift
//  Profile
//
//  Created by Magic Jammie on 12/2/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class MainView: UIView {
	
	private lazy var photoLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemGray4
		return label
	}()
	
	private lazy var imageView = UIImageView()
	
	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemGray4
		return label
	}()
	
	private lazy var genderLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemGray4
		return label
	}()
	
	private lazy var ageLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemGray4
		return label
	}()
	
	private lazy var emailLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemGray4
		return label
	}()
	
	private lazy var phoneLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemGray4
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		createPhotoLable()
		createNameLable()
		createGenderLable()
		createAgeLabel()
		createEmailLabel()
		createPhoneLabel()
	}
	
	private func createPhotoLable() {
		self.setupConstraints(label: photoLabel, topAnchor: self.topAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 110, botConst: nil, leadingConst: 110, trailingConst: -110, heightConst: 180, widthConst: nil)
	}
	
	private func createNameLable() {
		self.setupConstraints(label: nameLabel, topAnchor: photoLabel.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 20, botConst: nil, leadingConst: 20, trailingConst: -20, heightConst: 40, widthConst: nil)
	}
	
	private func createImageView() {
		self.photoLabel.setupConstraints(label: self.imageView, topAnchor: self.photoLabel.topAnchor, botAnchor: self.photoLabel.bottomAnchor, leftAnchor: self.photoLabel.leadingAnchor, rightAnchor: self.photoLabel.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
	
	private func createGenderLable() {
		self.setupConstraints(label: genderLabel, topAnchor: nameLabel.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 20, botConst: nil, leadingConst: 20, trailingConst: -20, heightConst: 40, widthConst: nil)
	}
	
	private func createAgeLabel() {
		self.setupConstraints(label: ageLabel, topAnchor: genderLabel.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 20, botConst: nil, leadingConst: 20, trailingConst: -20, heightConst: 40, widthConst: nil)
	}
	
	private func createEmailLabel() {
		self.setupConstraints(label: emailLabel, topAnchor: ageLabel.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 20, botConst: nil, leadingConst: 20, trailingConst: -20, heightConst: 40, widthConst: nil)
	}
	
	private func createPhoneLabel() {
		self.setupConstraints(label: phoneLabel, topAnchor: emailLabel.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 20, botConst: nil, leadingConst: 20, trailingConst: -20, heightConst: 40, widthConst: nil)
	}
	
	func updateInterface(user: UserProfile) {
		DispatchQueue.main.async {
			self.nameLabel.text = "name: \(user.name)"
			self.genderLabel.text = "gender: \(user.gender)"
			self.ageLabel.text = "age: \(user.age)"
			self.emailLabel.text = "email: \(user.email)"
			self.phoneLabel.text = "phone: \(user.phone)"
			do {
				if let url = URL(string: user.picture) {
					let data = try Data(contentsOf: url)
					let image = UIImage(data: data)
					self.imageView = UIImageView(image: image)
					self.createImageView()
				}
				else {
					self.photoLabel.backgroundColor = .systemGray4
				}
			}
			catch {
				print(error)
			}
		}
	}
}
