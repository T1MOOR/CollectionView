//
//  Cell.swift
//  CollectionView
//
//  Created by Тимур Гарипов on 17.08.22.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var smileImage: UIImageView!
    
    func setTemperatureImage (tempName: String) {
        temperatureImage.image = UIImage(named: tempName)
    }
    func setSmileImage (smileName: String) {
        smileImage.image = UIImage(named: smileName)
    }
}
