//
//  User.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 22.03.2022.
//

import Foundation
import UIKit

struct User {
    var userName: String
    var password: String
    var person: Person
    
    static func getUser() -> User {
        User(userName: "user",
             password: "password",
             person: Person(photo: "Profile",
                            name: "Дмитрий",
                            surname: "Мирошников",
                            age: 27,
                            city: "Москва",
                            contactNumber: "8977138****",
                            email: "ssteamm**@gmail.com",
                            expirience: [Expirience(startYear: 2016,
                                                    endYear: 2021,
                                                    organization: "IBS",
                                                    position: "IT project manager",
                                                    description: "работа c гос сектором - тоска смертная"),
                                         Expirience(startYear: 2021,
                                                    endYear: 2022,
                                                    organization: "БСТ",
                                                    position: "senior project manager",
                                                    description: "И снова работа с гос сектором")],
                            skill: ["ms office", "jira", "confluence", "asana", "agile"],
                            hobby: ["Snowboarding", "surfing"],
                            about: "lorem",
                            education: [Education(startYear: 2011,
                                                  endYear: 2015,
                                                  typeOfEducation: .bachelorsDegree,
                                                  educationalOrganization: "МИСиС",
                                                  specialization: "Прикладная информатика в экономике"),
                                       Education(startYear: 2015,
                                                 endYear: 2017,
                                                 typeOfEducation: .mastersDegree,
                                                 educationalOrganization: "МИСиС",
                                                 specialization: "Информационные бизнес системы")]))
    }
}

struct Person {
    var photo: String
    var name: String
    var surname: String
    var age: Int
    var city: String
    var contactNumber: String
    var email: String
    var expirience: [Expirience]
    var skill: [String]
    var hobby: [String]
    var about: String
    var education: [Education]
}

struct Expirience {
    var startYear: Int
    var endYear: Int
    var organization: String
    var position: String
    var description: String
}

struct Education {
    var startYear: Int
    var endYear: Int
    var typeOfEducation: TypeOfEducation
    var educationalOrganization: String
    var specialization: String
}

enum TypeOfEducation: String {
    case primarySchool = "Начальная школа"
    case basicGeneralEducation = "Средняя школа"
    case secondarySchool = "Среднее образование"
    case lowerPostSecondaryVocationalEducation = "Среднее профессиональное образование"
    case bachelorsDegree = "Бакалавриат"
    case specialistDegree = "Специалитет"
    case mastersDegree = "Магистратура"
    case postgraduateDegree = "Аспирантура"
}

