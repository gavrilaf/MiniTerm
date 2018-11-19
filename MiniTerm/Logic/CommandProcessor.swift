import Foundation

class CommandProcessor {
    
    func run(command: String, with stdout: StreamWriter) {
        stdout.Write(string: "\(command): command not found!")
    }
}
