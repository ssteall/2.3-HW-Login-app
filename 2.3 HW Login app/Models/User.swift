//
//  User.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 22.03.2022.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
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
                            about: "Тут должно быть что-то интересное, но не сегодня",
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
    let photo: String
    let name: String
    let surname: String
    let age: Int
    let city: String
    let contactNumber: String
    let email: String
    let expirience: [Expirience]
    let skill: [String]
    let hobby: [String]
    let about: String
    let education: [Education]
}

struct Expirience {
    let startYear: Int
    let endYear: Int
    let organization: String
    let position: String
    let description: String
}

struct Education {
    let startYear: Int
    let endYear: Int
    let typeOfEducation: TypeOfEducation
    let educationalOrganization: String
    let specialization: String
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

