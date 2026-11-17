// One-page, two-column resume (port of the Deedy-style LaTeX template).
// Compile with:  typst compile --font-path fonts resume.typ

#let primary = rgb("#2b2b2b")
#let heading-color = rgb("#6a6a6a")
#let sub-color = rgb("#333333")

#set document(title: "Lucas Sterzinger – Resume", author: "Lucas Sterzinger")
#set page(paper: "us-letter", margin: (x: 1.25cm, y: 0.75cm))
#set text(font: "Lato", size: 10pt, fill: primary)
#set par(leading: 0.55em, spacing: 0.6em)
#set list(marker: [•], indent: 6pt, body-indent: 5pt, spacing: 0.5em)

// ---------- helpers ----------

#let section(title) = {
  v(0.5em)
  text(size: 15pt, fill: heading-color, upper(title))
  v(-0.2em)
}

#let sep = v(0.7em)

// Org / role header block used in both columns.
#let entry(org, role: none, date: none, place: none, body: none) = {
  let details = (date, place, body).filter(x => x != none)
  block(above: 0.5em, below: 0.4em, breakable: false, {
    text(weight: "bold", size: 11pt, fill: sub-color, upper(org))
    if role != none {
      h(4pt)
      text(font: "Raleway", weight: "medium", size: 10pt, fill: sub-color)[| #smallcaps(role)]
    }
    if details.len() > 0 {
      linebreak()
      text(font: "Raleway", weight: "medium", size: 9pt, fill: sub-color, details.join(linebreak()))
    }
  })
}

#let url(u) = link(u, u)

// ---------- header ----------

#move(dx: -1.25cm, block(width: 100% + 2.5cm, {
  align(center, text(font: "Lato", weight: "light", size: 38pt)[Lucas Sterzinger, PhD])
  v(-0.2em)
  line(length: 100%, stroke: 0.5pt + heading-color)
}))
#v(0.2em)

// ---------- body ----------

#grid(
  columns: (60%, 33%),
  column-gutter: 1fr,

  // ===== Column one =====
  [
    #section[Experience]

    #entry(
      "NASA – GES DISC (ADNET Systems, Inc)",
      role: "Mission Support Scientist + Software Developer",
      date: "January 2023 – Present",
      place: "NASA Goddard Space Flight Center – Greenbelt, MD (Fully Remote)",
    )
    - Goddard Earth Science Data and Information Services Center
    - I am responsible for NASA satellite mission data processing, archive, and distribution at GES DISC. Total archive size: 7.1 PB (#url("https://disc.gsfc.nasa.gov"))
    - I support development of cloud-native data tools and applications for the NASA EarthData ecosystem (#url("https://earthdata.nasa.gov"))
    - Support science data processing, local + cloud software engineering, data curation, and archive operations throughout the entire GES DISC archive center
    #sep

    #entry(
      "University of California, Davis",
      role: "Graduate Research Assistant",
      date: "August 2017 – March 2023 | Davis, CA",
    )
    - Worked with *#link("https://adele.faculty.ucdavis.edu/")[Adele Igel]* on research related to cloud and precipitation physics. Projects included "real" and idealized simulations of mixed phase clouds – see Google Scholar or ORCiD links for more details
    #sep

    #entry(
      "University of North Dakota",
      role: "Dept of Atmospheric Sciences",
      body: [
        Research Assistant, 2015 – 2017 \
        Teaching Assistant, 2016 – 2017
      ],
    )
    #sep

    #entry(
      "University of North Dakota",
      role: "School of Medicine and Health Sciences",
      date: "2012 – 2017",
      body: [Technical Support Specialist],
    )
    #sep

    #section[Selected Publications]
    #set text(size: 9pt)
    #bibliography("publications.bib", title: none, style: "ieee", full: true)
  ],

  // ===== Column two =====
  [
    #section[Coding Projects]

    #entry("Kerchunk", role: "Contributor", place: url("https://github.com/fsspec/kerchunk"))
    - Kerchunk provides performant access to cloud-hosted NetCDF4/HDF5 data
    - Core contributor starting in June 2021, though currently less active
    #sep

    #entry("PyRAMS", role: "Creator", place: url("https://github.com/lsterzinger/pyrams"))
    - Package originally created for my work with RAMS model output
    - Open-sourced and packaged in PyPI/Conda-Forge for use by the broader RAMS community
    #sep

    #section[Education]

    #entry(
      "Univ. of California, Davis",
      role: "PhD in Atmospheric Science",
      date: "February 2023 | Davis, CA",
    )
    - Dissertation: _Ice, Liquid, and Aerosol: Mixed-Phase Cloud Properties and Processes in Regional and Large Eddy Simulations_
    #text(font: "Raleway", weight: "medium", size: 9pt, fill: sub-color)[Cum. GPA: 3.74 / 4.0]
    #sep

    #entry(
      "Univ. of North Dakota",
      role: "B.S. Atmospheric Science",
      date: "May 2017 | Grand Forks, ND",
      body: [B.S. Aeronautics],
    )
    - Minor in Mathematics
    #sep

    #section[Societies]
    American Meteorological Society (AMS) \
    American Geophysical Union (AGU)
    #sep

    #section[Links]
    Github: *#link("https://github.com/lsterzinger")[lsterzinger]* \
    Google Scholar: *#link("https://scholar.google.com/citations?user=W5M2bZkAAAAJ&hl=en&oi=ao")[Lucas Sterzinger]* \
    ORCiD: *#link("https://orcid.org/0000-0003-3321-4534")[0000-0003-3321-4534]*
  ],
)
