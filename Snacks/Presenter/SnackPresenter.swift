//
//  SnackPresenter.swift
//  Snacks
//
//  Created by Douglas Queiroz on 17/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import Foundation

class SnackPresenter {
    
    weak private var snacksView: SnacksView?
    
    func setView(snacksView: SnacksView) {
        self.snacksView = snacksView
    }

    func getSnacks<Service: Gettable>(fromService service: Service) where Service.DataArray == [Snack] {
        snacksView?.showLoading()
        
        service.get { result in
            switch result {
            case .success(let snacks):
                if snacks.isEmpty {
                    self.snacksView?.showEmptyView()
                    self.snacksView?.hideLoading()
                } else {
                    self.snacksView?.setSnacks(snacks: snacks)
                    self.snacksView?.hideLoading()
                }
            case .failure(let error):
                self.snacksView?.showError(message: error.message())
                self.snacksView?.showEmptyView()
                self.snacksView?.hideLoading()
            }
            
        }
    }
}
