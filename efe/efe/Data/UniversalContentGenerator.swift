//
//  UniversalContentGenerator.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class UniversalContentGenerator {
    // Базовые профессиональные термины для всех категорий
    private static let baseProfessionalTerms: [String: [(russian: String, translations: [Language: String])]] = [
        "HR и рекрутинг": [
            ("Сотрудник", [Language.english: "Employee", Language.french: "Employé", Language.spanish: "Empleado", Language.chinese: "员工", Language.portuguese: "Funcionário", Language.italian: "Dipendente"]),
            ("Работодатель", [Language.english: "Employer", Language.french: "Employeur", Language.spanish: "Empleador", Language.chinese: "雇主", Language.portuguese: "Empregador", Language.italian: "Datore di lavoro"]),
            ("Резюме", [Language.english: "Resume", Language.french: "CV", Language.spanish: "Currículum", Language.chinese: "简历", Language.portuguese: "Currículo", Language.italian: "Curriculum"]),
            ("Интервью", [Language.english: "Interview", Language.french: "Entretien", Language.spanish: "Entrevista", Language.chinese: "面试", Language.portuguese: "Entrevista", Language.italian: "Colloquio"]),
            ("Найм", [Language.english: "Hiring", Language.french: "Recrutement", Language.spanish: "Contratación", Language.chinese: "招聘", Language.portuguese: "Contratação", Language.italian: "Assunzione"]),
            ("Зарплата", [Language.english: "Salary", Language.french: "Salaire", Language.spanish: "Salario", Language.chinese: "工资", Language.portuguese: "Salário", Language.italian: "Stipendio"]),
            ("Обучение", [Language.english: "Training", Language.french: "Formation", Language.spanish: "Capacitación", Language.chinese: "培训", Language.portuguese: "Treinamento", Language.italian: "Formazione"]),
            ("Развитие", [Language.english: "Development", Language.french: "Développement", Language.spanish: "Desarrollo", Language.chinese: "发展", Language.portuguese: "Desenvolvimento", Language.italian: "Sviluppo"]),
            ("Оценка", [Language.english: "Evaluation", Language.french: "Évaluation", Language.spanish: "Evaluación", Language.chinese: "评估", Language.portuguese: "Avaliação", Language.italian: "Valutazione"]),
            ("Мотивация", [Language.english: "Motivation", Language.french: "Motivation", Language.spanish: "Motivación", Language.chinese: "动机", Language.portuguese: "Motivação", Language.italian: "Motivazione"])
        ],
        "Операции": [
            ("Процесс", [Language.english: "Process", Language.french: "Processus", Language.spanish: "Proceso", Language.chinese: "过程", Language.portuguese: "Processo", Language.italian: "Processo"]),
            ("Операция", [Language.english: "Operation", Language.french: "Opération", Language.spanish: "Operación", Language.chinese: "运营", Language.portuguese: "Operação", Language.italian: "Operazione"]),
            ("Эффективность", [Language.english: "Efficiency", Language.french: "Efficacité", Language.spanish: "Eficiencia", Language.chinese: "效率", Language.portuguese: "Eficiência", Language.italian: "Efficienza"]),
            ("Производительность", [Language.english: "Productivity", Language.french: "Productivité", Language.spanish: "Productividad", Language.chinese: "生产力", Language.portuguese: "Produtividade", Language.italian: "Produttività"]),
            ("Оптимизация", [Language.english: "Optimization", Language.french: "Optimisation", Language.spanish: "Optimización", Language.chinese: "优化", Language.portuguese: "Otimização", Language.italian: "Ottimizzazione"]),
            ("Стандартизация", [Language.english: "Standardization", Language.french: "Standardisation", Language.spanish: "Estandarización", Language.chinese: "标准化", Language.portuguese: "Padronização", Language.italian: "Standardizzazione"]),
            ("Автоматизация", [Language.english: "Automation", Language.french: "Automatisation", Language.spanish: "Automatización", Language.chinese: "自动化", Language.portuguese: "Automação", Language.italian: "Automazione"]),
            ("Контроль качества", [Language.english: "Quality control", Language.french: "Contrôle qualité", Language.spanish: "Control de calidad", Language.chinese: "质量控制", Language.portuguese: "Controle de qualidade", Language.italian: "Controllo qualità"]),
            ("Управление цепочкой поставок", [Language.english: "Supply chain management", Language.french: "Gestion de la chaîne d'approvisionnement", Language.spanish: "Gestión de cadena de suministro", Language.chinese: "供应链管理", Language.portuguese: "Gestão da cadeia de suprimentos", Language.italian: "Gestione della catena di fornitura"]),
            ("Логистика", [Language.english: "Logistics", Language.french: "Logistique", Language.spanish: "Logística", Language.chinese: "物流", Language.portuguese: "Logística", Language.italian: "Logistica"])
        ],
        "Аналитика данных": [
            ("Данные", [Language.english: "Data", Language.french: "Données", Language.spanish: "Datos", Language.chinese: "数据", Language.portuguese: "Dados", Language.italian: "Dati"]),
            ("Анализ", [Language.english: "Analysis", Language.french: "Analyse", Language.spanish: "Análisis", Language.chinese: "分析", Language.portuguese: "Análise", Language.italian: "Analisi"]),
            ("Аналитика", [Language.english: "Analytics", Language.french: "Analytique", Language.spanish: "Analítica", Language.chinese: "分析", Language.portuguese: "Analytics", Language.italian: "Analitica"]),
            ("Метрика", [Language.english: "Metric", Language.french: "Métrique", Language.spanish: "Métrica", Language.chinese: "指标", Language.portuguese: "Métrica", Language.italian: "Metrica"]),
            ("Отчет", [Language.english: "Report", Language.french: "Rapport", Language.spanish: "Informe", Language.chinese: "报告", Language.portuguese: "Relatório", Language.italian: "Rapporto"]),
            ("Визуализация", [Language.english: "Visualization", Language.french: "Visualisation", Language.spanish: "Visualización", Language.chinese: "可视化", Language.portuguese: "Visualização", Language.italian: "Visualizzazione"]),
            ("Дашборд", [Language.english: "Dashboard", Language.french: "Tableau de bord", Language.spanish: "Panel de control", Language.chinese: "仪表板", Language.portuguese: "Painel", Language.italian: "Dashboard"]),
            ("Прогнозирование", [Language.english: "Forecasting", Language.french: "Prévision", Language.spanish: "Pronóstico", Language.chinese: "预测", Language.portuguese: "Previsão", Language.italian: "Previsione"]),
            ("Модель", [Language.english: "Model", Language.french: "Modèle", Language.spanish: "Modelo", Language.chinese: "模型", Language.portuguese: "Modelo", Language.italian: "Modello"]),
            ("Инсайт", [Language.english: "Insight", Language.french: "Perspective", Language.spanish: "Perspectiva", Language.chinese: "洞察", Language.portuguese: "Insight", Language.italian: "Insight"])
        ]
    ]
    
    // Генерация уникальных слов для категории
    static func generateWords(for category: String, difficulty: DifficultyLevel, count: Int) -> [(russian: String, translations: [Language: String])] {
        var words: [(russian: String, translations: [Language: String])] = []
        var usedWords = Set<String>() // Для отслеживания уникальности
        
        // Используем базовые термины, если они есть
        if let baseTerms = baseProfessionalTerms[category] {
            for term in baseTerms {
                if !usedWords.contains(term.russian) {
                    words.append(term)
                    usedWords.insert(term.russian)
                }
            }
        }
        
        // Отключаем генерацию слов из ключевых слов категорий, так как это создает некорректные слова
        // let categoryWords = getCategorySpecificWords(category: category, difficulty: difficulty)
        // for word in categoryWords {
        //     if !usedWords.contains(word.russian) {
        //         words.append(word)
        //         usedWords.insert(word.russian)
        //     }
        // }
        
        // Используем расширенную базу данных для категории
        let extendedWords = getExtendedCategoryWords(category: category, difficulty: difficulty)
        for word in extendedWords {
            if !usedWords.contains(word.russian) && words.count < count {
                words.append(word)
                usedWords.insert(word.russian)
            }
        }
        
        // Если нужно больше слов, используем общие профессиональные термины
        while words.count < count {
            let generalTerms = getGeneralProfessionalTerms(difficulty: difficulty)
            guard !generalTerms.isEmpty else {
                break // Защита от бесконечного цикла
            }
            for term in generalTerms {
                if !usedWords.contains(term.russian) && words.count < count {
                    words.append(term)
                    usedWords.insert(term.russian)
                }
            }
            // Если все общие термины уже использованы, останавливаемся
            if words.count == usedWords.count {
                break
            }
        }
        
        return Array(words.prefix(count))
    }
    
    // Расширенная база данных слов для категорий
    private static func getExtendedCategoryWords(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        // Большая база уникальных слов для каждой категории
        // Это будет расширяться по мере необходимости
        let extendedDatabase: [String: [DifficultyLevel: [(russian: String, translations: [Language: String])]]] = [
            "HR и рекрутинг": [
                .beginner: [
                    ("Сотрудник", [Language.english: "Employee", Language.french: "Employé", Language.spanish: "Empleado", Language.chinese: "员工", Language.portuguese: "Funcionário", Language.italian: "Dipendente"]),
                    ("Работодатель", [Language.english: "Employer", Language.french: "Employeur", Language.spanish: "Empleador", Language.chinese: "雇主", Language.portuguese: "Empregador", Language.italian: "Datore di lavoro"]),
                    ("Резюме", [Language.english: "Resume", Language.french: "CV", Language.spanish: "Currículum", Language.chinese: "简历", Language.portuguese: "Currículo", Language.italian: "Curriculum"]),
                    ("Интервью", [Language.english: "Interview", Language.french: "Entretien", Language.spanish: "Entrevista", Language.chinese: "面试", Language.portuguese: "Entrevista", Language.italian: "Colloquio"]),
                    ("Найм", [Language.english: "Hiring", Language.french: "Recrutement", Language.spanish: "Contratación", Language.chinese: "招聘", Language.portuguese: "Contratação", Language.italian: "Assunzione"]),
                    ("Зарплата", [Language.english: "Salary", Language.french: "Salaire", Language.spanish: "Salario", Language.chinese: "工资", Language.portuguese: "Salário", Language.italian: "Stipendio"]),
                    ("Обучение", [Language.english: "Training", Language.french: "Formation", Language.spanish: "Capacitación", Language.chinese: "培训", Language.portuguese: "Treinamento", Language.italian: "Formazione"]),
                    ("Развитие", [Language.english: "Development", Language.french: "Développement", Language.spanish: "Desarrollo", Language.chinese: "发展", Language.portuguese: "Desenvolvimento", Language.italian: "Sviluppo"]),
                    ("Оценка", [Language.english: "Evaluation", Language.french: "Évaluation", Language.spanish: "Evaluación", Language.chinese: "评估", Language.portuguese: "Avaliação", Language.italian: "Valutazione"]),
                    ("Мотивация", [Language.english: "Motivation", Language.french: "Motivation", Language.spanish: "Motivación", Language.chinese: "动机", Language.portuguese: "Motivação", Language.italian: "Motivazione"]),
                    ("Команда", [Language.english: "Team", Language.french: "Équipe", Language.spanish: "Equipo", Language.chinese: "团队", Language.portuguese: "Equipe", Language.italian: "Squadra"]),
                    ("Коллега", [Language.english: "Colleague", Language.french: "Collègue", Language.spanish: "Colega", Language.chinese: "同事", Language.portuguese: "Colega", Language.italian: "Collega"]),
                    ("Руководитель", [Language.english: "Manager", Language.french: "Manager", Language.spanish: "Gerente", Language.chinese: "经理", Language.portuguese: "Gerente", Language.italian: "Manager"]),
                    ("Подчиненный", [Language.english: "Subordinate", Language.french: "Subordonné", Language.spanish: "Subordinado", Language.chinese: "下属", Language.portuguese: "Subordinado", Language.italian: "Subordinato"]),
                    ("Должность", [Language.english: "Position", Language.french: "Poste", Language.spanish: "Posición", Language.chinese: "职位", Language.portuguese: "Posição", Language.italian: "Posizione"]),
                    ("Вакансия", [Language.english: "Vacancy", Language.french: "Poste vacant", Language.spanish: "Vacante", Language.chinese: "空缺", Language.portuguese: "Vaga", Language.italian: "Vacante"]),
                    ("Кандидат", [Language.english: "Candidate", Language.french: "Candidat", Language.spanish: "Candidato", Language.chinese: "候选人", Language.portuguese: "Candidato", Language.italian: "Candidato"]),
                    ("Навыки", [Language.english: "Skills", Language.french: "Compétences", Language.spanish: "Habilidades", Language.chinese: "技能", Language.portuguese: "Habilidades", Language.italian: "Competenze"]),
                    ("Опыт работы", [Language.english: "Work experience", Language.french: "Expérience professionnelle", Language.spanish: "Experiencia laboral", Language.chinese: "工作经验", Language.portuguese: "Experiência profissional", Language.italian: "Esperienza lavorativa"]),
                    ("Отпуск", [Language.english: "Vacation", Language.french: "Vacances", Language.spanish: "Vacaciones", Language.chinese: "假期", Language.portuguese: "Férias", Language.italian: "Vacanze"])
                ]
            ]
        ]
        
        return extendedDatabase[category]?[difficulty] ?? []
    }
    
    // Генерация уникальных фраз
    static func generatePhrases(for category: String, difficulty: DifficultyLevel, count: Int) -> [(russian: String, translations: [Language: String])] {
        var phrases: [(russian: String, translations: [Language: String])] = []
        
        let categoryPhrases = getCategorySpecificPhrases(category: category, difficulty: difficulty)
        phrases.append(contentsOf: categoryPhrases)
        
        while phrases.count < count {
            let generalPhrases = getGeneralProfessionalPhrases(difficulty: difficulty)
            guard !generalPhrases.isEmpty else {
                break // Защита от бесконечного цикла
            }
            phrases.append(contentsOf: generalPhrases.prefix(count - phrases.count))
            // Если не добавили новых фраз, выходим из цикла
            if phrases.count < count && generalPhrases.count == 0 {
                break
            }
        }
        
        return Array(phrases.prefix(count))
    }
    
    // Генерация уникальных предложений
    static func generateSentences(for category: String, difficulty: DifficultyLevel, count: Int) -> [(russian: String, translations: [Language: String])] {
        var sentences: [(russian: String, translations: [Language: String])] = []
        
        let categorySentences = getCategorySpecificSentences(category: category, difficulty: difficulty)
        sentences.append(contentsOf: categorySentences)
        
        while sentences.count < count {
            let generalSentences = getGeneralProfessionalSentences(difficulty: difficulty)
            guard !generalSentences.isEmpty else {
                break // Защита от бесконечного цикла
            }
            let beforeCount = sentences.count
            sentences.append(contentsOf: generalSentences.prefix(count - sentences.count))
            // Если не добавили новых предложений, выходим из цикла
            if sentences.count == beforeCount {
                break
            }
        }
        
        return Array(sentences.prefix(count))
    }
    
    // Специфичные слова для категории
    private static func getCategorySpecificWords(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        // Генерируем уникальные слова на основе названия категории
        let categoryKeywords = extractKeywords(from: category)
        var words: [(russian: String, translations: [Language: String])] = []
        
        for keyword in categoryKeywords {
            words.append(createWordFromKeyword(keyword, difficulty: difficulty))
        }
        
        return words
    }
    
    // Специфичные фразы для категории
    private static func getCategorySpecificPhrases(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        let categoryKeywords = extractKeywords(from: category)
        var phrases: [(russian: String, translations: [Language: String])] = []
        
        let actionVerbs = getActionVerbs(difficulty: difficulty)
        for verb in actionVerbs {
            for keyword in categoryKeywords {
                phrases.append(createPhraseFromComponents(verb: verb, keyword: keyword, difficulty: difficulty))
            }
        }
        
        return phrases
    }
    
    // Специфичные предложения для категории
    private static func getCategorySpecificSentences(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        let categoryKeywords = extractKeywords(from: category)
        var sentences: [(russian: String, translations: [Language: String])] = []
        
        let templates = getSentenceTemplates(difficulty: difficulty)
        for template in templates {
            for keyword in categoryKeywords {
                sentences.append(createSentenceFromTemplate(template: template, keyword: keyword, difficulty: difficulty))
            }
        }
        
        return sentences
    }
    
    // Извлечение ключевых слов из названия категории
    private static func extractKeywords(from category: String) -> [String] {
        let words = category.components(separatedBy: CharacterSet(charactersIn: " и "))
        return words.map { $0.trimmingCharacters(in: .whitespaces) }
    }
    
    // Создание слова из ключевого слова
    private static func createWordFromKeyword(_ keyword: String, difficulty: DifficultyLevel) -> (russian: String, translations: [Language: String]) {
        // Используем ключевое слово как основу для создания перевода
        let translations: [Language: String] = [
            Language.english: translateToEnglish(keyword),
            Language.french: translateToFrench(keyword),
            Language.spanish: translateToSpanish(keyword),
            Language.chinese: translateToChinese(keyword),
            Language.portuguese: translateToPortuguese(keyword),
            Language.italian: translateToItalian(keyword)
        ]
        return (keyword, translations)
    }
    
    // Общие профессиональные термины
    private static func getGeneralProfessionalTerms(difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch difficulty {
        case .beginner:
            return [
                ("Процесс", [Language.english: "Process", Language.french: "Processus", Language.spanish: "Proceso", Language.chinese: "过程", Language.portuguese: "Processo", Language.italian: "Processo"]),
                ("Стратегия", [Language.english: "Strategy", Language.french: "Stratégie", Language.spanish: "Estrategia", Language.chinese: "策略", Language.portuguese: "Estratégia", Language.italian: "Strategia"]),
                ("Управление", [Language.english: "Management", Language.french: "Gestion", Language.spanish: "Gestión", Language.chinese: "管理", Language.portuguese: "Gestão", Language.italian: "Gestione"]),
                ("Анализ", [Language.english: "Analysis", Language.french: "Analyse", Language.spanish: "Análisis", Language.chinese: "分析", Language.portuguese: "Análise", Language.italian: "Analisi"]),
                ("Оптимизация", [Language.english: "Optimization", Language.french: "Optimisation", Language.spanish: "Optimización", Language.chinese: "优化", Language.portuguese: "Otimização", Language.italian: "Ottimizzazione"])
            ]
        case .intermediate:
            return [
                ("Стратегическое планирование", [Language.english: "Strategic planning", Language.french: "Planification stratégique", Language.spanish: "Planificación estratégica", Language.chinese: "战略规划", Language.portuguese: "Planejamento estratégico", Language.italian: "Pianificazione strategica"]),
                ("Управление рисками", [Language.english: "Risk management", Language.french: "Gestion des risques", Language.spanish: "Gestión de riesgos", Language.chinese: "风险管理", Language.portuguese: "Gestão de riscos", Language.italian: "Gestione dei rischi"]),
                ("Операционная эффективность", [Language.english: "Operational efficiency", Language.french: "Efficacité opérationnelle", Language.spanish: "Eficiencia operacional", Language.chinese: "运营效率", Language.portuguese: "Eficiência operacional", Language.italian: "Efficienza operativa"]),
                ("Ключевые показатели", [Language.english: "Key metrics", Language.french: "Métriques clés", Language.spanish: "Métricas clave", Language.chinese: "关键指标", Language.portuguese: "Métricas-chave", Language.italian: "Metriche chiave"]),
                ("Бизнес-процесс", [Language.english: "Business process", Language.french: "Processus métier", Language.spanish: "Proceso de negocio", Language.chinese: "业务流程", Language.portuguese: "Processo de negócio", Language.italian: "Processo aziendale"])
            ]
        case .advanced:
            return [
                ("Трансформация бизнеса", [Language.english: "Business transformation", Language.french: "Transformation d'entreprise", Language.spanish: "Transformación empresarial", Language.chinese: "业务转型", Language.portuguese: "Transformação empresarial", Language.italian: "Trasformazione aziendale"]),
                ("Организационная эффективность", [Language.english: "Organizational effectiveness", Language.french: "Efficacité organisationnelle", Language.spanish: "Efectividad organizacional", Language.chinese: "组织效能", Language.portuguese: "Efetividade organizacional", Language.italian: "Efficacia organizzativa"]),
                ("Стратегическое партнерство", [Language.english: "Strategic partnership", Language.french: "Partenariat stratégique", Language.spanish: "Asociación estratégica", Language.chinese: "战略伙伴关系", Language.portuguese: "Parceria estratégica", Language.italian: "Partenariato strategico"]),
                ("Инновационное управление", [Language.english: "Innovation management", Language.french: "Gestion de l'innovation", Language.spanish: "Gestión de la innovación", Language.chinese: "创新管理", Language.portuguese: "Gestão da inovação", Language.italian: "Gestione dell'innovazione"]),
                ("Устойчивое развитие", [Language.english: "Sustainable development", Language.french: "Développement durable", Language.spanish: "Desarrollo sostenible", Language.chinese: "可持续发展", Language.portuguese: "Desenvolvimento sustentável", Language.italian: "Sviluppo sostenibile"])
            ]
        }
    }
    
    // Общие профессиональные фразы
    private static func getGeneralProfessionalPhrases(difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch difficulty {
        case .beginner:
            return [
                ("Разработать стратегию", [Language.english: "Develop a strategy", Language.french: "Développer une stratégie", Language.spanish: "Desarrollar una estrategia", Language.chinese: "制定策略", Language.portuguese: "Desenvolver uma estratégia", Language.italian: "Sviluppare una strategia"]),
                ("Провести анализ", [Language.english: "Conduct analysis", Language.french: "Effectuer une analyse", Language.spanish: "Realizar análisis", Language.chinese: "进行分析", Language.portuguese: "Realizar análise", Language.italian: "Condurre analisi"]),
                ("Оптимизировать процесс", [Language.english: "Optimize process", Language.french: "Optimiser le processus", Language.spanish: "Optimizar el proceso", Language.chinese: "优化流程", Language.portuguese: "Otimizar o processo", Language.italian: "Ottimizzare il processo"])
            ]
        case .intermediate:
            return [
                ("Внедрить систему управления", [Language.english: "Implement management system", Language.french: "Mettre en œuvre un système de gestion", Language.spanish: "Implementar sistema de gestión", Language.chinese: "实施管理系统", Language.portuguese: "Implementar sistema de gestão", Language.italian: "Implementare sistema di gestione"]),
                ("Оптимизировать операционные процессы", [Language.english: "Optimize operational processes", Language.french: "Optimiser les processus opérationnels", Language.spanish: "Optimizar procesos operacionales", Language.chinese: "优化运营流程", Language.portuguese: "Otimizar processos operacionais", Language.italian: "Ottimizzare processi operativi"]),
                ("Управлять ключевыми показателями", [Language.english: "Manage key metrics", Language.french: "Gérer les métriques clés", Language.spanish: "Gestionar métricas clave", Language.chinese: "管理关键指标", Language.portuguese: "Gerenciar métricas-chave", Language.italian: "Gestire metriche chiave"])
            ]
        case .advanced:
            return [
                ("Внедрить стратегическую трансформацию", [Language.english: "Implement strategic transformation", Language.french: "Mettre en œuvre une transformation stratégique", Language.spanish: "Implementar transformación estratégica", Language.chinese: "实施战略转型", Language.portuguese: "Implementar transformação estratégica", Language.italian: "Implementare trasformazione strategica"]),
                ("Оптимизировать организационную структуру", [Language.english: "Optimize organizational structure", Language.french: "Optimiser la structure organisationnelle", Language.spanish: "Optimizar estructura organizacional", Language.chinese: "优化组织结构", Language.portuguese: "Otimizar estrutura organizacional", Language.italian: "Ottimizzare struttura organizzativa"]),
                ("Развить инновационные возможности", [Language.english: "Develop innovative capabilities", Language.french: "Développer des capacités innovantes", Language.spanish: "Desarrollar capacidades innovadoras", Language.chinese: "发展创新能力", Language.portuguese: "Desenvolver capacidades inovadoras", Language.italian: "Sviluppare capacità innovative"])
            ]
        }
    }
    
    // Общие профессиональные предложения
    private static func getGeneralProfessionalSentences(difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch difficulty {
        case .beginner:
            return [
                ("Мы разработали комплексную стратегию для достижения поставленных целей.", [Language.english: "We developed a comprehensive strategy to achieve the set goals.", Language.french: "Nous avons développé une stratégie complète pour atteindre les objectifs fixés.", Language.spanish: "Desarrollamos una estrategia integral para lograr los objetivos establecidos.", Language.chinese: "我们制定了全面的策略来实现既定目标。", Language.portuguese: "Desenvolvemos uma estratégia abrangente para alcançar os objetivos estabelecidos.", Language.italian: "Abbiamo sviluppato una strategia completa per raggiungere gli obiettivi stabiliti."])
            ]
        case .intermediate:
            return [
                ("Внедрение новой системы управления позволило нам повысить эффективность операций на 30% и улучшить качество обслуживания клиентов.", [Language.english: "Implementation of a new management system allowed us to increase operational efficiency by 30% and improve customer service quality.", Language.french: "La mise en œuvre d'un nouveau système de gestion nous a permis d'augmenter l'efficacité opérationnelle de 30% et d'améliorer la qualité du service client.", Language.spanish: "La implementación de un nuevo sistema de gestión nos permitió aumentar la eficiencia operacional en un 30% y mejorar la calidad del servicio al cliente.", Language.chinese: "新管理系统的实施使我们能够将运营效率提高30%并改善客户服务质量。", Language.portuguese: "A implementação de um novo sistema de gestão nos permitiu aumentar a eficiência operacional em 30% e melhorar a qualidade do atendimento ao cliente.", Language.italian: "L'implementazione di un nuovo sistema di gestione ci ha permesso di aumentare l'efficienza operativa del 30% e migliorare la qualità del servizio clienti."])
            ]
        case .advanced:
            return [
                ("Стратегическая трансформация организации с внедрением цифровых технологий и развитием организационных способностей привела к созданию устойчивых конкурентных преимуществ и увеличению рыночной доли на 45%.", [Language.english: "Strategic transformation of the organization with implementation of digital technologies and development of organizational capabilities led to creation of sustainable competitive advantages and increase in market share by 45%.", Language.french: "La transformation stratégique de l'organisation avec la mise en œuvre de technologies numériques et le développement des capacités organisationnelles a conduit à la création d'avantages concurrentiels durables et à une augmentation de la part de marché de 45%.", Language.spanish: "La transformación estratégica de la organización con la implementación de tecnologías digitales y el desarrollo de capacidades organizacionales llevó a la creación de ventajas competitivas sostenibles y un aumento de la cuota de mercado del 45%.", Language.chinese: "通过实施数字技术和发展组织能力的组织战略转型，创造了可持续的竞争优势，并将市场份额增加了45%。", Language.portuguese: "A transformação estratégica da organização com a implementação de tecnologias digitais e o desenvolvimento de capacidades organizacionais levou à criação de vantagens competitivas sustentáveis e ao aumento da participação de mercado em 45%.", Language.italian: "La trasformazione strategica dell'organizzazione con l'implementazione di tecnologie digitali e lo sviluppo di capacità organizzative ha portato alla creazione di vantaggi competitivi sostenibili e all'aumento della quota di mercato del 45%."])
            ]
        }
    }
    
    // Вспомогательные функции для создания контента
    private static func getActionVerbs(difficulty: DifficultyLevel) -> [String] {
        switch difficulty {
        case .beginner:
            return ["Разработать", "Провести", "Создать", "Управлять", "Организовать"]
        case .intermediate:
            return ["Оптимизировать", "Внедрить", "Координировать", "Анализировать", "Планировать"]
        case .advanced:
            return ["Трансформировать", "Стратегически развивать", "Инновационно внедрять", "Системно оптимизировать", "Комплексно управлять"]
        }
    }
    
    private static func getSentenceTemplates(difficulty: DifficultyLevel) -> [String] {
        switch difficulty {
        case .beginner:
            return [
                "Мы {действие} {объект} для достижения целей.",
                "Новый {объект} помог нам улучшить результаты."
            ]
        case .intermediate:
            return [
                "{Действие} {объекта} позволило нам повысить эффективность на {процент}% и оптимизировать процессы.",
                "Анализ {объекта} выявил ключевые возможности для улучшения."
            ]
        case .advanced:
            return [
                "Внедрение {объекта} с использованием {технологии} привело к развитию {способности} и увеличению {показателя} на {процент}%.",
                "Стратегическая трансформация {объекта} с фокусом на {направление} создала устойчивые конкурентные преимущества."
            ]
        }
    }
    
    // Простые функции перевода (заглушки - в реальном приложении нужны настоящие переводы)
    private static func translateToEnglish(_ word: String) -> String { return word }
    private static func translateToFrench(_ word: String) -> String { return word }
    private static func translateToSpanish(_ word: String) -> String { return word }
    private static func translateToChinese(_ word: String) -> String { return word }
    private static func translateToPortuguese(_ word: String) -> String { return word }
    private static func translateToItalian(_ word: String) -> String { return word }
    
    private static func createPhraseFromComponents(verb: String, keyword: String, difficulty: DifficultyLevel) -> (russian: String, translations: [Language: String]) {
        let phrase = "\(verb) \(keyword)"
        return (phrase, [
            Language.english: "\(verb) \(keyword)",
            Language.french: "\(verb) \(keyword)",
            Language.spanish: "\(verb) \(keyword)",
            Language.chinese: "\(verb) \(keyword)",
            Language.portuguese: "\(verb) \(keyword)",
            Language.italian: "\(verb) \(keyword)"
        ])
    }
    
    private static func createSentenceFromTemplate(template: String, keyword: String, difficulty: DifficultyLevel) -> (russian: String, translations: [Language: String]) {
        let sentence = template.replacingOccurrences(of: "{объект}", with: keyword)
        return (sentence, [
            Language.english: sentence,
            Language.french: sentence,
            Language.spanish: sentence,
            Language.chinese: sentence,
            Language.portuguese: sentence,
            Language.italian: sentence
        ])
    }
}

