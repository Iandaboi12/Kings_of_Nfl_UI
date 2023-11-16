//
//  Chapter1View2.swift
//  SwiftUIStoryTemplate
//
//  Created by Francesca Walz on 11/15/23.
//

import SwiftUI



struct Chapter1View2: View {
    
    @ObservedObject var footBallVM : FootBallTeamViewModel
    @State var didGenerateTeam : Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors:[Color("LionsSilver"), Color("HB")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                VStack{
                    ZStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                    }
                    Text ("Hello, \(footBallVM.coachName)!")
                        .font(.system(size: 28, weight: .bold))
                    Text("You are the new")
                        .font(.system(size: 28, weight: .bold))
                    Text("coach of the Lions!")
                        .font(.system(size: 28, weight: .bold))
                    Text("Let's Build your team...")
                        .font(.system(size: 20))
                    Spacer()
                    Button(action: {
                        
                        
                        footBallVM.generateTeam()
                        didGenerateTeam = true
                        
                    }) {
                        Text("Generate Team")
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black, radius: 8, y: 6)
                }
                Spacer()
                
                
                ScrollView {
                    
                    if didGenerateTeam  == true {
                        
                        Text("Welcome to the 2023-2024 NFL season! Coach \(footBallVM.coachName), the day you have long anticipated has arrived, draft day! Today is the day that you find out the players that will represent the Lions on the field. Your team will shape the entire course of the season.")
                        
                        Text("Every team needs a QuarterBack, the QuarterBack you have been given is \(footBallVM.newTeam[0].name) and their point value is \(footBallVM.newTeam[0].value)"  )
                        
                        Text("Every team needs a Runningback to establish the running game, the RunningBack you have been given is \(footBallVM.newTeam[2].name) and their point value is  \(footBallVM.newTeam[2].value)")
                        
                        Text("No team is complete without their star Wide Reciever, the Wide Reciever you have been given is \(footBallVM.newTeam[1].name) and their point value is  \(footBallVM.newTeam[1].value)")
                        
                        Text("Defense is always the best offense, the three defensive players you have been given are \(footBallVM.newTeam[3].name) and his point value is \(footBallVM.newTeam[3].value), \(footBallVM.newTeam[4].name) and his point value is \(footBallVM.newTeam[4].value), \(footBallVM.newTeam[5].name) and his point value is \(footBallVM.newTeam[5].value)")
                        
                        Text("This is the point total of your team! \(footBallVM.pointTotal)")
                        
                        
                        if footBallVM.pointTotal >= 46 {
                            Text("What a great team we've got here! This should shape up to be a great season!")
                        }
                        
                        else {
                            Text("This might be a tough season for the Lions, but if anyone can do it it's you, \(footBallVM.coachName)!")
                        }
                        
                    }
                }
                
                NavigationLink {
                    Chapter2View(footBallVM: footBallVM)
                } label: {
                    Text("Start Regular Season")
                        .padding()
                        .foregroundColor(.black)
                        .background(.gray)
                        .cornerRadius(10)
                }
                .shadow(color: .black, radius: 8, y: 6)
                
            }
        }
    }
}

#Preview {
    
//    @StateObject var footBallVM : FootBallTeamViewModel = FootBallTeamViewModel()
    Chapter1View2(footBallVM: FootBallTeamViewModel())
}

    struct PlayerModel {
        
        var name:String
        var position:String
        var value:Int
        
    }



class FootBallTeamViewModel: ObservableObject {
    
    
    @Published var newTeam : [PlayerModel] = []
    @Published var pointTotal : Int = 0
    
    @Published var totalWins = 0
    @Published var totalLosses = 0
    @Published var totalDraws = 0
    
    @Published var didWinFirstRound = false
    @Published var didWinSecondRound = false
    @Published var didWinThirdRound = false
    @Published var didWinSuperbowl = false
    @Published var coachName: String = ""
    
    // Lions Players Arrays
    var lionsQB:[PlayerModel] = [
        PlayerModel(name: "Matthew Stafford", position: "QB", value: 10),
        PlayerModel(name: "Bobby Lane", position: "QB", value: 8),
        PlayerModel(name: "Jared Goff", position: "QB", value: 7),
        PlayerModel(name: "Greg Landry", position: "QB", value: 7),
        PlayerModel(name: "Scott Mitchell", position: "QB", value: 6)
    ]
    
    var lionsWR:[PlayerModel] = [
        PlayerModel(name: "Calvin Johnson 'Megatron'", position: "WR", value: 10),
        PlayerModel(name: "Herman Moore", position: "WR", value: 10),
        PlayerModel(name: "Golden Tate III", position: "WR", value: 9),
        PlayerModel(name: "Johnnie Morton", position: "WR", value: 9),
        PlayerModel(name: "Amon-Ra St. Borwn", position: "WR", value: 8),
        PlayerModel(name: "Jameson Williams", position: "WR", value: 5),
        PlayerModel(name: "Marvin Jones", position: "WR", value: 6)
    ]
    
    var lionsRB:[PlayerModel] = [
        PlayerModel(name: "Barry Sanders", position: "RB", value: 10),
        PlayerModel(name: "Billy Sims", position: "RB", value: 9),
        PlayerModel(name: "Doack Walker", position: "RB", value: 8),
        PlayerModel(name: "Mel Farr", position: "RB", value: 8),
        PlayerModel(name: "David Mont", position: "RB", value: 8),
        PlayerModel(name: "D'Andre Swift", position: "RB", value: 7)
    ]
    
    var lionsDP1:[PlayerModel] = [
        PlayerModel(name: "Joe Schmidt", position: "DP1", value: 10),
        PlayerModel(name: "Lem Barney", position: "DP1", value: 10),
        PlayerModel(name: "Brian Branch", position: "DP1", value: 5),
        PlayerModel(name: "Bennie Blades", position: "DP1", value: 8),
    ]
    
    var lionsDP2:[PlayerModel] = [
        PlayerModel(name: "James Houston", position: "DP2", value: 6),
        PlayerModel(name: "Aiden Hutchinson", position: "DP2", value: 7),
        PlayerModel(name: "Dick LeBeau", position: "DP2", value: 9),
        PlayerModel(name: "Richard Lane", position: "DP2", value: 9),
    ]
    
    var lionsDP3:[PlayerModel] = [
        PlayerModel(name: "C.J.Gardner-Johnson", position: "DP3", value: 8),
        PlayerModel(name: "Alex Anzalone", position: "DP3", value: 7),
        PlayerModel(name: "Jack Campbell", position: "DP3", value: 6),
        PlayerModel(name:"Jack Christiansen", position: "DP3", value: 9)
    ]
    
    
    func generateQB(){
        lionsQB.shuffle()
        newTeam.append(lionsQB[0])
        pointTotal += lionsQB[0].value
    }
    
    func generateRB(){
        lionsRB.shuffle()
        newTeam.append(lionsRB[0])
        pointTotal += lionsRB[0].value
    }
    
    func generateWR(){
        lionsWR.shuffle()
        newTeam.append(lionsWR[0])
        pointTotal += lionsWR[0].value
    }
    
    func generateDP1(){
        lionsDP1.shuffle()
        newTeam.append(lionsDP1[0])
        pointTotal += lionsDP1[0].value
    }
    
    func generateDP2(){
        lionsDP2.shuffle()
        newTeam.append(lionsDP2[0])
        pointTotal += lionsDP2[0].value
    }
    
    func generateDP3(){
        lionsDP3.shuffle()
        newTeam.append(lionsDP3[0])
        pointTotal += lionsDP3[0].value
    }
    
    func generateTeam() {
        
        newTeam = []
        pointTotal = 0
        
        generateQB()
        generateWR()
        generateRB()
        generateDP1()
        generateDP2()
        generateDP3()
    }
    
    
    
    
    
    //update the games in the correct order
    let teams:[OpponentModel] = [
        
        OpponentModel(TeamName: "Kansas City Chiefs", Score: 57, gameWeek: "Game 1", opponentPlaying: "Kansas City Cheifs"),
        OpponentModel(TeamName: "Seattle Seahawks", Score: 51, gameWeek: "Game 2", opponentPlaying: "Detroit Lions Vs Seattle Seahawks"),
        OpponentModel(TeamName: "Atlanta Falcons", Score: 41, gameWeek: "Game 3", opponentPlaying: "Detroit Lions Vs Atlanta Falcons"),
        OpponentModel(TeamName: "Green Bay Packers", Score: 33, gameWeek: "Game 4", opponentPlaying: "Detroit Lions Vs. Green Bay Packers"),
        OpponentModel(TeamName: "Tampa Bay Buccaneers", Score: 10, gameWeek: "Game 5", opponentPlaying: "Detroit Lions Vs. Tampa Bay Buccaneers"),
        OpponentModel(TeamName: "Carolina Panthers", Score: 40, gameWeek: "Game 6", opponentPlaying: "Detroit Vs. Carolina Panthers"),
        OpponentModel(TeamName: "Las Vegas Raiders", Score: 25, gameWeek: "Game 7", opponentPlaying: "Detroit Lions VS. Las Vegas Raiders"),
        OpponentModel(TeamName: "Los Angeles Chargers", Score: 42, gameWeek: "Game 8", opponentPlaying: "Detroit Lions Vs. Los Angelos Chargers"),
        OpponentModel(TeamName: "Chicago Bears", Score: 26, gameWeek: "Game 9", opponentPlaying: "Detroit Lions Vs. Chicaco Bears"),
        OpponentModel(TeamName: "New Orleans Saints", Score: 35, gameWeek: "Game 10", opponentPlaying: "Detroit Lions Vs. New Orleans Saints"),
        OpponentModel(TeamName: "Denver Broncos", Score: 34, gameWeek: "Game 11", opponentPlaying: "Detroit Lions Vs Denver Broncos"),
        OpponentModel(TeamName: "Minnesota Vikings", Score: 46, gameWeek: "Game 12", opponentPlaying: "Detroit Lions Vs. Minnesota Vikings"),
        OpponentModel(TeamName: "Dallas Cowboys", Score: 50, gameWeek: "Game 13", opponentPlaying: "Detroit Lions Vs. Dallas Cowboys"),
        OpponentModel(TeamName: "New York Giants", Score: 40, gameWeek: "Game 14", opponentPlaying: "Detroit Lions Vs. New York Giants"),
        OpponentModel(TeamName: "Miami Dolphins", Score: 50, gameWeek: "Game 15", opponentPlaying: "Detroit Lions Vs. Miami Dolphins")
    ]
    //change to actual play off teams
    var POteams:[OpponentModel] = [
        OpponentModel(TeamName: "Denver Broncos", Score: 45, gameWeek: "Game 1", opponentPlaying: "Detroit Lions Vs. Denver Broncos"),
        OpponentModel(TeamName: "Minnesota Vikings", Score: 44, gameWeek: "Game 1", opponentPlaying: "Detroit Lions Vs. Minnestoa Vikings"),
        OpponentModel(TeamName: "Dallas Cowboys", Score: 34, gameWeek: "Game 1", opponentPlaying: "Detroit Lions Vs. Dallas Cowboys"),
        OpponentModel(TeamName: "New York Giants", Score: 36, gameWeek: "Game 1", opponentPlaying: "Detroit Lions Vs. New York Giants"),
        OpponentModel(TeamName: "Miami Dolphins", Score: 42, gameWeek: "Game 1", opponentPlaying: "Detroit Lions Vs. Miami Dolphins")
    ]
    
    
    func generateWinsAndLosses() {
        
        totalWins = 0
        totalLosses = 0
        totalDraws = 0
        
        for game in 0...14 {
            if pointTotal > teams[game].Score {
                print("Great job, \(coachName)! You Won against the \(teams[game].TeamName)!")
                
                totalWins += 1
            } else if pointTotal < teams[game].Score {
                print("Your team lost against the \(teams[game].TeamName), SOL!")
                
                totalLosses += 1
            } else {
                print("it's a tie...")
                
                totalDraws += 1
            }
        }
    }
    
    func playOffGames() -> String {
        
        //print("play off games called")
        var gameResults = """
Test
"""
        
        if let newTeam = POteams.randomElement() {
            gameResults +=  " Your first Play-Off game is today. The lions will now play against \(newTeam.TeamName)"
            
            if pointTotal >= newTeam.Score {
                
                
                gameResults += " Great job, \(coachName)! You Won against the \(newTeam.TeamName)! That means you are moving on to the next Play-Off game!"
                
                // footBallVM.totalWins += 1
                POteams.removeAll(where: {$0 == newTeam })
                didWinFirstRound = true
                
            } else if pointTotal < newTeam.Score {
                gameResults += " Your team lost against the \(newTeam.TeamName), SOL!"
                
               return gameResults
                // footBallVM.totalLosses += 1
                
            }
            
        }
        
        if didWinFirstRound == true {
            
            if let newTeam = POteams.randomElement() {
                gameResults += " Theres a new game You're in the second round of the play-off's now The lions will now play against \(newTeam.TeamName)"
                
                if pointTotal >= newTeam.Score {
                    
                    
                    gameResults += " Great job, \(coachName)! You Won against the \(newTeam.TeamName)! That means you are moving on to the next Play-Off game!"
                    
                    //footBallVM.totalWins += 1
                    POteams.removeAll(where: {$0 == newTeam })
                    didWinSecondRound = true
                    
                } else if pointTotal < newTeam.Score {
                    gameResults += " Your team lost against the \(newTeam.TeamName), SOL!"
                    
                    //footBallVM.totalLosses += 1
                    return gameResults
                }
                
            }
            
            
        }
        
        if didWinSecondRound == true {
            
            if let newTeam = POteams.randomElement() {
                gameResults += " Last game in the play-offs, good luck! If we make it, we are going to the Superbowl for the first time in history!! The lions will now play against \(newTeam.TeamName)"
                
                if pointTotal >= newTeam.Score {
                    
                    
                    gameResults += " Great job, \(coachName)! You Won against the \(newTeam.TeamName)! You made histroy, you are taking the Lions to the Superbowl!"
                    
                    //footBallVM.totalWins += 1
                    POteams.removeAll(where: {$0 == newTeam })
                    didWinThirdRound = true
                    
                } else if pointTotal < newTeam.Score {
                    gameResults += " Your team lost against the \(newTeam.TeamName), SOL!"
                    
                    //footBallVM.totalLosses += 1
                    return gameResults
                }
                
            }
            
            
        }
        
        if didWinThirdRound == true {
            
            if let newTeam = POteams.randomElement() {
                gameResults += " Welcome to the Superbowl!! Now is your chance to show that the Lions really are the Kings of the NFL. This is your day to make Detroit proud The lions will now play against \(newTeam.TeamName)"
                
                if pointTotal >= newTeam.Score {
                    
                    
                    gameResults += " Great job, \(coachName)! You Won against the \(newTeam.TeamName)! YOU DID IT!!!!"
                    
                    
                    
                    //footBallVM.totalWins += 1
                    POteams.removeAll(where: {$0 == newTeam })
                    didWinSuperbowl = true
                    
                } else if pointTotal < newTeam.Score {
                    gameResults += " Your team lost against the \(newTeam.TeamName), SOL!"
                    
                    
                    //footBallVM.totalLosses += 1
                return gameResults
                }
                
            }
        }
        return gameResults
    }
    
        struct OpponentModel: Identifiable, Equatable {
            var id = UUID()
            let TeamName:String
            let Score:Int
            var gameWeek : String
            var opponentPlaying: String
            
        }
    }
