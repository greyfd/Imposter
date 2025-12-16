//
//  Game.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation

class Game: ObservableObject {
    
     enum category {
         case Sports
         case Geography
         case VideoGames
    }
    
    
    
    @Published var currentQuestion: Question?
    var numberOfPlayers: Int
   @Published var players: [Player] = []
    var imposter: Player?
    var category: category
    let words = [
        "Eagle",
        "Pizza",
        "Helicopter",
        "Guitar",
        "Rose",
        "Laptop",
        "Sneakers",
        "Hammer",
        "Shark",
        "Sofa",
        "Ice Cream",
        "Bicycle",
        "Sword",
        "Basketball",
        "Sun",
        "Diamond",
        "Toilet Paper",
        "Microscope",
        "Spider",
        "Castle",
        "Gold",
        "T-Shirt",
        "Apple",
        "Clock",
        "Ocean"
    ]
    var questionSet: [Question] = [
        Question(question: "Where would you usually find this?", answers: ["Indoors", "Outdoors", "In a pocket", "Underground"]),
            Question(question: "How much does it usually cost?", answers: ["Cheap/Free", "Reasonable", "Expensive", "Priceless"]),
            Question(question: "What is it primarily made of?", answers: ["Metal", "Plastic", "Wood", "Organic Material"]),
            Question(question: "How big is it typically?", answers: ["Tiny", "Hand-held", "Human-sized", "Giant"]),
            Question(question: "Is it alive?", answers: ["Yes", "No", "It used to be", "It's a plant"]),
            Question(question: "What is its main purpose?", answers: ["Entertainment", "Work/Utility", "Survival", "Decoration"]),
            Question(question: "How heavy is it?", answers: ["Feather light", "Liftable with one hand", "Needs two people", "Immovable"]),
            Question(question: "Does it make any sound?", answers: ["Completely silent", "Quiet hum", "Loud noise", "It talks"]),
            Question(question: "Who uses this the most?", answers: ["Children", "Adults", "Professionals", "Everyone"]),
            Question(question: "How often is it used?", answers: ["Daily", "Weekly", "Rarely", "Once in a lifetime"]),
            Question(question: "Does it require power?", answers: ["No power needed", "Batteries", "Plug-in", "Gas/Fuel"]),
            Question(question: "Is it dangerous?", answers: ["Safe", "Mildly risky", "Dangerous if misused", "Deadly"]),
            Question(question: "What texture does it have?", answers: ["Smooth", "Rough/Gritty", "Soft/Fluffy", "Sharp"]),
            Question(question: "Can you eat it?", answers: ["Yes, delicious", "Technically yes", "No, toxic", "No, inedible"]),
            Question(question: "How fragile is it?", answers: ["Very breakable", "Sturdy", "Indestructible", "Flexible"]),
            Question(question: "What temperature is it usually?", answers: ["Hot", "Cold", "Room Temperature", "Body Temperature"]),
            Question(question: "Where do you store it?", answers: ["Drawer/Shelf", "Garage", "Fridge/Pantry", "It stays outside"]),
            Question(question: "Does it have a smell?", answers: ["Odorless", "Pleasant", "Strong/Pungent", "Smells like food"]),
            Question(question: "What color is it usually?", answers: ["Black/White/Grey", "Bright/Colorful", "Metallic", "Transparent"]),
            Question(question: "How old is this concept/item?", answers: ["Ancient", "Old Fashioned", "Modern", "Futuristic"]),
            Question(question: "Does it move?", answers: ["Stationary", "Slow movement", "Fast", "Only when carried"]),
            Question(question: "Is it used alone or with others?", answers: ["Solo", "With a partner", "In a group", "Crowds"]),
            Question(question: "Does it involve water/liquids?", answers: ["Yes, relies on it", "No, keep dry", "It is liquid", "Waterproof"]),
            Question(question: "How long does it last?", answers: ["Single use", "A few years", "A lifetime", "Centuries"]),
            Question(question: "How does it make people feel?", answers: ["Happy", "Productive", "Relaxed", "Scared"]),

    ]
    var questionIndex = -1
    
    
    init(numberOfPlayers: Int, category: category) {
        
        self.numberOfPlayers = numberOfPlayers
        self.category = category
        self.questionSet.shuffle()
        for i in 0..<numberOfPlayers {
            players.append(Player(name: "Player \(i + 1)", isImposter: false))
        }
    }
    
    func getPlayer(index: Int) -> Player {
        return players[index];
    }
    
    func answerQuestion(player: Player, answer: String) -> Void {
        player.answers.append(answer)
    }
    
    func nextQuestion() -> Question? {
        if questionIndex + 1 >= questionSet.count {
            return nil
        }
        
        questionIndex += 1
        
        currentQuestion = questionSet[questionIndex]
        
        return currentQuestion
    }
    
    func setSelf(game: Game) {
        self.players = game.players
        self.category = game.category
        self.numberOfPlayers = game.numberOfPlayers
        self.imposter = game.imposter
    }
    
    func setPlayers(players: [Player]) {
        self.players = players
    }
    
    func initGame() {
        let random = Int.random(in: 0..<numberOfPlayers)
        
        let impasta = players[random]
        impasta.isImposter = true
        imposter = impasta
    }
    
    
    
     
}
