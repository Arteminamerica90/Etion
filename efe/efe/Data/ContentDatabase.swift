//
//  ContentDatabase.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class ContentDatabase {
    static let shared = ContentDatabase()
    
    // База данных слов по категориям и уровням
    private let wordsDatabase: [String: [DifficultyLevel: [(russian: String, translations: [Language: String])]]] = [
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
                ("Канал", [.english: "Channel", .french: "Canal", .spanish: "Canal", .chinese: "渠道", .portuguese: "Canal", .italian: "Canale"])
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
                ("Метрика", [.english: "Metric", .french: "Métrique", .spanish: "Métrica", .chinese: "指标", .portuguese: "Métrica", .italian: "Metrica"])
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
        ],
        "Финансы": [
            .beginner: [
                ("Деньги", [.english: "Money", .french: "Argent", .spanish: "Dinero", .chinese: "钱", .portuguese: "Dinheiro", .italian: "Denaro"]),
                ("Банк", [.english: "Bank", .french: "Banque", .spanish: "Banco", .chinese: "银行", .portuguese: "Banco", .italian: "Banca"]),
                ("Кредит", [.english: "Credit", .french: "Crédit", .spanish: "Crédito", .chinese: "信贷", .portuguese: "Crédito", .italian: "Credito"]),
                ("Депозит", [.english: "Deposit", .french: "Dépôt", .spanish: "Depósito", .chinese: "存款", .portuguese: "Depósito", .italian: "Deposito"]),
                ("Процент", [.english: "Interest", .french: "Intérêt", .spanish: "Interés", .chinese: "利息", .portuguese: "Juros", .italian: "Interesse"]),
                ("Счет", [.english: "Account", .french: "Compte", .spanish: "Cuenta", .chinese: "账户", .portuguese: "Conta", .italian: "Conto"]),
                ("Платеж", [.english: "Payment", .french: "Paiement", .spanish: "Pago", .chinese: "付款", .portuguese: "Pagamento", .italian: "Pagamento"]),
                ("Баланс", [.english: "Balance", .french: "Solde", .spanish: "Saldo", .chinese: "余额", .portuguese: "Saldo", .italian: "Saldo"]),
                ("Валюта", [.english: "Currency", .french: "Devise", .spanish: "Moneda", .chinese: "货币", .portuguese: "Moeda", .italian: "Valuta"]),
                ("Бюджет", [.english: "Budget", .french: "Budget", .spanish: "Presupuesto", .chinese: "预算", .portuguese: "Orçamento", .italian: "Bilancio"])
            ],
            .intermediate: [
                ("Актив", [.english: "Asset", .french: "Actif", .spanish: "Activo", .chinese: "资产", .portuguese: "Ativo", .italian: "Attività"]),
                ("Пассив", [.english: "Liability", .french: "Passif", .spanish: "Pasivo", .chinese: "负债", .portuguese: "Passivo", .italian: "Passività"]),
                ("Дивиденды", [.english: "Dividends", .french: "Dividendes", .spanish: "Dividendos", .chinese: "股息", .portuguese: "Dividendos", .italian: "Dividendi"]),
                ("Капитализация", [.english: "Capitalization", .french: "Capitalisation", .spanish: "Capitalización", .chinese: "资本化", .portuguese: "Capitalização", .italian: "Capitalizzazione"]),
                ("Ликвидность", [.english: "Liquidity", .french: "Liquidité", .spanish: "Liquidez", .chinese: "流动性", .portuguese: "Liquidez", .italian: "Liquidità"]),
                ("Портфель", [.english: "Portfolio", .french: "Portefeuille", .spanish: "Cartera", .chinese: "投资组合", .portuguese: "Carteira", .italian: "Portafoglio"]),
                ("Диверсификация", [.english: "Diversification", .french: "Diversification", .spanish: "Diversificación", .chinese: "多元化", .portuguese: "Diversificação", .italian: "Diversificazione"]),
                ("Риск", [.english: "Risk", .french: "Risque", .spanish: "Riesgo", .chinese: "风险", .portuguese: "Risco", .italian: "Rischio"]),
                ("Доходность", [.english: "Yield", .french: "Rendement", .spanish: "Rendimiento", .chinese: "收益率", .portuguese: "Rendimento", .italian: "Rendimento"]),
                ("Оценка", [.english: "Valuation", .french: "Évaluation", .spanish: "Valoración", .chinese: "估值", .portuguese: "Avaliação", .italian: "Valutazione"])
            ],
            .advanced: [
                ("Дериватив", [.english: "Derivative", .french: "Dérivé", .spanish: "Derivado", .chinese: "衍生品", .portuguese: "Derivativo", .italian: "Derivato"]),
                ("Хеджирование", [.english: "Hedging", .french: "Couverture", .spanish: "Cobertura", .chinese: "对冲", .portuguese: "Hedge", .italian: "Copertura"]),
                ("Секьюритизация", [.english: "Securitization", .french: "Titrisation", .spanish: "Titulización", .chinese: "证券化", .portuguese: "Securitização", .italian: "Cartolarizzazione"]),
                ("Арбитраж", [.english: "Arbitrage", .french: "Arbitrage", .spanish: "Arbitraje", .chinese: "套利", .portuguese: "Arbitragem", .italian: "Arbitraggio"]),
                ("Волатильность", [.english: "Volatility", .french: "Volatilité", .spanish: "Volatilidad", .chinese: "波动性", .portuguese: "Volatilidade", .italian: "Volatilità"]),
                ("Корреляция", [.english: "Correlation", .french: "Corrélation", .spanish: "Correlación", .chinese: "相关性", .portuguese: "Correlação", .italian: "Correlazione"]),
                ("Ковариация", [.english: "Covariance", .french: "Covariance", .spanish: "Covarianza", .chinese: "协方差", .portuguese: "Covariância", .italian: "Covarianza"]),
                ("Бета-коэффициент", [.english: "Beta coefficient", .french: "Coefficient bêta", .spanish: "Coeficiente beta", .chinese: "贝塔系数", .portuguese: "Coeficiente beta", .italian: "Coefficiente beta"]),
                ("Альфа", [.english: "Alpha", .french: "Alpha", .spanish: "Alfa", .chinese: "阿尔法", .portuguese: "Alfa", .italian: "Alfa"]),
                ("Шарп-коэффициент", [.english: "Sharpe ratio", .french: "Ratio de Sharpe", .spanish: "Ratio de Sharpe", .chinese: "夏普比率", .portuguese: "Índice de Sharpe", .italian: "Rapporto di Sharpe"])
            ]
        ],
        "Технологии": [
            .beginner: [
                ("Компьютер", [.english: "Computer", .french: "Ordinateur", .spanish: "Computadora", .chinese: "计算机", .portuguese: "Computador", .italian: "Computer"]),
                ("Программа", [.english: "Program", .french: "Programme", .spanish: "Programa", .chinese: "程序", .portuguese: "Programa", .italian: "Programma"]),
                ("Интернет", [.english: "Internet", .french: "Internet", .spanish: "Internet", .chinese: "互联网", .portuguese: "Internet", .italian: "Internet"]),
                ("Сайт", [.english: "Website", .french: "Site web", .spanish: "Sitio web", .chinese: "网站", .portuguese: "Site", .italian: "Sito web"]),
                ("Приложение", [.english: "Application", .french: "Application", .spanish: "Aplicación", .chinese: "应用程序", .portuguese: "Aplicativo", .italian: "Applicazione"]),
                ("Код", [.english: "Code", .french: "Code", .spanish: "Código", .chinese: "代码", .portuguese: "Código", .italian: "Codice"]),
                ("Файл", [.english: "File", .french: "Fichier", .spanish: "Archivo", .chinese: "文件", .portuguese: "Arquivo", .italian: "File"]),
                ("Папка", [.english: "Folder", .french: "Dossier", .spanish: "Carpeta", .chinese: "文件夹", .portuguese: "Pasta", .italian: "Cartella"]),
                ("Устройство", [.english: "Device", .french: "Appareil", .spanish: "Dispositivo", .chinese: "设备", .portuguese: "Dispositivo", .italian: "Dispositivo"]),
                ("Данные", [.english: "Data", .french: "Données", .spanish: "Datos", .chinese: "数据", .portuguese: "Dados", .italian: "Dati"])
            ],
            .intermediate: [
                ("Алгоритм", [.english: "Algorithm", .french: "Algorithme", .spanish: "Algoritmo", .chinese: "算法", .portuguese: "Algoritmo", .italian: "Algoritmo"]),
                ("База данных", [.english: "Database", .french: "Base de données", .spanish: "Base de datos", .chinese: "数据库", .portuguese: "Banco de dados", .italian: "Database"]),
                ("Интерфейс", [.english: "Interface", .french: "Interface", .spanish: "Interfaz", .chinese: "界面", .portuguese: "Interface", .italian: "Interfaccia"]),
                ("Сервер", [.english: "Server", .french: "Serveur", .spanish: "Servidor", .chinese: "服务器", .portuguese: "Servidor", .italian: "Server"]),
                ("Протокол", [.english: "Protocol", .french: "Protocole", .spanish: "Protocolo", .chinese: "协议", .portuguese: "Protocolo", .italian: "Protocollo"]),
                ("API", [.english: "API", .french: "API", .spanish: "API", .chinese: "应用程序接口", .portuguese: "API", .italian: "API"]),
                ("Фреймворк", [.english: "Framework", .french: "Cadre", .spanish: "Framework", .chinese: "框架", .portuguese: "Framework", .italian: "Framework"]),
                ("Библиотека", [.english: "Library", .french: "Bibliothèque", .spanish: "Biblioteca", .chinese: "库", .portuguese: "Biblioteca", .italian: "Libreria"]),
                ("Развертывание", [.english: "Deployment", .french: "Déploiement", .spanish: "Despliegue", .chinese: "部署", .portuguese: "Implantação", .italian: "Distribuzione"]),
                ("Интеграция", [.english: "Integration", .french: "Intégration", .spanish: "Integración", .chinese: "集成", .portuguese: "Integração", .italian: "Integrazione"])
            ],
            .advanced: [
                ("Микросервисная архитектура", [.english: "Microservices architecture", .french: "Architecture microservices", .spanish: "Arquitectura de microservicios", .chinese: "微服务架构", .portuguese: "Arquitetura de microsserviços", .italian: "Architettura a microservizi"]),
                ("Контейнеризация", [.english: "Containerization", .french: "Conteneurisation", .spanish: "Contenedorización", .chinese: "容器化", .portuguese: "Containerização", .italian: "Containerizzazione"]),
                ("Оркестрация", [.english: "Orchestration", .french: "Orchestration", .spanish: "Orquestración", .chinese: "编排", .portuguese: "Orquestração", .italian: "Orchestrazione"]),
                ("Рефакторинг", [.english: "Refactoring", .french: "Refactorisation", .spanish: "Refactorización", .chinese: "重构", .portuguese: "Refatoração", .italian: "Refactoring"]),
                ("Масштабируемость", [.english: "Scalability", .french: "Évolutivité", .spanish: "Escalabilidad", .chinese: "可扩展性", .portuguese: "Escalabilidade", .italian: "Scalabilità"]),
                ("Отказоустойчивость", [.english: "Fault tolerance", .french: "Tolérance aux pannes", .spanish: "Tolerancia a fallos", .chinese: "容错性", .portuguese: "Tolerância a falhas", .italian: "Tolleranza ai guasti"]),
                ("Репликация", [.english: "Replication", .french: "Réplication", .spanish: "Replicación", .chinese: "复制", .portuguese: "Replicação", .italian: "Replicazione"]),
                ("Шардирование", [.english: "Sharding", .french: "Partitionnement", .spanish: "Fragmentación", .chinese: "分片", .portuguese: "Fragmentação", .italian: "Sharding"]),
                ("Кэширование", [.english: "Caching", .french: "Mise en cache", .spanish: "Almacenamiento en caché", .chinese: "缓存", .portuguese: "Cacheamento", .italian: "Caching"]),
                ("Асинхронность", [.english: "Asynchrony", .french: "Asynchronisme", .spanish: "Asincronía", .chinese: "异步", .portuguese: "Assincronia", .italian: "Asincronia"])
            ]
        ]
    ]
    
    // База данных фраз
    private let phrasesDatabase: [String: [DifficultyLevel: [(russian: String, translations: [Language: String])]]] = [
        "Маркетинг": [
            .beginner: [
                ("Провести маркетинговое исследование", [.english: "Conduct market research", .french: "Effectuer une étude de marché", .spanish: "Realizar investigación de mercado", .chinese: "进行市场研究", .portuguese: "Realizar pesquisa de mercado", .italian: "Condurre ricerca di mercato"]),
                ("Разработать стратегию", [.english: "Develop a strategy", .french: "Développer une stratégie", .spanish: "Desarrollar una estrategia", .chinese: "制定策略", .portuguese: "Desenvolver uma estratégia", .italian: "Sviluppare una strategia"]),
                ("Повысить узнаваемость бренда", [.english: "Increase brand awareness", .french: "Augmenter la notoriété de la marque", .spanish: "Aumentar el reconocimiento de marca", .chinese: "提高品牌知名度", .portuguese: "Aumentar o reconhecimento da marca", .italian: "Aumentare la consapevolezza del brand"])
            ],
            .intermediate: [
                ("Оптимизировать воронку конверсии", [.english: "Optimize conversion funnel", .french: "Optimiser l'entonnoir de conversion", .spanish: "Optimizar el embudo de conversión", .chinese: "优化转化漏斗", .portuguese: "Otimizar o funil de conversão", .italian: "Ottimizzare l'imbuto di conversione"]),
                ("Сегментировать целевую аудиторию", [.english: "Segment target audience", .french: "Segmenter le public cible", .spanish: "Segmentar la audiencia objetivo", .chinese: "细分目标受众", .portuguese: "Segmentar o público-alvo", .italian: "Segmentare il pubblico di riferimento"]),
                ("Измерить ROI кампании", [.english: "Measure campaign ROI", .french: "Mesurer le ROI de la campagne", .spanish: "Medir el ROI de la campaña", .chinese: "衡量活动投资回报率", .portuguese: "Medir o ROI da campanha", .italian: "Misurare il ROI della campagna"])
            ],
            .advanced: [
                ("Внедрить мультиканальную маркетинговую стратегию", [.english: "Implement omnichannel marketing strategy", .french: "Mettre en œuvre une stratégie marketing omnicanale", .spanish: "Implementar estrategia de marketing omnicanal", .chinese: "实施全渠道营销策略", .portuguese: "Implementar estratégia de marketing omnicanal", .italian: "Implementare strategia di marketing omnicanale"]),
                ("Применить машинное обучение для персонализации", [.english: "Apply machine learning for personalization", .french: "Appliquer l'apprentissage automatique pour la personnalisation", .spanish: "Aplicar aprendizaje automático para personalización", .chinese: "应用机器学习进行个性化", .portuguese: "Aplicar aprendizado de máquina para personalização", .italian: "Applicare machine learning per la personalizzazione"]),
                ("Оптимизировать customer journey mapping", [.english: "Optimize customer journey mapping", .french: "Optimiser la cartographie du parcours client", .spanish: "Optimizar el mapeo del viaje del cliente", .chinese: "优化客户旅程映射", .portuguese: "Otimizar o mapeamento da jornada do cliente", .italian: "Ottimizzare la mappatura del customer journey"])
            ]
        ]
    ]
    
    // База данных предложений
    private let sentencesDatabase: [String: [DifficultyLevel: [(russian: String, translations: [Language: String])]]] = [
        "Маркетинг": [
            .beginner: [
                ("Мы провели исследование рынка и выяснили потребности клиентов.", [.english: "We conducted market research and identified customer needs.", .french: "Nous avons effectué une étude de marché et identifié les besoins des clients.", .spanish: "Realizamos investigación de mercado e identificamos las necesidades del cliente.", .chinese: "我们进行了市场研究并确定了客户需求。", .portuguese: "Realizamos pesquisa de mercado e identificamos as necessidades dos clientes.", .italian: "Abbiamo condotto una ricerca di mercato e identificato i bisogni dei clienti."]),
                ("Новая рекламная кампания увеличила продажи на 20%.", [.english: "The new advertising campaign increased sales by 20%.", .french: "La nouvelle campagne publicitaire a augmenté les ventes de 20%.", .spanish: "La nueva campaña publicitaria aumentó las ventas en un 20%.", .chinese: "新的广告活动使销售额增长了20%。", .portuguese: "A nova campanha publicitária aumentou as vendas em 20%.", .italian: "La nuova campagna pubblicitaria ha aumentato le vendite del 20%."])
            ],
            .intermediate: [
                ("Сегментация целевой аудитории позволила нам повысить конверсию на 35% и оптимизировать маркетинговый бюджет.", [.english: "Target audience segmentation allowed us to increase conversion by 35% and optimize marketing budget.", .french: "La segmentation du public cible nous a permis d'augmenter la conversion de 35% et d'optimiser le budget marketing.", .spanish: "La segmentación de la audiencia objetivo nos permitió aumentar la conversión en un 35% y optimizar el presupuesto de marketing.", .chinese: "目标受众细分使我们能够将转化率提高35%并优化营销预算。", .portuguese: "A segmentação do público-alvo nos permitiu aumentar a conversão em 35% e otimizar o orçamento de marketing.", .italian: "La segmentazione del pubblico di riferimento ci ha permesso di aumentare la conversione del 35% e ottimizzare il budget di marketing."]),
                ("Анализ воронки продаж выявил узкие места в процессе конверсии, которые требуют немедленной оптимизации.", [.english: "Sales funnel analysis revealed bottlenecks in the conversion process that require immediate optimization.", .french: "L'analyse de l'entonnoir de vente a révélé des goulots d'étranglement dans le processus de conversion qui nécessitent une optimisation immédiate.", .spanish: "El análisis del embudo de ventas reveló cuellos de botella en el proceso de conversión que requieren optimización inmediata.", .chinese: "销售漏斗分析揭示了转化过程中的瓶颈，需要立即优化。", .portuguese: "A análise do funil de vendas revelou gargalos no processo de conversão que requerem otimização imediata.", .italian: "L'analisi dell'imbuto di vendita ha rivelato colli di bottiglia nel processo di conversione che richiedono un'ottimizzazione immediata."])
            ],
            .advanced: [
                ("Внедрение мультиканальной маркетинговой стратегии с использованием машинного обучения для персонализации контента привело к увеличению customer lifetime value на 45% и улучшению показателей удержания клиентов.", [.english: "Implementation of omnichannel marketing strategy using machine learning for content personalization resulted in 45% increase in customer lifetime value and improved customer retention metrics.", .french: "La mise en œuvre d'une stratégie marketing omnicanale utilisant l'apprentissage automatique pour la personnalisation du contenu a entraîné une augmentation de 45% de la valeur vie client et une amélioration des métriques de rétention client.", .spanish: "La implementación de una estrategia de marketing omnicanal utilizando aprendizaje automático para la personalización de contenido resultó en un aumento del 45% en el valor de vida del cliente y mejoró las métricas de retención de clientes.", .chinese: "使用机器学习进行内容个性化的全渠道营销策略的实施使客户生命周期价值增加了45%，并改善了客户保留指标。", .portuguese: "A implementação de uma estratégia de marketing omnicanal usando aprendizado de máquina para personalização de conteúdo resultou em um aumento de 45% no valor vitalício do cliente e melhorou as métricas de retenção de clientes.", .italian: "L'implementazione di una strategia di marketing omnicanale utilizzando il machine learning per la personalizzazione dei contenuti ha portato a un aumento del 45% del customer lifetime value e al miglioramento delle metriche di fidelizzazione dei clienti."])
            ]
        ]
    ]
    
    func getWords(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        // Сначала проверяем основную базу данных
        if let words = wordsDatabase[category]?[difficulty], !words.isEmpty {
            return words
        }
        // Затем проверяем расширенную базу данных
        let extendedWords = ContentDatabase.getExtendedWords(for: category, difficulty: difficulty)
        if !extendedWords.isEmpty {
            return extendedWords
        }
        // Если ничего не найдено, возвращаем пустой массив
        return []
    }
    
    func getPhrases(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        // Сначала проверяем основную базу данных
        if let phrases = phrasesDatabase[category]?[difficulty], !phrases.isEmpty {
            return phrases
        }
        // Затем проверяем расширенную базу данных
        let extendedPhrases = ContentDatabase.getExtendedPhrases(for: category, difficulty: difficulty)
        if !extendedPhrases.isEmpty {
            return extendedPhrases
        }
        // Если ничего не найдено, возвращаем пустой массив
        return []
    }
    
    func getSentences(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        // Сначала проверяем основную базу данных
        if let sentences = sentencesDatabase[category]?[difficulty], !sentences.isEmpty {
            return sentences
        }
        // Затем проверяем расширенную базу данных
        let extendedSentences = ContentDatabase.getExtendedSentences(for: category, difficulty: difficulty)
        if !extendedSentences.isEmpty {
            return extendedSentences
        }
        // Если ничего не найдено, возвращаем пустой массив
        return []
    }
    
    private init() {}
}

