//
//  SquadTableViewController.swift
//  detailed-table
//
//  Created by Anton Karytka on 2/6/18.
//  Copyright © 2018 Anton Karytka. All rights reserved.
//

import UIKit

class SquadTableViewController: UITableViewController {
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "PlayerDetails", sender: players[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PlayerDetailsViewController
        destination.player = sender as? [String: AnyObject]
        
        let backItemWithoutTitle = UIBarButtonItem()
        backItemWithoutTitle.title = ""
        navigationItem.backBarButtonItem = backItemWithoutTitle
    }
}
