import Cocoa

protocol Athlete{
    func practice()
    func playGame()->Bool
}

class Student: Athlete{
    func practice() {
        print("Practicing!")
    }
    func playGame()-> Bool {
    return true
    }
}
