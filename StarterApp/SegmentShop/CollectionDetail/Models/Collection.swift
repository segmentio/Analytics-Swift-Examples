//
//  Collection.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation

//struct CollectionData: Codable {
//    let collections: [Collection]
//}

struct Product: Codable {
    let title: String
    let description: String
    var id = UUID().uuidString
    let price: Double
    let category: String
    
    init(title: String, description: String, price: Double, category: String) {
        self.title = title
        self.description = description
        self.price = price
        self.category = category
        
    }
}

struct Collection: Codable {

    var id = UUID()
    let title: String
    let products: [Product]
    
    init(title: String, products: [Product]) {
        self.title = title
        self.products = products
    }
}

extension Collection: Identifiable {}
extension Product: Identifiable {}

let collectionData = [
    Collection(title: "Widgets", products: [
        Product(
            title: "Aura",
            description: "Awaken your inner glow with Aura! This mood-boosting orb emits calming frequencies, harmonizing your space and elevating your well-being.",
            price: 345.89,
            category: "Lifestyle"
        ),
        Product(
            title: "Catalyst",
            description: "Spark change with Catalyst! This sleek device amplifies your intentions, igniting your drive to achieve your goals and conquer any obstacle.",
            price: 246.99,
            category: "Office"
        ),
        Product(
            title: "Dynamo",
            description: "Unleash your inner power with Dynamo! This compact powerhouse channels kinetic energy, fueling your gadgets and powering your adventures.",
            price: 699.99,
            category: "Lifestyle"
        ),
        Product(
            title: "Equinox",
            description: "Embrace balance with Equinox! This harmonizing pendant aligns your chakras, promoting serenity and inner peace.",
            price: 389.99,
            category: "Home"
        ),
        Product(
            title: "Nexus",
            description: "Connect beyond boundaries with Nexus! This holographic communicator bridges the gap between worlds, bringing loved ones closer with stunning clarity.",
            price: 900.00,
            category: "Office"
        ),
        Product(title: "OmniTool",
                description: "Simplify your life with OmniTool! This multi-functional marvel replaces your toolbox, crafting, and repair kit, all in one sleek design.",
                price: 280.00,
                category: "Home"
               ),
        Product(
            title: "Quanta",
            description: "Unlock the secrets of the universe with Quanta! This quantum compass guides you to hidden possibilities, revealing new paths and hidden truths.",
            price: 845.00,
            category: "Lifestyle"
        ),
        Product(
            title: "Verita",
            description: "Seek truth in every word with Verita! This intelligent translator pierces through deception, revealing the true meaning behind any language or message.",
            price: 649.99,
            category: "Home"
        ),
        Product(
            title: "Zenith",
            description: "Reach new heights of focus with Zenith! This brainwave stimulator unlocks your peak potential, enhancing creativity, memory, and mental clarity.",
            price: 1499.99,
            category: "Lifestyle"
        ),
        Product(
            title: "Zephyr",
            description: "Breathe easy, wherever you roam with Zephyr! This portable air purifier filters out pollutants, leaving you refreshed and revitalized in any environment.",
            price: 600.00,
            category: "Office")
    ]),
    
    Collection(title: "Gizmos", products: [
        Product(
            title: "EcoHelper",
            description: "Ditch the guilt, embrace the green! EcoHelper is your pocket-sized sustainability companion. Track your eco-footprint, discover eco-friendly alternatives, and offset your impact with every purchase.",
            price: 99.99,
            category: "Office"
        ),
        Product(
            title: "EnviroGear",
            description: "Adventure awaits, protected! EnviroGear is your rugged shield against the elements. This weatherproof, multi-tool kit tackles any terrain, from scaling mountains to conquering cityscapes, with ease.",
            price: 450.00,
            category: "lifestyle"
        ),
        Product(
            title: "GearGenie",
            description: "Say goodbye to gear headaches! GearGenie is your personal tech whisperer. This AI-powered app diagnoses device woes, optimizes performance, and even recommends upgrades, keeping your tech life running smoothly.",
            price: 344.99,
            category: "Home"
        ),
        Product(
            title: "HomeHero",
            description: "Conquer chaos, be a domestic legend! HomeHero is your all-in-one home management hub. Automate routines, monitor security, control appliances, and simplify life, all from your smartphone.",
            price: 89.99,
            category: "Office"
        ),
        Product(
            title: "Simplifi",
            description: "Unclutter your mind, declutter your world! Simplifi is your minimalist magic wand. This AI-powered organizer categorizes, prioritizes, and schedules tasks, leaving you free to focus on what matters.",
            price: 649.99,
            category: "Office"
        ),
        Product(
            title: "WhizClick",
            description: "Capture fleeting moments, unleash your inner artist! WhizClick is your lightning-fast photo editor. Enhance, stylize, and transform images in a flash, creating stunning visuals with just a click.",
            price: 949.99,
            category: "Home"
        ),
        Product(
            title: "Whizzit",
            description: " Ditch the cables, embrace wireless magic! Whizzit is your portable power bank and file transfer hub. Charge any device on the go, and share files instantly, all without a single cord.",
            price: 346.98,
            category: "Home"
        ),
        Product(
            title: "Fixify",
            description: "Banish DIY disasters, become a repair master! Fixify is your interactive video repair guide. Diagnose issues, follow step-by-step instructions, and fix anything from leaky faucets to faulty gadgets with confidence.",
            price: 299.99,
            category: "Lifestyle"
        ),
        Product(
            title: "ZapZip",
            description: "Experience lightning-fast connections, leave slow Wi-Fi in the dust! ZapZip is your mesh Wi-Fi extender. Eliminate dead zones, blanket your home in seamless coverage, and stream, game, and work without a lag",
            price: 734.99,
            category: "Office"
        )
    ]),
    
    Collection(title: "Trinkets", products: [
        Product(
            title: "Bloomscape",
            description: "Tiny terrariums teeming with life! Build your own miniature ecosystems, watch vibrant flora unfold, and bring a touch of nature's magic to your palm.",
            price: 344.99,
            category: "Home"
        ),
        Product(
            title: "Faerieglass",
            description: "Capture a whisper of enchantment! These iridescent orbs shimmer with otherworldly hues, said to house playful sprites and bring a sprinkle of fairy luck.",
            price: 800.00,
            category: "Office"
        ),
        Product(
            title: "Knackster",
            description: "Unleash your hidden talents! This magical charm amplifies your dexterity, sharpening skills, and boosting your confidence to tackle anything with finesse.",
            price: 300.00,
            category: "Lifestyle"
        ),
        Product(
            title: "MemoryMinder",
            description: "Hold onto precious moments, forever. This exquisite locket captures and stores fleeting experiences, allowing you to relive cherished memories at a touch.",
            price: 665.00,
            category: "Office"
        ),
        Product(
            title: "OwlStone",
            description: "Wisdom whispers in the night. This carved owl pendant enhances intuition, sharpens your inner compass, and guides you through life's winding paths with a touch of ancient wisdom.",
            price: 999.99,
            category: "Lifestyle"),
        Product(
            title: "Sunweave",
            description: "Wear a piece of the sun! This radiant tapestry captures the warmth and joy of sunlit moments, bringing a touch of golden cheer to any day.",
            price: 225.00,
            category: "Home"
        ),
        Product(
            title: "MiniMoments",
            description: "Life's magic in miniature! These tiny, intricate figurines bring your dreams to life, reminding you to find wonder in everyday moments.",
            price: 89.99,
            category: "Lifestyle"),
        Product(
            title: "Timecraft",
            description: "Sculpt your future, one grain at a time. This hourglass filled with shimmering sand allows you to shape your destiny, planting seeds of intention and watching them blossom.",
            price: 348.99,
            category: "Home"),
        Product(
            title: "Whisperscape",
            description: "Immerse yourself in unseen worlds. This enchanted seashell sings with the murmurs of distant oceans, carrying you away to realms of your imagination.",
            price: 225.00,
            category: "Office"
        ),
        Product(
            title: "Wildernest",
            description: "Carry the wild within. This carved acorn pendant whispers of ancient forests and untamed spirits, reminding you to embrace your own wildness and seek adventure.",
            price: 475.00,
            category: "Home"
        )
    ]),
    
    Collection(title: "Heros", products: [
        Product(
            title: "widget-hero",
            description: "Shop Widgets",
            price: 345.89,
            category: "Home"
        ),
        Product(
            title: "gizmo-hero",
            description: "Explore Gizmos",
            price: 345.89,
            category: "Home"
        ),
        Product(
            title: "trinket-hero",
            description: "Peruse Trinkets",
            price: 345.89,
            category: "Home"
        ),
    ])
]

