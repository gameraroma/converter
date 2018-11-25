//
//  ViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {
    // MARK: private property
    private var menus = [Dimension]()

    // MARK: Outlet property
    @IBOutlet weak var menuCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = AppData.menuItemsList

        menuCollectionView.dataSource = self
    }

    // MARK: cellection view datadource implement method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Use the same string value as define in collection view cell in storyboard
        let cellIdentifier = "MenuCollectionViewCell"
        
        // Use `gaurd` for prevent program work with error
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MenuCollectionViewCell  else {
            fatalError("The dequeued cell is not an instance of MenuCollectionViewCell.")
        }
        
        // Custom UI style which cannot do it in storyboard
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        
        // assign value to view
        let unitDimensionType = menus[indexPath.row]
        // Ex: When type string of `unitDimensionType` is "NSUnitLength", `typeString` will be "Length".
        let typeString = NSStringFromClass(type(of: unitDimensionType)).replacingOccurrences(of: "NSUnit", with: "")
        cell.nameLabel.text = typeString
        cell.unitDimensionType = unitDimensionType
        // Map to asset name
        cell.iconImageView.image = UIImage.init(named: typeString.lowercased())
        return cell
    }
    
    // MARK: Navigation
    // Pass value to Convert View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToConvertView" {
            let cell = sender as! MenuCollectionViewCell
            let vc = segue.destination as! ConvertViewController
            vc.unitDimensionType = cell.unitDimensionType
        }
    }
}

