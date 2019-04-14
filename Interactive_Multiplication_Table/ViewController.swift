//
//  ViewController.swift
//  Interactive_Multiplication_Table
//
//  Created by Admin on 14/04/2019.
//  Copyright © 2019 Xelwow. All rights reserved.
//

import UIKit
import Foundation

class MultiplicationTableButton : UIButton {
    var ID : Int = -1
    override init(frame: CGRect) {
        super.init(frame: frame)
        Setup()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Setup()
        
    }
    func Setup(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}

class ViewController: UIViewController{
    
    
    @IBOutlet weak var MultiplicationLabel : UILabel!
    
    var MultiplicationCells : [MultiplicationTableButton] = []
    var SelectedNumber : MultiplicationTableButton?
    
    @objc func ButtonTapped(sender : MultiplicationTableButton){
        //
        if sender.ID == 0 {
            return
        }
        let firstNumber = sender.ID / 10
        let secondNumber = sender.ID % 10
        if (firstNumber == 0 || secondNumber == 0){
            return
        }
        if SelectedNumber != nil {
            MultiplicationCells[SelectedNumber!.ID / 10 * 10].backgroundColor = .gray
            MultiplicationCells[SelectedNumber!.ID % 10].backgroundColor = .gray
            SelectedNumber!.backgroundColor = .white
            SelectedNumber!.setTitleColor(.black, for: .normal)
        }
        MultiplicationCells[firstNumber * 10].backgroundColor = .red
        MultiplicationCells[secondNumber].backgroundColor = .green
        sender.backgroundColor = .blue
        sender.setTitleColor(.white, for: .normal)
        MultiplicationLabel.text = "\(firstNumber) X \(secondNumber) = \(firstNumber * secondNumber)"
        
        
        SelectedNumber = sender
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let startX = (self.view.frame.width - 300) / 2
        var x : CGFloat = startX
        var y : CGFloat = MultiplicationLabel.frame.origin.y + 60
        var id : Int = 0
        for i in  0...9{
            let cell = MultiplicationTableButton(frame: CGRect(x: x, y: y, width: 30, height: 30))
            cell.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
            cell.isUserInteractionEnabled = true
            self.view.addSubview(cell)
            //cell.delegate = self
            cell.ID = id
            cell.frame.origin = CGPoint(x: x, y: y)
            let title = i == 0 ? "" : "\(i)"
            cell.setTitle(title, for: .normal)
            cell.setTitleColor(.black, for: .normal)
            cell.backgroundColor = .gray
            MultiplicationCells.append(cell)
            
            x += 30
            id += 1
        }
        
        for i in 1...9{
            x = startX
            y += 30
            for j in 0...9{
                let cell = MultiplicationTableButton(frame: CGRect(x: x, y: y, width: 30, height: 30))
                cell.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
                self.view.addSubview(cell)
                //cell.delegate = self
                cell.ID = id
                cell.frame.origin = CGPoint(x: x, y: y)
                if j == 0 {
                    cell.backgroundColor = .gray
                    cell.setTitle("\(i)", for: .normal)
                }
                else {
                    cell.setTitle("\(i * j)", for: .normal)
                }
                cell.setTitleColor(.black, for: .normal)
                MultiplicationCells.append(cell)
                x += 30
                id += 1
            }
        }
    }


}

