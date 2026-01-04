//
//  ExampleSentenceGenerator.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class ExampleSentenceGenerator {
    // Генерация примеров предложений для слова
    static func generateExamples(for word: String, translations: [Language: String], category: String, difficulty: DifficultyLevel) -> [LearningItem.ExampleSentence] {
        var examples: [LearningItem.ExampleSentence] = []
        
        // Получаем примеры из базы данных
        let databaseExamples = getExamplesFromDatabase(word: word, category: category, difficulty: difficulty)
        examples.append(contentsOf: databaseExamples)
        
        // Если недостаточно примеров, генерируем дополнительные
        if examples.count < 3 {
            let generatedExamples = generateDynamicExamples(for: word, translations: translations, category: category, difficulty: difficulty, count: 3 - examples.count)
            examples.append(contentsOf: generatedExamples)
        }
        
        return Array(examples.prefix(3)) // Возвращаем максимум 3 примера
    }
    
    // Получение примеров из базы данных
    private static func getExamplesFromDatabase(word: String, category: String, difficulty: DifficultyLevel) -> [LearningItem.ExampleSentence] {
        let examplesDatabase: [String: [String: [(russian: String, translations: [Language: String], position: Int)]]] = [
            "Маркетинг": [
                "Рынок": [
                    ("Мы провели анализ рынка и выявили новые возможности.", [
                        Language.english: "We conducted market analysis and identified new opportunities.",
                        Language.french: "Nous avons effectué une analyse de marché et identifié de nouvelles opportunités.",
                        Language.spanish: "Realizamos análisis de mercado e identificamos nuevas oportunidades.",
                        Language.chinese: "我们进行了市场分析并发现了新的机会。",
                        Language.portuguese: "Realizamos análise de mercado e identificamos novas oportunidades.",
                        Language.italian: "Abbiamo condotto un'analisi di mercato e identificato nuove opportunità."
                    ], 2),
                    ("Рынок растет быстрыми темпами.", [
                        Language.english: "The market is growing at a rapid pace.",
                        Language.french: "Le marché croît à un rythme rapide.",
                        Language.spanish: "El mercado está creciendo a un ritmo rápido.",
                        Language.chinese: "市场正在快速增长。",
                        Language.portuguese: "O mercado está crescendo em ritmo acelerado.",
                        Language.italian: "Il mercato sta crescendo a ritmo sostenuto."
                    ], 0),
                    ("Наш продукт занимает лидирующее положение на рынке.", [
                        Language.english: "Our product holds a leading position in the market.",
                        Language.french: "Notre produit occupe une position de leader sur le marché.",
                        Language.spanish: "Nuestro producto ocupa una posición líder en el mercado.",
                        Language.chinese: "我们的产品在市场上占据领先地位。",
                        Language.portuguese: "Nosso produto ocupa uma posição de liderança no mercado.",
                        Language.italian: "Il nostro prodotto detiene una posizione di leadership nel mercato."
                    ], 5)
                ],
                "Реклама": [
                    ("Новая рекламная кампания привлекла много внимания.", [
                        Language.english: "The new advertising campaign attracted a lot of attention.",
                        Language.french: "La nouvelle campagne publicitaire a attiré beaucoup d'attention.",
                        Language.spanish: "La nueva campaña publicitaria atrajo mucha atención.",
                        Language.chinese: "新的广告活动吸引了很多关注。",
                        Language.portuguese: "A nova campanha publicitária atraiu muita atenção.",
                        Language.italian: "La nuova campagna pubblicitaria ha attirato molta attenzione."
                    ], 1),
                    ("Мы инвестируем значительные средства в рекламу.", [
                        Language.english: "We invest significant funds in advertising.",
                        Language.french: "Nous investissons des fonds importants dans la publicité.",
                        Language.spanish: "Invertimos fondos significativos en publicidad.",
                        Language.chinese: "我们在广告上投入了大量资金。",
                        Language.portuguese: "Investimos fundos significativos em publicidade.",
                        Language.italian: "Investiamo fondi significativi nella pubblicità."
                    ], 4)
                ],
                "Бренд": [
                    ("Сильный бренд создает доверие у клиентов.", [
                        Language.english: "A strong brand creates trust among customers.",
                        Language.french: "Une marque forte crée la confiance chez les clients.",
                        Language.spanish: "Una marca fuerte crea confianza entre los clientes.",
                        Language.chinese: "强大的品牌在客户中建立信任。",
                        Language.portuguese: "Uma marca forte cria confiança entre os clientes.",
                        Language.italian: "Un marchio forte crea fiducia tra i clienti."
                    ], 1),
                    ("Мы работаем над укреплением нашего бренда.", [
                        Language.english: "We are working on strengthening our brand.",
                        Language.french: "Nous travaillons au renforcement de notre marque.",
                        Language.spanish: "Estamos trabajando en fortalecer nuestra marca.",
                        Language.chinese: "我们正在努力加强我们的品牌。",
                        Language.portuguese: "Estamos trabalhando para fortalecer nossa marca.",
                        Language.italian: "Stiamo lavorando per rafforzare il nostro marchio."
                    ], 4)
                ],
                "CAC": [
                    ("Мы снизили CAC на 30% благодаря оптимизации каналов.", [
                        Language.english: "We reduced CAC by 30% through channel optimization.",
                        Language.french: "Nous avons réduit le CAC de 30% grâce à l'optimisation des canaux.",
                        Language.spanish: "Redujimos el CAC en un 30% mediante la optimización de canales.",
                        Language.chinese: "我们通过渠道优化将CAC降低了30%。",
                        Language.portuguese: "Reduzimos o CAC em 30% através da otimização de canais.",
                        Language.italian: "Abbiamo ridotto il CAC del 30% attraverso l'ottimizzazione dei canali."
                    ], 1),
                    ("Высокий CAC может негативно влиять на прибыльность.", [
                        Language.english: "High CAC can negatively impact profitability.",
                        Language.french: "Un CAC élevé peut avoir un impact négatif sur la rentabilité.",
                        Language.spanish: "Un CAC alto puede afectar negativamente la rentabilidad.",
                        Language.chinese: "高CAC可能对盈利能力产生负面影响。",
                        Language.portuguese: "Um CAC alto pode afetar negativamente a rentabilidade.",
                        Language.italian: "Un CAC elevato può influire negativamente sulla redditività."
                    ], 1)
                ]
            ]
        ]
        
        var result: [LearningItem.ExampleSentence] = []
        
        if let categoryExamples = examplesDatabase[category],
           let wordExamples = categoryExamples[word] {
            for example in wordExamples {
                result.append(LearningItem.ExampleSentence(
                    russian: example.russian,
                    translations: example.translations,
                    wordPosition: example.position
                ))
            }
        }
        
        return result
    }
    
    // Динамическая генерация примеров
    private static func generateDynamicExamples(for word: String, translations: [Language: String], category: String, difficulty: DifficultyLevel, count: Int) -> [LearningItem.ExampleSentence] {
        var examples: [LearningItem.ExampleSentence] = []
        
        let templates = getSentenceTemplates(for: category, difficulty: difficulty)
        let translation = translations[Language.english] ?? word
        
        // Защита от пустого массива шаблонов
        guard !templates.isEmpty else {
            return examples
        }
        
        for i in 0..<count {
            let templateIndex = i % templates.count
            let template = templates[templateIndex]
            
            // Создаем предложение, вставляя слово в шаблон
            let (sentence, position) = createSentenceFromTemplate(template: template, word: word, translation: translation)
            
            // Создаем переводы для предложения
            let sentenceTranslations = createTranslationsForSentence(sentence: sentence, word: word, translations: translations, translation: translation, difficulty: difficulty, templateIndex: templateIndex)
            
            examples.append(LearningItem.ExampleSentence(
                russian: sentence,
                translations: sentenceTranslations,
                wordPosition: position
            ))
        }
        
        return examples
    }
    
    // Шаблоны предложений для категорий
    private static func getSentenceTemplates(for category: String, difficulty: DifficultyLevel) -> [String] {
        switch difficulty {
        case .beginner:
            return [
                "Мы используем {word} в нашей работе.",
                "{Word} помогает нам достигать целей.",
                "Важно понимать значение {word}.",
                "Наша компания работает с {word}.",
                "{Word} является ключевым элементом."
            ]
        case .intermediate:
            return [
                "Эффективное использование {word} позволяет нам оптимизировать процессы.",
                "Мы анализируем влияние {word} на результаты бизнеса.",
                "Стратегическое применение {word} дает конкурентные преимущества.",
                "Наша команда специализируется на работе с {word}.",
                "Интеграция {word} в бизнес-процессы повышает эффективность."
            ]
        case .advanced:
            return [
                "Внедрение передовых практик работы с {word} трансформирует наш бизнес.",
                "Комплексный анализ {word} выявляет скрытые возможности для роста.",
                "Стратегическая оптимизация {word} создает устойчивые конкурентные преимущества.",
                "Инновационные подходы к использованию {word} революционизируют отрасль.",
                "Системная интеграция {word} в корпоративную стратегию обеспечивает долгосрочный успех."
            ]
        }
    }
    
    // Создание предложения из шаблона
    private static func createSentenceFromTemplate(template: String, word: String, translation: String) -> (sentence: String, position: Int) {
        let words = template.components(separatedBy: " ")
        var resultWords: [String] = []
        var position = -1
        
        for (index, templateWord) in words.enumerated() {
            if templateWord.contains("{word}") {
                let replaced = templateWord.replacingOccurrences(of: "{word}", with: word)
                resultWords.append(replaced)
                position = index
            } else if templateWord.contains("{Word}") {
                let capitalizedWord = word.prefix(1).uppercased() + word.dropFirst()
                let replaced = templateWord.replacingOccurrences(of: "{Word}", with: capitalizedWord)
                resultWords.append(replaced)
                position = index
            } else {
                resultWords.append(templateWord)
            }
        }
        
        let sentence = resultWords.joined(separator: " ")
        return (sentence, position >= 0 ? position : 0)
    }
    
    // Создание переводов для предложения
    private static func createTranslationsForSentence(sentence: String, word: String, translations: [Language: String], translation: String, difficulty: DifficultyLevel, templateIndex: Int) -> [Language: String] {
        // Используем базовые шаблоны переводов
        let englishTemplates = [
            // Beginner (0-4)
            "We use {word} in our work.",
            "{Word} helps us achieve our goals.",
            "It is important to understand the meaning of {word}.",
            "Our company works with {word}.",
            "{Word} is a key element.",
            // Intermediate (5-9)
            "Effective use of {word} allows us to optimize processes.",
            "We analyze the impact of {word} on business results.",
            "Strategic application of {word} provides competitive advantages.",
            "Our team specializes in working with {word}.",
            "Integration of {word} into business processes increases efficiency.",
            // Advanced (10-14)
            "Implementation of advanced practices of working with {word} transforms our business.",
            "Comprehensive analysis of {word} reveals hidden opportunities for growth.",
            "Strategic optimization of {word} creates sustainable competitive advantages.",
            "Innovative approaches to using {word} revolutionize the industry.",
            "Systematic integration of {word} into corporate strategy ensures long-term success."
        ]
        
        let frenchTemplates = [
            // Beginner (0-4)
            "Nous utilisons {word} dans notre travail.",
            "{Word} nous aide à atteindre nos objectifs.",
            "Il est important de comprendre la signification de {word}.",
            "Notre entreprise travaille avec {word}.",
            "{Word} est un élément clé.",
            // Intermediate (5-9)
            "L'utilisation efficace de {word} nous permet d'optimiser les processus.",
            "Nous analysons l'impact de {word} sur les résultats commerciaux.",
            "L'application stratégique de {word} offre des avantages concurrentiels.",
            "Notre équipe se spécialise dans le travail avec {word}.",
            "L'intégration de {word} dans les processus commerciaux augmente l'efficacité.",
            // Advanced (10-14)
            "La mise en œuvre de pratiques avancées de travail avec {word} transforme notre entreprise.",
            "L'analyse complète de {word} révèle des opportunités cachées de croissance.",
            "L'optimisation stratégique de {word} crée des avantages concurrentiels durables.",
            "Les approches innovantes d'utilisation de {word} révolutionnent l'industrie.",
            "L'intégration systématique de {word} dans la stratégie d'entreprise assure le succès à long terme."
        ]
        
        let spanishTemplates = [
            // Beginner (0-4)
            "Utilizamos {word} en nuestro trabajo.",
            "{Word} nos ayuda a alcanzar nuestros objetivos.",
            "Es importante entender el significado de {word}.",
            "Nuestra empresa trabaja con {word}.",
            "{Word} es un elemento clave.",
            // Intermediate (5-9)
            "El uso efectivo de {word} nos permite optimizar procesos.",
            "Analizamos el impacto de {word} en los resultados del negocio.",
            "La aplicación estratégica de {word} proporciona ventajas competitivas.",
            "Nuestro equipo se especializa en trabajar con {word}.",
            "La integración de {word} en los procesos comerciales aumenta la eficiencia.",
            // Advanced (10-14)
            "La implementación de prácticas avanzadas de trabajo con {word} transforma nuestro negocio.",
            "El análisis integral de {word} revela oportunidades ocultas de crecimiento.",
            "La optimización estratégica de {word} crea ventajas competitivas sostenibles.",
            "Los enfoques innovadores para usar {word} revolucionan la industria.",
            "La integración sistemática de {word} en la estrategia corporativa asegura el éxito a largo plazo."
        ]
        
        let chineseTemplates = [
            // Beginner (0-4)
            "我们在工作中使用{word}。",
            "{Word}帮助我们实现目标。",
            "理解{word}的含义很重要。",
            "我们公司与{word}合作。",
            "{Word}是一个关键要素。",
            // Intermediate (5-9)
            "有效使用{word}使我们能够优化流程。",
            "我们分析{word}对业务结果的影响。",
            "{Word}的战略应用提供了竞争优势。",
            "我们的团队专门从事{word}工作。",
            "将{word}整合到业务流程中提高了效率。",
            // Advanced (10-14)
            "实施与{word}合作的先进实践改变了我们的业务。",
            "对{word}的全面分析揭示了隐藏的增长机会。",
            "{Word}的战略优化创造了可持续的竞争优势。",
            "使用{word}的创新方法正在革命性地改变行业。",
            "将{word}系统性地整合到企业战略中确保了长期成功。"
        ]
        
        let portugueseTemplates = [
            // Beginner (0-4)
            "Usamos {word} em nosso trabalho.",
            "{Word} nos ajuda a alcançar nossos objetivos.",
            "É importante entender o significado de {word}.",
            "Nossa empresa trabalha com {word}.",
            "{Word} é um elemento chave.",
            // Intermediate (5-9)
            "O uso eficaz de {word} nos permite otimizar processos.",
            "Analisamos o impacto de {word} nos resultados do negócio.",
            "A aplicação estratégica de {word} fornece vantagens competitivas.",
            "Nossa equipe se especializa em trabalhar com {word}.",
            "A integração de {word} nos processos comerciais aumenta a eficiência.",
            // Advanced (10-14)
            "A implementação de práticas avançadas de trabalho com {word} transforma nosso negócio.",
            "A análise abrangente de {word} revela oportunidades ocultas de crescimento.",
            "A otimização estratégica de {word} cria vantagens competitivas sustentáveis.",
            "Abordagens inovadoras para usar {word} revolucionam a indústria.",
            "A integração sistemática de {word} na estratégia corporativa garante o sucesso a longo prazo."
        ]
        
        let italianTemplates = [
            // Beginner (0-4)
            "Usiamo {word} nel nostro lavoro.",
            "{Word} ci aiuta a raggiungere i nostri obiettivi.",
            "È importante capire il significato di {word}.",
            "La nostra azienda lavora con {word}.",
            "{Word} è un elemento chiave.",
            // Intermediate (5-9)
            "L'uso efficace di {word} ci permette di ottimizzare i processi.",
            "Analizziamo l'impatto di {word} sui risultati aziendali.",
            "L'applicazione strategica di {word} fornisce vantaggi competitivi.",
            "Il nostro team si specializza nel lavorare con {word}.",
            "L'integrazione di {word} nei processi aziendali aumenta l'efficienza.",
            // Advanced (10-14)
            "L'implementazione di pratiche avanzate di lavoro con {word} trasforma la nostra azienda.",
            "L'analisi completa di {word} rivela opportunità nascoste di crescita.",
            "L'ottimizzazione strategica di {word} crea vantaggi competitivi sostenibili.",
            "Approcci innovativi all'uso di {word} rivoluzionano il settore.",
            "L'integrazione sistematica di {word} nella strategia aziendale assicura il successo a lungo termine."
        ]
        
        // Вычисляем правильный индекс в зависимости от уровня сложности
        let offset: Int
        switch difficulty {
        case .beginner:
            offset = 0
        case .intermediate:
            offset = 5
        case .advanced:
            offset = 10
        }
        let templateIndexToUse = englishTemplates.isEmpty ? 0 : ((templateIndex + offset) % englishTemplates.count)
        
        func replaceWord(in template: String, with word: String) -> String {
            // Убеждаемся, что слово не пустое
            guard !word.isEmpty else {
                return template
            }
            let capitalized = word.prefix(1).uppercased() + word.dropFirst()
            var result = template
            // Заменяем сначала {Word}, потом {word}, чтобы избежать конфликтов
            result = result.replacingOccurrences(of: "{Word}", with: capitalized, options: [], range: nil)
            result = result.replacingOccurrences(of: "{word}", with: word, options: [], range: nil)
            // Дополнительная проверка - если остались плейсхолдеры, заменяем их
            if result.contains("{word}") || result.contains("{Word}") {
                result = result.replacingOccurrences(of: "{Word}", with: capitalized)
                result = result.replacingOccurrences(of: "{word}", with: word)
            }
            return result
        }
        
        // Получаем переводы для каждого языка
        let englishTranslation = translations[.english] ?? translation
        let frenchTranslation = translations[.french] ?? translation
        let spanishTranslation = translations[.spanish] ?? translation
        let chineseTranslation = translations[.chinese] ?? translation
        let portugueseTranslation = translations[.portuguese] ?? translation
        let italianTranslation = translations[.italian] ?? translation
        
        return [
            Language.english: replaceWord(in: englishTemplates[templateIndexToUse], with: englishTranslation.isEmpty ? translation : englishTranslation),
            Language.french: replaceWord(in: frenchTemplates[templateIndexToUse], with: frenchTranslation.isEmpty ? translation : frenchTranslation),
            Language.spanish: replaceWord(in: spanishTemplates[templateIndexToUse], with: spanishTranslation.isEmpty ? translation : spanishTranslation),
            Language.chinese: replaceWord(in: chineseTemplates[templateIndexToUse], with: chineseTranslation.isEmpty ? translation : chineseTranslation),
            Language.portuguese: replaceWord(in: portugueseTemplates[templateIndexToUse], with: portugueseTranslation.isEmpty ? translation : portugueseTranslation),
            Language.italian: replaceWord(in: italianTemplates[templateIndexToUse], with: italianTranslation.isEmpty ? translation : italianTranslation)
        ]
    }
}

