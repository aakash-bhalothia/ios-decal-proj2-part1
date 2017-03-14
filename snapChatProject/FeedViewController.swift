//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Aakash Bhalothia on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var categoryName: String?
    var imagePosted: UIImage?
    var openImage: UIImage?

    @IBOutlet weak var tView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.tView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.delegate = self
        tView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        cell.name.text = "Aakash Bhalothia"
        let cat = threadNames[indexPath.section]
        if readImages[cat]?[indexPath.row] == false {
            cell.statusIcon.image = #imageLiteral(resourceName: "unread")
        }
        else {
            cell.statusIcon.image = #imageLiteral(resourceName: "read")
        }
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        let cat = threadNames[indexPath.section]
        if readImages[cat]?[indexPath.row] == false {
            readImages[cat]?[indexPath.row] = true
            openImage = threads[cat]?[indexPath.row]
            cell.statusIcon.image = #imageLiteral(resourceName: "read")
            cell.name.text = "Aakash Bhalothia"
            performSegue(withIdentifier: "openImageSegue", sender:nil)
        }
        else{
            cell.statusIcon.image = #imageLiteral(resourceName: "read")
            cell.name.text = "Aakash Bhalothia"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "openImageSegue" {
                if let dest = segue.destination as? SnapViewController {
                    dest.imageSet = openImage
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cat = threadNames[section]
        return threads[cat]!.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
