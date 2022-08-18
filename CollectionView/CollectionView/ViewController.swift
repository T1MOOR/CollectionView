//
//  ViewController.swift
//  CollectionView
//
//  Created by Тимур Гарипов on 17.08.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    let arrayTemperature = [
        "temp.blackGreen",
        "temp.darkYellow",
        "temp.green",
        "temp.lightYellow",
        "temp.orange",
        "temp.red"
    ]
    
    let arraySmile = [
        "nice",
        "notPleasant",
        "favorite",
        "routine",
        "bad",
        "hate"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    }
    
//Чтобы определить, какая ячейка в какой секции нажата:
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC
        else { return }
        
        var currentSelectedImage: String!
        
        if collectionView == collectionViewOne {
            currentSelectedImage = arrayTemperature[indexPath.row]
        }
        
        if collectionView == collectionViewTwo {
            currentSelectedImage = arraySmile[indexPath.row]
        }
        
        vc.setImageName(name: currentSelectedImage)
        present(vc, animated: true, completion: nil)
    }
//Чтобы определить, сколько ячеек выводить в секции:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
              return arrayTemperature.count
            }
            if collectionView == collectionViewTwo {
              return arraySmile.count
            }
            return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOne {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell {
                let imageName = arrayTemperature[indexPath.row]
                cell.setTemperatureImage(tempName: imageName)
                return cell
            }
        }
        if collectionViewTwo == collectionViewTwo {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? Cell {
                let smileImage = arraySmile[indexPath.row]
                cell.setSmileImage(smileName: smileImage)
                return cell
            }
        }
        return UICollectionViewCell()
    }
}
