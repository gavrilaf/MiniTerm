import Foundation

class InteractionHandler: InteractionHandlerProtocol {
    
    weak var updateDelegate: ScreenBufferUpdateDelegate?
    
    func symbol(_ c: String) {
        screenBuffer.addChar(c)
        updateDelegate?.didScreenUpdate(with: screenBuffer)
    }
    
    func delete() {
        screenBuffer.delete()
        updateDelegate?.didScreenUpdate(with: screenBuffer)
    }
    
    func newLine() {
        let command = screenBuffer.currentLine
        
        screenBuffer.Open()
        commandProcessor.run(command: command, with: screenBuffer)
        screenBuffer.Close()
        
        updateDelegate?.didScreenUpdate(with: screenBuffer)
    }
    
    func start() {
        updateDelegate?.didScreenUpdate(with: screenBuffer)
    }
    
    init() {
        screenBuffer = ScreenBuffer()
        commandProcessor = CommandProcessor()
    }
    
    // MARK: - private
    
    private let screenBuffer: ScreenBuffer
    private let commandProcessor: CommandProcessor
}
