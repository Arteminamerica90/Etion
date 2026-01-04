//
//  ExtendedContentDatabase.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

extension ContentDatabase {
    // Расширенная база данных для всех категорий
    static func getExtendedWords(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch category {
        case "Бизнес-стратегия":
            switch difficulty {
            case .beginner:
                return [
                    ("Стратегия", [Language.english: "Strategy", Language.french: "Stratégie", Language.spanish: "Estrategia", Language.chinese: "策略", Language.portuguese: "Estratégia", Language.italian: "Strategia"]),
                    ("План", [Language.english: "Plan", Language.french: "Plan", Language.spanish: "Plan", Language.chinese: "计划", Language.portuguese: "Plano", Language.italian: "Piano"]),
                    ("Цель", [Language.english: "Goal", Language.french: "Objectif", Language.spanish: "Objetivo", Language.chinese: "目标", Language.portuguese: "Objetivo", Language.italian: "Obiettivo"]),
                    ("Миссия", [Language.english: "Mission", Language.french: "Mission", Language.spanish: "Misión", Language.chinese: "使命", Language.portuguese: "Missão", Language.italian: "Missione"]),
                    ("Видение", [Language.english: "Vision", Language.french: "Vision", Language.spanish: "Visión", Language.chinese: "愿景", Language.portuguese: "Visão", Language.italian: "Visione"]),
                    ("Конкурент", [Language.english: "Competitor", Language.french: "Concurrent", Language.spanish: "Competidor", Language.chinese: "竞争对手", Language.portuguese: "Concorrente", Language.italian: "Concorrente"]),
                    ("Рыночная доля", [Language.english: "Market share", Language.french: "Part de marché", Language.spanish: "Cuota de mercado", Language.chinese: "市场份额", Language.portuguese: "Participação de mercado", Language.italian: "Quota di mercato"]),
                    ("Конкурентное преимущество", [Language.english: "Competitive advantage", Language.french: "Avantage concurrentiel", Language.spanish: "Ventaja competitiva", Language.chinese: "竞争优势", Language.portuguese: "Vantagem competitiva", Language.italian: "Vantaggio competitivo"]),
                    ("Бизнес-модель", [Language.english: "Business model", Language.french: "Modèle d'affaires", Language.spanish: "Modelo de negocio", Language.chinese: "商业模式", Language.portuguese: "Modelo de negócio", Language.italian: "Modello di business"]),
                    ("Стратегическое планирование", [Language.english: "Strategic planning", Language.french: "Planification stratégique", Language.spanish: "Planificación estratégica", Language.chinese: "战略规划", Language.portuguese: "Planejamento estratégico", Language.italian: "Pianificazione strategica"])
                ]
            case .intermediate:
                return [
                    ("SWOT-анализ", [Language.english: "SWOT analysis", Language.french: "Analyse SWOT", Language.spanish: "Análisis SWOT", Language.chinese: "SWOT分析", Language.portuguese: "Análise SWOT", Language.italian: "Analisi SWOT"]),
                    ("Портфельный анализ", [Language.english: "Portfolio analysis", Language.french: "Analyse de portefeuille", Language.spanish: "Análisis de cartera", Language.chinese: "投资组合分析", Language.portuguese: "Análise de portfólio", Language.italian: "Analisi del portafoglio"]),
                    ("Матрица BCG", [Language.english: "BCG matrix", Language.french: "Matrice BCG", Language.spanish: "Matriz BCG", Language.chinese: "BCG矩阵", Language.portuguese: "Matriz BCG", Language.italian: "Matrice BCG"]),
                    ("Диверсификация", [Language.english: "Diversification", Language.french: "Diversification", Language.spanish: "Diversificación", Language.chinese: "多元化", Language.portuguese: "Diversificação", Language.italian: "Diversificazione"]),
                    ("Вертикальная интеграция", [Language.english: "Vertical integration", Language.french: "Intégration verticale", Language.spanish: "Integración vertical", Language.chinese: "垂直整合", Language.portuguese: "Integração vertical", Language.italian: "Integrazione verticale"]),
                    ("Горизонтальная интеграция", [Language.english: "Horizontal integration", Language.french: "Intégration horizontale", Language.spanish: "Integración horizontal", Language.chinese: "水平整合", Language.portuguese: "Integração horizontal", Language.italian: "Integrazione orizzontale"]),
                    ("Стратегический альянс", [Language.english: "Strategic alliance", Language.french: "Alliance stratégique", Language.spanish: "Alianza estratégica", Language.chinese: "战略联盟", Language.portuguese: "Aliança estratégica", Language.italian: "Alleanza strategica"]),
                    ("Синергия", [Language.english: "Synergy", Language.french: "Synergie", Language.spanish: "Sinergia", Language.chinese: "协同效应", Language.portuguese: "Sinergia", Language.italian: "Sinergia"]),
                    ("Стратегическое позиционирование", [Language.english: "Strategic positioning", Language.french: "Positionnement stratégique", Language.spanish: "Posicionamiento estratégico", Language.chinese: "战略定位", Language.portuguese: "Posicionamento estratégico", Language.italian: "Posizionamento strategico"]),
                    ("Ключевые компетенции", [Language.english: "Core competencies", Language.french: "Compétences clés", Language.spanish: "Competencias clave", Language.chinese: "核心竞争力", Language.portuguese: "Competências principais", Language.italian: "Competenze chiave"])
                ]
            case .advanced:
                return [
                    ("Стратегическая гибкость", [Language.english: "Strategic agility", Language.french: "Agilité stratégique", Language.spanish: "Agilidad estratégica", Language.chinese: "战略敏捷性", Language.portuguese: "Agilidade estratégica", Language.italian: "Agilità strategica"]),
                    ("Динамические способности", [Language.english: "Dynamic capabilities", Language.french: "Capacités dynamiques", Language.spanish: "Capacidades dinámicas", Language.chinese: "动态能力", Language.portuguese: "Capacidades dinâmicas", Language.italian: "Capacità dinamiche"]),
                    ("Стратегическое лидерство", [Language.english: "Strategic leadership", Language.french: "Leadership stratégique", Language.spanish: "Liderazgo estratégico", Language.chinese: "战略领导力", Language.portuguese: "Liderança estratégica", Language.italian: "Leadership strategico"]),
                    ("Организационное обучение", [Language.english: "Organizational learning", Language.french: "Apprentissage organisationnel", Language.spanish: "Aprendizaje organizacional", Language.chinese: "组织学习", Language.portuguese: "Aprendizado organizacional", Language.italian: "Apprendimento organizzativo"]),
                    ("Стратегическая инновация", [Language.english: "Strategic innovation", Language.french: "Innovation stratégique", Language.spanish: "Innovación estratégica", Language.chinese: "战略创新", Language.portuguese: "Inovação estratégica", Language.italian: "Innovazione strategica"]),
                    ("Бизнес-экосистема", [Language.english: "Business ecosystem", Language.french: "Écosystème d'affaires", Language.spanish: "Ecosistema de negocio", Language.chinese: "商业生态系统", Language.portuguese: "Ecossistema de negócios", Language.italian: "Ecosistema aziendale"]),
                    ("Стратегическое партнерство", [Language.english: "Strategic partnership", Language.french: "Partenariat stratégique", Language.spanish: "Asociación estratégica", Language.chinese: "战略伙伴关系", Language.portuguese: "Parceria estratégica", Language.italian: "Partenariato strategico"]),
                    ("Трансформация бизнеса", [Language.english: "Business transformation", Language.french: "Transformation d'entreprise", Language.spanish: "Transformación empresarial", Language.chinese: "业务转型", Language.portuguese: "Transformação empresarial", Language.italian: "Trasformazione aziendale"]),
                    ("Стратегическое управление рисками", [Language.english: "Strategic risk management", Language.french: "Gestion stratégique des risques", Language.spanish: "Gestión estratégica de riesgos", Language.chinese: "战略风险管理", Language.portuguese: "Gestão estratégica de riscos", Language.italian: "Gestione strategica dei rischi"]),
                    ("Цифровая трансформация", [Language.english: "Digital transformation", Language.french: "Transformation numérique", Language.spanish: "Transformación digital", Language.chinese: "数字化转型", Language.portuguese: "Transformação digital", Language.italian: "Trasformazione digitale"])
                ]
            }
            
        case "Управление проектами":
            switch difficulty {
            case .beginner:
                return [
                    ("Проект", [Language.english: "Project", Language.french: "Projet", Language.spanish: "Proyecto", Language.chinese: "项目", Language.portuguese: "Projeto", Language.italian: "Progetto"]),
                    ("Задача", [Language.english: "Task", Language.french: "Tâche", Language.spanish: "Tarea", Language.chinese: "任务", Language.portuguese: "Tarefa", Language.italian: "Compito"]),
                    ("Срок", [Language.english: "Deadline", Language.french: "Date limite", Language.spanish: "Fecha límite", Language.chinese: "截止日期", Language.portuguese: "Prazo", Language.italian: "Scadenza"]),
                    ("Бюджет", [Language.english: "Budget", Language.french: "Budget", Language.spanish: "Presupuesto", Language.chinese: "预算", Language.portuguese: "Orçamento", Language.italian: "Bilancio"]),
                    ("Команда", [Language.english: "Team", Language.french: "Équipe", Language.spanish: "Equipo", Language.chinese: "团队", Language.portuguese: "Equipe", Language.italian: "Squadra"]),
                    ("План", [Language.english: "Plan", Language.french: "Plan", Language.spanish: "Plan", Language.chinese: "计划", Language.portuguese: "Plano", Language.italian: "Piano"]),
                    ("Менеджер проекта", [Language.english: "Project manager", Language.french: "Chef de projet", Language.spanish: "Director de proyecto", Language.chinese: "项目经理", Language.portuguese: "Gerente de projeto", Language.italian: "Project manager"]),
                    ("Этап", [Language.english: "Phase", Language.french: "Phase", Language.spanish: "Fase", Language.chinese: "阶段", Language.portuguese: "Fase", Language.italian: "Fase"]),
                    ("Милистоун", [Language.english: "Milestone", Language.french: "Jalon", Language.spanish: "Hito", Language.chinese: "里程碑", Language.portuguese: "Marco", Language.italian: "Milestone"]),
                    ("Ресурсы", [Language.english: "Resources", Language.french: "Ressources", Language.spanish: "Recursos", Language.chinese: "资源", Language.portuguese: "Recursos", Language.italian: "Risorse"])
                ]
            case .intermediate:
                return [
                    ("Управление рисками проекта", [Language.english: "Project risk management", Language.french: "Gestion des risques de projet", Language.spanish: "Gestión de riesgos del proyecto", Language.chinese: "项目风险管理", Language.portuguese: "Gestão de riscos do projeto", Language.italian: "Gestione dei rischi del progetto"]),
                    ("Управление заинтересованными сторонами", [Language.english: "Stakeholder management", Language.french: "Gestion des parties prenantes", Language.spanish: "Gestión de interesados", Language.chinese: "利益相关者管理", Language.portuguese: "Gestão de partes interessadas", Language.italian: "Gestione degli stakeholder"]),
                    ("Управление качеством", [Language.english: "Quality management", Language.french: "Gestion de la qualité", Language.spanish: "Gestión de calidad", Language.chinese: "质量管理", Language.portuguese: "Gestão da qualidade", Language.italian: "Gestione della qualità"]),
                    ("Управление изменениями", [Language.english: "Change management", Language.french: "Gestion du changement", Language.spanish: "Gestión del cambio", Language.chinese: "变更管理", Language.portuguese: "Gestão de mudanças", Language.italian: "Gestione del cambiamento"]),
                    ("Управление коммуникациями", [Language.english: "Communication management", Language.french: "Gestion de la communication", Language.spanish: "Gestión de comunicaciones", Language.chinese: "沟通管理", Language.portuguese: "Gestão de comunicações", Language.italian: "Gestione delle comunicazioni"]),
                    ("Управление закупками", [Language.english: "Procurement management", Language.french: "Gestion des achats", Language.spanish: "Gestión de adquisiciones", Language.chinese: "采购管理", Language.portuguese: "Gestão de compras", Language.italian: "Gestione degli approvvigionamenti"]),
                    ("Критический путь", [Language.english: "Critical path", Language.french: "Chemin critique", Language.spanish: "Ruta crítica", Language.chinese: "关键路径", Language.portuguese: "Caminho crítico", Language.italian: "Percorso critico"]),
                    ("Диаграмма Ганта", [Language.english: "Gantt chart", Language.french: "Diagramme de Gantt", Language.spanish: "Diagrama de Gantt", Language.chinese: "甘特图", Language.portuguese: "Gráfico de Gantt", Language.italian: "Diagramma di Gantt"]),
                    ("Управление расписанием", [Language.english: "Schedule management", Language.french: "Gestion du planning", Language.spanish: "Gestión del cronograma", Language.chinese: "进度管理", Language.portuguese: "Gestão do cronograma", Language.italian: "Gestione della pianificazione"]),
                    ("Управление стоимостью", [Language.english: "Cost management", Language.french: "Gestion des coûts", Language.spanish: "Gestión de costos", Language.chinese: "成本管理", Language.portuguese: "Gestão de custos", Language.italian: "Gestione dei costi"])
                ]
            case .advanced:
                return [
                    ("Agile-методология", [Language.english: "Agile methodology", Language.french: "Méthodologie Agile", Language.spanish: "Metodología Ágil", Language.chinese: "敏捷方法论", Language.portuguese: "Metodologia Ágil", Language.italian: "Metodologia Agile"]),
                    ("Scrum-фреймворк", [Language.english: "Scrum framework", Language.french: "Cadre Scrum", Language.spanish: "Marco Scrum", Language.chinese: "Scrum框架", Language.portuguese: "Framework Scrum", Language.italian: "Framework Scrum"]),
                    ("Kanban-метод", [Language.english: "Kanban method", Language.french: "Méthode Kanban", Language.spanish: "Método Kanban", Language.chinese: "看板方法", Language.portuguese: "Método Kanban", Language.italian: "Metodo Kanban"]),
                    ("Управление портфелем проектов", [Language.english: "Project portfolio management", Language.french: "Gestion de portefeuille de projets", Language.spanish: "Gestión de cartera de proyectos", Language.chinese: "项目组合管理", Language.portuguese: "Gestão de portfólio de projetos", Language.italian: "Gestione del portafoglio progetti"]),
                    ("Управление программами", [Language.english: "Program management", Language.french: "Gestion de programme", Language.spanish: "Gestión de programas", Language.chinese: "项目管理", Language.portuguese: "Gestão de programas", Language.italian: "Gestione dei programmi"]),
                    ("Управление офисом проектов", [Language.english: "Project management office", Language.french: "Bureau de gestion de projet", Language.spanish: "Oficina de gestión de proyectos", Language.chinese: "项目管理办公室", Language.portuguese: "Escritório de gestão de projetos", Language.italian: "Ufficio di gestione progetti"]),
                    ("Управление знаниями", [Language.english: "Knowledge management", Language.french: "Gestion des connaissances", Language.spanish: "Gestión del conocimiento", Language.chinese: "知识管理", Language.portuguese: "Gestão do conhecimento", Language.italian: "Gestione della conoscenza"]),
                    ("Управление производительностью", [Language.english: "Performance management", Language.french: "Gestion de la performance", Language.spanish: "Gestión del rendimiento", Language.chinese: "绩效管理", Language.portuguese: "Gestão de desempenho", Language.italian: "Gestione delle prestazioni"]),
                    ("Управление зависимостями", [Language.english: "Dependency management", Language.french: "Gestion des dépendances", Language.spanish: "Gestión de dependencias", Language.chinese: "依赖管理", Language.portuguese: "Gestão de dependências", Language.italian: "Gestione delle dipendenze"]),
                    ("Управление конфигурацией", [Language.english: "Configuration management", Language.french: "Gestion de la configuration", Language.spanish: "Gestión de configuración", Language.chinese: "配置管理", Language.portuguese: "Gestão de configuração", Language.italian: "Gestione della configurazione"])
                ]
            }
            
        case "Продажи":
            switch difficulty {
            case .beginner:
                return [
                    ("Продажа", [Language.english: "Sale", Language.french: "Vente", Language.spanish: "Venta", Language.chinese: "销售", Language.portuguese: "Venda", Language.italian: "Vendita"]),
                    ("Покупатель", [Language.english: "Buyer", Language.french: "Acheteur", Language.spanish: "Comprador", Language.chinese: "买家", Language.portuguese: "Comprador", Language.italian: "Acquirente"]),
                    ("Клиент", [Language.english: "Client", Language.french: "Client", Language.spanish: "Cliente", Language.chinese: "客户", Language.portuguese: "Cliente", Language.italian: "Cliente"]),
                    ("Сделка", [Language.english: "Deal", Language.french: "Affaire", Language.spanish: "Trato", Language.chinese: "交易", Language.portuguese: "Negócio", Language.italian: "Affare"]),
                    ("Предложение", [Language.english: "Offer", Language.french: "Offre", Language.spanish: "Oferta", Language.chinese: "报价", Language.portuguese: "Oferta", Language.italian: "Offerta"]),
                    ("Цена", [Language.english: "Price", Language.french: "Prix", Language.spanish: "Precio", Language.chinese: "价格", Language.portuguese: "Preço", Language.italian: "Prezzo"]),
                    ("Скидка", [Language.english: "Discount", Language.french: "Remise", Language.spanish: "Descuento", Language.chinese: "折扣", Language.portuguese: "Desconto", Language.italian: "Sconto"]),
                    ("Договор", [Language.english: "Contract", Language.french: "Contrat", Language.spanish: "Contrato", Language.chinese: "合同", Language.portuguese: "Contrato", Language.italian: "Contratto"]),
                    ("Продавец", [Language.english: "Salesperson", Language.french: "Vendeur", Language.spanish: "Vendedor", Language.chinese: "销售员", Language.portuguese: "Vendedor", Language.italian: "Venditore"]),
                    ("Квота", [Language.english: "Quota", Language.french: "Quota", Language.spanish: "Cuota", Language.chinese: "配额", Language.portuguese: "Cota", Language.italian: "Quota"])
                ]
            case .intermediate:
                return [
                    ("Воронка продаж", [Language.english: "Sales funnel", Language.french: "Entonnoir de vente", Language.spanish: "Embudo de ventas", Language.chinese: "销售漏斗", Language.portuguese: "Funil de vendas", Language.italian: "Imbuto di vendita"]),
                    ("Лидогенерация", [Language.english: "Lead generation", Language.french: "Génération de pistes", Language.spanish: "Generación de leads", Language.chinese: "潜在客户开发", Language.portuguese: "Geração de leads", Language.italian: "Generazione di lead"]),
                    ("Квалификация лидов", [Language.english: "Lead qualification", Language.french: "Qualification des pistes", Language.spanish: "Calificación de leads", Language.chinese: "潜在客户资格", Language.portuguese: "Qualificação de leads", Language.italian: "Qualificazione dei lead"]),
                    ("Управление отношениями с клиентами", [Language.english: "Customer relationship management", Language.french: "Gestion de la relation client", Language.spanish: "Gestión de relaciones con clientes", Language.chinese: "客户关系管理", Language.portuguese: "Gestão de relacionamento com clientes", Language.italian: "Gestione delle relazioni con i clienti"]),
                    ("Прогноз продаж", [Language.english: "Sales forecast", Language.french: "Prévision des ventes", Language.spanish: "Pronóstico de ventas", Language.chinese: "销售预测", Language.portuguese: "Previsão de vendas", Language.italian: "Previsione delle vendite"]),
                    ("Управление конвейером продаж", [Language.english: "Sales pipeline management", Language.french: "Gestion du pipeline de vente", Language.spanish: "Gestión del pipeline de ventas", Language.chinese: "销售管道管理", Language.portuguese: "Gestão do pipeline de vendas", Language.italian: "Gestione della pipeline di vendita"]),
                    ("Техника продаж", [Language.english: "Sales technique", Language.french: "Technique de vente", Language.spanish: "Técnica de ventas", Language.chinese: "销售技巧", Language.portuguese: "Técnica de vendas", Language.italian: "Tecnica di vendita"]),
                    ("Закрытие сделки", [Language.english: "Closing the deal", Language.french: "Clôture de l'affaire", Language.spanish: "Cierre de la venta", Language.chinese: "成交", Language.portuguese: "Fechamento da venda", Language.italian: "Chiusura dell'affare"]),
                    ("Управление возражениями", [Language.english: "Objection handling", Language.french: "Gestion des objections", Language.spanish: "Manejo de objeciones", Language.chinese: "处理异议", Language.portuguese: "Tratamento de objeções", Language.italian: "Gestione delle obiezioni"]),
                    ("Продажи по телефону", [Language.english: "Telemarketing", Language.french: "Télémarketing", Language.spanish: "Telemarketing", Language.chinese: "电话销售", Language.portuguese: "Telemarketing", Language.italian: "Telemarketing"])
                ]
            case .advanced:
                return [
                    ("Стратегические продажи", [Language.english: "Strategic selling", Language.french: "Vente stratégique", Language.spanish: "Ventas estratégicas", Language.chinese: "战略销售", Language.portuguese: "Vendas estratégicas", Language.italian: "Vendita strategica"]),
                    ("Продажи решений", [Language.english: "Solution selling", Language.french: "Vente de solutions", Language.spanish: "Venta de soluciones", Language.chinese: "解决方案销售", Language.portuguese: "Venda de soluções", Language.italian: "Vendita di soluzioni"]),
                    ("Консультативные продажи", [Language.english: "Consultative selling", Language.french: "Vente consultative", Language.spanish: "Venta consultiva", Language.chinese: "咨询式销售", Language.portuguese: "Venda consultiva", Language.italian: "Vendita consulente"]),
                    ("Продажи на основе ценности", [Language.english: "Value-based selling", Language.french: "Vente basée sur la valeur", Language.spanish: "Venta basada en valor", Language.chinese: "基于价值的销售", Language.portuguese: "Venda baseada em valor", Language.italian: "Vendita basata sul valore"]),
                    ("Управление ключевыми клиентами", [Language.english: "Key account management", Language.french: "Gestion des comptes clés", Language.spanish: "Gestión de cuentas clave", Language.chinese: "关键客户管理", Language.portuguese: "Gestão de contas-chave", Language.italian: "Gestione degli account chiave"]),
                    ("Продажи в B2B", [Language.english: "B2B sales", Language.french: "Ventes B2B", Language.spanish: "Ventas B2B", Language.chinese: "B2B销售", Language.portuguese: "Vendas B2B", Language.italian: "Vendite B2B"]),
                    ("Продажи в B2C", [Language.english: "B2C sales", Language.french: "Ventes B2C", Language.spanish: "Ventas B2C", Language.chinese: "B2C销售", Language.portuguese: "Vendas B2C", Language.italian: "Vendite B2C"]),
                    ("Управление территорией продаж", [Language.english: "Sales territory management", Language.french: "Gestion du territoire de vente", Language.spanish: "Gestión de territorio de ventas", Language.chinese: "销售区域管理", Language.portuguese: "Gestão de território de vendas", Language.italian: "Gestione del territorio di vendita"]),
                    ("Аналитика продаж", [Language.english: "Sales analytics", Language.french: "Analytique des ventes", Language.spanish: "Analítica de ventas", Language.chinese: "销售分析", Language.portuguese: "Analytics de vendas", Language.italian: "Analisi delle vendite"]),
                    ("Автоматизация продаж", [Language.english: "Sales automation", Language.french: "Automatisation des ventes", Language.spanish: "Automatización de ventas", Language.chinese: "销售自动化", Language.portuguese: "Automação de vendas", Language.italian: "Automazione delle vendite"])
                ]
            }
            
        default:
            return []
        }
    }
    
    static func getExtendedPhrases(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch category {
        case "Бизнес-стратегия":
            switch difficulty {
            case .beginner:
                return [
                    ("Разработать бизнес-стратегию", [Language.english: "Develop business strategy", Language.french: "Développer une stratégie d'affaires", Language.spanish: "Desarrollar estrategia de negocio", Language.chinese: "制定商业策略", Language.portuguese: "Desenvolver estratégia de negócios", Language.italian: "Sviluppare strategia aziendale"]),
                    ("Провести анализ рынка", [Language.english: "Conduct market analysis", Language.french: "Effectuer une analyse de marché", Language.spanish: "Realizar análisis de mercado", Language.chinese: "进行市场分析", Language.portuguese: "Realizar análise de mercado", Language.italian: "Condurre analisi di mercato"]),
                    ("Определить конкурентные преимущества", [Language.english: "Identify competitive advantages", Language.french: "Identifier les avantages concurrentiels", Language.spanish: "Identificar ventajas competitivas", Language.chinese: "确定竞争优势", Language.portuguese: "Identificar vantagens competitivas", Language.italian: "Identificare vantaggi competitivi"])
                ]
            case .intermediate:
                return [
                    ("Провести SWOT-анализ", [Language.english: "Conduct SWOT analysis", Language.french: "Effectuer une analyse SWOT", Language.spanish: "Realizar análisis SWOT", Language.chinese: "进行SWOT分析", Language.portuguese: "Realizar análise SWOT", Language.italian: "Condurre analisi SWOT"]),
                    ("Разработать стратегию роста", [Language.english: "Develop growth strategy", Language.french: "Développer une stratégie de croissance", Language.spanish: "Desarrollar estrategia de crecimiento", Language.chinese: "制定增长策略", Language.portuguese: "Desenvolver estratégia de crescimento", Language.italian: "Sviluppare strategia di crescita"]),
                    ("Оптимизировать бизнес-модель", [Language.english: "Optimize business model", Language.french: "Optimiser le modèle d'affaires", Language.spanish: "Optimizar modelo de negocio", Language.chinese: "优化商业模式", Language.portuguese: "Otimizar modelo de negócio", Language.italian: "Ottimizzare modello di business"])
                ]
            case .advanced:
                return [
                    ("Внедрить стратегическую трансформацию", [Language.english: "Implement strategic transformation", Language.french: "Mettre en œuvre une transformation stratégique", Language.spanish: "Implementar transformación estratégica", Language.chinese: "实施战略转型", Language.portuguese: "Implementar transformação estratégica", Language.italian: "Implementare trasformazione strategica"]),
                    ("Развить динамические способности организации", [Language.english: "Develop organizational dynamic capabilities", Language.french: "Développer les capacités dynamiques organisationnelles", Language.spanish: "Desarrollar capacidades dinámicas organizacionales", Language.chinese: "发展组织动态能力", Language.portuguese: "Desenvolver capacidades dinâmicas organizacionais", Language.italian: "Sviluppare capacità dinamiche organizzative"]),
                    ("Создать стратегические альянсы", [Language.english: "Create strategic alliances", Language.french: "Créer des alliances stratégiques", Language.spanish: "Crear alianzas estratégicas", Language.chinese: "建立战略联盟", Language.portuguese: "Criar alianças estratégicas", Language.italian: "Creare alleanze strategiche"])
                ]
            }
            
        case "Управление проектами":
            switch difficulty {
            case .beginner:
                return [
                    ("Создать проект", [Language.english: "Create a project", Language.french: "Créer un projet", Language.spanish: "Crear un proyecto", Language.chinese: "创建项目", Language.portuguese: "Criar um projeto", Language.italian: "Creare un progetto"]),
                    ("Планировать задачи", [Language.english: "Plan tasks", Language.french: "Planifier les tâches", Language.spanish: "Planificar tareas", Language.chinese: "规划任务", Language.portuguese: "Planejar tarefas", Language.italian: "Pianificare compiti"]),
                    ("Управлять бюджетом", [Language.english: "Manage budget", Language.french: "Gérer le budget", Language.spanish: "Gestionar presupuesto", Language.chinese: "管理预算", Language.portuguese: "Gerenciar orçamento", Language.italian: "Gestire il bilancio"])
                ]
            case .intermediate:
                return [
                    ("Управлять рисками проекта", [Language.english: "Manage project risks", Language.french: "Gérer les risques du projet", Language.spanish: "Gestionar riesgos del proyecto", Language.chinese: "管理项目风险", Language.portuguese: "Gerenciar riscos do projeto", Language.italian: "Gestire i rischi del progetto"]),
                    ("Координировать команду проекта", [Language.english: "Coordinate project team", Language.french: "Coordonner l'équipe projet", Language.spanish: "Coordinar equipo del proyecto", Language.chinese: "协调项目团队", Language.portuguese: "Coordenar equipe do projeto", Language.italian: "Coordinare il team del progetto"]),
                    ("Отслеживать прогресс проекта", [Language.english: "Track project progress", Language.french: "Suivre l'avancement du projet", Language.spanish: "Seguir el progreso del proyecto", Language.chinese: "跟踪项目进度", Language.portuguese: "Acompanhar progresso do projeto", Language.italian: "Monitorare il progresso del progetto"])
                ]
            case .advanced:
                return [
                    ("Внедрить Agile-методологию", [Language.english: "Implement Agile methodology", Language.french: "Mettre en œuvre la méthodologie Agile", Language.spanish: "Implementar metodología Ágil", Language.chinese: "实施敏捷方法论", Language.portuguese: "Implementar metodologia Ágil", Language.italian: "Implementare metodologia Agile"]),
                    ("Управлять портфелем проектов", [Language.english: "Manage project portfolio", Language.french: "Gérer le portefeuille de projets", Language.spanish: "Gestionar cartera de proyectos", Language.chinese: "管理项目组合", Language.portuguese: "Gerenciar portfólio de projetos", Language.italian: "Gestire il portafoglio progetti"]),
                    ("Оптимизировать критический путь", [Language.english: "Optimize critical path", Language.french: "Optimiser le chemin critique", Language.spanish: "Optimizar ruta crítica", Language.chinese: "优化关键路径", Language.portuguese: "Otimizar caminho crítico", Language.italian: "Ottimizzare il percorso critico"])
                ]
            }
            
        case "Продажи":
            switch difficulty {
            case .beginner:
                return [
                    ("Заключить сделку", [Language.english: "Close a deal", Language.french: "Conclure une affaire", Language.spanish: "Cerrar un trato", Language.chinese: "达成交易", Language.portuguese: "Fechar um negócio", Language.italian: "Chiudere un affare"]),
                    ("Найти новых клиентов", [Language.english: "Find new clients", Language.french: "Trouver de nouveaux clients", Language.spanish: "Encontrar nuevos clientes", Language.chinese: "寻找新客户", Language.portuguese: "Encontrar novos clientes", Language.italian: "Trovare nuovi clienti"]),
                    ("Предложить скидку", [Language.english: "Offer a discount", Language.french: "Offrir une remise", Language.spanish: "Ofrecer un descuento", Language.chinese: "提供折扣", Language.portuguese: "Oferecer um desconto", Language.italian: "Offrire uno sconto"])
                ]
            case .intermediate:
                return [
                    ("Квалифицировать потенциального клиента", [Language.english: "Qualify a lead", Language.french: "Qualifier une piste", Language.spanish: "Calificar un lead", Language.chinese: "评估潜在客户", Language.portuguese: "Qualificar um lead", Language.italian: "Qualificare un lead"]),
                    ("Управлять воронкой продаж", [Language.english: "Manage sales funnel", Language.french: "Gérer l'entonnoir de vente", Language.spanish: "Gestionar embudo de ventas", Language.chinese: "管理销售漏斗", Language.portuguese: "Gerenciar funil de vendas", Language.italian: "Gestire l'imbuto di vendita"]),
                    ("Обработать возражения клиента", [Language.english: "Handle customer objections", Language.french: "Gérer les objections du client", Language.spanish: "Manejar objeciones del cliente", Language.chinese: "处理客户异议", Language.portuguese: "Tratar objeções do cliente", Language.italian: "Gestire le obiezioni del cliente"])
                ]
            case .advanced:
                return [
                    ("Внедрить стратегию продаж решений", [Language.english: "Implement solution selling strategy", Language.french: "Mettre en œuvre une stratégie de vente de solutions", Language.spanish: "Implementar estrategia de venta de soluciones", Language.chinese: "实施解决方案销售策略", Language.portuguese: "Implementar estratégia de venda de soluções", Language.italian: "Implementare strategia di vendita di soluzioni"]),
                    ("Оптимизировать процесс продаж на основе ценности", [Language.english: "Optimize value-based selling process", Language.french: "Optimiser le processus de vente basé sur la valeur", Language.spanish: "Optimizar proceso de venta basado en valor", Language.chinese: "优化基于价值的销售流程", Language.portuguese: "Otimizar processo de venda baseado em valor", Language.italian: "Ottimizzare processo di vendita basato sul valore"]),
                    ("Управлять ключевыми клиентскими отношениями", [Language.english: "Manage key customer relationships", Language.french: "Gérer les relations avec les clients clés", Language.spanish: "Gestionar relaciones con clientes clave", Language.chinese: "管理关键客户关系", Language.portuguese: "Gerenciar relacionamentos com clientes-chave", Language.italian: "Gestire relazioni con clienti chiave"])
                ]
            }
            
        default:
            return []
        }
    }
    
    static func getExtendedSentences(for category: String, difficulty: DifficultyLevel) -> [(russian: String, translations: [Language: String])] {
        switch category {
        case "Бизнес-стратегия":
            switch difficulty {
            case .beginner:
                return [
                    ("Мы разработали новую бизнес-стратегию для расширения рынка.", [Language.english: "We developed a new business strategy to expand the market.", Language.french: "Nous avons développé une nouvelle stratégie d'affaires pour étendre le marché.", Language.spanish: "Desarrollamos una nueva estrategia de negocio para expandir el mercado.", Language.chinese: "我们制定了新的商业策略以扩大市场。", Language.portuguese: "Desenvolvemos uma nova estratégia de negócios para expandir o mercado.", Language.italian: "Abbiamo sviluppato una nuova strategia aziendale per espandere il mercato."]),
                    ("Анализ конкурентов помог нам определить наши преимущества.", [Language.english: "Competitor analysis helped us identify our advantages.", Language.french: "L'analyse des concurrents nous a aidés à identifier nos avantages.", Language.spanish: "El análisis de competidores nos ayudó a identificar nuestras ventajas.", Language.chinese: "竞争对手分析帮助我们确定了我们的优势。", Language.portuguese: "A análise de concorrentes nos ajudou a identificar nossas vantagens.", Language.italian: "L'analisi dei concorrenti ci ha aiutato a identificare i nostri vantaggi."])
                ]
            case .intermediate:
                return [
                    ("SWOT-анализ выявил ключевые возможности для роста и потенциальные угрозы, требующие стратегического планирования.", [Language.english: "SWOT analysis revealed key growth opportunities and potential threats requiring strategic planning.", Language.french: "L'analyse SWOT a révélé des opportunités de croissance clés et des menaces potentielles nécessitant une planification stratégique.", Language.spanish: "El análisis SWOT reveló oportunidades clave de crecimiento y amenazas potenciales que requieren planificación estratégica.", Language.chinese: "SWOT分析揭示了关键的增长机会和需要战略规划的潜在威胁。", Language.portuguese: "A análise SWOT revelou oportunidades-chave de crescimento e ameaças potenciais que requerem planejamento estratégico.", Language.italian: "L'analisi SWOT ha rivelato opportunità chiave di crescita e minacce potenziali che richiedono pianificazione strategica."]),
                    ("Стратегический альянс с партнером позволил нам выйти на новые рынки и увеличить долю рынка на 25%.", [Language.english: "Strategic alliance with a partner allowed us to enter new markets and increase market share by 25%.", Language.french: "L'alliance stratégique avec un partenaire nous a permis d'entrer sur de nouveaux marchés et d'augmenter la part de marché de 25%.", Language.spanish: "La alianza estratégica con un socio nos permitió ingresar a nuevos mercados y aumentar la cuota de mercado en un 25%.", Language.chinese: "与合作伙伴的战略联盟使我们能够进入新市场并将市场份额增加25%。", Language.portuguese: "A aliança estratégica com um parceiro nos permitiu entrar em novos mercados e aumentar a participação de mercado em 25%.", Language.italian: "L'alleanza strategica con un partner ci ha permesso di entrare in nuovi mercati e aumentare la quota di mercato del 25%."])
                ]
            case .advanced:
                return [
                    ("Внедрение стратегической трансформации с фокусом на цифровые технологии и организационное обучение привело к развитию динамических способностей компании и повышению конкурентной устойчивости на 40%.", [Language.english: "Implementation of strategic transformation focusing on digital technologies and organizational learning led to the development of company's dynamic capabilities and increased competitive resilience by 40%.", Language.french: "La mise en œuvre d'une transformation stratégique axée sur les technologies numériques et l'apprentissage organisationnel a conduit au développement des capacités dynamiques de l'entreprise et à une augmentation de la résilience concurrentielle de 40%.", Language.spanish: "La implementación de una transformación estratégica centrada en tecnologías digitales y aprendizaje organizacional llevó al desarrollo de capacidades dinámicas de la empresa y aumentó la resiliencia competitiva en un 40%.", Language.chinese: "实施专注于数字技术和组织学习的战略转型，使公司发展了动态能力，并将竞争弹性提高了40%。", Language.portuguese: "A implementação de uma transformação estratégica focada em tecnologias digitais e aprendizado organizacional levou ao desenvolvimento de capacidades dinâmicas da empresa e aumentou a resiliência competitiva em 40%.", Language.italian: "L'implementazione di una trasformazione strategica focalizzata su tecnologie digitali e apprendimento organizzativo ha portato allo sviluppo delle capacità dinamiche dell'azienda e ha aumentato la resilienza competitiva del 40%."])
                ]
            }
            
        case "HR и рекрутинг", "Операции", "Аналитика данных", "Корпоративные финансы", "Инвестиции", "Бухгалтерия", "Цифровой маркетинг", "Брендинг", "Контент-маркетинг", "SEO и SEM", "Социальные медиа", "E-commerce", "Программирование", "Кибербезопасность", "Искусственный интеллект", "Облачные технологии", "Блокчейн", "Мобильная разработка", "Веб-разработка", "DevOps", "Управление рисками", "Стратегическое планирование", "Лидерство", "Переговоры", "Презентации", "Клиентский сервис", "Логистика", "Цепочка поставок", "Качество продукции", "Исследования рынка", "Потребительское поведение", "Международный бизнес", "Юридические вопросы", "Интеллектуальная собственность", "Налогообложение", "Аудит", "Финансовое планирование", "Управление активами", "Венчурный капитал", "Стартапы", "Инновации", "Устойчивое развитие", "Корпоративная этика", "Управление изменениями", "Организационная культура":
            // Используем универсальный генератор для остальных категорий
            return UniversalContentGenerator.generateWords(for: category, difficulty: difficulty, count: 50)
            
        default:
            return []
        }
    }
}

