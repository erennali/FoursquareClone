//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Eren Ali Koca on 12.01.2025.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //parse veri kaydetme
        
        /*
         let parseObject = PFObject(className: "Test")
         parseObject["name"] = "Eren Ali Koca2"
         parseObject["age"] = 22
         parseObject["email"] = "erenali@gmail.com2"
         parseObject["phone"] = "+905312345678"
         parseObject["address"] = "Fethiye2"
         parseObject.saveInBackground { (sucess , error) in
         if error != nil {
         print(error!.localizedDescription)
         }else{
         print("uploaded")
         }
         }*/
        
        //veri çekme
        let query = PFQuery(className: "Test")
        query.whereKey("age", equalTo: 21)
        query.findObjectsInBackground { (objects , error) in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                print(objects)
            }
        }
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { (user , error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!")
                }else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                }
            }
        }else {
            makeAlert(title: "Error", message: "Username/Password cannot be empty!")
        }
        
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = usernameText.text
            user.password = passwordText.text

            //InBackground async çalışır
            user.signUpInBackground { (success , error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!")
                }else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(title: "Error", message: "Username/Password?")
        }
    }
    
    
    func makeAlert(title: String , message: String) {
        let alert = UIAlertController(title: title , message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK" , style: .default , handler: nil)
        alert.addAction(okAction)
        self.present(alert , animated: true , completion: nil)
    }
}


