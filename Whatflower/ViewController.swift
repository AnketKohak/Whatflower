//
//  ViewController.swift
//  Whatflower
//
//  Created by Anket Kohak on 26/08/24.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    let imagepicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagepicker.delegate = self
        imagepicker.allowsEditing = false
        imagepicker.sourceType = .photoLibrary
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let userpickedImage = info[UIImagePickerController.InfoKey.originalImage]
        imageView?.image = userpickedImage as? UIImage
        imagepicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cammeraTapped(_ sender: UIBarButtonItem) {
        present(imagepicker,animated: true,completion: nil)
        
    }
    
}

