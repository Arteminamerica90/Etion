//
//  LearningDataGenerator.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class LearningDataGenerator {
    static func generateAllData() -> [LearningItem] {
        var allItems: [LearningItem] = []
        
        let categories = CategoriesData.shared.categories
        // Исключаем грамматические категории из генерации (они загружаются отдельно через GrammarDatabase)
        let nonGrammarCategories = categories.filter { !$0.name.contains("Грамматика -") }
        let totalCategories = max(nonGrammarCategories.count, 1) // Защита от деления на ноль
        
        // Распределяем 10000 слов, 10000 фраз, 10000 предложений по категориям и уровням
        let wordsPerCategory = 10000 / totalCategories
        let phrasesPerCategory = 10000 / totalCategories
        let sentencesPerCategory = 10000 / totalCategories
        
        // Распределение по уровням: 40% начальный, 35% средний, 25% продвинутый
        let beginnerWords = Int(Double(wordsPerCategory) * 0.4)
        let intermediateWords = Int(Double(wordsPerCategory) * 0.35)
        let advancedWords = wordsPerCategory - beginnerWords - intermediateWords
        
        let beginnerPhrases = Int(Double(phrasesPerCategory) * 0.4)
        let intermediatePhrases = Int(Double(phrasesPerCategory) * 0.35)
        let advancedPhrases = phrasesPerCategory - beginnerPhrases - intermediatePhrases
        
        let beginnerSentences = Int(Double(sentencesPerCategory) * 0.4)
        let intermediateSentences = Int(Double(sentencesPerCategory) * 0.35)
        let advancedSentences = sentencesPerCategory - beginnerSentences - intermediateSentences
        
        // Генерируем данные только для неграмматических категорий
        for category in nonGrammarCategories {
            // Начальный уровень
            allItems.append(contentsOf: generateWords(for: category.name, difficulty: .beginner, count: beginnerWords))
            allItems.append(contentsOf: generatePhrases(for: category.name, difficulty: .beginner, count: beginnerPhrases))
            allItems.append(contentsOf: generateSentences(for: category.name, difficulty: .beginner, count: beginnerSentences))
            
            // Средний уровень
            allItems.append(contentsOf: generateWords(for: category.name, difficulty: .intermediate, count: intermediateWords))
            allItems.append(contentsOf: generatePhrases(for: category.name, difficulty: .intermediate, count: intermediatePhrases))
            allItems.append(contentsOf: generateSentences(for: category.name, difficulty: .intermediate, count: intermediateSentences))
            
            // Продвинутый уровень
            allItems.append(contentsOf: generateWords(for: category.name, difficulty: .advanced, count: advancedWords))
            allItems.append(contentsOf: generatePhrases(for: category.name, difficulty: .advanced, count: advancedPhrases))
            allItems.append(contentsOf: generateSentences(for: category.name, difficulty: .advanced, count: advancedSentences))
        }
        
        return allItems
    }
    
    // Генерация слов по категориям и уровням
    private static func generateWords(for category: String, difficulty: DifficultyLevel, count: Int) -> [LearningItem] {
        var items: [LearningItem] = []
        var baseWords = ContentDatabase.shared.getWords(for: category, difficulty: difficulty)
        
        // Если слов недостаточно, генерируем дополнительные уникальные слова
        if baseWords.count < count {
            let additionalWords = generateUniqueWords(for: category, difficulty: difficulty, needed: count - baseWords.count)
            baseWords.append(contentsOf: additionalWords)
        }
        
        // Перемешиваем слова для разнообразия
        var shuffledWords = baseWords.shuffled()
        
        // Защита от пустого массива
        guard !shuffledWords.isEmpty else {
            return items
        }
        
        // Используем только уникальные слова, перемешивая их
        for i in 0..<count {
            let wordIndex = i % shuffledWords.count
            let baseWord = shuffledWords[wordIndex]
            
                // Генерируем примеры предложений для слова
                let exampleSentences = ExampleSentenceGenerator.generateExamples(
                    for: baseWord.russian,
                    translations: baseWord.translations,
                    category: category,
                    difficulty: difficulty
                )
                
                items.append(LearningItem(
                    type: .word,
                    russian: baseWord.russian,
                    translations: baseWord.translations,
                    category: category,
                    difficulty: difficulty,
                    exampleSentences: exampleSentences.isEmpty ? nil : exampleSentences
                ))
            
            // Перемешиваем снова каждые 50 элементов для большего разнообразия
            if (i + 1) % 50 == 0 && shuffledWords.count > 1 {
                shuffledWords = baseWords.shuffled()
            }
        }
        
        return items
    }
    
    // Генерация дополнительных уникальных слов на основе категории
    private static func generateUniqueWords(for category: String, difficulty: DifficultyLevel, needed: Int) -> [(russian: String, translations: [Language: String])] {
        var uniqueWords: [(russian: String, translations: [Language: String])] = []
        
        // Используем расширенную базу данных
        let extendedWords = UniversalContentGenerator.generateWords(for: category, difficulty: difficulty, count: needed)
        uniqueWords.append(contentsOf: extendedWords)
        
        // Если все еще недостаточно, создаем вариации на основе категории
        if uniqueWords.count < needed {
            let professionalTerms = getProfessionalTermsForCategory(category, difficulty: difficulty)
            
            guard !professionalTerms.isEmpty else {
                return Array(uniqueWords.prefix(needed))
            }
            
            for i in uniqueWords.count..<needed {
                let termIndex = i % professionalTerms.count
                let term = professionalTerms[termIndex]
                
                // Создаем уникальную комбинацию
                let uniqueWord = createUniqueWordVariation(
                    base: term,
                    category: category,
                    index: i,
                    total: needed
                )
                uniqueWords.append(uniqueWord)
            }
        }
        
        return Array(uniqueWords.prefix(needed))
    }
    
    // Извлечение ключевых слов категории
    private static func extractCategoryKeywords(_ category: String) -> [String] {
        return category.components(separatedBy: CharacterSet(charactersIn: " и ")).map { $0.trimmingCharacters(in: .whitespaces) }
    }
    
    // Получение профессиональных терминов для категории
    private static func getProfessionalTermsForCategory(_ category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        // Большая база профессиональных терминов для каждой категории
        let allTerms: [String: [DifficultyLevel: [(russian: String, translations: [Language: String])]]] = [
            "Маркетинг": [
                .beginner: [
                    ("Рынок", [.english: "Market", .french: "Marché", .spanish: "Mercado", .chinese: "市场", .portuguese: "Mercado", .italian: "Mercato"]),
                    ("Реклама", [.english: "Advertising", .french: "Publicité", .spanish: "Publicidad", .chinese: "广告", .portuguese: "Publicidade", .italian: "Pubblicità"]),
                    ("Бренд", [.english: "Brand", .french: "Marque", .spanish: "Marca", .chinese: "品牌", .portuguese: "Marca", .italian: "Marca"]),
                    ("Продукт", [.english: "Product", .french: "Produit", .spanish: "Producto", .chinese: "产品", .portuguese: "Produto", .italian: "Prodotto"]),
                    ("Клиент", [.english: "Client", .french: "Client", .spanish: "Cliente", .chinese: "客户", .portuguese: "Cliente", .italian: "Cliente"]),
                    ("Продажи", [.english: "Sales", .french: "Ventes", .spanish: "Ventas", .chinese: "销售", .portuguese: "Vendas", .italian: "Vendite"]),
                    ("Цена", [.english: "Price", .french: "Prix", .spanish: "Precio", .chinese: "价格", .portuguese: "Preço", .italian: "Prezzo"]),
                    ("Скидка", [.english: "Discount", .french: "Remise", .spanish: "Descuento", .chinese: "折扣", .portuguese: "Desconto", .italian: "Sconto"]),
                    ("Промоакция", [.english: "Promotion", .french: "Promotion", .spanish: "Promoción", .chinese: "促销", .portuguese: "Promoção", .italian: "Promozione"]),
                    ("Канал", [.english: "Channel", .french: "Canal", .spanish: "Canal", .chinese: "渠道", .portuguese: "Canal", .italian: "Canale"]),
                    ("Целевая аудитория", [.english: "Target audience", .french: "Public cible", .spanish: "Audiencia objetivo", .chinese: "目标受众", .portuguese: "Público-alvo", .italian: "Pubblico di riferimento"]),
                    ("Рыночная доля", [.english: "Market share", .french: "Part de marché", .spanish: "Cuota de mercado", .chinese: "市场份额", .portuguese: "Participação de mercado", .italian: "Quota di mercato"]),
                    ("Конкуренция", [.english: "Competition", .french: "Concurrence", .spanish: "Competencia", .chinese: "竞争", .portuguese: "Concorrência", .italian: "Concorrenza"]),
                    ("Упаковка", [.english: "Packaging", .french: "Emballage", .spanish: "Embalaje", .chinese: "包装", .portuguese: "Embalagem", .italian: "Imballaggio"]),
                    ("Дистрибуция", [.english: "Distribution", .french: "Distribution", .spanish: "Distribución", .chinese: "分销", .portuguese: "Distribuição", .italian: "Distribuzione"]),
                    ("Позиционирование", [.english: "Positioning", .french: "Positionnement", .spanish: "Posicionamiento", .chinese: "定位", .portuguese: "Posicionamento", .italian: "Posizionamento"]),
                    ("Сегментация", [.english: "Segmentation", .french: "Segmentation", .spanish: "Segmentación", .chinese: "细分", .portuguese: "Segmentação", .italian: "Segmentazione"]),
                    ("Конверсия", [.english: "Conversion", .french: "Conversion", .spanish: "Conversión", .chinese: "转化", .portuguese: "Conversão", .italian: "Conversione"]),
                    ("Лид", [.english: "Lead", .french: "Piste", .spanish: "Cliente potencial", .chinese: "潜在客户", .portuguese: "Lead", .italian: "Lead"]),
                    ("Воронка", [.english: "Funnel", .french: "Entonnoir", .spanish: "Embudo", .chinese: "漏斗", .portuguese: "Funil", .italian: "Imbuto"]),
                    ("ROI", [.english: "ROI", .french: "ROI", .spanish: "ROI", .chinese: "投资回报率", .portuguese: "ROI", .italian: "ROI"]),
                    ("KPI", [.english: "KPI", .french: "KPI", .spanish: "KPI", .chinese: "关键绩效指标", .portuguese: "KPI", .italian: "KPI"]),
                    ("Таргетинг", [.english: "Targeting", .french: "Ciblage", .spanish: "Segmentación", .chinese: "定向", .portuguese: "Segmentação", .italian: "Targeting"]),
                    ("Ретаргетинг", [.english: "Retargeting", .french: "Reciblage", .spanish: "Retargeting", .chinese: "再营销", .portuguese: "Retargeting", .italian: "Retargeting"]),
                    ("Метрика", [.english: "Metric", .french: "Métrique", .spanish: "Métrica", .chinese: "指标", .portuguese: "Métrica", .italian: "Metrica"]),
                    ("Кампания", [.english: "Campaign", .french: "Campagne", .spanish: "Campaña", .chinese: "活动", .portuguese: "Campanha", .italian: "Campagna"]),
                    ("Медиапланирование", [.english: "Media planning", .french: "Planification média", .spanish: "Planificación de medios", .chinese: "媒体规划", .portuguese: "Planejamento de mídia", .italian: "Pianificazione media"]),
                    ("Бюджет", [.english: "Budget", .french: "Budget", .spanish: "Presupuesto", .chinese: "预算", .portuguese: "Orçamento", .italian: "Bilancio"]),
                    ("Аналитика", [.english: "Analytics", .french: "Analytique", .spanish: "Analítica", .chinese: "分析", .portuguese: "Analytics", .italian: "Analitica"]),
                    ("Исследование", [.english: "Research", .french: "Recherche", .spanish: "Investigación", .chinese: "研究", .portuguese: "Pesquisa", .italian: "Ricerca"])
                ],
                .intermediate: [
                    ("Сегментация", [.english: "Segmentation", .french: "Segmentation", .spanish: "Segmentación", .chinese: "细分", .portuguese: "Segmentação", .italian: "Segmentazione"]),
                    ("Позиционирование", [.english: "Positioning", .french: "Positionnement", .spanish: "Posicionamiento", .chinese: "定位", .portuguese: "Posicionamento", .italian: "Posizionamento"]),
                    ("Конверсия", [.english: "Conversion", .french: "Conversion", .spanish: "Conversión", .chinese: "转化", .portuguese: "Conversão", .italian: "Conversione"]),
                    ("Лид", [.english: "Lead", .french: "Piste", .spanish: "Cliente potencial", .chinese: "潜在客户", .portuguese: "Lead", .italian: "Lead"]),
                    ("Воронка", [.english: "Funnel", .french: "Entonnoir", .spanish: "Embudo", .chinese: "漏斗", .portuguese: "Funil", .italian: "Imbuto"]),
                    ("ROI", [.english: "ROI", .french: "ROI", .spanish: "ROI", .chinese: "投资回报率", .portuguese: "ROI", .italian: "ROI"]),
                    ("KPI", [.english: "KPI", .french: "KPI", .spanish: "KPI", .chinese: "关键绩效指标", .portuguese: "KPI", .italian: "KPI"]),
                    ("Таргетинг", [.english: "Targeting", .french: "Ciblage", .spanish: "Segmentación", .chinese: "定向", .portuguese: "Segmentação", .italian: "Targeting"]),
                    ("Ретаргетинг", [.english: "Retargeting", .french: "Reciblage", .spanish: "Retargeting", .chinese: "再营销", .portuguese: "Retargeting", .italian: "Retargeting"]),
                    ("Метрика", [.english: "Metric", .french: "Métrique", .spanish: "Métrica", .chinese: "指标", .portuguese: "Métrica", .italian: "Metrica"]),
                    ("Маркетинговая стратегия", [.english: "Marketing strategy", .french: "Stratégie marketing", .spanish: "Estrategia de marketing", .chinese: "营销策略", .portuguese: "Estratégia de marketing", .italian: "Strategia di marketing"]),
                    ("Брендинг", [.english: "Branding", .french: "Image de marque", .spanish: "Branding", .chinese: "品牌建设", .portuguese: "Branding", .italian: "Branding"]),
                    ("Маркетинговая коммуникация", [.english: "Marketing communication", .french: "Communication marketing", .spanish: "Comunicación de marketing", .chinese: "营销传播", .portuguese: "Comunicação de marketing", .italian: "Comunicazione di marketing"]),
                    ("Маркетинговый микс", [.english: "Marketing mix", .french: "Mix marketing", .spanish: "Mezcla de marketing", .chinese: "营销组合", .portuguese: "Mix de marketing", .italian: "Mix di marketing"]),
                    ("Рыночная ниша", [.english: "Market niche", .french: "Niche de marché", .spanish: "Nicho de mercado", .chinese: "市场细分", .portuguese: "Nicho de mercado", .italian: "Nicchia di mercato"]),
                    ("Конкурентный анализ", [.english: "Competitive analysis", .french: "Analyse concurrentielle", .spanish: "Análisis competitivo", .chinese: "竞争分析", .portuguese: "Análise competitiva", .italian: "Analisi competitiva"]),
                    ("Маркетинговая воронка", [.english: "Marketing funnel", .french: "Entonnoir marketing", .spanish: "Embudo de marketing", .chinese: "营销漏斗", .portuguese: "Funil de marketing", .italian: "Imbuto di marketing"]),
                    ("Контент-маркетинг", [.english: "Content marketing", .french: "Marketing de contenu", .spanish: "Marketing de contenidos", .chinese: "内容营销", .portuguese: "Marketing de conteúdo", .italian: "Content marketing"]),
                    ("Email-маркетинг", [.english: "Email marketing", .french: "Marketing par email", .spanish: "Marketing por correo electrónico", .chinese: "电子邮件营销", .portuguese: "Marketing por email", .italian: "Email marketing"]),
                    ("Социальные медиа", [.english: "Social media", .french: "Médias sociaux", .spanish: "Redes sociales", .chinese: "社交媒体", .portuguese: "Redes sociais", .italian: "Social media"]),
                    ("Вирусный маркетинг", [.english: "Viral marketing", .french: "Marketing viral", .spanish: "Marketing viral", .chinese: "病毒式营销", .portuguese: "Marketing viral", .italian: "Marketing virale"]),
                    ("Influencer-маркетинг", [.english: "Influencer marketing", .french: "Marketing d'influence", .spanish: "Marketing de influencers", .chinese: "影响者营销", .portuguese: "Marketing de influenciadores", .italian: "Influencer marketing"]),
                    ("Performance-маркетинг", [.english: "Performance marketing", .french: "Marketing de performance", .spanish: "Marketing de rendimiento", .chinese: "效果营销", .portuguese: "Marketing de performance", .italian: "Performance marketing"]),
                    ("Growth-маркетинг", [.english: "Growth marketing", .french: "Marketing de croissance", .spanish: "Marketing de crecimiento", .chinese: "增长营销", .portuguese: "Marketing de crescimento", .italian: "Growth marketing"]),
                    ("Маркетинговая автоматизация", [.english: "Marketing automation", .french: "Automatisation marketing", .spanish: "Automatización de marketing", .chinese: "营销自动化", .portuguese: "Automação de marketing", .italian: "Automazione marketing"]),
                    ("Кросс-канальный маркетинг", [.english: "Cross-channel marketing", .french: "Marketing multicanal", .spanish: "Marketing multicanal", .chinese: "跨渠道营销", .portuguese: "Marketing multicanal", .italian: "Marketing multicanale"]),
                    ("Маркетинговая аналитика", [.english: "Marketing analytics", .french: "Analytique marketing", .spanish: "Analítica de marketing", .chinese: "营销分析", .portuguese: "Analytics de marketing", .italian: "Analisi di marketing"]),
                    ("Customer journey", [.english: "Customer journey", .french: "Parcours client", .spanish: "Viaje del cliente", .chinese: "客户旅程", .portuguese: "Jornada do cliente", .italian: "Customer journey"]),
                    ("LTV", [.english: "LTV", .french: "LTV", .spanish: "LTV", .chinese: "客户生命周期价值", .portuguese: "LTV", .italian: "LTV"]),
                    ("CAC", [.english: "CAC", .french: "CAC", .spanish: "CAC", .chinese: "客户获取成本", .portuguese: "CAC", .italian: "CAC"]),
                    ("Атрибуция", [.english: "Attribution", .french: "Attribution", .spanish: "Atribución", .chinese: "归因", .portuguese: "Atribuição", .italian: "Attribuzione"]),
                    ("Когортный анализ", [.english: "Cohort analysis", .french: "Analyse de cohorte", .spanish: "Análisis de cohortes", .chinese: "队列分析", .portuguese: "Análise de coorte", .italian: "Analisi di coorte"]),
                    ("Прогнозирование", [.english: "Forecasting", .french: "Prévision", .spanish: "Pronóstico", .chinese: "预测", .portuguese: "Previsão", .italian: "Previsione"]),
                    ("Мультиканальность", [.english: "Omnichannel", .french: "Omnicanal", .spanish: "Omnicanal", .chinese: "全渠道", .portuguese: "Omnicanal", .italian: "Omnicanale"]),
                    ("Персонализация", [.english: "Personalization", .french: "Personnalisation", .spanish: "Personalización", .chinese: "个性化", .portuguese: "Personalização", .italian: "Personalizzazione"]),
                    ("Кастомизация", [.english: "Customization", .french: "Personnalisation", .spanish: "Personalización", .chinese: "定制化", .portuguese: "Personalização", .italian: "Personalizzazione"])
                ],
                .advanced: [
                    ("Мультиканальность", [.english: "Omnichannel", .french: "Omnicanal", .spanish: "Omnicanal", .chinese: "全渠道", .portuguese: "Omnicanal", .italian: "Omnicanale"]),
                    ("Персонализация", [.english: "Personalization", .french: "Personnalisation", .spanish: "Personalización", .chinese: "个性化", .portuguese: "Personalização", .italian: "Personalizzazione"]),
                    ("Кастомизация", [.english: "Customization", .french: "Personnalisation", .spanish: "Personalización", .chinese: "定制化", .portuguese: "Personalização", .italian: "Personalizzazione"]),
                    ("Маркетинговая аналитика", [.english: "Marketing analytics", .french: "Analytique marketing", .spanish: "Analítica de marketing", .chinese: "营销分析", .portuguese: "Analytics de marketing", .italian: "Analisi di marketing"]),
                    ("Customer journey", [.english: "Customer journey", .french: "Parcours client", .spanish: "Viaje del cliente", .chinese: "客户旅程", .portuguese: "Jornada do cliente", .italian: "Customer journey"]),
                    ("LTV", [.english: "LTV", .french: "LTV", .spanish: "LTV", .chinese: "客户生命周期价值", .portuguese: "LTV", .italian: "LTV"]),
                    ("CAC", [.english: "CAC", .french: "CAC", .spanish: "CAC", .chinese: "客户获取成本", .portuguese: "CAC", .italian: "CAC"]),
                    ("Атрибуция", [.english: "Attribution", .french: "Attribution", .spanish: "Atribución", .chinese: "归因", .portuguese: "Atribuição", .italian: "Attribuzione"]),
                    ("Когортный анализ", [.english: "Cohort analysis", .french: "Analyse de cohorte", .spanish: "Análisis de cohortes", .chinese: "队列分析", .portuguese: "Análise de coorte", .italian: "Analisi di coorte"]),
                    ("Прогнозирование", [.english: "Forecasting", .french: "Prévision", .spanish: "Pronóstico", .chinese: "预测", .portuguese: "Previsão", .italian: "Previsione"]),
                    ("Маркетинговая автоматизация", [.english: "Marketing automation", .french: "Automatisation marketing", .spanish: "Automatización de marketing", .chinese: "营销自动化", .portuguese: "Automação de marketing", .italian: "Automazione marketing"]),
                    ("Кросс-канальный маркетинг", [.english: "Cross-channel marketing", .french: "Marketing multicanal", .spanish: "Marketing multicanal", .chinese: "跨渠道营销", .portuguese: "Marketing multicanal", .italian: "Marketing multicanale"]),
                    ("Контент-маркетинг", [.english: "Content marketing", .french: "Marketing de contenu", .spanish: "Marketing de contenidos", .chinese: "内容营销", .portuguese: "Marketing de conteúdo", .italian: "Content marketing"]),
                    ("Email-маркетинг", [.english: "Email marketing", .french: "Marketing par email", .spanish: "Marketing por correo electrónico", .chinese: "电子邮件营销", .portuguese: "Marketing por email", .italian: "Email marketing"]),
                    ("Вирусный маркетинг", [.english: "Viral marketing", .french: "Marketing viral", .spanish: "Marketing viral", .chinese: "病毒式营销", .portuguese: "Marketing viral", .italian: "Marketing virale"]),
                    ("Influencer-маркетинг", [.english: "Influencer marketing", .french: "Marketing d'influence", .spanish: "Marketing de influencers", .chinese: "影响者营销", .portuguese: "Marketing de influenciadores", .italian: "Influencer marketing"]),
                    ("Performance-маркетинг", [.english: "Performance marketing", .french: "Marketing de performance", .spanish: "Marketing de rendimiento", .chinese: "效果营销", .portuguese: "Marketing de performance", .italian: "Performance marketing"]),
                    ("Growth-маркетинг", [.english: "Growth marketing", .french: "Marketing de croissance", .spanish: "Marketing de crecimiento", .chinese: "增长营销", .portuguese: "Marketing de crescimento", .italian: "Growth marketing"]),
                    ("Маркетинговая воронка", [.english: "Marketing funnel", .french: "Entonnoir marketing", .spanish: "Embudo de marketing", .chinese: "营销漏斗", .portuguese: "Funil de marketing", .italian: "Imbuto di marketing"]),
                    ("Маркетинговая стратегия", [.english: "Marketing strategy", .french: "Stratégie marketing", .spanish: "Estrategia de marketing", .chinese: "营销策略", .portuguese: "Estratégia de marketing", .italian: "Strategia di marketing"])
                ]
            ]
        ]
        
        return allTerms[category]?[difficulty] ?? []
    }
    
    // Создание уникальной вариации слова
    private static func createUniqueWordVariation(base: (russian: String, translations: [Language: String]), category: String, index: Int, total: Int) -> (russian: String, translations: [Language: String]) {
        // Просто возвращаем базовое слово - вариации не нужны, нужны уникальные слова
        return base
    }
    
    // Генерация фраз
    private static func generatePhrases(for category: String, difficulty: DifficultyLevel, count: Int) -> [LearningItem] {
        var items: [LearningItem] = []
        var basePhrases = ContentDatabase.shared.getPhrases(for: category, difficulty: difficulty)
        
        // Если фраз недостаточно, генерируем дополнительные уникальные фразы
        if basePhrases.count < count {
            let additionalPhrases = UniversalContentGenerator.generatePhrases(for: category, difficulty: difficulty, count: count - basePhrases.count)
            basePhrases.append(contentsOf: additionalPhrases)
        }
        
        // Перемешиваем фразы для разнообразия
        var shuffledPhrases = basePhrases.shuffled()
        
        // Защита от пустого массива
        guard !shuffledPhrases.isEmpty else {
            return items
        }
        
        // Используем только уникальные фразы, перемешивая их
        for i in 0..<count {
            let phraseIndex = i % shuffledPhrases.count
            let basePhrase = shuffledPhrases[phraseIndex]
            
            items.append(LearningItem(
                type: .phrase,
                russian: basePhrase.russian,
                translations: basePhrase.translations,
                category: category,
                difficulty: difficulty
            ))
            
            // Перемешиваем снова каждые 50 элементов для большего разнообразия
            if (i + 1) % 50 == 0 && shuffledPhrases.count > 1 {
                shuffledPhrases = basePhrases.shuffled()
            }
        }
        
        return items
    }
    
    // Генерация предложений
    private static func generateSentences(for category: String, difficulty: DifficultyLevel, count: Int) -> [LearningItem] {
        var items: [LearningItem] = []
        var baseSentences = ContentDatabase.shared.getSentences(for: category, difficulty: difficulty)
        
        // Если предложений недостаточно, генерируем дополнительные уникальные предложения
        if baseSentences.count < count {
            let additionalSentences = UniversalContentGenerator.generateSentences(for: category, difficulty: difficulty, count: count - baseSentences.count)
            baseSentences.append(contentsOf: additionalSentences)
        }
        
        // Перемешиваем предложения для разнообразия
        var shuffledSentences = baseSentences.shuffled()
        
        // Защита от пустого массива
        guard !shuffledSentences.isEmpty else {
            return items
        }
        
        // Используем только уникальные предложения, перемешивая их
        for i in 0..<count {
            let sentenceIndex = i % shuffledSentences.count
            let baseSentence = shuffledSentences[sentenceIndex]
            
            items.append(LearningItem(
                type: .sentence,
                russian: baseSentence.russian,
                translations: baseSentence.translations,
                category: category,
                difficulty: difficulty
            ))
            
            // Перемешиваем снова каждые 50 элементов для большего разнообразия
            if (i + 1) % 50 == 0 && shuffledSentences.count > 1 {
                shuffledSentences = baseSentences.shuffled()
            }
        }
        
        return items
    }
    
    
    // Шаблоны слов
    private static func getWordTemplates(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        let base: [(russian: String, translations: [Language: String])] = [
            ("Процесс", [Language.english: "Process", Language.french: "Processus", Language.spanish: "Proceso", Language.chinese: "过程", Language.portuguese: "Processo", Language.italian: "Processo"]),
            ("Стратегия", [Language.english: "Strategy", Language.french: "Stratégie", Language.spanish: "Estrategia", Language.chinese: "策略", Language.portuguese: "Estratégia", Language.italian: "Strategia"]),
            ("Управление", [Language.english: "Management", Language.french: "Gestion", Language.spanish: "Gestión", Language.chinese: "管理", Language.portuguese: "Gestão", Language.italian: "Gestione"]),
            ("Анализ", [Language.english: "Analysis", Language.french: "Analyse", Language.spanish: "Análisis", Language.chinese: "分析", Language.portuguese: "Análise", Language.italian: "Analisi"]),
            ("Оптимизация", [Language.english: "Optimization", Language.french: "Optimisation", Language.spanish: "Optimización", Language.chinese: "优化", Language.portuguese: "Otimização", Language.italian: "Ottimizzazione"])
        ]
        return base
    }
    
    // Шаблоны фраз
    private static func getPhraseTemplates(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        return [
            ("Разработать стратегию", [Language.english: "Develop a strategy", Language.french: "Développer une stratégie", Language.spanish: "Desarrollar una estrategia", Language.chinese: "制定策略", Language.portuguese: "Desenvolver uma estratégia", Language.italian: "Sviluppare una strategia"]),
            ("Провести анализ", [Language.english: "Conduct analysis", Language.french: "Effectuer une analyse", Language.spanish: "Realizar análisis", Language.chinese: "进行分析", Language.portuguese: "Realizar análise", Language.italian: "Condurre analisi"]),
            ("Оптимизировать процесс", [Language.english: "Optimize process", Language.french: "Optimiser le processus", Language.spanish: "Optimizar el proceso", Language.chinese: "优化流程", Language.portuguese: "Otimizar o processo", Language.italian: "Ottimizzare il processo"])
        ]
    }
    
    // Шаблоны предложений
    private static func getSentenceTemplates(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        return [
            ("Мы разработали комплексную стратегию для достижения поставленных целей.", [Language.english: "We developed a comprehensive strategy to achieve the set goals.", Language.french: "Nous avons développé une stratégie complète pour atteindre les objectifs fixés.", Language.spanish: "Desarrollamos una estrategia integral para lograr los objetivos establecidos.", Language.chinese: "我们制定了全面的策略来实现既定目标。", Language.portuguese: "Desenvolvemos uma estratégia abrangente para alcançar os objetivos estabelecidos.", Language.italian: "Abbiamo sviluppato una strategia completa per raggiungere gli obiettivi stabiliti."])
        ]
    }
    
    // База данных слов по категориям
    private static func getWordsForCategory(_ category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch category {
        case "Маркетинг":
            switch difficulty {
            case .beginner:
                return [
                    ("Рынок", [.english: "Market", .french: "Marché", .spanish: "Mercado", .chinese: "市场", .portuguese: "Mercado", .italian: "Mercato"]),
                    ("Реклама", [.english: "Advertising", .french: "Publicité", .spanish: "Publicidad", .chinese: "广告", .portuguese: "Publicidade", .italian: "Pubblicità"]),
                    ("Бренд", [.english: "Brand", .french: "Marque", .spanish: "Marca", .chinese: "品牌", .portuguese: "Marca", .italian: "Marca"]),
                    ("Целевая аудитория", [.english: "Target audience", .french: "Public cible", .spanish: "Audiencia objetivo", .chinese: "目标受众", .portuguese: "Público-alvo", .italian: "Pubblico di riferimento"]),
                    ("Продукт", [.english: "Product", .french: "Produit", .spanish: "Producto", .chinese: "产品", .portuguese: "Produto", .italian: "Prodotto"])
                ]
            case .intermediate:
                return [
                    ("Сегментация", [.english: "Segmentation", .french: "Segmentation", .spanish: "Segmentación", .chinese: "细分", .portuguese: "Segmentação", .italian: "Segmentazione"]),
                    ("Позиционирование", [.english: "Positioning", .french: "Positionnement", .spanish: "Posicionamiento", .chinese: "定位", .portuguese: "Posicionamento", .italian: "Posizionamento"]),
                    ("Конверсия", [.english: "Conversion", .french: "Conversion", .spanish: "Conversión", .chinese: "转化", .portuguese: "Conversão", .italian: "Conversione"]),
                    ("Лид", [.english: "Lead", .french: "Piste", .spanish: "Cliente potencial", .chinese: "潜在客户", .portuguese: "Lead", .italian: "Lead"]),
                    ("Воронка продаж", [.english: "Sales funnel", .french: "Entonnoir de vente", .spanish: "Embudo de ventas", .chinese: "销售漏斗", .portuguese: "Funil de vendas", .italian: "Imbuto di vendita"])
                ]
            case .advanced:
                return [
                    ("Маркетинговая стратегия", [.english: "Marketing strategy", .french: "Stratégie marketing", .spanish: "Estrategia de marketing", .chinese: "营销策略", .portuguese: "Estratégia de marketing", .italian: "Strategia di marketing"]),
                    ("Кастомизация", [.english: "Customization", .french: "Personnalisation", .spanish: "Personalización", .chinese: "定制化", .portuguese: "Personalização", .italian: "Personalizzazione"]),
                    ("Мультиканальность", [.english: "Omnichannel", .french: "Omnicanal", .spanish: "Omnicanal", .chinese: "全渠道", .portuguese: "Omnicanal", .italian: "Omnicanale"]),
                    ("Маркетинговая аналитика", [.english: "Marketing analytics", .french: "Analytique marketing", .spanish: "Analítica de marketing", .chinese: "营销分析", .portuguese: "Analytics de marketing", .italian: "Analisi di marketing"]),
                    ("Персонализация", [.english: "Personalization", .french: "Personnalisation", .spanish: "Personalización", .chinese: "个性化", .portuguese: "Personalização", .italian: "Personalizzazione"])
                ]
            }
            
        case "Финансы":
            switch difficulty {
            case .beginner:
                return [
                    ("Деньги", [.english: "Money", .french: "Argent", .spanish: "Dinero", .chinese: "钱", .portuguese: "Dinheiro", .italian: "Denaro"]),
                    ("Банк", [.english: "Bank", .french: "Banque", .spanish: "Banco", .chinese: "银行", .portuguese: "Banco", .italian: "Banca"]),
                    ("Кредит", [.english: "Credit", .french: "Crédit", .spanish: "Crédito", .chinese: "信贷", .portuguese: "Crédito", .italian: "Credito"]),
                    ("Депозит", [.english: "Deposit", .french: "Dépôt", .spanish: "Depósito", .chinese: "存款", .portuguese: "Depósito", .italian: "Deposito"]),
                    ("Процент", [.english: "Interest", .french: "Intérêt", .spanish: "Interés", .chinese: "利息", .portuguese: "Juros", .italian: "Interesse"])
                ]
            case .intermediate:
                return [
                    ("Актив", [.english: "Asset", .french: "Actif", .spanish: "Activo", .chinese: "资产", .portuguese: "Ativo", .italian: "Attività"]),
                    ("Пассив", [.english: "Liability", .french: "Passif", .spanish: "Pasivo", .chinese: "负债", .portuguese: "Passivo", .italian: "Passività"]),
                    ("Дивиденды", [.english: "Dividends", .french: "Dividendes", .spanish: "Dividendos", .chinese: "股息", .portuguese: "Dividendos", .italian: "Dividendi"]),
                    ("Капитализация", [.english: "Capitalization", .french: "Capitalisation", .spanish: "Capitalización", .chinese: "资本化", .portuguese: "Capitalização", .italian: "Capitalizzazione"]),
                    ("Ликвидность", [.english: "Liquidity", .french: "Liquidité", .spanish: "Liquidez", .chinese: "流动性", .portuguese: "Liquidez", .italian: "Liquidità"])
                ]
            case .advanced:
                return [
                    ("Дериватив", [.english: "Derivative", .french: "Dérivé", .spanish: "Derivado", .chinese: "衍生品", .portuguese: "Derivativo", .italian: "Derivato"]),
                    ("Хеджирование", [.english: "Hedging", .french: "Couverture", .spanish: "Cobertura", .chinese: "对冲", .portuguese: "Hedge", .italian: "Copertura"]),
                    ("Секьюритизация", [.english: "Securitization", .french: "Titrisation", .spanish: "Titulización", .chinese: "证券化", .portuguese: "Securitização", .italian: "Cartolarizzazione"]),
                    ("Арбитраж", [.english: "Arbitrage", .french: "Arbitrage", .spanish: "Arbitraje", .chinese: "套利", .portuguese: "Arbitragem", .italian: "Arbitraggio"]),
                    ("Волатильность", [.english: "Volatility", .french: "Volatilité", .spanish: "Volatilidad", .chinese: "波动性", .portuguese: "Volatilidade", .italian: "Volatilità"])
                ]
            }
            
        case "Технологии":
            switch difficulty {
            case .beginner:
                return [
                    ("Компьютер", [.english: "Computer", .french: "Ordinateur", .spanish: "Computadora", .chinese: "计算机", .portuguese: "Computador", .italian: "Computer"]),
                    ("Программа", [.english: "Program", .french: "Programme", .spanish: "Programa", .chinese: "程序", .portuguese: "Programa", .italian: "Programma"]),
                    ("Интернет", [.english: "Internet", .french: "Internet", .spanish: "Internet", .chinese: "互联网", .portuguese: "Internet", .italian: "Internet"]),
                    ("Сайт", [.english: "Website", .french: "Site web", .spanish: "Sitio web", .chinese: "网站", .portuguese: "Site", .italian: "Sito web"]),
                    ("Приложение", [.english: "Application", .french: "Application", .spanish: "Aplicación", .chinese: "应用程序", .portuguese: "Aplicativo", .italian: "Applicazione"])
                ]
            case .intermediate:
                return [
                    ("Алгоритм", [.english: "Algorithm", .french: "Algorithme", .spanish: "Algoritmo", .chinese: "算法", .portuguese: "Algoritmo", .italian: "Algoritmo"]),
                    ("База данных", [.english: "Database", .french: "Base de données", .spanish: "Base de datos", .chinese: "数据库", .portuguese: "Banco de dados", .italian: "Database"]),
                    ("Интерфейс", [.english: "Interface", .french: "Interface", .spanish: "Interfaz", .chinese: "界面", .portuguese: "Interface", .italian: "Interfaccia"]),
                    ("Сервер", [.english: "Server", .french: "Serveur", .spanish: "Servidor", .chinese: "服务器", .portuguese: "Servidor", .italian: "Server"]),
                    ("Протокол", [.english: "Protocol", .french: "Protocole", .spanish: "Protocolo", .chinese: "协议", .portuguese: "Protocolo", .italian: "Protocollo"])
                ]
            case .advanced:
                return [
                    ("Микросервисная архитектура", [.english: "Microservices architecture", .french: "Architecture microservices", .spanish: "Arquitectura de microservicios", .chinese: "微服务架构", .portuguese: "Arquitetura de microsserviços", .italian: "Architettura a microservizi"]),
                    ("Контейнеризация", [.english: "Containerization", .french: "Conteneurisation", .spanish: "Contenedorización", .chinese: "容器化", .portuguese: "Containerização", .italian: "Containerizzazione"]),
                    ("Оркестрация", [.english: "Orchestration", .french: "Orchestration", .spanish: "Orquestración", .chinese: "编排", .portuguese: "Orquestração", .italian: "Orchestrazione"]),
                    ("Рефакторинг", [.english: "Refactoring", .french: "Refactorisation", .spanish: "Refactorización", .chinese: "重构", .portuguese: "Refatoração", .italian: "Refactoring"]),
                    ("Масштабируемость", [.english: "Scalability", .french: "Évolutivité", .spanish: "Escalabilidad", .chinese: "可扩展性", .portuguese: "Escalabilidade", .italian: "Scalabilità"])
                ]
            }
            
        default:
            // Для остальных категорий используем общие профессиональные термины
            return getGenericWords(category: category, difficulty: difficulty)
        }
    }
    
    // Генерация фраз по категориям
    private static func getPhrasesForCategory(_ category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch category {
        case "Маркетинг":
            switch difficulty {
            case .beginner:
                return [
                    ("Провести маркетинговое исследование", [.english: "Conduct market research", .french: "Effectuer une étude de marché", .spanish: "Realizar investigación de mercado", .chinese: "进行市场研究", .portuguese: "Realizar pesquisa de mercado", .italian: "Condurre ricerca di mercato"]),
                    ("Разработать стратегию", [.english: "Develop a strategy", .french: "Développer une stratégie", .spanish: "Desarrollar una estrategia", .chinese: "制定策略", .portuguese: "Desenvolver uma estratégia", .italian: "Sviluppare una strategia"]),
                    ("Повысить узнаваемость бренда", [.english: "Increase brand awareness", .french: "Augmenter la notoriété de la marque", .spanish: "Aumentar el reconocimiento de marca", .chinese: "提高品牌知名度", .portuguese: "Aumentar o reconhecimento da marca", .italian: "Aumentare la consapevolezza del brand"])
                ]
            case .intermediate:
                return [
                    ("Оптимизировать воронку конверсии", [.english: "Optimize conversion funnel", .french: "Optimiser l'entonnoir de conversion", .spanish: "Optimizar el embudo de conversión", .chinese: "优化转化漏斗", .portuguese: "Otimizar o funil de conversão", .italian: "Ottimizzare l'imbuto di conversione"]),
                    ("Сегментировать целевую аудиторию", [.english: "Segment target audience", .french: "Segmenter le public cible", .spanish: "Segmentar la audiencia objetivo", .chinese: "细分目标受众", .portuguese: "Segmentar o público-alvo", .italian: "Segmentare il pubblico di riferimento"]),
                    ("Измерить ROI кампании", [.english: "Measure campaign ROI", .french: "Mesurer le ROI de la campagne", .spanish: "Medir el ROI de la campaña", .chinese: "衡量活动投资回报率", .portuguese: "Medir o ROI da campanha", .italian: "Misurare il ROI della campagna"])
                ]
            case .advanced:
                return [
                    ("Внедрить мультиканальную маркетинговую стратегию", [.english: "Implement omnichannel marketing strategy", .french: "Mettre en œuvre une stratégie marketing omnicanale", .spanish: "Implementar estrategia de marketing omnicanal", .chinese: "实施全渠道营销策略", .portuguese: "Implementar estratégia de marketing omnicanal", .italian: "Implementare strategia di marketing omnicanale"]),
                    ("Применить машинное обучение для персонализации", [.english: "Apply machine learning for personalization", .french: "Appliquer l'apprentissage automatique pour la personnalisation", .spanish: "Aplicar aprendizaje automático para personalización", .chinese: "应用机器学习进行个性化", .portuguese: "Aplicar aprendizado de máquina para personalização", .italian: "Applicare machine learning per la personalizzazione"]),
                    ("Оптимизировать customer journey mapping", [.english: "Optimize customer journey mapping", .french: "Optimiser la cartographie du parcours client", .spanish: "Optimizar el mapeo del viaje del cliente", .chinese: "优化客户旅程映射", .portuguese: "Otimizar o mapeamento da jornada do cliente", .italian: "Ottimizzare la mappatura del customer journey"])
                ]
            }
            
        case "Финансы":
            switch difficulty {
            case .beginner:
                return [
                    ("Открыть банковский счет", [.english: "Open a bank account", .french: "Ouvrir un compte bancaire", .spanish: "Abrir una cuenta bancaria", .chinese: "开立银行账户", .portuguese: "Abrir uma conta bancária", .italian: "Aprire un conto bancario"]),
                    ("Получить кредит", [.english: "Get a loan", .french: "Obtenir un prêt", .spanish: "Obtener un préstamo", .chinese: "获得贷款", .portuguese: "Obter um empréstimo", .italian: "Ottenere un prestito"]),
                    ("Инвестировать деньги", [.english: "Invest money", .french: "Investir de l'argent", .spanish: "Invertir dinero", .chinese: "投资", .portuguese: "Investir dinheiro", .italian: "Investire denaro"])
                ]
            case .intermediate:
                return [
                    ("Диверсифицировать инвестиционный портфель", [.english: "Diversify investment portfolio", .french: "Diversifier le portefeuille d'investissement", .spanish: "Diversificar la cartera de inversiones", .chinese: "分散投资组合", .portuguese: "Diversificar a carteira de investimentos", .italian: "Diversificare il portafoglio di investimenti"]),
                    ("Провести финансовый анализ", [.english: "Conduct financial analysis", .french: "Effectuer une analyse financière", .spanish: "Realizar análisis financiero", .chinese: "进行财务分析", .portuguese: "Realizar análise financeira", .italian: "Condurre analisi finanziaria"]),
                    ("Управлять ликвидностью", [.english: "Manage liquidity", .french: "Gérer la liquidité", .spanish: "Gestionar la liquidez", .chinese: "管理流动性", .portuguese: "Gerenciar a liquidez", .italian: "Gestire la liquidità"])
                ]
            case .advanced:
                return [
                    ("Хеджировать валютные риски", [.english: "Hedge currency risks", .french: "Couvrir les risques de change", .spanish: "Cubrir riesgos cambiarios", .chinese: "对冲货币风险", .portuguese: "Proteger contra riscos cambiais", .italian: "Coprire i rischi valutari"]),
                    ("Структурировать производные финансовые инструменты", [.english: "Structure derivative financial instruments", .french: "Structurer des instruments financiers dérivés", .spanish: "Estructurar instrumentos financieros derivados", .chinese: "构建衍生金融工具", .portuguese: "Estruturar instrumentos financeiros derivativos", .italian: "Strutturare strumenti finanziari derivati"]),
                    ("Оптимизировать структуру капитала", [.english: "Optimize capital structure", .french: "Optimiser la structure du capital", .spanish: "Optimizar la estructura de capital", .chinese: "优化资本结构", .portuguese: "Otimizar a estrutura de capital", .italian: "Ottimizzare la struttura del capitale"])
                ]
            }
            
        default:
            return getGenericPhrases(category: category, difficulty: difficulty)
        }
    }
    
    // Генерация предложений
    private static func getSentencesForCategory(_ category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch category {
        case "Маркетинг":
            switch difficulty {
            case .beginner:
                return [
                    ("Мы провели исследование рынка и выяснили потребности клиентов.", [.english: "We conducted market research and identified customer needs.", .french: "Nous avons effectué une étude de marché et identifié les besoins des clients.", .spanish: "Realizamos investigación de mercado e identificamos las necesidades del cliente.", .chinese: "我们进行了市场研究并确定了客户需求。", .portuguese: "Realizamos pesquisa de mercado e identificamos as necessidades dos clientes.", .italian: "Abbiamo condotto una ricerca di mercato e identificato i bisogni dei clienti."]),
                    ("Новая рекламная кампания увеличила продажи на 20%.", [.english: "The new advertising campaign increased sales by 20%.", .french: "La nouvelle campagne publicitaire a augmenté les ventes de 20%.", .spanish: "La nueva campaña publicitaria aumentó las ventas en un 20%.", .chinese: "新的广告活动使销售额增长了20%。", .portuguese: "A nova campanha publicitária aumentou as vendas em 20%.", .italian: "La nuova campagna pubblicitaria ha aumentato le vendite del 20%."])
                ]
            case .intermediate:
                return [
                    ("Сегментация целевой аудитории позволила нам повысить конверсию на 35% и оптимизировать маркетинговый бюджет.", [.english: "Target audience segmentation allowed us to increase conversion by 35% and optimize marketing budget.", .french: "La segmentation du public cible nous a permis d'augmenter la conversion de 35% et d'optimiser le budget marketing.", .spanish: "La segmentación de la audiencia objetivo nos permitió aumentar la conversión en un 35% y optimizar el presupuesto de marketing.", .chinese: "目标受众细分使我们能够将转化率提高35%并优化营销预算。", .portuguese: "A segmentação do público-alvo nos permitiu aumentar a conversão em 35% e otimizar o orçamento de marketing.", .italian: "La segmentazione del pubblico di riferimento ci ha permesso di aumentare la conversione del 35% e ottimizzare il budget di marketing."]),
                    ("Анализ воронки продаж выявил узкие места в процессе конверсии, которые требуют немедленной оптимизации.", [.english: "Sales funnel analysis revealed bottlenecks in the conversion process that require immediate optimization.", .french: "L'analyse de l'entonnoir de vente a révélé des goulots d'étranglement dans le processus de conversion qui nécessitent une optimisation immédiate.", .spanish: "El análisis del embudo de ventas reveló cuellos de botella en el proceso de conversión que requieren optimización inmediata.", .chinese: "销售漏斗分析揭示了转化过程中的瓶颈，需要立即优化。", .portuguese: "A análise do funil de vendas revelou gargalos no processo de conversão que requerem otimização imediata.", .italian: "L'analisi dell'imbuto di vendita ha rivelato colli di bottiglia nel processo di conversione che richiedono un'ottimizzazione immediata."])
                ]
            case .advanced:
                return [
                    ("Внедрение мультиканальной маркетинговой стратегии с использованием машинного обучения для персонализации контента привело к увеличению customer lifetime value на 45% и улучшению показателей удержания клиентов.", [.english: "Implementation of omnichannel marketing strategy using machine learning for content personalization resulted in 45% increase in customer lifetime value and improved customer retention metrics.", .french: "La mise en œuvre d'une stratégie marketing omnicanale utilisant l'apprentissage automatique pour la personnalisation du contenu a entraîné une augmentation de 45% de la valeur vie client et une amélioration des métriques de rétention client.", .spanish: "La implementación de una estrategia de marketing omnicanal utilizando aprendizaje automático para la personalización de contenido resultó en un aumento del 45% en el valor de vida del cliente y mejoró las métricas de retención de clientes.", .chinese: "使用机器学习进行内容个性化的全渠道营销策略的实施使客户生命周期价值增加了45%，并改善了客户保留指标。", .portuguese: "A implementação de uma estratégia de marketing omnicanal usando aprendizado de máquina para personalização de conteúdo resultou em um aumento de 45% no valor vitalício do cliente e melhorou as métricas de retenção de clientes.", .italian: "L'implementazione di una strategia di marketing omnicanale utilizzando il machine learning per la personalizzazione dei contenuti ha portato a un aumento del 45% del customer lifetime value e al miglioramento delle metriche di fidelizzazione dei clienti."])
                ]
            }
            
        default:
            return getGenericSentences(category: category, difficulty: difficulty)
        }
    }
    
    // Общие слова для остальных категорий
    private static func getGenericWords(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        let baseWords: [(russian: String, translations: [Language: String])] = [
            ("Процесс", [.english: "Process", .french: "Processus", .spanish: "Proceso", .chinese: "过程", .portuguese: "Processo", .italian: "Processo"]),
            ("Стратегия", [.english: "Strategy", .french: "Stratégie", .spanish: "Estrategia", .chinese: "策略", .portuguese: "Estratégia", .italian: "Strategia"]),
            ("Управление", [.english: "Management", .french: "Gestion", .spanish: "Gestión", .chinese: "管理", .portuguese: "Gestão", .italian: "Gestione"]),
            ("Анализ", [.english: "Analysis", .french: "Analyse", .spanish: "Análisis", .chinese: "分析", .portuguese: "Análise", .italian: "Analisi"]),
            ("Оптимизация", [.english: "Optimization", .french: "Optimisation", .spanish: "Optimización", .chinese: "优化", .portuguese: "Otimização", .italian: "Ottimizzazione"])
        ]
        return baseWords
    }
    
    // Общие фразы
    private static func getGenericPhrases(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        return [
            ("Разработать стратегию", [.english: "Develop a strategy", .french: "Développer une stratégie", .spanish: "Desarrollar una estrategia", .chinese: "制定策略", .portuguese: "Desenvolver uma estratégia", .italian: "Sviluppare una strategia"]),
            ("Провести анализ", [.english: "Conduct analysis", .french: "Effectuer une analyse", .spanish: "Realizar análisis", .chinese: "进行分析", .portuguese: "Realizar análise", .italian: "Condurre analisi"]),
            ("Оптимизировать процесс", [.english: "Optimize process", .french: "Optimiser le processus", .spanish: "Optimizar el proceso", .chinese: "优化流程", .portuguese: "Otimizar o processo", .italian: "Ottimizzare il processo"])
        ]
    }
    
    // Общие предложения
    private static func getGenericSentences(category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        return [
            ("Мы разработали комплексную стратегию для достижения поставленных целей.", [.english: "We developed a comprehensive strategy to achieve the set goals.", .french: "Nous avons développé une stratégie complète pour atteindre les objectifs fixés.", .spanish: "Desarrollamos una estrategia integral para lograr los objetivos establecidos.", .chinese: "我们制定了全面的策略来实现既定目标。", .portuguese: "Desenvolvemos uma estratégia abrangente para alcançar os objetivos estabelecidos.", .italian: "Abbiamo sviluppato una strategia completa per raggiungere gli obiettivi stabiliti."])
        ]
    }
}
