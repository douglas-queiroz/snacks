//
//  SnackCell.swift
//  Snacks
//
//  Created by Douglas Queiroz on 18/07/17.
//  Copyright © 2017 Douglas Queiroz. All rights reserved.
//

import UIKit
import SDWebImage

class SnackCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    static let identifier = "SnackCell"
    
    func set(snack: Snack) {
        if let name = snack.name {
            lbName.text = name
        }
        
        if let snackImage = snack.image {
            image.sd_setImage(with: URL(string: snackImage))
        }
    }
}
