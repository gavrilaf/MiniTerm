import Foundation

protocol InteractionHandlerProtocol {
    
    func start()
    
    func symbol(_ c: String)
    func delete()
    func newLine()
    
    var updateDelegate: ScreenBufferUpdateDelegate? { get set }
}

