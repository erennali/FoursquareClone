//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Eren Ali Koca on 12.01.2025.
//

import UIKit
import Parse

class PlacesVC: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var placeNameArray = [String]()
    var placeIdArray = [String]()
    var selectedPlaceId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutButtonClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromParse()
    }
    
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            }else {
                if objects != nil {
                    self.placeNameArray.removeAll()
                    self.placeIdArray.removeAll()
                    
                    for object in objects! {
                        if let placeName = object.object(forKey: "name") as? String{
                            if let placeId = object.objectId {
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                            }
                        }
                            
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    @objc func addButtonClicked() {
        self.performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
    }
    @objc func logoutButtonClicked() {
        PFUser.logOutInBackground() { (error) in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            }else {
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
    }
    //segue olmadan önce yapılacak
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            //destinationvc deki oluşturduklarımıza ulaşabilme
            destinationVC.chosenPlaceId = selectedPlaceId
        }
    }
    //tıklanılan cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlaceId = placeIdArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placeNameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return placeNameArray.count
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

}
