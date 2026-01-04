//
//  GrammarDatabase.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class GrammarDatabase {
    static let shared = GrammarDatabase()
    
    // Местоимения
    let pronouns: [Language: [(russian: String, translations: [Language: String], examples: [String])]] = [
        Language.english: [
            // Личные местоимения
            ("Я", [
                Language.english: "I",
                Language.french: "Je",
                Language.spanish: "Yo",
                Language.chinese: "我",
                Language.portuguese: "Eu",
                Language.italian: "Io"
            ], [
                "Я работаю в офисе.",
                "Я изучаю языки.",
                "Я люблю путешествовать."
            ]),
            ("Ты", [
                Language.english: "You",
                Language.french: "Tu",
                Language.spanish: "Tú",
                Language.chinese: "你",
                Language.portuguese: "Você",
                Language.italian: "Tu"
            ], [
                "Ты говоришь по-английски?",
                "Ты работаешь здесь?",
                "Ты понимаешь меня?"
            ]),
            ("Он", [
                Language.english: "He",
                Language.french: "Il",
                Language.spanish: "Él",
                Language.chinese: "他",
                Language.portuguese: "Ele",
                Language.italian: "Lui"
            ], [
                "Он менеджер проекта.",
                "Он живет в Лондоне.",
                "Он говорит на трех языках."
            ]),
            ("Она", [
                Language.english: "She",
                Language.french: "Elle",
                Language.spanish: "Ella",
                Language.chinese: "她",
                Language.portuguese: "Ela",
                Language.italian: "Lei"
            ], [
                "Она директор компании.",
                "Она работает в маркетинге.",
                "Она изучает бизнес."
            ]),
            ("Мы", [
                Language.english: "We",
                Language.french: "Nous",
                Language.spanish: "Nosotros",
                Language.chinese: "我们",
                Language.portuguese: "Nós",
                Language.italian: "Noi"
            ], [
                "Мы работаем вместе.",
                "Мы встречаемся каждый день.",
                "Мы планируем проект."
            ]),
            ("Вы", [
                Language.english: "You",
                Language.french: "Vous",
                Language.spanish: "Ustedes",
                Language.chinese: "你们",
                Language.portuguese: "Vocês",
                Language.italian: "Voi"
            ], [
                "Вы работаете в этой компании?",
                "Вы понимаете задачу?",
                "Вы готовы к встрече?"
            ]),
            ("Они", [
                Language.english: "They",
                Language.french: "Ils/Elles",
                Language.spanish: "Ellos/Ellas",
                Language.chinese: "他们",
                Language.portuguese: "Eles/Elas",
                Language.italian: "Loro"
            ], [
                "Они работают в команде.",
                "Они изучают новые технологии.",
                "Они достигли успеха."
            ]),
            // Притяжательные местоимения
            ("Мой", [
                Language.english: "My",
                Language.french: "Mon/Ma",
                Language.spanish: "Mi",
                Language.chinese: "我的",
                Language.portuguese: "Meu/Minha",
                Language.italian: "Mio/Mia"
            ], [
                "Это мой компьютер.",
                "Мой офис находится здесь.",
                "Мой проект завершен."
            ]),
            ("Твой", [
                Language.english: "Your",
                Language.french: "Ton/Ta",
                Language.spanish: "Tu",
                Language.chinese: "你的",
                Language.portuguese: "Seu/Sua",
                Language.italian: "Tuo/Tua"
            ], [
                "Твой отчет готов?",
                "Твой план работает.",
                "Твоя идея отличная."
            ]),
            ("Его", [
                Language.english: "His",
                Language.french: "Son/Sa",
                Language.spanish: "Su",
                Language.chinese: "他的",
                Language.portuguese: "Dele/Dela",
                Language.italian: "Suo/Sua"
            ], [
                "Его презентация была успешной.",
                "Его команда работает эффективно.",
                "Его решение правильное."
            ]),
            ("Её", [
                Language.english: "Her",
                Language.french: "Son/Sa",
                Language.spanish: "Su",
                Language.chinese: "她的",
                Language.portuguese: "Dele/Dela",
                Language.italian: "Suo/Sua"
            ], [
                "Её проект получил награду.",
                "Её команда лучшая.",
                "Её стратегия работает."
            ]),
            ("Наш", [
                Language.english: "Our",
                Language.french: "Notre",
                Language.spanish: "Nuestro",
                Language.chinese: "我们的",
                Language.portuguese: "Nosso/Nossa",
                Language.italian: "Nostro/Nostra"
            ], [
                "Наш офис находится в центре.",
                "Наш проект успешен.",
                "Наша команда профессиональная."
            ]),
            ("Их", [
                Language.english: "Their",
                Language.french: "Leur",
                Language.spanish: "Su",
                Language.chinese: "他们的",
                Language.portuguese: "Deles/Delas",
                Language.italian: "Loro"
            ], [
                "Их компания растет.",
                "Их продукт популярен.",
                "Их стратегия эффективна."
            ]),
            // Указательные местоимения
            ("Этот", [
                Language.english: "This",
                Language.french: "Ce/Cette",
                Language.spanish: "Este/Esta",
                Language.chinese: "这个",
                Language.portuguese: "Este/Esta",
                Language.italian: "Questo/Questa"
            ], [
                "Этот проект важен.",
                "Этот документ нужен.",
                "Этот метод работает."
            ]),
            ("Тот", [
                Language.english: "That",
                Language.french: "Ce/Cette",
                Language.spanish: "Ese/Esa",
                Language.chinese: "那个",
                Language.portuguese: "Esse/essa",
                Language.italian: "Quello/Quella"
            ], [
                "Тот проект завершен.",
                "Тот документ устарел.",
                "Тот метод не работает."
            ]),
            // Вопросительные местоимения
            ("Кто", [
                Language.english: "Who",
                Language.french: "Qui",
                Language.spanish: "Quién",
                Language.chinese: "谁",
                Language.portuguese: "Quem",
                Language.italian: "Chi"
            ], [
                "Кто руководит проектом?",
                "Кто отвечает за это?",
                "Кто работает здесь?"
            ]),
            ("Что", [
                Language.english: "What",
                Language.french: "Quoi",
                Language.spanish: "Qué",
                Language.chinese: "什么",
                Language.portuguese: "O que",
                Language.italian: "Cosa"
            ], [
                "Что вы делаете?",
                "Что это значит?",
                "Что нужно сделать?"
            ]),
            ("Где", [
                Language.english: "Where",
                Language.french: "Où",
                Language.spanish: "Dónde",
                Language.chinese: "哪里",
                Language.portuguese: "Onde",
                Language.italian: "Dove"
            ], [
                "Где находится офис?",
                "Где мы встречаемся?",
                "Где документы?"
            ]),
            ("Когда", [
                Language.english: "When",
                Language.french: "Quand",
                Language.spanish: "Cuándo",
                Language.chinese: "什么时候",
                Language.portuguese: "Quando",
                Language.italian: "Quando"
            ], [
                "Когда начинается встреча?",
                "Когда проект завершится?",
                "Когда вы вернетесь?"
            ]),
            ("Почему", [
                Language.english: "Why",
                Language.french: "Pourquoi",
                Language.spanish: "Por qué",
                Language.chinese: "为什么",
                Language.portuguese: "Por que",
                Language.italian: "Perché"
            ], [
                "Почему проект задержался?",
                "Почему это важно?",
                "Почему вы здесь?"
            ]),
            ("Как", [
                Language.english: "How",
                Language.french: "Comment",
                Language.spanish: "Cómo",
                Language.chinese: "怎么",
                Language.portuguese: "Como",
                Language.italian: "Come"
            ], [
                "Как это работает?",
                "Как вы это делаете?",
                "Как решить проблему?"
            ])
        ]
    ]
    
    // Артикли
    let articles: [Language: [(russian: String, translations: [Language: String], examples: [String])]] = [
        Language.english: [
            ("Неопределенный артикль (a/an)", [
                Language.english: "A/An",
                Language.french: "Un/Une",
                Language.spanish: "Un/Una",
                Language.chinese: "一个",
                Language.portuguese: "Um/Uma",
                Language.italian: "Un/Una"
            ], [
                "Это проект.",
                "У нас есть встреча.",
                "Нужен документ."
            ]),
            ("Определенный артикль (the)", [
                Language.english: "The",
                Language.french: "Le/La/Les",
                Language.spanish: "El/La/Los/Las",
                Language.chinese: "这/那",
                Language.portuguese: "O/A/Os/As",
                Language.italian: "Il/La/Lo/Gli/Le"
            ], [
                "Проект завершен.",
                "Встреча началась.",
                "Документ готов."
            ])
        ]
    ]
    
    // Предлоги
    let prepositions: [Language: [(russian: String, translations: [Language: String], examples: [String])]] = [
        Language.english: [
            ("В", [
                Language.english: "In",
                Language.french: "Dans",
                Language.spanish: "En",
                Language.chinese: "在...里",
                Language.portuguese: "Em",
                Language.italian: "In"
            ], [
                "Я работаю в офисе.",
                "Документы в папке.",
                "Встреча в понедельник."
            ]),
            ("На", [
                Language.english: "On",
                Language.french: "Sur",
                Language.spanish: "Sobre",
                Language.chinese: "在...上",
                Language.portuguese: "Em/Sobre",
                Language.italian: "Su"
            ], [
                "Документ на столе.",
                "Проект на стадии планирования.",
                "Фокус на результатах."
            ]),
            ("С", [
                Language.english: "With",
                Language.french: "Avec",
                Language.spanish: "Con",
                Language.chinese: "和",
                Language.portuguese: "Com",
                Language.italian: "Con"
            ], [
                "Я работаю с командой.",
                "Встреча с клиентом.",
                "Согласен с вами."
            ]),
            ("Для", [
                Language.english: "For",
                Language.french: "Pour",
                Language.spanish: "Para",
                Language.chinese: "为了",
                Language.portuguese: "Para",
                Language.italian: "Per"
            ], [
                "Это для проекта.",
                "Презентация для клиента.",
                "Важно для бизнеса."
            ]),
            ("От", [
                Language.english: "From",
                Language.french: "De",
                Language.spanish: "De",
                Language.chinese: "从",
                Language.portuguese: "De",
                Language.italian: "Da"
            ], [
                "Письмо от клиента.",
                "От начала до конца.",
                "Зависит от ситуации."
            ]),
            ("К", [
                Language.english: "To",
                Language.french: "À",
                Language.spanish: "A",
                Language.chinese: "到",
                Language.portuguese: "Para/A",
                Language.italian: "A"
            ], [
                "Идем к клиенту.",
                "Отчет к пятнице.",
                "Принадлежит к группе."
            ]),
            ("Из", [
                Language.english: "From/Of",
                Language.french: "De",
                Language.spanish: "De",
                Language.chinese: "从",
                Language.portuguese: "De",
                Language.italian: "Di"
            ], [
                "Из разных стран.",
                "Состоит из частей.",
                "Один из многих."
            ]),
            ("По", [
                Language.english: "By/According to",
                Language.french: "Par/Selon",
                Language.spanish: "Por/Según",
                Language.chinese: "根据",
                Language.portuguese: "Por/De acordo com",
                Language.italian: "Da/Secondo"
            ], [
                "По плану.",
                "По мнению экспертов.",
                "По результатам анализа."
            ]),
            ("При", [
                Language.english: "At/During",
                Language.french: "Lors de",
                Language.spanish: "Durante",
                Language.chinese: "在...期间",
                Language.portuguese: "Durante",
                Language.italian: "Durante"
            ], [
                "При обсуждении.",
                "При выполнении задачи.",
                "При встрече."
            ]),
            ("О", [
                Language.english: "About",
                Language.french: "Sur",
                Language.spanish: "Sobre",
                Language.chinese: "关于",
                Language.portuguese: "Sobre",
                Language.italian: "Su"
            ], [
                "Говорим о проекте.",
                "Думаем о решении.",
                "Знаем о проблеме."
            ])
        ]
    ]
    
    // Союзы
    let conjunctions: [Language: [(russian: String, translations: [Language: String], examples: [String])]] = [
        Language.english: [
            ("И", [
                Language.english: "And",
                Language.french: "Et",
                Language.spanish: "Y",
                Language.chinese: "和",
                Language.portuguese: "E",
                Language.italian: "E"
            ], [
                "Проект и команда.",
                "Анализ и планирование.",
                "Мы и они работаем вместе."
            ]),
            ("Но", [
                Language.english: "But",
                Language.french: "Mais",
                Language.spanish: "Pero",
                Language.chinese: "但是",
                Language.portuguese: "Mas",
                Language.italian: "Ma"
            ], [
                "Хорошо, но дорого.",
                "Быстро, но некачественно.",
                "Хотели, но не смогли."
            ]),
            ("Или", [
                Language.english: "Or",
                Language.french: "Ou",
                Language.spanish: "O",
                Language.chinese: "或者",
                Language.portuguese: "Ou",
                Language.italian: "O"
            ], [
                "Сегодня или завтра.",
                "Это или то.",
                "Да или нет."
            ]),
            ("Потому что", [
                Language.english: "Because",
                Language.french: "Parce que",
                Language.spanish: "Porque",
                Language.chinese: "因为",
                Language.portuguese: "Porque",
                Language.italian: "Perché"
            ], [
                "Успешно, потому что работали усердно.",
                "Задержались, потому что были проблемы.",
                "Выбрали это, потому что лучше."
            ]),
            ("Если", [
                Language.english: "If",
                Language.french: "Si",
                Language.spanish: "Si",
                Language.chinese: "如果",
                Language.portuguese: "Se",
                Language.italian: "Se"
            ], [
                "Если успеем, сделаем сегодня.",
                "Если нужно, поможем.",
                "Если возможно, сделаем."
            ]),
            ("Хотя", [
                Language.english: "Although",
                Language.french: "Bien que",
                Language.spanish: "Aunque",
                Language.chinese: "虽然",
                Language.portuguese: "Embora",
                Language.italian: "Sebbene"
            ], [
                "Хотя сложно, но возможно.",
                "Хотя дорого, но качественно.",
                "Хотя долго, но эффективно."
            ]),
            ("Чтобы", [
                Language.english: "In order to/So that",
                Language.french: "Pour que",
                Language.spanish: "Para que",
                Language.chinese: "为了",
                Language.portuguese: "Para que",
                Language.italian: "Affinché"
            ], [
                "Работаем, чтобы достичь цели.",
                "Учимся, чтобы развиваться.",
                "Планируем, чтобы успешно."
            ])
        ]
    ]
    
    // Наречия
    let adverbs: [Language: [(russian: String, translations: [Language: String], examples: [String])]] = [
        Language.english: [
            ("Очень", [
                Language.english: "Very",
                Language.french: "Très",
                Language.spanish: "Muy",
                Language.chinese: "很",
                Language.portuguese: "Muito",
                Language.italian: "Molto"
            ], [
                "Очень важно.",
                "Очень эффективно.",
                "Очень профессионально."
            ]),
            ("Хорошо", [
                Language.english: "Well",
                Language.french: "Bien",
                Language.spanish: "Bien",
                Language.chinese: "好",
                Language.portuguese: "Bem",
                Language.italian: "Bene"
            ], [
                "Хорошо работает.",
                "Хорошо понимает.",
                "Хорошо справляется."
            ]),
            ("Быстро", [
                Language.english: "Quickly",
                Language.french: "Rapidement",
                Language.spanish: "Rápidamente",
                Language.chinese: "快速",
                Language.portuguese: "Rapidamente",
                Language.italian: "Rapidamente"
            ], [
                "Быстро решает.",
                "Быстро отвечает.",
                "Быстро работает."
            ]),
            ("Всегда", [
                Language.english: "Always",
                Language.french: "Toujours",
                Language.spanish: "Siempre",
                Language.chinese: "总是",
                Language.portuguese: "Sempre",
                Language.italian: "Sempre"
            ], [
                "Всегда на связи.",
                "Всегда готов помочь.",
                "Всегда в срок."
            ]),
            ("Никогда", [
                Language.english: "Never",
                Language.french: "Jamais",
                Language.spanish: "Nunca",
                Language.chinese: "从不",
                Language.portuguese: "Nunca",
                Language.italian: "Mai"
            ], [
                "Никогда не опаздывает.",
                "Никогда не сдается.",
                "Никогда не отказывается."
            ]),
            ("Иногда", [
                Language.english: "Sometimes",
                Language.french: "Parfois",
                Language.spanish: "A veces",
                Language.chinese: "有时",
                Language.portuguese: "Às vezes",
                Language.italian: "A volte"
            ], [
                "Иногда встречаемся.",
                "Иногда обсуждаем.",
                "Иногда работаем вместе."
            ]),
            ("Обычно", [
                Language.english: "Usually",
                Language.french: "Habituellement",
                Language.spanish: "Usualmente",
                Language.chinese: "通常",
                Language.portuguese: "Geralmente",
                Language.italian: "Di solito"
            ], [
                "Обычно работаем здесь.",
                "Обычно встречаемся утром.",
                "Обычно делаем так."
            ])
        ]
    ]
    
    // Глаголы
    let verbs: [Language: [(russian: String, translations: [Language: String], examples: [String])]] = [
        Language.english: [
            ("Работать", [
                Language.english: "To work",
                Language.french: "Travailler",
                Language.spanish: "Trabajar",
                Language.chinese: "工作",
                Language.portuguese: "Trabalhar",
                Language.italian: "Lavorare"
            ], [
                "Я работаю в офисе.",
                "Мы работаем вместе.",
                "Они работают эффективно."
            ]),
            ("Изучать", [
                Language.english: "To study",
                Language.french: "Étudier",
                Language.spanish: "Estudiar",
                Language.chinese: "学习",
                Language.portuguese: "Estudar",
                Language.italian: "Studiare"
            ], [
                "Я изучаю языки.",
                "Она изучает бизнес.",
                "Мы изучаем новые технологии."
            ]),
            ("Говорить", [
                Language.english: "To speak",
                Language.french: "Parler",
                Language.spanish: "Hablar",
                Language.chinese: "说",
                Language.portuguese: "Falar",
                Language.italian: "Parlare"
            ], [
                "Я говорю по-английски.",
                "Он говорит на трех языках.",
                "Мы говорим о проекте."
            ]),
            ("Понимать", [
                Language.english: "To understand",
                Language.french: "Comprendre",
                Language.spanish: "Entender",
                Language.chinese: "理解",
                Language.portuguese: "Entender",
                Language.italian: "Capire"
            ], [
                "Я понимаю задачу.",
                "Они понимают проблему.",
                "Мы понимаем друг друга."
            ]),
            ("Делать", [
                Language.english: "To do/To make",
                Language.french: "Faire",
                Language.spanish: "Hacer",
                Language.chinese: "做",
                Language.portuguese: "Fazer",
                Language.italian: "Fare"
            ], [
                "Я делаю проект.",
                "Она делает презентацию.",
                "Мы делаем важную работу."
            ]),
            ("Планировать", [
                Language.english: "To plan",
                Language.french: "Planifier",
                Language.spanish: "Planificar",
                Language.chinese: "计划",
                Language.portuguese: "Planejar",
                Language.italian: "Pianificare"
            ], [
                "Я планирую встречу.",
                "Они планируют проект.",
                "Мы планируем стратегию."
            ]),
            ("Управлять", [
                Language.english: "To manage",
                Language.french: "Gérer",
                Language.spanish: "Gestionar",
                Language.chinese: "管理",
                Language.portuguese: "Gerenciar",
                Language.italian: "Gestire"
            ], [
                "Я управляю командой.",
                "Она управляет проектом.",
                "Мы управляем процессом."
            ]),
            ("Анализировать", [
                Language.english: "To analyze",
                Language.french: "Analyser",
                Language.spanish: "Analizar",
                Language.chinese: "分析",
                Language.portuguese: "Analisar",
                Language.italian: "Analizzare"
            ], [
                "Я анализирую данные.",
                "Они анализируют результаты.",
                "Мы анализируем рынок."
            ]),
            ("Развивать", [
                Language.english: "To develop",
                Language.french: "Développer",
                Language.spanish: "Desarrollar",
                Language.chinese: "发展",
                Language.portuguese: "Desenvolver",
                Language.italian: "Sviluppare"
            ], [
                "Я развиваю навыки.",
                "Она развивает бизнес.",
                "Мы развиваем проект."
            ]),
            ("Достигать", [
                Language.english: "To achieve",
                Language.french: "Atteindre",
                Language.spanish: "Lograr",
                Language.chinese: "达到",
                Language.portuguese: "Alcançar",
                Language.italian: "Raggiungere"
            ], [
                "Я достигаю целей.",
                "Они достигают успеха.",
                "Мы достигаем результатов."
            ])
        ]
    ]
    
    // Правила грамматики (как предложения с объяснениями)
    let grammarRules: [Language: [(russian: String, translations: [Language: String], explanation: String)]] = [
        Language.english: [
            ("Порядок слов в английском предложении: Подлежащее + Сказуемое + Дополнение", [
                Language.english: "Word order in English sentence: Subject + Verb + Object",
                Language.french: "Ordre des mots en anglais: Sujet + Verbe + Objet",
                Language.spanish: "Orden de palabras en inglés: Sujeto + Verbo + Objeto",
                Language.chinese: "英语句子词序：主语 + 谓语 + 宾语",
                Language.portuguese: "Ordem das palavras em inglês: Sujeito + Verbo + Objeto",
                Language.italian: "Ordine delle parole in inglese: Soggetto + Verbo + Oggetto"
            ], "В английском языке порядок слов фиксированный. Например: 'I work here' (Я работаю здесь)."),
            ("Артикли: 'a/an' для неопределенных, 'the' для определенных", [
                Language.english: "Articles: 'a/an' for indefinite, 'the' for definite",
                Language.french: "Articles: 'un/une' pour indéfini, 'le/la/les' pour défini",
                Language.spanish: "Artículos: 'un/una' para indefinido, 'el/la/los/las' para definido",
                Language.chinese: "冠词：'a/an' 用于不定，'the' 用于定",
                Language.portuguese: "Artigos: 'um/uma' para indefinido, 'o/a/os/as' para definido",
                Language.italian: "Articoli: 'un/una' per indefinito, 'il/la/lo/gli/le' per definito"
            ], "Используйте 'a' перед согласными, 'an' перед гласными. 'The' используется для конкретных предметов."),
            ("Времена глаголов: Present Simple для регулярных действий", [
                Language.english: "Verb tenses: Present Simple for regular actions",
                Language.french: "Temps verbaux: Présent simple pour actions régulières",
                Language.spanish: "Tiempos verbales: Presente simple para acciones regulares",
                Language.chinese: "动词时态：一般现在时用于常规动作",
                Language.portuguese: "Tempos verbais: Presente simples para ações regulares",
                Language.italian: "Tempi verbali: Presente semplice per azioni regolari"
            ], "Present Simple используется для описания регулярных действий, фактов и привычек. Например: 'I work every day'."),
            ("Множественное число: добавление -s или -es к существительным", [
                Language.english: "Plural: adding -s or -es to nouns",
                Language.french: "Pluriel: ajout de -s ou -es aux noms",
                Language.spanish: "Plural: agregar -s o -es a los sustantivos",
                Language.chinese: "复数：在名词后加 -s 或 -es",
                Language.portuguese: "Plural: adicionar -s ou -es aos substantivos",
                Language.italian: "Plurale: aggiungere -s o -es ai sostantivi"
            ], "Большинство существительных образуют множественное число добавлением -s. После s, sh, ch, x добавляется -es."),
            ("Притяжательный падеж: использование 's или s'", [
                Language.english: "Possessive case: using 's or s'",
                Language.french: "Cas possessif: utilisation de 's ou s'",
                Language.spanish: "Caso posesivo: uso de 's o s'",
                Language.chinese: "所有格：使用 's 或 s'",
                Language.portuguese: "Caso possessivo: uso de 's ou s'",
                Language.italian: "Caso possessivo: uso di 's o s'"
            ], "Для единственного числа используйте 's (John's car). Для множественного числа, оканчивающегося на s, используйте только апостроф (students' books).")
        ]
    ]
    
    // Получить все грамматические элементы для языка
    func getAllGrammarItems(for language: Language) -> [LearningItem] {
        var items: [LearningItem] = []
        
        // Местоимения (используем английский как базовый, но переводим для всех языков)
        if let pronouns = pronouns[Language.english] {
            for pronoun in pronouns {
                let exampleSentences = pronoun.examples.map { example in
                    LearningItem.ExampleSentence(
                        russian: example,
                        translations: createTranslationsForExample(example: example, word: pronoun.russian, translation: pronoun.translations[language] ?? ""),
                        wordPosition: findWordPosition(in: example, word: pronoun.russian)
                    )
                }
                
                items.append(LearningItem(
                    type: .word,
                    russian: pronoun.russian,
                    translations: pronoun.translations,
                    category: "Грамматика - Местоимения",
                    difficulty: .intermediate,
                    exampleSentences: exampleSentences
                ))
            }
        }
        
        // Артикли
        if let articles = articles[Language.english] {
            for article in articles {
                let exampleSentences = article.examples.map { example in
                    LearningItem.ExampleSentence(
                        russian: example,
                        translations: createTranslationsForExample(example: example, word: article.russian, translation: article.translations[language] ?? ""),
                        wordPosition: findWordPosition(in: example, word: article.russian)
                    )
                }
                
                items.append(LearningItem(
                    type: .word,
                    russian: article.russian,
                    translations: article.translations,
                    category: "Грамматика - Артикли",
                    difficulty: .intermediate,
                    exampleSentences: exampleSentences
                ))
            }
        }
        
        // Предлоги
        if let prepositions = prepositions[Language.english] {
            for preposition in prepositions {
                let exampleSentences = preposition.examples.map { example in
                    LearningItem.ExampleSentence(
                        russian: example,
                        translations: createTranslationsForExample(example: example, word: preposition.russian, translation: preposition.translations[language] ?? ""),
                        wordPosition: findWordPosition(in: example, word: preposition.russian)
                    )
                }
                
                items.append(LearningItem(
                    type: .word,
                    russian: preposition.russian,
                    translations: preposition.translations,
                    category: "Грамматика - Предлоги",
                    difficulty: .intermediate,
                    exampleSentences: exampleSentences
                ))
            }
        }
        
        // Союзы
        if let conjunctions = conjunctions[Language.english] {
            for conjunction in conjunctions {
                let exampleSentences = conjunction.examples.map { example in
                    LearningItem.ExampleSentence(
                        russian: example,
                        translations: createTranslationsForExample(example: example, word: conjunction.russian, translation: conjunction.translations[language] ?? ""),
                        wordPosition: findWordPosition(in: example, word: conjunction.russian)
                    )
                }
                
                items.append(LearningItem(
                    type: .word,
                    russian: conjunction.russian,
                    translations: conjunction.translations,
                    category: "Грамматика - Союзы",
                    difficulty: .intermediate,
                    exampleSentences: exampleSentences
                ))
            }
        }
        
        // Наречия
        if let adverbs = adverbs[Language.english] {
            for adverb in adverbs {
                let exampleSentences = adverb.examples.map { example in
                    LearningItem.ExampleSentence(
                        russian: example,
                        translations: createTranslationsForExample(example: example, word: adverb.russian, translation: adverb.translations[language] ?? ""),
                        wordPosition: findWordPosition(in: example, word: adverb.russian)
                    )
                }
                
                items.append(LearningItem(
                    type: .word,
                    russian: adverb.russian,
                    translations: adverb.translations,
                    category: "Грамматика - Наречия",
                    difficulty: .intermediate,
                    exampleSentences: exampleSentences
                ))
            }
        }
        
        // Глаголы
        if let verbs = verbs[Language.english] {
            for verb in verbs {
                let exampleSentences = verb.examples.map { example in
                    LearningItem.ExampleSentence(
                        russian: example,
                        translations: createTranslationsForExample(example: example, word: verb.russian, translation: verb.translations[language] ?? ""),
                        wordPosition: findWordPosition(in: example, word: verb.russian)
                    )
                }
                
                items.append(LearningItem(
                    type: .word,
                    russian: verb.russian,
                    translations: verb.translations,
                    category: "Грамматика - Глаголы",
                    difficulty: .intermediate,
                    exampleSentences: exampleSentences
                ))
            }
        }
        
        // Правила грамматики (как предложения) - все с одним уровнем сложности
        if let rules = grammarRules[Language.english] {
            for rule in rules {
                let exampleSentence = LearningItem.ExampleSentence(
                    russian: rule.russian,
                    translations: rule.translations,
                    wordPosition: 0
                )
                
                items.append(LearningItem(
                    type: .sentence,
                    russian: rule.russian,
                    translations: rule.translations,
                    category: "Грамматика - Правила",
                    difficulty: .intermediate,
                    exampleSentences: [exampleSentence]
                ))
            }
        }
        
        return items
    }
    
    // Вспомогательные функции
    private func findWordPosition(in sentence: String, word: String) -> Int {
        let words = sentence.components(separatedBy: " ")
        for (index, sentenceWord) in words.enumerated() {
            if sentenceWord.lowercased().contains(word.lowercased()) || word.lowercased().contains(sentenceWord.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: ".,!?;:"))) {
                return index
            }
        }
        return 0
    }
    
    private func createTranslationsForExample(example: String, word: String, translation: String) -> [Language: String] {
        // Создаем переводы примеров, заменяя слово на его перевод в соответствующем языке
        var translations: [Language: String] = [:]
        
        for language in Language.allCases {
            // Получаем перевод слова для данного языка
            let wordTranslation = getWordTranslation(word: word, language: language)
            
            // Заменяем слово в примере на его перевод
            let translatedExample = example.replacingOccurrences(of: word, with: wordTranslation, options: .caseInsensitive)
            translations[language] = translatedExample
        }
        
        return translations
    }
    
    private func getWordTranslation(word: String, language: Language) -> String {
        // Ищем перевод слова в базе данных
        if let pronouns = pronouns[Language.english] {
            for pronoun in pronouns {
                if pronoun.russian.lowercased() == word.lowercased() {
                    return pronoun.translations[language] ?? word
                }
            }
        }
        
        if let articles = articles[Language.english] {
            for article in articles {
                if article.russian.lowercased().contains(word.lowercased()) {
                    return article.translations[language] ?? word
                }
            }
        }
        
        if let prepositions = prepositions[Language.english] {
            for preposition in prepositions {
                if preposition.russian.lowercased() == word.lowercased() {
                    return preposition.translations[language] ?? word
                }
            }
        }
        
        if let conjunctions = conjunctions[Language.english] {
            for conjunction in conjunctions {
                if conjunction.russian.lowercased() == word.lowercased() {
                    return conjunction.translations[language] ?? word
                }
            }
        }
        
        if let adverbs = adverbs[Language.english] {
            for adverb in adverbs {
                if adverb.russian.lowercased() == word.lowercased() {
                    return adverb.translations[language] ?? word
                }
            }
        }
        
        if let verbs = verbs[Language.english] {
            for verb in verbs {
                if verb.russian.lowercased() == word.lowercased() {
                    return verb.translations[language] ?? word
                }
            }
        }
        
        return word
    }
    
    private init() {}
}

