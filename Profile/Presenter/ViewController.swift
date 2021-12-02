//
//  ViewController.swift
//  Profile
//
//  Created by Magic Jammie on 12/2/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private var apiManager = APIManagerImpl()
	
	private var mainView = MainView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addMainView()
		self.navigationItem.title = "Profile"
		self.navigationItem.rightBarButtonItem = createRequestButton()
		apiManager.onComplition = { user in
			self.mainView.updateInterface(user: user)
		}
		apiManager.getNewUser()
	}
	
	private func addMainView() {
		self.view.setupConstraints(label: mainView, topAnchor: view.topAnchor, botAnchor: view.bottomAnchor, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
	
	private func createRequestButton() -> UIBarButtonItem {
		let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))
		return button
	}
	
	@objc private func didTapRefresh() {
		self.apiManager.getNewUser()
	}
}
