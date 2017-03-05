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
    
    var post = [Event]()
    @IBOutlet weak var menueButton: UIBarButtonItem!
    
	
    
    
    
    override func viewDidLoad(){
    super.viewDidLoad()
    let titleLogo : UIImage = UIImage(named: "FeedLogo")!
    let marginX: CGFloat = (self.navigationController!.navigationBar.frame.size.width / 2) - 45
    let imageView = UIImageView(frame: CGRect(x: marginX, y: 0, width: 90, height: 45))
    imageView.contentMode = .scaleAspectFit
    imageView.image = titleLogo
    self.navigationController?.navigationBar.addSubview(imageView)
    self.collectionView?.backgroundColor = UIColor.black
    self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    self.navigationController?.navigationBar.barTintColor = UIColor.clear
    menueButton.target = self.revealViewController()
    menueButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    
    collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customIdentifier)
        
        
    
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        
        
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: customIdentifier, for: indexPath)
    }
    let names = [" 1.png ", "2.JPG", "3.jpeg" , "4.png"]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width), height: (view.frame.width - 30))
    }
    func transitionButtonPressed() {
     performSegue(withIdentifier: "goToFeed", sender: self)
        
    }
    func checkForPost() {
        
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
        hostView.image = UIImage(named: "3")
        hostView.contentMode = .scaleAspectFit
        hostView.backgroundColor = UIColor.black
		hostView.layer.cornerRadius = 22
		hostView.layer.borderColor = UIColor.white.cgColor
		hostView.layer.borderWidth = 2
		hostView.clipsToBounds = true
        return hostView
    }()
    let hostNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gucci Mane"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
  
        return label
    }()
	let cityLabel: UILabel = {
		let label = UILabel()
		label.text = "City,State"
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textColor = UIColor.white
  
		return label
		
	}()
    let eventDateLabel: UILabel = {
        let label = UILabel()
        label.text = "8:30 PM"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        
     
        return label
    }()
    
    let flyerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "waka")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let transitionButton: UIButton = {
        let button = UIButton()
        button.setImage( #imageLiteral(resourceName: "redButton"), for: .normal)
        button.addTarget(self, action: #selector(FeedController.transitionButtonPressed) , for: .touchUpInside)
		button.tintColor = UIColor.black
        return button
        
    
    }()
    let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Waka Party"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    let top : UIView = {
       let label = UIView()
        label.backgroundColor = UIColor.black
        label.alpha = 0.4
        return label
    }()



    
    func setupViews(){
        backgroundColor = UIColor.white
        
        
        addSubview(flyerImageView)
        addSubview(top)
        addSubview(hostNameLabel)
		addSubview(cityLabel)
        addSubview(hostPicture)
        addSubview(eventDateLabel)
        addSubview(transitionButton)
        addSubview(eventTitleLabel)
        addConstriantsWithFormat(format: "H:|[v0]|", views: top)
        addConstriantsWithFormat(format: "V:|[v0(65)]", views: top)
        addConstriantsWithFormat(format: "H:|-8-[v0(44)]-8-[v1][v2]-25-|", views: hostPicture, hostNameLabel, eventDateLabel)
		addConstriantsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]", views: hostPicture, cityLabel)
        addConstriantsWithFormat(format: "H:|[v0]|", views: flyerImageView)
        addConstriantsWithFormat(format: "H:|[v0]|", views: transitionButton)
        addConstriantsWithFormat(format: "H:|-20-[v0]", views: eventTitleLabel)
        addConstriantsWithFormat(format: "V:|-10-[v0][v1]", views: hostNameLabel, cityLabel)
        addConstriantsWithFormat(format: "V:|-8-[v0(44)]", views: hostPicture)
        addConstriantsWithFormat(format: "V:|[v0(325)][v1]|", views: flyerImageView, transitionButton)
        addConstriantsWithFormat(format: "V:|-8-[v0]", views: eventDateLabel)
        addConstriantsWithFormat(format: "V:[v0]-10-|", views: eventTitleLabel)

   
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
