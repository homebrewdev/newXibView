//
//  XibView.swift
//  newXibView
//
//  Created by Egor Devyatov on 29.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class XibView: UIView {
    
    @IBOutlet var contView: XibView!
    @IBOutlet weak var xibLabel: UILabel!
    
    
    let aView: UIView = UIView()
    let bView: UIView = UIView()
    let cView: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("XibView", owner: self, options: nil)
        contView.backgroundColor = .lightGray// серый фон это у нас контентВью Xiba
        contView.frame = self.bounds // берем размеры XibView
        
        self.addSubview(contView)
       
        aView.frame = contView.bounds
        
        bView.frame = CGRect(x: 20, y: contView.bounds.height/2 - 8, width: contView.bounds.width/2 - 8, height: contView.bounds.height/2 - 8)
        
        cView.frame = CGRect(x: contView.bounds.width/2 + 8, y: contView.bounds.height/2 - 8, width: contView.bounds.width/2 - 8, height: contView.bounds.height/2 - 8)
        
        contView.addSubview(aView)
        
        contView.addSubview(bView)
        
        contView.addSubview(cView)
        
        
        
        makeConstraintsViewA()
        makeConstraintsViewB()
        makeConstraintsViewC()
        
        addImageToXIB(bView)
        
        // добавляем кастомную label на view
        addLabelToXIB("Some label", aView)
        
        let someButton = generateButton(title: "Button for View A")
        aView.addSubview(someButton)
        
//        self.addSubview(contView)
//        print("Superview = \(String(describing: contView.superview))")
        
//        self.contView.addSubview(aView)
//        print("Superview = \(String(describing: aView.superview))")
        
//        initializeSubViewA()
    }
    
    // ViewA Constraints
    func makeConstraintsViewA() {
        
        aView.backgroundColor = .green
        aView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = self.bounds.midY
        
        let someButton = generateButton(title: "Some button")
    
        aView.addSubview(someButton)
        
        NSLayoutConstraint(item: aView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 33).isActive = true
        
        NSLayoutConstraint(item: aView,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: contView,
                           attribute: .left,
                           multiplier: 1,
                           constant: 16).isActive = true
        
        NSLayoutConstraint(item: aView,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: contView,
                           attribute: .right,
                           multiplier: 1,
                           constant: -16).isActive = true
        
//        NSLayoutConstraint(item: aView,
//                           attribute: .right,
//                           relatedBy: .equal,
//                           toItem: contView,
//                           attribute: .right,
//                           multiplier: 1,
//                           constant: -16).isActive = true
//
//        NSLayoutConstraint(item: aView,
//                           attribute: .bottom,
//                           relatedBy: .lessThanOrEqual,
//                           toItem: contView,
//                           attribute: .bottom,
//                           multiplier: 1,
//                           constant: 300).isActive = true
        
//        NSLayoutConstraint(item: aView,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .width,
//                           multiplier: 1,
//                           constant: 100).isActive = true
        
        NSLayoutConstraint(item: aView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: centerY).isActive = true
    }
    
    func makeConstraintsViewB() {
        bView.backgroundColor = .white
        bView.translatesAutoresizingMaskIntoConstraints = false
        
//        let views = ["contentView": self, "bView": bView, "aView": aView]
//
//        let horizontalConstraints = NSLayoutConstraint.constraints(
//            withVisualFormat: "H:[contentView]-(<=0)-[bView(100)]",
//            options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
//            metrics: nil, views: views)
        
//        let verticalConstraints = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:[aView]-(<=100)-[bView(100)]",
//            options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
//            metrics: nil, views: views)
        
//        let horizontalConstraints1 = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:[aView]-16-[bView]",
//            options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
//            metrics: nil, views: views)
        
//        let verticalConstraints = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:[aView]-(<=0)-[bView(100)]",
//            options: NSLayoutConstraint.FormatOptions.alignAllLeading,
//            metrics: nil, views: views)
        
//        self.addConstraints(horizontalConstraints)
//        self.addConstraints(verticalConstraints)
        //self.addConstraint((horizontalConstraints1)
    }
    
    func makeConstraintsViewC() {
        cView.backgroundColor = .red
    }
    
    // создаем кастомную кнопку
    func generateButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }
    
    // размещаем картинку
    func addImageToXIB(_ toView: UIView) {
        let imageView: UIImageView = UIImageView()
        imageView.frame = CGRect(x: 16, y: 16, width: 100, height: 150)
        let myPicture = UIImage(named: "i.jpeg")
        imageView.image = myPicture
        
        // установливаем радиус скругления и тень
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = false
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize.zero
        
        // добавляем на View которая в параметре
        toView.addSubview(imageView)
    }
    
    // размещаем свою кастомную label
    func addLabelToXIB(_ labelText: String, _ toView: UIView) {
        let lbl: UILabel = UILabel()
        lbl.frame = CGRect(x: 50, y: 150, width: 200, height: 20)
        lbl.backgroundColor = .green
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = labelText
        
        toView.addSubview(lbl)
    }
    
}
