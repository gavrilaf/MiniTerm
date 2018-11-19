import Foundation


protocol StreamWriter {
    func Open()
    func Close()
    
    func Write(string: String)
}
