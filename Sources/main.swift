let manager = ReminderManager()
let reminders = [ Reminder(text: "Do the dishes", tags: ["chore"], duration: .seconds(6)),
                  Reminder(text: "Clean the litter", tags: ["chore", "cats"], duration: .seconds(12)),
                  Reminder(text: "Dance like no one is watching", tags: ["fun"], duration: .seconds(3))]

for reminder in reminders {
    await manager.add(reminder)
}

await manager.run()
