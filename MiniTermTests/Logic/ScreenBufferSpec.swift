import Quick
import Nimble

@testable import MiniTerm

class ScreenBufferSpec: QuickSpec {
    override func spec() {
        describe("ScreenBuffer") {
            var subject: ScreenBuffer!
            
            beforeEach {
                subject = ScreenBuffer()
            }
            
            describe("buffer init state") {
                it("buffer text should contain default prompt") {
                    expect(subject.content).to(equal(ScreenBuffer.Constant.defaultPrompt))
                }
                
                it("current line should be empty") {
                    expect(subject.currentLine.isEmpty).to(beTrue())
                }
            }
            
            describe("dititing") {
                
                describe("add symbol") {
                    beforeEach {
                        subject.addChar("A")
                    }
                
                    it("buffer should contain correct text") {
                        let expected = ScreenBuffer.Constant.defaultPrompt + "A"
                        expect(subject.content).to(equal(expected))
                    }
                    
                    it("current line should contain one symbol") {
                        expect(subject.currentLine).to(equal("A"))
                    }
                }
                
                describe("add new line") {
                    beforeEach {
                        subject.newLine()
                    }
                    
                    it("buffer should contain correct text") {
                        let expected = ScreenBuffer.Constant.defaultPrompt + "\n" + ScreenBuffer.Constant.defaultPrompt
                        expect(subject.content).to(equal(expected))
                    }
                    
                    it("current line should be empty") {
                        expect(subject.currentLine.isEmpty).to(beTrue())
                    }
                }
                
                describe("delete") {
                    beforeEach {
                        subject.addChar("A")
                        subject.delete()
                    }
                    
                    it("buffer text should contain default prompt") {
                        expect(subject.content).to(equal(ScreenBuffer.Constant.defaultPrompt))
                    }
                    
                    it("current line should be empty") {
                        expect(subject.currentLine.isEmpty).to(beTrue())
                    }
                }
                
                describe("delete when line is empty") {
                    beforeEach {
                        subject.addChar("A")
                        subject.delete()
                        subject.delete()
                    }
                    
                    it("buffer text should contain default prompt") {
                        expect(subject.content).to(equal(ScreenBuffer.Constant.defaultPrompt))
                    }
                    
                    it("current line should be empty") {
                        expect(subject.currentLine.isEmpty).to(beTrue())
                    }
                }
                
                describe("complex editind") {
                    beforeEach {
                        subject.addChar("A")
                        subject.addChar("B")
                        subject.newLine()
                        subject.addChar("C")
                        subject.addChar("D")
                        subject.addChar("E")
                        subject.delete()
                    }
                    
                    it("buffer should contain correct text") {
                        let expected = ScreenBuffer.Constant.defaultPrompt + "AB\n" + ScreenBuffer.Constant.defaultPrompt + "CD"
                        expect(subject.content).to(equal(expected))
                    }
                    
                    it("current line should contain correct text") {
                        expect(subject.currentLine).to(equal("CD"))
                    }
                }
            }
        }
    }
}
