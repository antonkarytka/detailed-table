//
//  WebBrowserViewController.swift
//  detailed-table
//
//  Created by Anton Karytka on 2/11/18.
//  Copyright © 2018 Anton Karytka. All rights reserved.
//

import UIKit
import WebKit

class WebBrowserViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func goToPreviousViewController(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func refreshPage(_ sender: UIBarButtonItem) {
        if ((webView.reload()) != nil) {webView.reload()}
    }
    
    var link: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        guard let url = URL(string: link) else { return }
        let request = URLRequest(url: url)
        webView.load(request)

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
