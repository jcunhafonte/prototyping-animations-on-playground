//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController : UIViewController {
    let cardView = UIView()
    let coverImageView = UIImageView()
    let tagLabel = UILabel()
    let titleLabel = UILabel()
    let captionLabel = UILabel()
    let descriptionLabel = UILabel()
    let backgroundImageView = UIImageView()
    let closeButton = UIButton()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        setupCardView()
        setupCoverImageView()
        
        setupTagLabel()
        setupTitleLabel()
        setupCaptionLabel()
        setupDescriptionLabel()
        
        setupBackgroundImageView()
        setupCloseButton()
        
        view.addSubview(backgroundImageView)
        view.addSubview(cardView)
        
        cardView.addSubview(coverImageView)
        cardView.addSubview(tagLabel)
        cardView.addSubview(titleLabel)
        cardView.addSubview(captionLabel)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(closeButton)
    }
    
    func setupCardView() {
        cardView.frame = CGRect(x: 20, y: 129, width: 315, height: 315)
        cardView.backgroundColor = .white
        cardView.layer.shadowOpacity = 0.25
        cardView.layer.shadowOffset = CGSize(width: 0, height: 8)
        cardView.layer.shadowRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardViewTapped))
        cardView.addGestureRecognizer(tap)
        cardView.isUserInteractionEnabled = true
    }
    
    func setupCoverImageView() {
        coverImageView.frame = CGRect(x: 0, y: 0, width: 315, height: 315)
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.image = UIImage(named: "album")
        coverImageView.clipsToBounds = true
    }
    
    func setupTagLabel() {
        tagLabel.frame = CGRect(x: 16, y: 16, width: 142, height: 16)
        tagLabel.text = "Featured Band".uppercased()
        tagLabel.textColor = .white
        tagLabel.alpha = 0.7
        tagLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    func setupTitleLabel() {
        titleLabel.frame = CGRect(x: 20, y: 192, width: 272, height: 38)
        titleLabel.text = "Darkside".uppercased()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    func setupCaptionLabel() {
        captionLabel.frame = CGRect(x: 20, y: 241, width: 274, height: 54)
        captionLabel.text = "Collaboration of electronic musician Nicolas Jaar and Brooklyn multi-instrumentalist Dave Harrington"
        captionLabel.textColor = .white
        captionLabel.numberOfLines = 0
        captionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.frame = CGRect(x: 20, y: 420, width: 335, height: 200)
        descriptionLabel.text = "Jaar and Harrington first met while they were both students at Brown University. Harrington was recommended to Jaar by frequent collaborator Will Epstein when he was looking for a third musician for his live band, with the three subsequently touring together to support Jaar's 2011 album Space Is Only Noise. Darkside first formed during a Berlin stop on this tour. Jaar and Harrington were writing in their hotel room together when their converter plug popped, filling their room with smoke and forcing them to finish the song in the hallway on a laptop. Upon returning to New York, they continued to write together, developing their sound in their Brooklyn studio."
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 10
        descriptionLabel.alpha = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    func setupCloseButton() {
        closeButton.frame = CGRect(x: 329, y: 16, width: 30, height: 30)
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.alpha = 0
    }
    
    func setupBackgroundImageView() {
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        backgroundImageView.image = UIImage(named: "main")
    }
    
    @objc func cardViewTapped() {
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.7) {
            self.cardView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            self.cardView.layer.cornerRadius = 0
            self.coverImageView.frame = CGRect(x: 0, y: 0, width: 375, height: 400)
            self.tagLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            self.titleLabel.frame = CGRect(x: 20, y: 277, width: 148, height: 41)
            self.captionLabel.frame = CGRect(x: 20, y: 326, width: 274, height: 54)
            self.descriptionLabel.alpha = 1
            self.closeButton.alpha = 1
        }
        
        animator.startAnimation()
    }
    
    @objc func closeButtonTapped() {
        let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.7) {
            self.cardView.frame = CGRect(x: 20, y: 129, width: 315, height: 315)
            self.coverImageView.frame = CGRect(x: 0, y: 0, width: 315, height: 315)
            self.tagLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            self.titleLabel.frame = CGRect(x: 20, y: 192, width: 272, height: 38)
            self.captionLabel.frame = CGRect(x: 20, y: 241, width: 274, height: 54)
            self.closeButton.alpha = 0
            self.descriptionLabel.alpha = 0
        }
        
        animator.startAnimation()
    }
}

PlaygroundPage.current.liveView = ViewController()
