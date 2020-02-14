//
//  ViewController.swift
//  JSONParsingNew
//
//  Created by Felix 12 on 23/01/20.
//  Copyright © 2020 Felix-IT. All rights reserved.
//

import UIKit
struct UserElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}
// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}
// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}
// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tbView: UITableView!
    var user: [UserElement] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RUN")
        jsonParsing()
    }
    func jsonParsing() {
        let url = "https://jsonplaceholder.typicode.com/users"
        let urlSession = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if(error == nil){
                do{
                    let post = try JSONDecoder().decode([UserElement].self, from: data!)
                    self.user = post
                    self.user.forEach { (user) in
                        print(user.name)
                        print(user.id)
                    }
                    DispatchQueue.main.async {
                        self.tbView.reloadData()
                    }
                }catch {
                    print(error.localizedDescription)
                }
        }
        
    }.resume()
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        //let post: User = user[indexPath.row]
        cell.idLabel.text =  "id: \(String(describing: user[indexPath.row].id))"
        cell.nameLabel.text = "name: user[indexPath.row].name"
        cell.usernameLabel.text = "username: user[indexPath.row].username"
        cell.emailLabel.text = "email: user[indexPath.row].email"
        cell.phoneLabel.text = "phone: \(String(describing: user[indexPath.row].phone))"
        cell.websiteLabel.text = "website: user[indexPath.row].website"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
           }
     
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 366
    }
}
