//
//  SnacksViewController.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import UIKit
import PKHUD

class SnacksViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let snackService = SnackService()
    private let snackPresenter = SnackPresenter()
    internal var dataSource = [Snack]() {
        didSet {
            if let collectionView = collectionView {
                collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snackPresenter.setView(snacksView: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getSnacks(fromService: snackService)
    }

    func getSnacks<Service: Gettable>(fromService service: Service) where Service.DataArray == [Snack] {
        snackPresenter.getSnacks(fromService: service)
    }
}


extension SnacksViewController: SnacksView {
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showError(message: String) {
        HUD.flash(.label(message), delay: 3.0) { _ in
        }
    }
    
    func setSnacks(snacks: [Snack]) {
        collectionView?.isHidden = false
        dataSource = snacks
    }
    
    func showEmptyView() {
        collectionView?.isHidden = true
    }
}

extension SnacksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SnackCell = collectionView.dequeueReusableCell(withReuseIdentifier: SnackCell.identifier, for: indexPath) as! SnackCell
        cell.set(snack: dataSource[indexPath.row])
        
        return cell
    }
}

extension SnacksViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.view.bounds.width/2) - 5
        return CGSize(width: size, height: size)
    }
}
