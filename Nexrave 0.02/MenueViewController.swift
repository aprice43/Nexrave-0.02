//
//  MenueViewController.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 2/18/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import Foundation



class MenueViewController: UIViewController,   UITableViewDelegate , UITableViewDataSource{
    
    var menueNameArr : Array = [String]()
    var iconImageArr : Array = [UIImage]()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var profileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menueNameArr = ["Discover", "Event History", "Host", "Settings" ]
        iconImageArr = [ UIImage(named: "Discover" )! , UIImage(named: "history" )! , UIImage(named: "host" )! ,UIImage(named: "settings" )! ,]
        
        
        let image = UIImage(named: "thug")
        
        profilePic.image = image
        profilePic.contentMode = .scaleAspectFill
        backgroundImage.image = image
        backgroundImage.alpha = 0.6
        profileName.text = "Thugger Thugger"
        profileName.textColor = UIColor.white
        
        profilePic.layer.borderWidth = 2
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.clipsToBounds = true
        profilePic.layer.cornerRadius = 75
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menueNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenueTableViewCell") as! MenueTableViewCell
        
        cell.iconImage.image = iconImageArr[indexPath.row]
        cell.menueLabel.text! = menueNameArr[indexPath.row]
        return cell
    }
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height / 2) / 6
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController : SWRevealViewController = self.revealViewController()
        
        let cell : MenueTableViewCell = tableView.cellForRow(at: indexPath) as! MenueTableViewCell
        
        if cell.menueLabel.text! == "Discover" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Timeline") as! FeedController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        if cell.menueLabel.text! == "Event History" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Timeline") as! FeedController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        if cell.menueLabel.text! == "Host" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Timeline") as! FeedController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        if cell.menueLabel.text! == "Settings" {
            
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "Timeline") as! FeedController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

class MenueTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var menueLabel: UILabel!
    



    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
