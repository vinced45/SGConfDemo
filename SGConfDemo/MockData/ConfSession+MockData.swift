//
//  ConfSession+MockData.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/14/25.
//

import Foundation

extension ConfSession {
    static let levelupPart1: ConfSession = ConfSession(
        id: UUID(),
        title: "Level up your Swift and SwiftUI Part 1",
        startTime: DateHelper.create(day: 15, month: 1, hour: 10, minute: 0),
        endTime: DateHelper.create(day: 15, month: 1, hour: 12, minute: 0),
        desc: "You're already writing good SwiftUI apps, but you're coming to iOS Conf SG because you want to write great SwiftUI apps, right? \n\nIn this workshop we'll walk through an existing SwiftUI project that could use more than a little improvement, and together we'll make the code faster, clearer, and smarter too.",
        speaker: .paul
    )
    
    static let levelupPart2: ConfSession = ConfSession(
        id: UUID(),
        title: "Level up your Swift and SwiftUI Part 2",
        startTime: DateHelper.create(day: 15, month: 1, hour: 12, minute: 15),
        endTime: DateHelper.create(day: 15, month: 1, hour: 2, minute: 15),
        desc: "The workshop continues with more suggestions from you, and lots of live coding and discussion from Paul. Come prepared to learn, and prepared to work too – make sure your laptops are fully charged, with Xcode 16 installed!",
        speaker: .paul
    )
    
    static let swiftConcurrencyPart1: ConfSession = ConfSession(
        id: UUID(),
        title: "Swift Concurrency Workshop Part 1",
        startTime: DateHelper.create(day: 15, month: 1, hour: 15, minute: 0),
        endTime: DateHelper.create(day: 15, month: 1, hour: 17, minute: 0),
        desc: "We’ll start off with the basics of Swift Concurrency by exploring the async/await syntax. \n\nAfter that, we’ll quickly see that async/await is only the surface of Swift Concurrency. We’ll move on to explore Structured Concurrency and how we can reason about where code runs once we mark functions as asynchronous or when we spawn new tasks. \n\nOnce we’ve got these basics down, we move on to advanced concepts like actors and sendable. You’ll learn about Swift Concurrency’s promises of compile-time data race protections and how this benefits us in the long run. We’ll also see how this is a major shift from the way that we write code in GCD, and how this means that migrations can sometimes be more involved than just translating syntax.",
        speaker: .donny
    )
    
    static let swiftConcurrencyPart2: ConfSession = ConfSession(
        id: UUID(),
        title: "Swift Concurrency Workshop Part 2",
        startTime: DateHelper.create(day: 15, month: 1, hour: 17, minute: 0),
        endTime: DateHelper.create(day: 15, month: 1, hour: 19, minute: 0),
        desc: "We’ll wrap the workshop up by carefully considering our options for moving to Swift 6. How can we make the migration as painless as possible? And should we prioritise migrating or are there more important things to focus on? \n\nBy the end of this workshop you’ll have gained a lot of Swift Concurrency knowledge and you’ll have a much better understanding of the more complex details that power Swift’s modern concurrency features.",
        speaker: .donny
    )
    
    static let bulidingHyper: ConfSession = ConfSession(
        id: UUID(),
        title: "Building a hyper flexible backend driven UI: Behind the scenes of the new RevenueCat Paywalls",
        startTime: DateHelper.create(day: 16, month: 1, hour: 10, minute: 25),
        endTime: DateHelper.create(day: 16, month: 1, hour: 10, minute: 50),
        desc: "We wanted to build a highly customizable UI editor on the web, but render those views natively on iOS with SwiftUI. So how did we do it? In this talk Charlie will walk you through the approach the RevenueCat team took to build version 2 of RevenueCat Paywalls. He’ll walk through the high level architectural decisions, some challenges we ran into along the way, and, of course, a live demo of the end result.",
        speaker: .charlie
    )
    
    static let userdefaults: ConfSession = ConfSession(
        id: UUID(),
        title: "UserDefaults: a wolf in sheep's clothings",
        startTime: DateHelper.create(day: 16, month: 1, hour: 10, minute: 55),
        endTime: DateHelper.create(day: 16, month: 1, hour: 11, minute: 30),
        desc: "If you're using UserDefaults (you are), you might think you know everything about the API, but there's some little known gotchas that can lead to catastrophic bugs.",
        speaker: .charlie
    )
    
    static let sideEffects: ConfSession = ConfSession(
        id: UUID(),
        title: "Managing Side Effects with Swift",
        startTime: DateHelper.create(day: 16, month: 1, hour: 11, minute: 40),
        endTime: DateHelper.create(day: 16, month: 1, hour: 12, minute: 10),
        desc: "The concept of functions with side effects is incredibly important in programming. A function is said to have side effects when it depends on or mutates external state. A simple example is a function that takes data and writes it to a database. Such functions, while highly useful, can present significant challenges when it comes to debugging, testing, reusing, and composing them. This is where the need for side-effect management comes in. I will demonstrate various techniques that leverage Swift’s expressive type system and powerful runtime to help make side effects explicit, controlled, and type-driven.",
        speaker: .alex
    )

}
