//
//  FeedViewController.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 12/28/16.
//  Copyright © 2016 Nexrave. All rights reserved.
//


import UIKit
import Foundation
import Darwin





extension UIImage {
	func getPixelColor(pos: CGPoint ) -> UIColor {
		
		
		

		let pixelData = self.cgImage!.dataProvider!.data
		let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
		
		let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
		
		let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
		let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
		let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
		//let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
		
		return UIColor(red: r, green: g, blue: b, alpha: 0.9)
	}
	func getPixelRGB(pos: CGPoint ) -> [CGFloat] {
		
		
		
		
		let pixelData = self.cgImage!.dataProvider!.data
		let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
		
		let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
		
		let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
		let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
		let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
		
		
		return [r,g,b]
	}
}


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
        return 10
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
		hostView.layer.borderColor = UIColor.black.cgColor
		hostView.layer.borderWidth = 2
		hostView.clipsToBounds = true
		
		
		
        return hostView
    }()
    let hostNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gucci Mane"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
  
        return label
    }()
	let cityLabel: UILabel = {
		let label = UILabel()
		label.text = "City,State"
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textColor = UIColor.black
  
		return label
		
	}()
    let eventDateLabel: UILabel = {
        let label = UILabel()
        label.text = "8:30 PM"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.black
        
     
        return label
    }()
    
    let flyerImageView: (UIImageView, UIColor) = {
        let imageView = UIImageView()
		let image = UIImage(named: "waka")

        imageView.image = image
        imageView.contentMode = .scaleToFill
		//imageView.backgroundColor = brightestColor
		
		
		
		
        return (imageView , imageView.getBestColor(image: image!))
    }()
    let transitionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(FeedController.transitionButtonPressed) , for: .touchUpInside)
		button.tintColor = UIColor.black
		let arrowView = UIImageView()
		let arrow = UIImage(named: "next")
		arrowView.image = arrow
		button.addSubview(arrowView)
		button.addConstriantsWithFormat(format: "H:[v0]-15-|", views: arrowView)
		button.addConstriantsWithFormat(format: "V:|-8-[v0]-8-|", views: arrowView)
		
        return button
        
    
    }()

    let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Waka Party"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
	let top: UIView = {
		let back = UIView()
		back.backgroundColor = UIColor.white
		back.layer.cornerRadius = 10
		return back
	}()





    
    func setupViews(){
        backgroundColor = UIColor.clear

        addSubview(top)
		
        addSubview(flyerImageView.0)
		
        addSubview(hostNameLabel)
		addSubview(cityLabel)
        addSubview(hostPicture)
        addSubview(eventDateLabel)
		transitionButton.backgroundColor = flyerImageView.1
		hostPicture.layer.borderColor = flyerImageView.1.cgColor
        addSubview(transitionButton)
        addSubview(eventTitleLabel)
		addConstriantsWithFormat(format: "H:|[v0]|", views: top)
		
		addConstriantsWithFormat(format: "V:|[v0(85)]", views: top)
		
        addConstriantsWithFormat(format: "H:|-8-[v0(44)]-8-[v1][v2]-25-|", views: hostPicture, hostNameLabel, eventDateLabel)
		addConstriantsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]", views: hostPicture, cityLabel)
        addConstriantsWithFormat(format: "H:|[v0]|", views: flyerImageView.0)
        addConstriantsWithFormat(format: "H:|[v0]|", views: transitionButton)
        addConstriantsWithFormat(format: "H:|-20-[v0]", views: eventTitleLabel)
        addConstriantsWithFormat(format: "V:|-10-[v0][v1]", views: hostNameLabel, cityLabel)
        addConstriantsWithFormat(format: "V:|-8-[v0(44)]", views: hostPicture)
        addConstriantsWithFormat(format: "V:|-65-[v0(260)][v1]|", views: flyerImageView.0, transitionButton)
        addConstriantsWithFormat(format: "V:|-8-[v0]", views: eventDateLabel)
        addConstriantsWithFormat(format: "V:[v0]-10-|", views: eventTitleLabel)

		if (transitionButton.backgroundColor == UIColor.black){
			transitionButton.layer.borderWidth = 1.3
			transitionButton.layer.borderColor = UIColor.white.cgColor
		}
		

		
		
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
extension UIImageView {
	
	
	func getBestColor(image: UIImage) -> UIColor {
		
		let w = Int(image.size.width / 9)
		let h = Int(image.size.height / 9)
		var brightestColor : UIColor = UIColor.black
		var brightness : CGFloat = 0.5
		
		var part = 1
		var cell = 1
		var since = 4.0
		var stop = 25
		var countdown = false
		while since > 0 {
			print( cell  , part)
			var x : Int = Int(arc4random_uniform(UInt32(w)) + UInt32(w * 4))
			var y : Int = Int(arc4random_uniform(UInt32(h)) + UInt32(h * 4))
			if cell == 1{
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(w * 4)) + 1
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(h * 4)) + 1
			}
			else if cell == 2 {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(3 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(3 * h))
			}
			else if cell == 3 {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(5 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(5 * h))
			}
			else if cell == 4 {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(w * 3)) + 1
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(5 * h))
			}
			else if cell == 5 {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(w * 5))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(h * 3))
			}
			else if cell == 6 {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(2 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(4 * h))
			}
			else if cell == 7{
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(w * 6))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(4 * h))
			}
			else if cell == 8 {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(w * 4))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(2 * h))
			}
			else if cell == 9  {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(4 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(6 * h))
			}
			else if cell == 10  {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(2 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(2 * h))
			}
			else if cell == 11  {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(6 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(2 * h))
			}
			else if cell == 12  {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32( w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32( 6 * h))
			}
			else if cell == 13  {
				x = Int(arc4random_uniform(UInt32(w)) + UInt32(7 * w))
				y = Int(arc4random_uniform(UInt32(h)) + UInt32(6 * h))
			}
		
			let point = CGPoint(x: x, y: y)
			let pixcolor = image.getPixelColor(pos: point )
			let RGB = image.getPixelRGB(pos:point)
			let RGBmax = RGB.max()
			let RGBmin = RGB.min()
			let luminance = (RGBmin! + RGBmax!)/2

			var saturation : CGFloat = 0
			let range = ((RGB[1]) - 0.3) ... ((RGB[1]) + 0.3)
			
			if ( range.contains((RGB[0])) && range.contains((RGB[2]))) {
				
				
				
				if countdown == false {

						cell = cell + 1
						print("new cell")
				}
				part = part - 1
				if part <= 0 {
					part = 1
				}
				
				
				if countdown {
					since = since - 1
				}
				
				if cell > 13 {
					cell = 1
				}
				if stop < 0  {
					break
				}else {
					stop = stop - 1
				}
			
				continue
			}
			else if (RGBmax == RGBmin) {
				print("black")
				continue
			}
			if (luminance < 0.5 && luminance > 0.45){
				saturation = ( (RGBmax! - RGBmin!) / (RGBmax! + RGBmin!) )
			}
			if (luminance > 0.5 && luminance < 0.55){
				saturation = ( (RGBmax! - RGBmin!)/(2.0 - RGBmax! - RGBmin!))
				
			}
			if (brightness < saturation) {
				print("new Color")
				countdown = true
				brightness = saturation
				brightestColor = pixcolor
				since = 4
				if (brightness > 0.8) {
					break
				}
			}
			if part > 2 {
		       if countdown == false {
					  cell = cell + 1
					print("new cell")
				}
				
				part = 1
			}
			
			if cell > 13 {
				cell = 1
			}

			part = part + 1
			if countdown {
				since = since - 0.5
			}
			if stop < 0  {
				break
			}else {
				stop = stop - 1
			}
		}
		print(" new Flyer **************")
		return brightestColor
		
	}
	
	
	
	
	
	
}
