//
//  ViewModel.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import Foundation

class MockData {
    static let arrOfOeuvres = [
        Oeuvre(
            title: "Liberté Égalité Fraternité",
            description:
                "Coming from the skateboard scene, he first became known by the stickers André the Giant Has in Posse, who gave the campaign Obey Giant. His work became world famous during the 2008 US presidential campaign, with the creation of Barack Obama's HOPE poster that will become an image-icon of the campaign. The Boston Institute of Contemporary Art considers him to be one of the best-known, best and most influential street artists of the moment. Fresco, produced in June 2016, a few months after the international summit of the COP21 (climate conference) in Paris in 2015, it is called \"Dedicate Balance\" and is part of the series \"Earth Crisis\" Ecological emergency.",
            type: .mural,
            condition: "Bon état",
            date: "",
            author: "CitéCréation",
            city: "Paris",
            address: "186 Rue nationale, Paris, France",
            latitude: 45.7799,
            longitude: 4.8260,
            photo: .liberty,
            isDiscovered: false
        ),
        Oeuvre(
            title: "La Joconde de Marseille",
            description:
                "Façade aveugle de 800 m² représentant une trentaine de personnalités lyonnaises célèbres (Bocuse, Bernard Pivot, Frédéric Dard, les frères Lumière…).",
            type: .mural,
            condition: "Bon état",
            date: "",
            author: "CitéCréation",
            city: "Lyon",
            address:
                "49 quai Saint-Vincent (angle 2 rue de la Martinière), 69001 Lyon",
            latitude: 45.7679,
            longitude: 4.8294,
            photo: .saint,
            isDiscovered: false
        ),
        Oeuvre(
            title: "La maison de Cécile",
            description:
                "Mur peint de 400 m² figurant une immense bibliothèque rassemblant des centaines d'auteurs liés à Lyon et à la région Rhône-Alpes.",
            type: .stencil,
            condition: "Bon état",
            date: "",
            author: "CitéCréation",
            city: "Lyon",
            address:
                "6 rue de la Platière (angle rue de la Pêcherie), 69001 Lyon",
            latitude: 45.7659,
            longitude: 4.8311,
            photo: .saint,
            isDiscovered: false,
        ),
        Oeuvre(
            title: "Chloé",
            description:
                "Trois fresques géantes (450 m²) aux couleurs mexicaines sur l'Espace Diego Rivera, commandées par la Fondation Diego Rivera.",
            type: .mural,
            condition: "Bon état",
            date: "",
            author: "CitéCréation",
            city: "Lyon",
            address: "23 rue Georges-Gouy, 69007 Lyon",
            latitude: 45.7263,
            longitude: 4.8330,
            photo: .saint,
            isDiscovered: false
        ),
        Oeuvre(
            title: "PA_278",
            description:
                "Parcours de 25 murs peints (≈230 m² chacun) illustrant l'œuvre de l'architecte Tony Garnier et des « cités idéales ». Labellisé par l'UNESCO en 1991.",
            type: .calligraphie,
            condition: "Bon état",
            date: "",
            author: "CitéCréation",
            city: "Lyon",
            address: "Boulevard des États-Unis, 69008 Lyon",
            latitude: 45.7261,
            longitude: 4.8703,
            photo: .saint,
            isDiscovered: false
        ),
        Oeuvre(
            title: "Chuuuut...",
            description:
                "Espace d'expression libre géré par l'association Le M.U.R. depuis 2007 : une nouvelle œuvre recouvre la précédente toutes les ~3 semaines. Plus de 250 artistes y sont passés.",
            type: .mural,
            condition: "Évolutif (renouvelé régulièrement)",
            date: "",
            author: "Association Le M.U.R. (artistes variés)",
            city: "Paris",
            address: "107 rue Oberkampf (angle rue Saint-Maur), 75011 Paris",
            latitude: 48.8657,
            longitude: 2.3779,
            photo: .saint,
            isDiscovered: false
        ),
        Oeuvre(
            title: "Le Tigre et la Cigale",
            description:
                "Façade peinte de l'ancien squat d'artistes 59 Rivoli, lieu emblématique de l'art alternatif parisien, dont une œuvre de Jef Aérosol.",
            type: .mural,
            condition: "Bon état",
            date: "",
            author: "Collectif 59 Rivoli (dont Jef Aérosol)",
            city: "Paris",
            address: "59 rue de Rivoli, 75001 Paris",
            latitude: 48.8588,
            longitude: 2.3470,
            photo: .saint,
            isDiscovered: false
        ),
    ]

   static let arrOfArtist = [
        Artist(
            name: "KAN DMV",
            age: "49 ans",
            origines: "France",
            style: "Pointillisme",
        ),
        Artist(
            name: "Kitsune Jolene",
            age: "34 ans",
            origines: "Belgique",
            style: "Mural",
            image: .kitsuneJolene
        ),
        Artist(
            name: "Aero",
            age: "NC",
            origines: "France",
            style: "Aérographe",
            image: .aero
        ),
        Artist(
            name: "Seth Globepainter",
            age: "54 ans",
            origines: "France",
            style: "Globepainter",
            image: .sethGlobepainter
        ),
        Artist(
            name: "JDL",
            age: "30 ans",
            origines: "Pays-Bas",
            style: "Mural",
            image: .jdl
        ),
        Artist(
            name: "Shepard Fairey",
            age: "56 ans",
            origines: "USA",
            style: "Mural",
            image: .shepardFairey,
        ),

    ]

    static let mockData = arrOfOeuvres[0]

    static func filter(by type: OeuvreType) -> [Oeuvre] {
        if type == .tous {
            arrOfOeuvres
        } else {
            arrOfOeuvres.filter { $0.type == type }
        }
    }

}
