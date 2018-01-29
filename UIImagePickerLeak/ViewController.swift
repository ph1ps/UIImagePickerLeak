//
//  ViewController.swift
//  UIImagePickerLeak
//
//  Created by Philipp Gabriel on 29.01.18.
//  Copyright © 2018 Philipp Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func takePhoto(_ sender: Any) {
 
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = false
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func recordVideo(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = false
        picker.mediaTypes = ["public.movie"]
        picker.videoQuality = .typeHigh
        
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print(image.size)
        }
        
        if let video = info[UIImagePickerControllerMediaURL] as? URL {
            print(video.path)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

