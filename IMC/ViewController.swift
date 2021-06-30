//
//  ViewController.swift
//  IMC
//
//  Created by Wellington Alves on 30/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var altura: UITextField!
    @IBOutlet var resultIMC: UILabel!
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet weak var imageView: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calcularIMC(_ sender: Any) {
        let pesoParsed = self.peso.text!.replacingOccurrences(of: ",", with: ".")
        let alturaParsed = self.altura.text!.replacingOccurrences(of: ",", with: ".")
        if let peso = Double(pesoParsed), let altura = Double(alturaParsed) {
            imc = peso / pow(altura, 2)
            showResults()
        } else {
            imageView.isHidden = true
            view.endEditing(true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
            }
    
        resultIMC.text = "\(Int(imc)): \(result)"
        resultImage.image = UIImage(named: image)
        imageView.isHidden = false
        view.endEditing(true)
    }
}

