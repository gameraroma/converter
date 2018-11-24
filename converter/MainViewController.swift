//
//  ViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {
    var menus = [Dimension]()

    @IBOutlet weak var menuCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = AppData.menuItemsList

        menuCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "MenuCollectionViewCell"
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MenuCollectionViewCell  else {
            fatalError("The dequeued cell is not an instance of MenuCollectionViewCell.")
        }
        
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        
        let unitDimensionType = menus[indexPath.row]
        let typeString = NSStringFromClass(type(of: unitDimensionType)).replacingOccurrences(of: "NSUnit", with: "")
        cell.nameLabel.text = typeString
        cell.unitDimensionType = unitDimensionType
        cell.iconImageView.image = UIImage.init(named: typeString.lowercased())
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToConvertView" {
            let cell = sender as! MenuCollectionViewCell
            let vc = segue.destination as! ConvertViewController
            vc.unitDimensionType = cell.unitDimensionType
        }
    }
}

