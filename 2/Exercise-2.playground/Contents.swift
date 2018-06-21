//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupStackView()
        setupTitleLabel()
        setupBodyLabel()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc fileprivate func handleTap() {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -250)
                self.titleLabel.alpha = 0
            })
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.6, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -250)
                self.bodyLabel.alpha = 0
            })
        }
    }
    
    func setupStackView() {
        view.addSubview(stackView)
    
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(bodyLabel)
        
        stackView.axis = .vertical
        stackView.spacing = 24
        // stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        
        // enable autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Swift Aveiro 2018"
        titleLabel.font = UIFont(name: "Futura", size: 34)
    }
    
    func setupBodyLabel() {
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "We're glad to announce that our 2018 edition will be held in Hotel Meliá Ria, on June 21st and 22nd."
    }
}

let viewController = ViewController()
viewController.preferredContentSize = CGSize(width: 375, height: 667)

PlaygroundPage.current.liveView = viewController
