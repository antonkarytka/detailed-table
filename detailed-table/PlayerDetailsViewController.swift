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
    
    @IBAction func openPlayerLink(_ sender: UIButton) {
        self.performSegue(withIdentifier: "OpenPlayerLink", sender: playerLink)
    }
    
    var playerImage: String = ""
    var playerName: String = ""
    var playerNumber: String = ""
    var playerAge: String = ""
    var playerCountry: String = ""
    var playerCity: String = ""
    var playerLink: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationBar.title = playerName
        image.image = UIImage(named: playerImage)
        name.text = playerName
        number.text = playerNumber
        age.text = playerAge
        country.text = playerCountry
        city.text = playerCity
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! WebBrowserViewController
        destination.link = (sender as? String)!
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
