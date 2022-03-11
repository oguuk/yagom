//
//  main.swift
//  yagom
//
//  Created by 오국원 on 2022/03/11.
//

import Foundation

var lists: [String: Set<String>] = [:]
var flag = 1
while flag == 1{
    print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
    print("메뉴를 선택해주세요 :",terminator: "")
    let menu = readLine()!
    switch menu
    {
    case "1":
        insertInfo()
    case "2":
        for value in lists.values{
            print("- \(value)")
        }
    case "3":
        print("연락처에서 찾을 이름을 입력해주세요 : ",terminator: "")
        let name:String = readLine()!
        if lists[name]?.count ?? 0 > 0 {
            for info in lists[name]!{
                print("- \(info)")
            }
        }
        else{
            print("연락처에 \(name)이 업습니다.")
        }
    case "x":
        print("[프로그램 종료]")
        flag = 0
    default:
        print("선택이 잘못되었습니다 확인 후 다시 입력해주세요")
    }
}

func insertInfo() -> Void{
    print("연락처 정보를 입력해주세요 : ",terminator: "")
    let infoStr:String? = readLine()!
    if infoStr?.filter({$0 == "/"}).count ?? 0 < 2{
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        return insertInfo()
    }
    let infoSplit = infoStr!.components(separatedBy: "/")
    let name = infoSplit[0].components(separatedBy: " ").joined()
    let age = infoSplit[1].trimmingCharacters(in: .whitespaces)
    let number = infoSplit[2].trimmingCharacters(in: .whitespaces)
    
    guard name.count < 999 && Int(age) != nil else {//나이정보 확인
        print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return insertInfo()
    }

    guard number.filter({$0 == "-"}).count > 1 && number.count > 6 else {
        print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        return insertInfo()
    }
    if lists[name] == nil{
        lists[name] = ["\(name) / \(age) / \(number)"]
    }
    lists[name]?.insert("\(name) / \(age) / \(number)")
    print("입력한 정보는 \(age) \(name) (\(number))입니다.")
}


