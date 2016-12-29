//
//  SignUpViewController.swift
//  Nexrave 0.01
//
//  Created by Alvan Price on 12/23/16.
//  Copyright © 2016 Nexrave. All rights reserved.
//

import UIKit




class SignUpViewController: UIViewController {
    

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var seperator: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topTextBox: UITextField!
    @IBOutlet weak var bottomTextBox: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var buttonTitlePressed: String?
    var isSignin: Bool!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.determineSignInOrRegister()
        self.hideKeyboardWhenTappedAround()
        if buttonTitlePressed != nil {
            
            if buttonTitlePressed == "signIn"{
                isSignin = true
                
            }
        } else {
            
            isSignin = false
            
        }
        
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func determineSignInOrRegister() {
        
        if buttonTitlePressed != nil {
            
            if buttonTitlePressed == "signIn"{
                
                isSignin = true
                
                self.navigationController!.topViewController!.title = "Sign In"
                self.topLabel.text = "Username"
                
                
            }
        } else {
            
            isSignin = false
            self.bottomButton.isHidden = true
            //self.seperator.isHidden = true
            self.bottomLabel.isHidden = true
            self.bottomTextBox.isHidden = true
            self.loginButton.isHidden = true
            //self.topLabel.isHidden = true
            self.topTextBox.isHidden = true
            self.seperator.isHidden = true
            self.navigationController!.topViewController!.title = "Register"
            self.topLabel.text = "Facebook Login:"
            self.topTextBox.attributedPlaceholder = NSAttributedString(string: "(404)-111-1111")
            self.topTextBox.keyboardType = UIKeyboardType(rawValue: 4)!
            self.loginButton.setTitle("Verify", for: .normal)
            
    
        }

    }
    
    
    
    @IBAction func bottomButtonPress(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func middleButtonPress(sender: UIButton) {
        if loginButton.currentTitle == "Login" {

            self.performSegue(withIdentifier: "Feed", sender: self)
            print("Login")
        } else {
            
           // guard let email = topTextBox.text , let password = bottomTextBox.text
               // else {
                    //print("Form is not valid")
            
           // FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user: FIRUser?, error) in
                //  let ref = FIRDatabase.database().reference(fromURL:"https://nexrave-dev.firebaseio.com/")
              //  let usersReference = ref.child("users").child(uid)
            
            print("Verify")
    
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
