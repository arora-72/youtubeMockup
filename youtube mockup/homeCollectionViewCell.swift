//
//  homeCollectionViewCell.swift
//  youtube mockup
//
//  Created by arora_72 on 17/06/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit

class homeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    
    var video: Video?{
        
        //setting the behaviour what it will display
        didSet{
            titleLabel.text = video?.title
            thumbnailImageView.image = UIImage(named: (video?.thumbnailImageView)!)
            
            if (video?.channel?.profileImageName) != nil{
                profileImageView.image = UIImage(named: (video?.channel?.profileImageName)!)
            }
            
            
            //to remove optionals
            
            if let channelname = video?.channel?.name,let numberofviews = video?.numberOfViews{
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                
                
                let subtitleText = "\(channelname) ● \((numberFormatter.string(from: numberofviews))!) ● \("2 years ago")"
                subTitle?.text = subtitleText
                
            }
            
            if let title = video?.title{
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
               
                 let font = UIFont(name: "Helvetica", size: 12.0)
                if estimatedRect.size.height > 20{
                   
                    heightForView(text: (video?.title)!, font:font! , height: 44)
                }else{
                    heightForView(text: (video?.title)!, font:font! , height: 20)
                }
                
            }
            
        }
    }
    
    func heightForView(text:String, font:UIFont, height:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
}



