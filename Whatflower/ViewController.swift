//
//  ViewController.swift
//  Whatflower
//
//  Created by Anket Kohak on 26/08/24.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    let imagepicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagepicker.delegate = self
    }

    @IBAction func cammeraTapped(_ sender: UIBarButtonItem) {
    }
    
}

