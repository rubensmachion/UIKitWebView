//
//  ViewController.swift
//  TesteWebView
//
//  Created by Rubens on 04/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBAction func actionButton(_ sender: UIButton) {
        guard let text = textField.text else { return }

        if text.isValidURL() {
            let webViewViewController = WebViewController(url: text)
            navigationController?.pushViewController(webViewViewController, animated: true)
        } else {
            showAlertError()
        }
    }

    @IBAction func actionExternal(_ sender: UIButton) {
        guard let text = textField.text else { return }

        if text.isValidURL() {
            UIApplication.shared.open(text.toURL()!)
        } else {
            showAlertError()
        }
    }

    private func showAlertError() {
        let alert = UIAlertController(title: "Error",
                                      message: "Link inválido.\n Lembre-se de utilizar https:// ou http://",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))

        present(alert, animated: true)
    }
}


extension String {
    func toURL() -> URL? {
        return .init(string: self)
    }

    func isValidURL() -> Bool {
        if let url = self.toURL(), UIApplication.shared.canOpenURL(url) {
            return true
        } else {
            return false
        }
    }
}
