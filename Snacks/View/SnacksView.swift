//
//  SnackView.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol SnacksView: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func setSnacks(snacks: [Snack])
    func showEmptyView()
}
