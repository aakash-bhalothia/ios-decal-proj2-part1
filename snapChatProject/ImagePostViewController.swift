//
//  ImagePostViewController.swift
//  snapChatProject
//
//  Created by Aakash Bhalothia on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePostViewController: UIViewController,  UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedIndexPath: IndexPath?
    var imageSelected: UIImage?
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    var categoryName: String?
    @IBOutlet weak var posting: UILabel!
    @IBOutlet weak var buttonView: UIView!
    
    @IBAction func buttonClicked(_ sender: Any) {
        threads[categoryName!]?.append(imageSelected!)
        readImages[categoryName!]?.append(false)
        
        let alert = UIAlertController(title: "Snap Posted!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { action in
            // do something like...
            self.performSegue(withIdentifier: "backPicker", sender: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        posting.text = "Posting To"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryName = threadNames[(indexPath.row)]
        categoryLabel.text = categoryName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! TableCellTableViewCell
        cell.categoryName.text = threadNames[indexPath.row]
        return cell
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
