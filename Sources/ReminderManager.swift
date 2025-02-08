import Foundation

actor ReminderManager {
    private var reminders: [UUID: Reminder] = [:]
    private var terminal: TerminalController = TerminalController()
    
    func add(_ reminder: Reminder) {
        reminders[reminder.id] = reminder
    }
    
    func run() async {
        await withThrowingTaskGroup(of: Void.self) { group in
            for key in reminders.keys {
                group.addTask {
                    let reminder = try await self.delayedReminder(with: key)
                    await self.terminal.display(reminder)
                }
            }
        }
        print("\nReminders all sent!")
    }
    
    private func delayedReminder(with id: UUID) async throws -> Reminder {
        guard let reminder = reminders[id] else {
            throw ManagerError.reminderNotFound
        }
        try await Task.sleep(for: reminder.duration)
        return reminder
    }
    
    enum ManagerError: Error {
        case reminderNotFound
    }
}
