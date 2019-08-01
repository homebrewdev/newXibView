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
    //@IBOutlet weak var xibLabel: UILabel!
    
    
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
        
        // узнаем текущий trait
        
        
        self.addSubview(contView)
       
        aView.frame = CGRect(x: 0,
                             y:0,
                             width: contView.bounds.width/2 - 16,
                             height: contView.bounds.height/2 - 16
        )
        
        bView.frame = CGRect(x: 0,
                             y: 250,
                             width: contView.bounds.width/2 - 16,
                             height: contView.bounds.height/2 - 16)
        
        cView.frame = CGRect(x: contView.bounds.width/2 + 8,
                             y: contView.bounds.height/2 - 8,
                             width: contView.bounds.width/2 - 16,
                             height: contView.bounds.height/2 - 16)
        
        // добавляем на contentView 3 наши view
        contView.addSubview(aView)
        contView.addSubview(bView)
        contView.addSubview(cView)
        
        // применяем к ним констрайнты
        makeConstraintsViewA()
        makeConstraintsViewB()
        makeConstraintsViewC()
        
        addImageToXIB(bView)
        
        // добавляем кастомную label на view
        addLabelToXIB("Some label", aView)
        
        // добавим на вьюB кнопку
//        let bButton = generateButton(title: "Button B")
//        bButton.frame = CGRect(x: 16, y: 100, width: 50, height: 20)
//        bView.addSubview(bButton)
        
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
        
        //let centerY = self.bounds.midY
        
        //let someButton = generateButton(title: "Some button")
    
        //aView.addSubview(someButton)
        
        NSLayoutConstraint(item: aView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 8).isActive = true
        
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
        
        NSLayoutConstraint(item: aView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: contView,
                           attribute: .height,
                           multiplier: 0.5,
                           constant: 0).isActive = true
        
//        // задаем высоту нашего зеленого вью
//        NSLayoutConstraint(item: aView,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: aView,
//                           attribute: .height,
//                           multiplier: 1,
//                           constant: 200).isActive = true
    }
    
    // констринты с помощью Visual Format Language
    func makeConstraintsViewB() {
        bView.backgroundColor = .white
        bView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //let halfScreenHeight = contView.bounds.size.height / 2
        
        // добвляем все view
        let views: [String: Any] = [
            "aView": aView,
            "bView": bView,
            "cView": cView]
            //"skipButton": skipButton]
        
        // массив констраинтов
        var allConstraints: [NSLayoutConstraint] = []
        
        //let halfHeight = self.bounds.height / 2 - 16
        // устанавливаем вертикальный констраинт
        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-370-[bView(200)]",
            metrics: nil,
            views: views)
        allConstraints += iconVerticalConstraints
        
        let bottomVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[bView(200)]",
            metrics: nil,
            views: views)
        allConstraints += bottomVerticalConstraints
        
        // горизонтальное расположение между aview и bView
        let viewBviewCHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "|-[bView]-16-[cView]-|",
            metrics: nil,
            views: views)
        allConstraints += viewBviewCHorizontalConstraints

        // gприменяем все констрайнты
        NSLayoutConstraint.activate(allConstraints)
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
    
    // с помощью Anchor
    func makeConstraintsViewC() {
        cView.backgroundColor = .red
        
        cView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: cView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 370).isActive = true
        
        cView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        cView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //cView.leftAnchor.constraint(equalTo: contView.leftAnchor).isActive = true
        
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
        imageView.frame = CGRect(x: 16, y: 16, width: 150, height: 150)
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
        lbl.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        lbl.backgroundColor = .green
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.text = labelText
        
        toView.addSubview(lbl)
    }
    
}
