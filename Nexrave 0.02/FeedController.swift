//
//  FeedViewController.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 12/28/16.
//  Copyright © 2016 Nexrave. All rights reserved.
//


import UIKit
import Foundation

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let customIdentifier = "custom ID"
    override func viewDidLoad(){
    super.viewDidLoad()
    
        
    navigationItem.title = "Nexrave"
    self.collectionView?.backgroundColor = UIColor.black
    collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customIdentifier)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        return collectionView.dequeueReusableCell(withReuseIdentifier: customIdentifier, for: indexPath)
    }
    let names = [" 1.png ", "2.JPG", "3.jpeg" , "4.png"]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width), height: (view.frame.width + 30))
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
    let hostPicture: UIImageView = {
        let hostView = UIImageView()
        hostView.contentMode = .scaleAspectFit
        hostView.backgroundColor = UIColor.black
        hostView.translatesAutoresizingMaskIntoConstraints = false
        return hostView
    }()
    let hostNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gucci Mane"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let eventDateLabel: UILabel = {
        let label = UILabel()
        label.text = "1/09/16"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    
    func setupViews(){
        backgroundColor = UIColor.white
        addSubview(hostNameLabel)
        addSubview(hostPicture)
        addSubview(eventDateLabel)
        
        addConstriantsWithFormat(format: "H:|-8-[v0(44)]-8-[v1][v3]-25-|", views: hostPicture,hostNameLabel,eventDateLabel)
        addConstriantsWithFormat(format: "V:|-10-[v0]", views: hostNameLabel)
        addConstriantsWithFormat(format: "V:|-8-[v0(44)]", views: hostPicture)
        addConstriantsWithFormat(format: "V:|-10-[v0]", views: eventDateLabel)
   
    }
}

extension UIView {
    
    
    func addConstriantsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String : UIView]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    
    
    
}
