//
//  ViewController.swift
//  Whatflower
//
//  Created by Anket Kohak on 26/08/24.
//

import UIKit
import CoreML
import Vision
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
        if  let userpickedImage = info[UIImagePickerController.InfoKey.originalImage]  as? UIImage{
            guard let convertedToCIImage =  CIImage(image: userpickedImage) else{
                fatalError("cannot convert to image")
            }
            
            detect(image: convertedToCIImage)
            
            imageView?.image = userpickedImage
            

        }
        imagepicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    func detect(image : CIImage){
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else{
            fatalError("cannot import model")
            
        }
        let request = VNCoreMLRequest(model: model) { request, error in
            let classification = request.results?.first as? VNClassificationObservation
            self.navigationItem.title =  classification?.identifier
        }
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
            try handler.perform([request])
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func cammeraTapped(_ sender: UIBarButtonItem) {
        present(imagepicker,animated: true,completion: nil)
        
    }
    
}

