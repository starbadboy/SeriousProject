//
//  FirstViewController.swift
//  TotoScanner
//
//  Created by SONG TAO on 15/02/2017.
//  Copyright © 2017 SONG TAO. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red
        let button = UIButton()
//        button.setTitle("scan", for:)
        button.setTitle("scan", for: .normal)
//        button.frame = CGRect(x: 100, y: 150, width: 100, height: 30)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        imageView.backgroundColor = .gray
//        imageView.frame = CGRect(x: 100, y: 250, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(button)
        view.addSubview(imageView)
        
        button.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp_leading).offset(50)
//            make.top.equalTo(view.snp_top).offset(200)
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.bottom.equalTo(imageView.snp_top).offset(-20)
        }
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp_leading).offset(50)
            make.trailing.equalTo(view.snp_trailing).offset(-50)
            make.height.equalTo(350)
            make.top.equalTo(button.snp_bottom).offset(50)
            make.center.equalToSuperview()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTap() {
        debugPrint("tapped")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        } else {
            debugPrint("no camera")
        }
    }
}

extension FirstViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            debugPrint("got the image")
            imageView.image = image
            self.dismiss(animated: true, completion: nil)
        }
    }
}

