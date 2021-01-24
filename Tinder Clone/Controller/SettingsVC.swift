//
//  SettingsVC.swift
//  Tinder Clone
//
//  Created by Kyo on 1/24/21.
//

import UIKit

class SettingsVC: UITableViewController {
    // MARK:- Properties
    private let headerView = SettingsHeader()
    private let imagePicker = UIImagePickerController()
    private var imageIndex = 0
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        tableView.separatorStyle = .none
        tableView.tableHeaderView = headerView
        headerView.delegate = self
        imagePicker.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)

    }
    
    func setHeaderImage(_ image: UIImage?) {
        
    }
    
    // MARK:- Selectors
    @objc func handleCancel() {
        dismiss(animated: true)
    }
    
    @objc func handleDone() {
        
    }
}

// MARK:- Extensions
extension SettingsVC: SettingsHeaderDelegate {
    func settingsHeader(_ header: SettingsHeader, didSelect index: Int) {
        imageIndex = index
        present(imagePicker, animated: true)
    }
}

extension SettingsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        
        headerView.buttons[imageIndex].setImage(selectedImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true)
    }
}

