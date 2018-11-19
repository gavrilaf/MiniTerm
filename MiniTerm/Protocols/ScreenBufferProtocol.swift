import Foundation

protocol ScreenBufferProtocol {
    var content: String { get }
}

protocol ScreenBufferUpdateDelegate: class {
    func didScreenUpdate(with buffer: ScreenBufferProtocol)
}
