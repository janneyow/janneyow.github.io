
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "J-Anne Yow"
#let locale-catalog-page-numbering-style = context { "J-Anne Yow - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Apr 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
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
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = false
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
#let design-entries-date-and-location-width = 4.15cm
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

= J-Anne Yow

// Print connections:
#let connections-list = (
  [Singapore],
  [#box(original-link("mailto:janne.yow@gmail.com")[janne.yow\@gmail.com])],
  [#box(original-link("https://janneyow.github.io/")[janneyow.github.io])],
  [#box(original-link("https://linkedin.com/in/janneyow")[linkedin.com\/in\/janneyow])],
)
#connections(connections-list)



== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], Ph.D. in Mechanical Engineering -- Singapore
  ],
  right-content: [
    Sept 2021 – present
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[Supervisor:] Prof Ang Wei Tech],[#strong[Proposed Dissertation:] Enhancing Human-Robot Interaction for Personalised Robot Behaviour in Assistive Feeding],[#strong[Research Interests:] Human-Robot Interaction, Machine Learning, Foundation Models, Continual Learning],)
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
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], BE in Mechanical Engineering with a Second Major in Business -- Singapore
  ],
  right-content: [
    Aug 2017 – May 2021
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 4.92\/5.00, Dean's List every Academic Year],[#strong[Awards:] #link("https://www.ntu.edu.sg/mae/admissions/current-students/undergraduate/medals-and-prizes")[Dr Leung Shiu Kee Gold Medal Award], ASEAN Undergraduate Scholarship],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Research Projects


#two-col-entry(
  left-content: [
    #strong[Robot-Assisted Feeding] 
  ],
  right-content: [
    2022 -- present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Implemented an end-to-end pipeline for robot-assisted feeding, including bite sequencing, food acquisition with a spoon, and transferring food to the user.],[Developed a personalized assistive feeding system that adapts to user preferences and needs, leveraging language corrections to modify robot actions.],[Developed a goal-conditioned scooping policy to scoop a target amount of food while considering different food properties.],[Exploring the integration of foundation models in robotics for more adaptive and intelligent robots.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Grasping in Clutter] 
  ],
  right-content: [
    2020 -- 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed a shared autonomy framework to decide when and what to query users in scenarios where uncertainty is high, enabling more effective human-robot collaboration.],[Developed a point-and-click interface for robotic grasping in cluttered environments by generating better grasp poses through object segmentation.],)
  ],
)



== Work Experience


#two-col-entry(
  left-content: [
    #strong[Research Assistant], Nanyang Techcnological University -- Singapore
  ],
  right-content: [
    Aug 2021 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Led the development of a personalized robot-assisted feeding system, ensuring ethical compliance and timely procurement of resources to advance project milestones.],[Mentored seven undergraduate students on final year projects, providing strategic guidance in research direction, methodology and technical problem-solving.],[Contributed to preparing funding proposals and established research collaborations with overseas institutes.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[SaaS Sales Operations Intern], #link("https://www.bytedance.com/en/")[ByteDance] -- Singapore
  ],
  right-content: [
    May 2020 – July 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Built and optimized dashboards for the Lark APAC team, improving data-driven decision-making and operational insights.],[Enhanced data quality and integrity in Salesforce.com, streamlining processes and ensuring consistency across regional teams.],[Conducted analysis on daily active user \(DAU\) trends and tenant health scores, providing product-market fit understanding and insights for the go-to-market strategy.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Engineering Intern], #link("https://oishii.com/")[Oishii] -- New Jersey, USA
  ],
  right-content: [
    Jan 2020 – Mar 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Oversaw a project which involved integrating farm systems and forecasting future infrastructure requirements to minimize operational risks.],[Evaluated and built communication pathways of sensors and actuators inside the world's largest indoor strawberry vertical farms to automate the farm.],[Coordinated and collaborated with contractors of different expertise to integrate systems and solve current infrastructure limitations.],)
  ],
)



== Journal Publications


#two-col-entry(
  left-content: [
    #link("https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2024.1345693/full")[#strong[ExTraCT - Explainable Trajectory Corrections for language-based human-robot interaction using Textual feature descriptions]]

  ],
  right-content: [
    Sept 2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Neha P Garg, Manoj Ramanathan, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)Frontiers in Robotics and AI])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://ieeexplore.ieee.org/document/10323205")[#strong[Shared Autonomy of a Robotic Manipulator for Grasping under Human Intent Uncertainty using POMDPs]]

  ],
  right-content: [
    Nov 2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Neha P Garg, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE Transactions on Robotics])



== Other Publications


#two-col-entry(
  left-content: [
    #strong[Simulating Safe Bite Transfer in Robot-Assisted Feeding wtih a Soft Head and Articulated Jaw]

  ],
  right-content: [
    May 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Yi Heng San, Vasanth Ravichandram, #strong[#emph[J-Anne Yow]], Sherwin Chan, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)International Conference on Rehabilitation Robotics \(ICORR\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Design of a Breakaway Utensil Attachment for Enhanced Safety in Robot-Assisted Feeding]

  ],
  right-content: [
    May 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Hau Wen Chang, #strong[#emph[J-Anne Yow]], Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)International Conference on Rehabilitation Robotics \(ICORR\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Adaptive Scooping in Simulation for Assistive Feeding: Meeting User Preferences in Bite Size \(Best Paper Award\)]

  ],
  right-content: [
    Oct 2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Neha P Garg, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)Workshop on Interactive Robots and AI for Healthcare, IEEE\/RSJ International Conference on Intelligent Robots and Systems])



== Service


#one-col-entry(
  content: [#strong[Reviewer:] IEEE Robotics and Automation Letters \(RAL\), IEEE International Conference on Robotics and Automation \(ICRA\)]
)


== Skills


#one-col-entry(
  content: [#strong[Programming:] Python, C\/C++, R, LaTeX, SQL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Robotics:] Machine Learning, ROS, MuJoCo, Computer Vision, Linux]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English, Chinese, Malay]
)


