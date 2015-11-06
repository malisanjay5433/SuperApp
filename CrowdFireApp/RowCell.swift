//
//  RowCell.swift
//  CrowdFireApp
//
//  Created by Sanjay Mali on 26/10/15.
//  Copyright © 2015 TickledMedia. All rights reserved.
//

import UIKit

class RowCell: UITableViewCell {
    var images = ["s1","s2","s4","s5","s7","s9","s12"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
    extension RowCell : UICollectionViewDataSource {
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Category", forIndexPath: indexPath) as! CollectionCell
            cell.imageView.image = UIImage(named: images[indexPath.row])
            return cell
        }
        
    }
    
    extension RowCell : UICollectionViewDelegateFlowLayout {
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let itemsPerRow:CGFloat = 1
            let hardCodedPadding:CGFloat = 16
            let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
            return CGSize(width: itemWidth, height: itemHeight)
        }


}
