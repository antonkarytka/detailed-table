//
//  PlayerDetailsViewController.swift
//  detailed-table
//
//  Created by Anton Karytka on 2/9/18.
//  Copyright © 2018 Anton Karytka. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var playingPosition: UILabel!
    @IBOutlet weak var previousTeam: UILabel!
    
    @IBAction func openPlayerLink(_ sender: UIButton) {
        self.performSegue(withIdentifier: "OpenPlayerLink", sender: (player["link"] as? String)!)
    }
    
    var player: [String: AnyObject]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationBar.title = (player["name"] as? String)!
        image.image = UIImage(named: (player["imageName"] as? String)!)
        name.text = (player["name"] as? String)!
        number.text = player["number"].flatMap {String(describing: $0)}!
        age.text = player["age"].flatMap {String(describing: $0)}!
        country.text = (player["country"] as? String)!
        city.text = (player["city"] as? String)!
        dateOfBirth.text = (player["dateOfBirth"] as? String)!
        height.text = (player["height"] as? String)!
        playingPosition.text = (player["playingPosition"] as? String)!
        previousTeam.text = (player["previousTeam"] as? String)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! WebBrowserViewController
        destination.link = (sender as? String)!
    }
}
