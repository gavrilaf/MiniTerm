import Foundation

class ScreenBuffer {
    enum Constant {
        static let defaultPrompt = "> "
    }
    
    var prompt: String
    
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

// MARK: -
extension ScreenBuffer: ScreenBufferProtocol {
    var content: String {
        return lines.joined(separator: "\n")
    }
}

extension ScreenBuffer: StreamWriter {
    func Write(string: String) {
        lines[lastIndex].append(string)
    }
    
    func Open() {
        lines.append("")
    }
    
    func Close() {
        newLine()
    }
}
