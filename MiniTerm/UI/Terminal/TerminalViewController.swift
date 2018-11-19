//
//  ViewController.swift
//  MiniTerm
//
//  Created by Eugen Fedchenko on 11/18/18.
//  Copyright © 2018 Eugen Fedchenko. All rights reserved.
//

import UIKit

class TerminalViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        reloadContent()
        
        textView.becomeFirstResponder()
    }
    
    private func reloadContent() {
        textView.text = buffer.text
    }
    
    private let buffer = ScreenBuffer()
}

extension TerminalViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            buffer.newLine()
        } else if text.count != 0 {
            buffer.addChar(text)
        } else if range.length == 1 {
            buffer.delete()
        }
        
        reloadContent()
        
        return false
    }
}

