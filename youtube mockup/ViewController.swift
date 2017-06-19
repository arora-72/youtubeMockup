//
//  ViewController.swift
//  youtube mockup
//
//  Created by arora_72 on 17/06/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit


let reuseIdentifier = "Cell"
let reuseIdentifier2 = "MenuCell"

let imageNames = ["home","trending","subscriptions","account"]
let addToList: Any = []


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionViewMenuBar: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var menuBar: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.barTintColor = UIColor(red: 233/255, green: 32/255, blue: 31/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        
        
        //title label for navigation controller
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        
        
        //collection view menu bar
        self.collectionViewMenuBar!.dataSource = self
        self.collectionViewMenuBar!.delegate = self
        
        
        
        //menu bar
        menuBar.backgroundColor = UIColor.red
        
        
        //when the app open the selected menu item
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        print(selectedIndexPath)
        collectionViewMenuBar.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
        
        
        setUpNavBarItems()
        
           }

    
    
    func setUpNavBarItems(){
        
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
    
        let moreButtonImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        
        let moreButtonItem = UIBarButtonItem(image: moreButtonImage, style: .plain, target: self, action: #selector(handleMoreItems))
        
            navigationItem.rightBarButtonItems = [moreButtonItem, searchBarButtonItem]
        
    }
    
    func handleMoreItems(){
        print("more button items")
    }
    
    func handleSearch(){
        print(123)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView != collectionViewMenuBar{
        return 5
        }else{
            return 4
        }
    }
    
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView != self.collectionViewMenuBar{
        let cell: homeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! homeCollectionViewCell
        
        
        cell.thumbnailImageView?.image = UIImage(named: "deathnode")
        cell.profileImageView?.image = UIImage(named: "profilepic")
        
        //cell.thumbnailImageView?.layer.cornerRadius = 22
        cell.profileImageView?.layer.cornerRadius = 25
        cell.titleLabel?.text = "TaylorSwiftVEVO"
        cell.subTitle?.text = "Taylor Swift - Blank Space . 1600 views . 2 years ago"
        cell.lineView?.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        cell.subTitle?.textColor = UIColor.lightGray
        
        
        //trying for image resizing
        
        //        cell.thumbnailImageView?.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleWidth
        //        cell.thumbnailImageView.View.contentMode = UIViewContentMode.ScaleAspectFit
        
        return cell
        }else{
            
            let cell: menuBarCollectionViewCell = collectionViewMenuBar.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath) as! menuBarCollectionViewCell
            
            cell.backgroundColor = UIColor.red
            cell.menuImageView?.backgroundColor = UIColor.red
            cell.menuImageView?.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
            cell.menuImageView?.image = UIImage(named:imageNames[indexPath.row])?.withRenderingMode(.alwaysTemplate)
            cell.menuImageView?.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
            return cell
            
        }
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView != collectionViewMenuBar{
        let height = (view.frame.width - 16 - 16) * 9 / 16
        print(height)
        //return CGSize(width: view.frame.width, height: height + 16 + 68)
        return CGSize(width: view.frame.width, height: 200)
        }else{
            return CGSize(width: view.frame.width/4, height: view.frame.height)
        }
    }
    
    

        
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

