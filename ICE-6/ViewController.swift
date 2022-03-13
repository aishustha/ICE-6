//
//  ViewController.swift
//  ICE-6
//
//  Created by Aishwarya Shrestha on 13/03/2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func AddImage(_ sender: UIButton) {
        let ac = UIAlertController(title: "Select Image", message: "Would Like to Access Your Photos", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) { [self] (_) in
            self.showImagePicker(source: .camera)
        }
        
        let libraryBtn = UIAlertAction(title: "Library", style: .default) { [self] (_) in
            self.showImagePicker(source: .photoLibrary)
        }
        let cancelbtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(cameraBtn)
        ac.addAction(libraryBtn)
        ac.addAction(cancelbtn)
        self.present(ac, animated: true, completion: nil)
    }
    
    func showImagePicker(source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            print("Selected Source not available")
            return
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = source
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            ImageView.image = selectedImage
        } else {
            print("Image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

