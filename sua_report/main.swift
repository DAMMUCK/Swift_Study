//
//  main.swift
//  sua_report
//  작성자: sua so
//
//  학생 정보입력, 정보조회, 정보삭제하는 프로그램
//
//
//  Created by osx_swift1111 on 16/10/2019.
//  Copyright © 2019 osx_swift1111. All rights reserved.
//

import Foundation

var num:Int=0//입력된 학생수 count

class Student{
    var id:Int = 0
    var name:String = ""
    var score=Array(repeating:0,count:3)
    var tel:String = ""
    
    init(){}
}

class StudentManager:Student{
    var students:[Student]=[]
    var avg:Int{
        get{
            let num=(score[0]+score[1]+score[2])/3
            return num
        }
    }
    
    init(id:Int,name:String,tel:String,eng:Int,math:Int,kor:Int){
        super.init()
        self.id=id
        self.name=name
        self.tel=tel
        self.score.insert(eng,at:0)
        self.score.insert(math,at:1)
        self.score.insert(kor,at:2)
    }
    
    func print_avg()->Int{
        return self.avg
    }
}

var studList:[StudentManager]=[StudentManager]()

func print_menu(){
    print("=============================")
    print("1. 학생정보,성적입력")
    print("2. 학생리스트보기(id순)")
    print("3. 학생성적보기(평점순)")
    print("4. 학생정보수정")
    print("5. 학생정보삭제")
    print("0. 종료")
}

func input_Info()->StudentManager{
    
    print("학번:",terminator:"")
    let id=Int(readLine()!)
    print("이름:",terminator:"")
    let name=readLine()
    print("전화번호:",terminator:"")
    let tel=readLine()
    print("영어점수:",terminator:"")
    let eng=Int(readLine()!)
    print("수학점수:",terminator:"")
    let math=Int(readLine()!)
    print("국어점수:",terminator:"")
    let kor=Int(readLine()!)
    
    //인스턴스 생성
    let manager=StudentManager(id:id!,name:name!,tel:tel!,eng:eng!,math:math!,kor:kor!)
    return manager
}


func print_studentList(studLists:[StudentManager]){
    if(num==0){print("정보를 입력해주세요.")}
    else{
        for studEntry in studLists{
            print("학번:\(studEntry.id), 이름:\(studEntry.name), 전화번호:\(studEntry.tel), 영어:\(studEntry.score[0]), 수학:\(studEntry.score[1]), 국어:\(studEntry.score[2]), 평균:\(studEntry.print_avg())")
        }
    }
}

func revise_info(value:Int)
{
    var count:Int=0
    for entry in studList{
        if(entry.id==value){
            studList.remove(at:count)
            studList.insert(input_Info(),at:count)
            break
        }else{
            count=count+1
            if(count==num){
            print("없는 정보입니다.")
            }
        }
    }
    print_studentList(studLists: studList)
}

func remove_info(value:Int)
{
    var count:Int=0
    for entry in studList{
        if(entry.id==value){
            studList.remove(at:count)
            num-=1
            print("삭제완료했습니다.")
            break
        }else{
            count=count+1
            if(count==num){
                print("없는 정보입니다.")
            }
        }
    }
    print_studentList(studLists: studList)
}

while true{
    print_menu()
    print("입력 : ",terminator:"")
    let select=Int(readLine()!)!
        if select==1{
            studList.append(input_Info())
            num+=1
        }else if select==2{
            let sortId=studList.sorted(by:{$0.id<$1.id})
            print_studentList(studLists:sortId)
        }
        else if select==3{
            let sortAvg=studList.sorted(by:{$0.avg>$1.avg})
            print_studentList(studLists:sortAvg)
        }
        else if select==4{
            print("학번입력:",terminator:"")
            let choice=Int(readLine()!)!
            revise_info(value:choice)
        }else if select==5{
            print("학번입력:",terminator:"")
            let input=Int(readLine()!)!
            remove_info(value:input)
        }
        else if select==0{
            print("종료합니다!")
            break
        }else{print("0~5사이 숫자만 입력해주세요")}
}


