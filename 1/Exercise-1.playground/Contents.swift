//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController : UIViewController {
    var image = UIImageView()
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.34, green: 0.46, blue: 0.96, alpha: 1.0)
        
        setupImage()
        setupAnimation()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    func setupImage() {
        image.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        image.image = UIImage(named: "swift-aveiro")
        view.addSubview(image)
    }
    
    func setupAnimation() {
        let timing = UICubicTimingParameters(animationCurve: .easeOut)
        
        animator = UIViewPropertyAnimator(duration: 2.0, timingParameters: timing)
        animator.addAnimations {
            self.image.center = CGPoint(x: self.image.center.x, y: 300)
            self.image.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        
        // To figure out the fraction completed, take the y location of the touch, and divide it by the maximum y the finger can move to (which is the screen's height)
        let fractionCompleted = location.y / view.bounds.height
        
        // Changing this property changes the % complete of the animation.
        // Try experimenting with a different fraction and see what you get
        animator.fractionComplete = fractionCompleted
    }
}

PlaygroundPage.current.liveView = ViewController()
