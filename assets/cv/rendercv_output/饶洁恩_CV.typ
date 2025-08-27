
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "饶洁恩"
#let locale-catalog-page-numbering-style = context { "饶洁恩 - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "最近更新于 2025.08"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "Noto Sans"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Noto Sans"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Noto Sans"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "Noto Sans"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 3.0cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= 饶洁恩

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)新加坡],
  [#box(original-link("mailto:janne.yow@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)janne.yow\@gmail.com])],
  [#box(original-link("https://janneyow.github.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)janneyow.github.io])],
  [#box(original-link("https://linkedin.com/in/janneyow")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)janneyow])],
)
#connections(connections-list)



== 个人简介


#one-col-entry(
  content: [新加坡南洋理工大学博士在读\(2026年2月毕业），专注于构建可与人交互并持续自适应的机器人系统。擅长将强化学习、控制策略与基础模型整合进端到端机器人系统。热衷设计可泛化、以用户为中心且可规模化落地的机器人。目前主导建设具身智能数据工厂，通过高保真、低认知负荷的遥操作接口，持续采集大规模高质量数据，用于训练视觉-语言-动作（VLA）基础模型策略。]
)


== 教育背景


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[南洋理工大学]], 新加坡

博士 — 机械工程
  ],
  right-content: [
    2021.09 -- 2026.02 \(预计\)
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[导师:] 洪伟德教授 （Prof Ang Wei Tech）],[#strong[论文题目:] Towards Personalized Robot Assistance: Integrating User Preferences in Robot-Assisted Feeding \(人机协同下的个性化助餐：基于用户偏好的机器人赋能\)],[#strong[研究兴趣:] : 机器人学习（强化学习、模仿学习）、人机交互、大模型],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[南洋理工大学]], 新加坡

本科 — 机械工程与商业分析 \(双专业\)
  ],
  right-content: [
    2017.08 – 2021.05
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 4.92\/5.00, 一等荣誉学位],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== 项目经历


#two-col-entry(
  left-content: [
    #strong[具身智能数据工厂（高效机器人数据采集与学习平台）] 
  ],
  right-content: [
    2025 -- 至今
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([共同主导高保真遥操作系统的整体架构设计，实现双臂与灵巧手的连续零停顿动作映射，显著降低操作员认知负荷，保持人类运动与机器人执行的高度一致性。],[打造异构机器人共享的数据工厂，融合无标记三维动作捕捉、多模态传感同步与实时动作重定向，支持仿真与真实平台间的高效切换。],[探索面向下一代策略训练的数据管线，目标构建大规模高保真多模态数据集，为视觉-语言-动作（VLA）模型与扩散策略（diffusion policies）等提供高质量训练数据，提升策略的泛化性与稳健性。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[机械辅助喂食系统] 
  ],
  right-content: [
    2022 -- 至今
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([主导端到端自适应喂食系统的技术开发，将多模态感知、运动规划与柔顺控制集成于安全、可部署的平台中，并成功应用于老年用户的试验。],[在MuJoCo中开发融合视觉与力矩反馈的强化学习策略，实现跨食物属性的自适应操作，完成 sim-to-real 迁移。],[搭建了语言驱动的自适应管道，利用大语言模型（LLM）解析用户自然语言反馈，并将其映射为安全、可靠的机器人运动参数，以实现个性化行为调整。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[杂乱环境下的机器人抓取] 
  ],
  right-content: [
    2020 -- 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([开发了点选式人机交互界面，将物体分割、抓取评分与抓取循环集成在一起，在杂乱场景中简化用户输入并提升选择效率。],[提出基于 POMDP 的人机协同控制框架，可在意图不确定时主动向用户提问，从而减少冲突操作并加快任务完成。],)
  ],
)



== 工作与实习经历


#two-col-entry(
  left-content: [
    #strong[助理研究员], 南洋理工大学 -- 新加坡
  ],
  right-content: [
    2021-08 -- 至今
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([主导基于ROS\/ROS2的系统集成与软硬件接口开发，与研究团队成员及学生协作制定技术目标，并在仿真环境与物理机器人系统上进行原型验证。],[负责项目规划、资源协调与伦理合规管理，消除算力瓶颈等运营障碍，确保项目按计划推进。],[指导了8个本科生毕业设计项目，设定研究目标，提供技术实现与方法技能发展的引导。],[撰写并参与具有竞争力的基金申请，为在研课题与新合作计划争取资金支持。],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[SaaS销售运营实习生], #link("https://www.bytedance.com/en/")[字节跳动] -- 新加坡
  ],
  right-content: [
    2020.05 – 2020.07
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([设计并优化飞书（Lark）亚太区运营仪表板，实现关键指标可视化，支持区域团队数据驱动决策。],[改善Salesforce数据架构，优化业务流程，提升区域业务数据一致性与运营效率。],[分析用户行为数据（DAU／租户健康评分），以协助制定产品推广策略并评估市场适应性],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[工程实习生], #link("https://oishii.com/")[Oishii] -- 新泽西州，美国
  ],
  right-content: [
    2020.01 – 2020.03
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([领导农场基础设施扩展项目的规划与推进，在技术可行性、成本控制与生产连续性间实现有效平衡。],[主导农场自动化的传感器-执行器系统实施，工作涵盖方案设计、部署、电气布线、系统集成与布局规划。],[协同外部承包商与内部运营团队，识别并解决基础设施瓶颈，优化产线运作效率。],)
  ],
)



== 精选出版物


#two-col-entry(
  left-content: [
    #strong[SAVR: Scooping Adaptation for Variable food properties via Reinforcement Learning]

  ],
  right-content: [
    2025.10
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[FRANC: Feeding Robot for Adaptive Needs and Personalized Care]

  ],
  right-content: [
    2025.10
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Luke Toh, Yi Heng San, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ORBiT: Optimizing Robot-Assisted Bite Transfer Leveraging a Real2Sim2Real Framework]

  ],
  right-content: [
    2025.10
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Sherwin Chan, #strong[#emph[J-Anne Yow]], Yi Heng San, Vasanth Ravichandram, Yifan Wang, Lek Syn Lim, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE\/RSJ International Conference on Intelligent Robots and Systems \(IROS\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://ieeexplore.ieee.org/document/10323205")[#strong[Shared Autonomy of a Robotic Manipulator for Grasping under Human Intent Uncertainty using POMDPs]]

  ],
  right-content: [
    2023.11
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Neha P Garg, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE Transactions on Robotics \(T-RO\)])



== 荣誉与奖项


#one-col-entry(
  content: [- 四年院长名单（专业前5\%）],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #link("https://www.ntu.edu.sg/mae/admissions/current-students/undergraduate/medals-and-prizes")[Dr Leung Shiu Kee 金牌奖] \(优秀毕业设计奖 1\/650\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- 东盟本科全额奖学金],
)


== 技能


#one-col-entry(
  content: [#strong[编程语言:] Python, C\/C++ ]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[机器人与仿真:] ROS\/ROS2, MoveIt, MuJoCo, Isaac Lab]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[机器学习:] 强化学习、模仿学习、PyTorch]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[开发与工具:] Git\/GitHub, Linux]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[语言能力:] 英语, 中文, 马来语]
)


