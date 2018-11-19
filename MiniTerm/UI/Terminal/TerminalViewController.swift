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
        textView.becomeFirstResponder()
        
        handler = InteractionHandler()
        
        handler.updateDelegate = self
        handler.start()
    }
    
    private var handler: InteractionHandlerProtocol!
}

extension TerminalViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            handler.newLine()
        } else if text.count != 0 {
            handler.symbol(text)
        } else if range.length == 1 {
            handler.delete()
        }
        return false
    }
}

extension TerminalViewController: ScreenBufferUpdateDelegate {
    func didScreenUpdate(with buffer: ScreenBufferProtocol) {
        textView.text = buffer.content
    }
}
