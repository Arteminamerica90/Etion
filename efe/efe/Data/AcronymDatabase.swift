//
//  AcronymDatabase.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class AcronymDatabase {
    static let shared = AcronymDatabase()
    
    // База данных аббревиатур с расшифровками
    private let acronyms: [String: [Language: String]] = [
        "LTV": [
            .english: "Lifetime Value",
            .french: "Valeur vie client",
            .spanish: "Valor de vida del cliente",
            .chinese: "客户生命周期价值",
            .portuguese: "Valor do ciclo de vida do cliente",
            .italian: "Valore del ciclo di vita del cliente"
        ],
        "CAC": [
            .english: "Customer Acquisition Cost",
            .french: "Coût d'acquisition client",
            .spanish: "Costo de adquisición de clientes",
            .chinese: "客户获取成本",
            .portuguese: "Custo de aquisição de clientes",
            .italian: "Costo di acquisizione clienti"
        ],
        "ROI": [
            .english: "Return on Investment",
            .french: "Retour sur investissement",
            .spanish: "Retorno de inversión",
            .chinese: "投资回报率",
            .portuguese: "Retorno sobre investimento",
            .italian: "Ritorno sull'investimento"
        ],
        "KPI": [
            .english: "Key Performance Indicator",
            .french: "Indicateur clé de performance",
            .spanish: "Indicador clave de rendimiento",
            .chinese: "关键绩效指标",
            .portuguese: "Indicador-chave de desempenho",
            .italian: "Indicatore chiave di prestazione"
        ],
        "HR": [
            .english: "Human Resources",
            .french: "Ressources humaines",
            .spanish: "Recursos humanos",
            .chinese: "人力资源",
            .portuguese: "Recursos humanos",
            .italian: "Risorse umane"
        ],
        "CRM": [
            .english: "Customer Relationship Management",
            .french: "Gestion de la relation client",
            .spanish: "Gestión de relaciones con clientes",
            .chinese: "客户关系管理",
            .portuguese: "Gestão de relacionamento com clientes",
            .italian: "Gestione delle relazioni con i clienti"
        ],
        "SEO": [
            .english: "Search Engine Optimization",
            .french: "Optimisation pour les moteurs de recherche",
            .spanish: "Optimización para motores de búsqueda",
            .chinese: "搜索引擎优化",
            .portuguese: "Otimização para mecanismos de busca",
            .italian: "Ottimizzazione per i motori di ricerca"
        ],
        "SEM": [
            .english: "Search Engine Marketing",
            .french: "Marketing sur les moteurs de recherche",
            .spanish: "Marketing en motores de búsqueda",
            .chinese: "搜索引擎营销",
            .portuguese: "Marketing em mecanismos de busca",
            .italian: "Marketing sui motori di ricerca"
        ],
        "API": [
            .english: "Application Programming Interface",
            .french: "Interface de programmation d'applications",
            .spanish: "Interfaz de programación de aplicaciones",
            .chinese: "应用程序编程接口",
            .portuguese: "Interface de programação de aplicações",
            .italian: "Interfaccia di programmazione delle applicazioni"
        ],
        "SaaS": [
            .english: "Software as a Service",
            .french: "Logiciel en tant que service",
            .spanish: "Software como servicio",
            .chinese: "软件即服务",
            .portuguese: "Software como serviço",
            .italian: "Software come servizio"
        ],
        "B2B": [
            .english: "Business to Business",
            .french: "Entreprise à entreprise",
            .spanish: "Empresa a empresa",
            .chinese: "企业对企业",
            .portuguese: "Empresa para empresa",
            .italian: "Business to business"
        ],
        "B2C": [
            .english: "Business to Consumer",
            .french: "Entreprise à consommateur",
            .spanish: "Empresa a consumidor",
            .chinese: "企业对消费者",
            .portuguese: "Empresa para consumidor",
            .italian: "Business to consumer"
        ],
        "MVP": [
            .english: "Minimum Viable Product",
            .french: "Produit minimum viable",
            .spanish: "Producto mínimo viable",
            .chinese: "最小可行产品",
            .portuguese: "Produto mínimo viável",
            .italian: "Prodotto minimo vitale"
        ],
        "CTR": [
            .english: "Click-Through Rate",
            .french: "Taux de clic",
            .spanish: "Tasa de clics",
            .chinese: "点击率",
            .portuguese: "Taxa de cliques",
            .italian: "Tasso di clic"
        ],
        "CPC": [
            .english: "Cost Per Click",
            .french: "Coût par clic",
            .spanish: "Costo por clic",
            .chinese: "每次点击成本",
            .portuguese: "Custo por clique",
            .italian: "Costo per clic"
        ],
        "CPM": [
            .english: "Cost Per Mille",
            .french: "Coût pour mille",
            .spanish: "Costo por mil",
            .chinese: "每千次展示成本",
            .portuguese: "Custo por mil",
            .italian: "Costo per mille"
        ],
        "CPA": [
            .english: "Cost Per Acquisition",
            .french: "Coût par acquisition",
            .spanish: "Costo por adquisición",
            .chinese: "每次获取成本",
            .portuguese: "Custo por aquisição",
            .italian: "Costo per acquisizione"
        ],
        "SWOT": [
            .english: "Strengths, Weaknesses, Opportunities, Threats",
            .french: "Forces, Faiblesses, Opportunités, Menaces",
            .spanish: "Fortalezas, Debilidades, Oportunidades, Amenazas",
            .chinese: "优势、劣势、机会、威胁",
            .portuguese: "Forças, Fraquezas, Oportunidades, Ameaças",
            .italian: "Punti di forza, Debolezze, Opportunità, Minacce"
        ]
    ]
    
    // Получить расшифровку аббревиатуры
    func getDecryption(for acronym: String, language: Language) -> String? {
        return acronyms[acronym.uppercased()]?[language]
    }
    
    // Проверить, является ли слово аббревиатурой
    func isAcronym(_ word: String) -> Bool {
        return acronyms[word.uppercased()] != nil
    }
    
    private init() {}
}

