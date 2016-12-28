//
//  FeedViewController.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 12/28/16.
//  Copyright © 2016 Nexrave. All rights reserved.
//


import UIKit


class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let customIdentifier = "custom ID"
    override func viewDidLoad(){
    super.viewDidLoad()
        
        
    navigationItem.title = "Nexrave"
    self.collectionView?.backgroundColor = UIColor.black
    collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customIdentifier)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customIdentifier, for: indexPath) as! CustomCell
        customCell.nameLabel.text = names[indexPath.item]
        return customCell
    }
    let names = [" Mark Zukerburg", "Bill Gates", "Steve Jobs"]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.width))
    }


}

class CustomCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nexrave"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setupViews(){
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions() , metrics: nil, views: ["v0" : nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
        
    }
}
