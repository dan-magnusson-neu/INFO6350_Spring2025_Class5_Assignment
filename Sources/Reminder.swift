import Foundation

struct Reminder: Identifiable {
    let id: UUID = UUID()
    let text: String
    let duration: Duration
    let tags: Set<String>
    init(text: String, tags: Set<String> = [], duration: Duration) {
        self.text = text
        self.duration = duration
        self.tags = tags
    }
}
