//
//  ViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {
    var menus = [Menu]()

    @IBOutlet weak var menuCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus += [Menu(name: "Length", icon: UIImage(named: "length")), Menu(name: "Temperature", icon: nil), Menu(name: "Mass", icon: nil)]
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
        
        let menu = menus[indexPath.row]
        cell.nameLabel.text = menu.name
        cell.iconImageView.image = menu.icon
        return cell
    }
}

