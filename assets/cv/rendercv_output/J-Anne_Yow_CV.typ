
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "J-Anne Yow"
#let locale-catalog-page-numbering-style = context { "J-Anne Yow - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated Aug 2025"
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
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
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
#let design-entries-date-and-location-width = 3.5cm
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
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Singapore],
  [#box(original-link("mailto:janne.yow@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)janne.yow\@gmail.com])],
  [#box(original-link("https://janneyow.github.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)janneyow.github.io])],
  [#box(original-link("https://linkedin.com/in/janneyow")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)janneyow])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Final-year PhD candidate in Robotics & AI at NTU Singapore, developing adaptive robotic systems that integrate reinforcement learning, multimodal perception, and language-driven control. Experienced in sim-to-real transfer, ROS\/ROS2, and real-world deployment in user trials. Passionate about bridging research and application by enabling embodied AI models to transfer from simulation into practical, deployable robots.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], Singapore

Ph.D. in Mechanical Engineering
  ],
  right-content: [
    Sept 2021 -- Feb 2026 \(Expected\)
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[Supervisor:] Prof Ang Wei Tech],[#strong[Dissertation:] Towards Personalized Robot Assistance: Integrating User Preferences in Robot-Assisted Feeding],[#strong[Research Interests:] Human-Robot Interaction, Machine Learning, Foundation Models, Continual Learning],)
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
    #link("https://www.ntu.edu.sg/")[#strong[Nanyang Technological University]], Singapore

BE in Mechanical Engineering with a Second Major in Business
  ],
  right-content: [
    Aug 2017 – May 2021
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([#strong[GPA:] 4.92\/5.00, First Class Honours],[#strong[Awards:] Dean's List every Academic Year, #link("https://www.ntu.edu.sg/mae/admissions/current-students/undergraduate/medals-and-prizes")[Dr Leung Shiu Kee Gold Medal Award], ASEAN Undergraduate Scholarship],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Research Experience


#two-col-entry(
  left-content: [
    #strong[Embodied AI Data Factory - Improving Teleoperation for Scalable Data Collection] 
  ],
  right-content: [
    2025 -- present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Leading efforts to enhance teleoperation for bimanual and dexterous manipulation to reduce cognitive load and preserve natural human motion.],[Building a scalable pipeline with markerless motion capture, multisensory perception, and real-time retargeting to dexterous hands, manipulators, and humanoids in simulation and on real hardware.],[Goal: To close the gap between human and robot motion to enable efficient, high-fidelity datasets for training robust, generalizable, foundation model-based vision-language-action \(VLA\) policies.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
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
    #v(design-highlights-top-margin);#highlights([Led the technical delivery of an end-to-end adaptive feeding system, integrating perception, planning, and control into a safe, deployable platform for real-world elderly user trials.],[Developed goal-conditioned reinforcement learning policies in MuJoCo, integrating multimodal feedback \(vision + force-torque sensing\) for adaptive manipulation across variable food properties, achieving successful sim-to-real transfer.],[Built a language-driven adaptation pipeline, leveraging large language models to map user feedback into motion parameters for reliable, safe robot behaviour.],)
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
    #v(design-highlights-top-margin);#highlights([Developed a point-and-click interface for human-in-the-loop robotic manipulation, integrating object segmentation, grasp ranking, and grasp cycling to streamline user input and improve selection efficiency in cluttered scenes.],[Developed a POMDP-based shared autonomy framework that queries users under intent uncertainty, reducing conflicting actions and enabling faster task completion.],)
  ],
)



== Work Experience


#two-col-entry(
  left-content: [
    #strong[Research Assistant], Nanyang Technological University -- Singapore
  ],
  right-content: [
    Aug 2021 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Managed ROS\/ROS2-based system integration and hardware-software interfacing, collaborating with research staff and students to define technical goals and evaluate prototypes in simulation and on physical robots.],[Managed project planning, resource coordination, and ethical compliance, removing operational bottlenecks such as compute limitations to keep development on schedule.],[Mentored and scoped eight undergraduate projects, defining research objectives, guiding technical execution and skill development.],[Drafted and contributed to competitive funding proposals to support ongoing research and new initiatives.],)
  ],
)



== Selected Publications


#two-col-entry(
  left-content: [
    #strong[SAVR: Scooping Adaptation for Variable food properties via Reinforcement Learning]

  ],
  right-content: [
    Oct 2025
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
    Oct 2025
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
    Oct 2025
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
    Nov 2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);#strong[#emph[J-Anne Yow]], Neha P Garg, Wei Tech Ang

#v(design-highlights-top-margin - design-text-leading)IEEE Transactions on Robotics \(T-RO\)])



== Service


#one-col-entry(
  content: [#strong[Reviewer:] IEEE Robotics and Automation Letters \(RAL\), IEEE International Conference on Robotics and Automation \(ICRA\)]
)


== Skills


#one-col-entry(
  content: [#strong[Programming:] Python, C\/C++ ]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Robotics & Simulation:] ROS\/ROS2, MoveIt, MuJoCo, Isaac Lab]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning:] Reinforcement Learning, Imitation Learning, PyTorch]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Perception & Control:] Vision, Force-Torque Sensing, Impedance\/Admittance Control]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English, Chinese, Malay]
)


