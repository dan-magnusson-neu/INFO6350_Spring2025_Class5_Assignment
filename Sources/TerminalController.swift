@MainActor
class TerminalController {
    enum Printer { case none, tick, display }
    private var lastPrint: Printer = .none
    func display(_ reminder: Reminder) {
        if lastPrint == .tick { print("") }
        let separator = Array(repeating: "-", count: reminder.text.count).joined()
        print("""
            \(separator)
            \(reminder.text)
               \(reminder.tags.map({ "#".appending($0) }).joined(separator: ", "))
            \(separator)
            """)
        lastPrint = .display
    }
}
