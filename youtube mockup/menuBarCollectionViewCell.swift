//
//  menuBarCollectionViewCell.swift
//  youtube mockup
//
//  Created by arora_72 on 18/06/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit

class menuBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    
    
    override var isHighlighted: Bool{
        didSet{
            menuImageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
        
    }
    
    override var isSelected: Bool{
        didSet{
            menuImageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
        
        
    }
}
