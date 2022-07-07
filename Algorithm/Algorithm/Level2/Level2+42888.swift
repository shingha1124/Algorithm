//
//  Level2_42888.swift
//  Algorithm
//
//  Created by seongha shin on 2022/07/07.
//

import Foundation

//https://school.programmers.co.kr/learn/courses/30/lessons/42888
class Level2_42888 {
    func start() {
        print(solution2(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
    }
    
    enum State: String {
        case enter
        case leave
        case change
        
        var message: String {
            switch self {
            case .enter:
                return "님이 들어왔습니다."
            case .leave:
                return "님이 나갔습니다."
            default:
                return ""
            }
        }
    }
    
    class Chat {
        let id: String
        let state: State
        
        init(id: String, state: State) {
            self.id = id
            self.state = state
        }
    }
    
    class User {
        let id: String
        var nickName: String
        
        init(id: String, nickName: String) {
            self.id = id
            self.nickName = nickName
        }
        
        func changeNickName(_ nickName: String) {
            self.nickName = nickName
        }
    }
    
    func solution(_ record:[String]) -> [String] {
        var chats = [Chat]()
        var userChat = [String: User]()
        
        record.forEach {
            let data = $0.split(separator: " ").map { String($0) }
            
            let state = State.init(rawValue: data[0].lowercased())!
            let id = data[1]
            let nickName = data.count == 3 ? data[2] : nil
            
            let chat = Chat(id: id, state: state)
            
            if let nickName = nickName {
                if userChat.keys.contains(id) == false {
                    userChat[id] = User(id: id, nickName: nickName)
                }
                
                if state == .change || state == .enter {
                    userChat[id]?.nickName = nickName
                }
            }
            chats.append(chat)
        }
        
        let messages = chats.filter { $0.state != .change }.map { chat -> String in
            let id = chat.id
            let nickName = userChat[id]?.nickName ?? ""
            let message = chat.state.message
            return "\(nickName)\(message)"
        }
        return messages
    }
    
    func solution2(_ record:[String]) -> [String] {
        let state = ["Enter": "님이 들어왔습니다.", "Leave": "님이 나갔습니다."]
        var nickName = [String: String]()
        
        record.forEach {
            let split = $0.components(separatedBy: " ")
            if split.count > 2 {
                nickName[split[1]] = split[2]
            }
        }
        
        return record.filter { !$0.contains("Change") }
            .map { chat -> String in
                let split = chat.components(separatedBy: " ")
                let message = "\(nickName[split[1]]!)\(state[split[0]]!)"
                return message
            }
        
    }
}
