//
//  SquadTableViewController.swift
//  detailed-table
//
//  Created by Anton Karytka on 2/6/18.
//  Copyright © 2018 Anton Karytka. All rights reserved.
//

import UIKit

class SquadTableViewController: UITableViewController {

    struct Player: Codable {
        var name: String
        var number: Int
        var imageName: String
        
        public init(name: String, number: Int, imageName: String) {
            self.name = name
            self.number = number
            self.imageName = imageName
        }
    }
    
    var players = [] as Array<AnyObject>
    
    func loadDataFromFile(fileName: String, fileExtension: String) {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
                
                if let playersJson = json["players"] as AnyObject? {
                    for i in 0...playersJson.count-1 {
                        let player = playersJson[i] as AnyObject
                        players.append(player)
                    }
                }
            } else {
                print("Probably, either filename or file's extension is incorrect.")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadDataFromFile(fileName: "PlayersData", fileExtension: "json")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell;

        let player = players[indexPath.row]
 
        cell.playerNameLabel.text = player["name"] as? String
        cell.playerNumberLabel.text = player["number"].flatMap {String(describing: $0)}
        cell.playerImage.image = UIImage(named: (player["imageName"] as? String)!)
        
        return cell
    }
}
