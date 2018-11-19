import Foundation

protocol ScreenBufferDelegate: class {
    func didBufferUpdate()
}


class ScreenBuffer {
    
    enum Constant {
        static let defaultPrompt = "> "
    }
    
    var prompt: String
    
    weak var delegate: ScreenBufferDelegate?
    
    var text: String {
        return lines.joined(separator: "\n")
    }
    
    var currentLine: String {
        let s = lines[lastIndex]
        return String(s.suffix(from: s.index(s.startIndex, offsetBy: prompt.count)))
    }
    
    init(with prompt: String = Constant.defaultPrompt) {
        self.prompt = prompt
        self.lines.append(prompt)
    }
    
    func addChar(_ c: String) {
        lines[lastIndex].append(c)
    }
    
    func delete() {
        guard lines[lastIndex].count > prompt.count else { return }
        lines[lastIndex].remove(at: lines[lastIndex].index(before: lines[lastIndex].endIndex))
    }
    
    func newLine() {
        self.lines.append(prompt)
    }
    
    // MARK: - private
    private var lines = Array<String>()
    
    private var lastIndex: Int {
        return lines.count - 1
    }
}
