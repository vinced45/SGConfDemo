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
        startTime: DateHelper.create(day: 16, month: 1, hour: 9, minute: 25),
        endTime: DateHelper.create(day: 16, month: 1, hour: 9, minute: 50),
        desc: "We wanted to build a highly customizable UI editor on the web, but render those views natively on iOS with SwiftUI. So how did we do it? In this talk Charlie will walk you through the approach the RevenueCat team took to build version 2 of RevenueCat Paywalls. He’ll walk through the high level architectural decisions, some challenges we ran into along the way, and, of course, a live demo of the end result.",
        speaker: .charlie
    )
    
    static let userdefaults: ConfSession = ConfSession(
        id: UUID(),
        title: "UserDefaults: a wolf in sheep's clothings",
        startTime: DateHelper.create(day: 16, month: 1, hour: 9, minute: 55),
        endTime: DateHelper.create(day: 16, month: 1, hour: 10, minute: 30),
        desc: "If you're using UserDefaults (you are), you might think you know everything about the API, but there's some little known gotchas that can lead to catastrophic bugs.",
        speaker: .christian
    )
    
    static let sideEffects: ConfSession = ConfSession(
        id: UUID(),
        title: "Managing Side Effects with Swift",
        startTime: DateHelper.create(day: 16, month: 1, hour: 10, minute: 40),
        endTime: DateHelper.create(day: 16, month: 1, hour: 11, minute: 10),
        desc: "The concept of functions with side effects is incredibly important in programming. A function is said to have side effects when it depends on or mutates external state. A simple example is a function that takes data and writes it to a database. Such functions, while highly useful, can present significant challenges when it comes to debugging, testing, reusing, and composing them. This is where the need for side-effect management comes in. I will demonstrate various techniques that leverage Swift’s expressive type system and powerful runtime to help make side effects explicit, controlled, and type-driven.",
        speaker: .alex
    )

    static let bluetooth: ConfSession = ConfSession(
        id: UUID(),
        title: "Making Connections: Practical Core Bluetooth",
        startTime: DateHelper.create(day: 16, month: 1, hour: 11, minute: 15),
        endTime: DateHelper.create(day: 16, month: 1, hour: 12, minute: 00),
        desc: "Take a step into the world of connected devices with a session designed to demystify Core Bluetooth. We’ll kick things off with a quick overview of Bluetooth basics: the versions, Classic vs BLE, key terminology, and how standard connection flows work. Next, we’ll dive into Apple’s Core Bluetooth framework, exploring how to connect iOS apps with the Bluetooth-enabled devices we find all around us. \n\nIn the hands-on demo, we’ll walk through connecting an iOS app to a BLE-compatible device, looking at how we can leverage Bluetooth specifications to build apps that work with a range of devices. To wrap things up, we’ll cover tips and best practices for quickly prototyping your Bluetooth-powered app ideas. Perfect for anyone looking to expand their iOS toolkit into the connected world, this session will empower you to bring new Bluetooth-enabled features to your apps with confidence",
        speaker: .ryan
    )
    static let snowglobe: ConfSession = ConfSession(
        id: UUID(),
        title: "Creating a SnowGlobe in visionOS: From Idea to Reality Composer Pro",
        startTime: DateHelper.create(day: 16, month: 1, hour: 13, minute: 40),
        endTime: DateHelper.create(day: 16, month: 1, hour: 14, minute: 10),
        desc: "In this talk, I’ll share key takeaways from creating a SnowGlobe in visionOS. We’ll explore beginner-friendly 3D modeling concepts, the basics of PBR materials, and the practical use of Reality Composer Pro’s Timeline and behaviors—essential tools for anyone starting out with visionOS.",
        speaker: .jane
    )
    static let innovation: ConfSession = ConfSession(
        id: UUID(),
        title: "Innovation @ OKX | AppClip's Deep Dive",
        startTime: DateHelper.create(day: 16, month: 1, hour: 14, minute: 15),
        endTime: DateHelper.create(day: 16, month: 1, hour: 14, minute: 25),
        desc: "Our Engineer from the mobile team will share about the innovation at OKX, including Live Activity, Dynamic Island, Widgets and AppClip at high level. And then deep dive into the AppClip technology with its challenges and how we overcome to build our experiences.",
        speaker: .jasper
    )
    static let reducing: ConfSession = ConfSession(
        id: UUID(),
        title: "Reducing App Launch Times: From Diagnostics to Optimization",
        startTime: DateHelper.create(day: 16, month: 1, hour: 14, minute: 30),
        endTime: DateHelper.create(day: 16, month: 1, hour: 15, minute: 00),
        desc: "App launch time is your app’s first impression—fast and smooth launches set the foundation for user satisfaction. But how can we truly optimize the launch process? \n\nI’ll take a deep dive into the mechanics of app startup, exploring each phase and uncovering the hidden costs of initialization. We’ll cover how to use various tools and custom instrumentation to identify bottlenecks, and discuss actionable techniques for improving both cold and warm startup times. \n\nThrough a demo, I’ll demonstrate how to diagnose startup issues and implement effective optimizations. Whether you’re looking to reduce your app’s launch time or deliver a seamless user experience, this talk will equip you with practical strategies and advanced techniques to elevate your app’s performance to the next level. Let’s make every millisecond count!",
        speaker: .dai
    )
    static let justPort: ConfSession = ConfSession(
        id: UUID(),
        title: "Don’t Just Port Your iOS Apps to visionOS: Develop with Purpose – Building Sign Language Recognition for VisionPro",
        startTime: DateHelper.create(day: 16, month: 1, hour: 15, minute: 45),
        endTime: DateHelper.create(day: 16, month: 1, hour: 16, minute: 15),
        desc: "VisionPro isn’t just another screen for your iPhone or iPad apps—it’s a revolutionary platform that invites us to rethink what’s possible. So why settle for simply porting over existing apps? This talk will explore how to approach VisionPro development with intention, creativity, and a focus on building experiences unique to the platform. \n\nI’ll share my journey from staring with the VisionPro and no clear idea of what to build, to discovering the platform’s potential and creating a sign language recognition app. Along the way, we’ll dive into extracting hand data from VisionPro’s API, building a machine learning model, and integrating it all into an app. And I won’t sugarcoat it—I’ll highlight the challenges, frustrations, and lessons learned throughout the process. \n\nWhether you’re new to VisionPro or looking for ways to make the most of its capabilities, this talk will show you how to shift your perspective and unlock the potential of this groundbreaking platform. Let’s embrace what makes VisionPro unique and create something extraordinary together!",
        speaker: .monika
    )
    static let scaling: ConfSession = ConfSession(
        id: UUID(),
        title: "Scaling iOS DevX with Tuist",
        startTime: DateHelper.create(day: 16, month: 1, hour: 16, minute: 20),
        endTime: DateHelper.create(day: 16, month: 1, hour: 16, minute: 50),
        desc: "As iOS applications and teams grow, maintaining developer productivity becomes increasingly challenging. In this talk, we'll explore the critical yet often overlooked aspect of Developer Experience (DevX) in iOS development. We'll examine how common bottlenecks like build times, workspace management, and team coordination can impact developer productivity at scale, and how these challenges compound as an organization grows. \n\nThrough real-world examples from Carousell's journey, we'll demonstrate how Tuist—a powerful project generation tool—can transform your development workflow. You'll learn practical strategies to dramatically shorten developer feedback loops, from local builds to CI pipelines. We'll explore how to democratize these optimizations across your entire team, ensuring every developer can enjoy fast, reliable builds without needing deep expertise in build systems. \n\nThe session will include a live demonstration of Tuist in action, providing you with actionable insights to enhance your own development workflow. Whether you're part of a growing startup or an established enterprise, you'll walk away with concrete steps to evaluate and improve your team's developer experience using modern tools and practices. This talk is ideal for iOS developers, tech leads, and engineering managers looking to scale their iOS development practices efficiently while maintaining team productivity and happiness.",
        speaker: .vijay
    )
    static let cloudKit: ConfSession = ConfSession(
        id: UUID(),
        title: "Syncing and Collaboration with CloudKit",
        startTime: DateHelper.create(day: 16, month: 1, hour: 17, minute: 10),
        endTime: DateHelper.create(day: 16, month: 1, hour: 17, minute: 40),
        desc: "CloudKit empowers developers to create apps with powerful data synchronization and effortless sharing across Apple devices, all while prioritizing user privacy. In this session, we’ll explore the fundamentals of CloudKit, from organizing data in containers to effectively using public, private, and shared databases. \n\nAlong the way, I’ll share practical tips, insights, and lessons learned from integrating CloudKit into my own apps—the good, the bad, and the unexpected. Whether you’re starting your first app or hoping to improve the experience of an existing app, this talk will equip you with the tools and confidence to unlock the full potential of CloudKit.",
        speaker: .mustafa
    )
    static let standOut: ConfSession = ConfSession(
        id: UUID(),
        title: "Make it Memorable: Crafting Apps That Stand Out 🌟",
        startTime: DateHelper.create(day: 16, month: 1, hour: 11, minute: 40),
        endTime: DateHelper.create(day: 16, month: 1, hour: 12, minute: 10),
        desc: "In today's crowded App Store, standing out requires more than technical excellence. Over the past decade, I've developed a design approach that powered the launch of 7 apps and games, earned two Apple Design Award nominations and a win. This approach centers on creating memorable core experiences that resonate with users – and keeps you motivated through the inevitable development struggles. \n\nI'll share my journey from concept to launch, including practical tools and techniques to accelerate development, enhance app quality, and increase visibility on the App Store.",
        speaker: .klemens
    )
    static let final: ConfSession = ConfSession(
        id: UUID(),
        title: "10 Years of Swift: A decade in review",
        startTime: DateHelper.create(day: 16, month: 1, hour: 17, minute: 35),
        endTime: DateHelper.create(day: 16, month: 1, hour: 18, minute: 15),
        desc: "The Swift we write today looks almost nothing like the Swift we wrote when it launched 10 years ago. What have we learned along the way, and what changes are still to come? Find out in this closing presentation from Paul, with a little help from his friends…",
        speaker: .paul
    )
    static let shrinking: ConfSession = ConfSession(
        id: UUID(),
        title: "Shrinking Fish: A Functional Programmer looks at SwiftUI",
        startTime: DateHelper.create(day: 17, month: 1, hour: 9, minute: 25),
        endTime: DateHelper.create(day: 17, month: 1, hour: 9, minute: 55),
        desc: "In a famous paper from forty years ago, Peter Henderson drew Escher’s famous Square Limit with fish that nested and shrank as they approached the edges of the square. “Big deal,” you say. He’s used functional techniques such as combinators and before there was SwiftUI I replicated this work using Swift and UIKit. It turns out that SwiftUI Views and ViewBuilders work in a way that is compatible with this technique and we’ll play with these ideas in this talk. Believe it or not - at the end you’ll come away with ideas for your own iOS apps.",
        speaker: .daniel
    )
    static let wrong: ConfSession = ConfSession(
        id: UUID(),
        title: "What people get wrong about testing and how can you leverage tests to develop a lot faster!",
        startTime: DateHelper.create(day: 17, month: 1, hour: 10, minute: 00),
        endTime: DateHelper.create(day: 17, month: 1, hour: 10, minute: 25),
        desc: "In this talk I'll share my best tips and approaches around testing software that not only allowed me to write projects like Sourcery, but also maintain large scale apps like New York Times or Arc Browser.",
        speaker: .krzysztof
    )
    static let journey: ConfSession = ConfSession(
        id: UUID(),
        title: "Enjoy the Journey",
        startTime: DateHelper.create(day: 17, month: 1, hour: 10, minute: 46),
        endTime: DateHelper.create(day: 17, month: 1, hour: 11, minute: 00),
        desc: "Learning new technology is critical to your professional development, but is that all there is? What happens when you make plans and you hit a fork in the road? Let’s really explore the question of “where do you see yourself in 5 years”.",
        speaker: .jeff
    )
    static let contextAware: ConfSession = ConfSession(
        id: UUID(),
        title: "Creating Context-Aware Apps with iOS App Intents",
        startTime: DateHelper.create(day: 17, month: 1, hour: 11, minute: 05),
        endTime: DateHelper.create(day: 17, month: 1, hour: 11, minute: 35),
        desc: "n this talk, we'll explore how App Intents enables apps to interact seamlessly with system-wide services and other apps. We’ll dive into the core concepts, including their role in enhancing user experience by providing contextually relevant actions and automating tasks and powering Apple Intelligence.",
        speaker: .priyal
    )
    static let appIntents: ConfSession = ConfSession(
        id: UUID(),
        title: "Enhancing App Experiences with App Intents and Live Activities",
        startTime: DateHelper.create(day: 17, month: 1, hour: 11, minute: 40),
        endTime: DateHelper.create(day: 17, month: 1, hour: 12, minute: 10),
        desc: "Dive into the world of App Intents and Live Activities to transform the way users interact with your iOS apps. This talk will explore how to seamlessly integrate App Intents to leverage Apple’s intelligence layers, such as Siri and Spotlight, and bring real-time, interactive updates to your app’s home screen and lock screen with Live Activities. We’ll also touch on best practices, implementation strategies, and lessons learned from real-world use cases, including flight tracking at United Airlines. Whether you’re building your first app or enhancing an existing one, this session will empower you to create dynamic, user-focused experiences that stand out.",
        speaker: .vince
    )
    static let automate: ConfSession = ConfSession(
        id: UUID(),
        title: "Automated Mobile E2E Testing at OKX",
        startTime: DateHelper.create(day: 17, month: 1, hour: 17, minute: 15),
        endTime: DateHelper.create(day: 17, month: 1, hour: 17, minute: 30),
        desc: "Our Engineer from the mobile infrastructure team will share about the software solution/architecture we build around open source projects for automated end to end testing to keep our apps’ quality at the highest. Also, we will briefly share what our self-hosted hardware device farms look like.",
        speaker: .he
    )
    static let softSkills: ConfSession = ConfSession(
        id: UUID(),
        title: "Beyond Engineering: Essential Soft Skills For Thriving In Your iOS Career",
        startTime: DateHelper.create(day: 17, month: 1, hour: 14, minute: 05),
        endTime: DateHelper.create(day: 17, month: 1, hour: 14, minute: 35),
        desc: "In the fast-paced world of iOS development, technical expertise is only part of the equation for career success. This talk dives into the often-overlooked soft skills that can set you apart: effective communication, collaboration, problem solving, adaptability, and emotional intelligence. Learn how to build stronger relationships, navigate workplace challenges, and foster your professional growth—ensuring your career thrives beyond the codebase.",
        speaker: .carola
    )
    static let testing: ConfSession = ConfSession(
        id: UUID(),
        title: "Unlocking the Power of Swift Testing: Modern Approaches to Testing iOS Apps",
        startTime: DateHelper.create(day: 17, month: 1, hour: 14, minute: 40),
        endTime: DateHelper.create(day: 17, month: 1, hour: 14, minute: 10),
        desc: "In this session, we’ll take an in-depth look at Apple’s powerful new Swift Testing framework, exploring how it’s transforming the way we write and manage tests for iOS apps. We’ll compare Swift Testing with the well-established XCTest framework, examining its unique features, strengths, and potential drawbacks. \n\nYou’ll discover how Swift Testing can streamline your testing workflow by offering more intuitive syntax, better integration with modern Swift features, and improved performance. \n\nI’ll also share personal insights and key lessons learned from my experience migrating from XCTest to Swift Testing, including the challenges I encountered during the transition, the improvements I saw, and the practical benefits of adopting this cutting-edge tool.",
        speaker: .riana
    )
    static let bringnin3D: ConfSession = ConfSession(
        id: UUID(),
        title: "Bringing 3D Content to your iOS Application",
        startTime: DateHelper.create(day: 17, month: 1, hour: 15, minute: 55),
        endTime: DateHelper.create(day: 17, month: 1, hour: 16, minute: 25),
        desc: "As developers, we focus on codes instead of designs. Specially on 3D Content. In this session, you’ll be able to create your own 3D content or Download 3D objects from various resources, modify them, and reuse them in your iOS application. We are going step by step from creating 3D objects using Photogrammetry API, 3D pipeline, and integration using SceneKit and the newest RealityKit API. Also, I am going to talk about how to select the framework that best fits your application, performance, and other key aspects.",
        speaker: .kosala
    )
    static let memorable: ConfSession = ConfSession(
        id: UUID(),
        title: "Make it Memorable: Crafting Apps That Stand Out 🌟",
        startTime: DateHelper.create(day: 17, month: 1, hour: 16, minute: 30),
        endTime: DateHelper.create(day: 17, month: 1, hour: 17, minute: 00),
        desc: "With Swift 6 being available in Xcode right now, more and more people are taking the plunge and trying out the Swift 6 language mode in their projects. And often they switch back to Swift 5 quickly. The errors, the warnings, how does it all make sense!? \n\nIn this talk, we’re going to explore some of the key fundamentals that drive Swift 6. We’ll look at what Swift does to ensure compile time safety for us, and how this drives those cryptic compiler errors. \n\nYou’ll learn about isolation regions, actor mailboxes, sending parameters and more, with the goal being to finally understand what the compiler is actually trying to tell us when it shows us a cryptic error.",
        speaker: .donny
    )
}
