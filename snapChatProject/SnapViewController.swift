//
//  SnapViewController.swift
//  snapChatProject
//
//  Created by Aakash Bhalothia on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {

    @IBOutlet weak var imgV: UIImageView!
    
    var imageSet: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        imgV.image = imageSet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgV.image = imageSet
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imgV.isUserInteractionEnabled = true
        imgV.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
         performSegue(withIdentifier: "goBacktoFeed", sender: nil)
        // Your action
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
