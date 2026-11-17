// Curriculum Vitae. Compile with:  typst compile --font-path fonts cv.typ

#let primary = rgb("#2b2b2b")
#let muted = rgb("#6a6a6a")
#let link-color = rgb("#1a56b0")

#set document(title: "Lucas Sterzinger – Curriculum Vitae", author: "Lucas Sterzinger")
#set page(
  paper: "us-letter",
  margin: (x: 0.9in, y: 0.8in),
  footer: context align(center, text(size: 8pt, fill: muted)[
    Lucas Sterzinger, PhD – Curriculum Vitae – #counter(page).display() / #counter(page).final().first()
  ]),
)
#set text(font: "Lato", size: 10pt, fill: primary)
#set par(leading: 0.55em, spacing: 0.7em)
#set list(marker: [•], indent: 8pt, body-indent: 6pt, spacing: 0.5em)
#show link: set text(fill: link-color)

// ---------- helpers ----------

#let section(title) = {
  v(1em)
  block(sticky: true, {
    text(size: 11.5pt, weight: "bold", fill: muted, tracking: 0.05em, upper(title))
    v(-0.5em)
    line(length: 100%, stroke: 0.5pt + muted)
  })
  v(-0.3em)
}

// A titled entry with right-aligned date, optional detail lines and bullets.
#let entry(title, date: none, lines: (), body: none) = block(breakable: false, above: 0.9em, below: 0em, {
  grid(
    columns: (1fr, auto),
    text(weight: "bold", style: "italic", title),
    date,
  )
  for l in lines { l; linebreak() }
  if body != none { body }
})

#let pub(title, date, authors, venue: none, doi: none) = entry(
  title,
  date: date,
  lines: (
    authors,
    if venue != none { emph(venue) },
    if doi != none { link(doi) },
  ).filter(x => x != none),
)

// ---------- header ----------

#align(center, {
  text(size: 22pt, weight: "light")[Lucas Sterzinger, PhD]
  v(-0.4em)
  text(size: 11pt, fill: muted)[Curriculum Vitae]
  v(-0.2em)
  link("https://github.com/lsterzinger")
})
#v(-0.3em)
#line(length: 100%, stroke: 1pt + primary)

// ---------- content ----------

#section[Work Experience]

#entry(
  "Mission Support / Scientific Software Developer",
  date: "2023 – Present",
  lines: ("NASA Goddard Earth Sciences Data and Information Services Center (GES DISC)", "ADNET Systems, Inc"),
  body: [
    - Manage on-prem SIPS data production for AIRS (Aqua) and CrIS/ATMS (SNPP, JPSS-1, and JPSS-2) instruments
    - Manage end-to-end production, ingest, and archive workflows for Earth science data
    - Support transition to cloud-based environment
  ],
)

#entry(
  "Graduate Student Researcher",
  date: "2017 – 2023",
  lines: ("Atmospheric Science Graduate Group, UC Davis", "Dr. Adele Igel, Faculty Advisor"),
  body: [
    - Worked on research related to cloud and precipitation physics. Projects included:
      - Effect of ice crystal habit (shape) on orographic snowfall in the Sierra Nevada Mountains. (Funding: Internal)
      - Examining the relationship between mixed-phase Arctic cloud dissipation and aerosol properties. (Funding: DOE ASR; A. Igel, PI)
      - Assessing relative impacts on aerosol contained within the boundary layer and free troposphere on the microphysics and other properties of Arctic mixed-phase clouds. (Funding: DOE ASR; A. Igel, PI)
  ],
)

#entry(
  "Intern",
  date: "Summer 2021",
  lines: (
    "Summer Internship in Parallel Computational Science (SIParCS)",
    "National Center for Atmospheric Research (NCAR), Boulder, CO",
  ),
  body: [
    - Worked with Chelle Gentemann (Farallon Inst./NASA TOPS), Kevin Paul (NCAR), Julia Kent (NCAR), Rich Signell (USGS) and Martin Durant (Anaconda Inc.) on the development of the Kerchunk software library and its applicability and performance accessing cloud-hosted NOAA/NASA satellite data.
    - Wrote documentation, blog posts, and example code on how to get started using Kerchunk – published open-source on GitHub.
  ],
)

#entry(
  "Undergraduate Research Assistant",
  date: "2016 – 2017",
  lines: ("Dept. of Atmospheric Sciences, University of N. Dakota", "Dr. Gretchen Mullendore, Faculty Advisor"),
  body: [
    - Worked on the "Big Weather Web" project examining potential uses for cloud computing infrastructure for numerical weather prediction.
  ],
)

#entry(
  "Undergraduate Teaching Assistant",
  date: "2015 – 2017",
  lines: ("Dept. of Atmospheric Sciences, University of N. Dakota",),
  body: [
    - Independently taught Introduction to Meteorology lab, complete with weekly lectures and laboratory experiments.
  ],
)

#entry(
  "Technical Support Specialist",
  date: "2012 – 2017",
  lines: ("Univ. of N. Dakota School of Medicine and Health Sciences",),
  body: [
    - Responsible for direct technology support to faculty, staff, and students. Also worked on managing video conference systems, networks, and servers.
  ],
)

#section[Technical]

_Languages & Software:_ Python, Perl, Julia, Fortran \
_Operating Systems:_ Unix/Linux, MacOS, Windows \
_Software Packages:_
- #link("https://github.com/lsterzinger/pyrams")[PyRAMS] (maintainer) – Package for working with RAMS model data
- #link("https://github.com/fsspec/kerchunk")[Kerchunk] (contributor) – Cloud performant access to NetCDF4 data

#section[Education]

#entry(
  [PhD, Atmospheric Science],
  date: "2017 – 2023",
  lines: (
    "University of California, Davis, Davis, CA",
    [Dissertation: #emph(link("https://escholarship.org/uc/item/1v54c9tv")[Ice, Liquid, and Aerosol: Mixed-Phase Cloud Properties and Processes in Regional and Large Eddy Simulations])],
  ),
)

#entry(
  [Bachelor of Science, Atmospheric Sciences],
  date: "2012 – 2017",
  lines: ("University of North Dakota, Grand Forks, ND", "Minor: Mathematics"),
)

#entry(
  [Bachelor of Science, Aeronautics],
  date: "2012 – 2017",
  lines: ("University of North Dakota, Grand Forks, ND",),
)

#section[Publications]

#pub(
  "Producing Earth science data for impact: Improved commercial cloud usability of archive model data",
  "2026",
  [McNally, A., *Sterzinger, L. J.*, & Carrol, I.],
  venue: "Environmental Modelling & Software",
  doi: "https://doi.org/10.1016/j.envsoft.2025.106846",
)

#pub(
  "Above-cloud concentrations of cloud condensation nuclei help to sustain some Arctic low-level clouds",
  "2024",
  [*Sterzinger, L. J.* & Igel, A. L.],
  venue: "Atmospheric Chemistry and Physics",
  doi: "https://doi.org/10.5194/acp-24-3529-2024",
)

#pub(
  "Do Arctic mixed-phase clouds sometimes dissipate due to insufficient aerosol? Evidence from comparisons between observations and idealized simulations",
  "2022",
  [Sterzinger, L. J., Sedlar, J., Guy, H., Neely III, R., & Igel, A. L.],
  venue: "Atmospheric Chemistry and Physics",
  doi: "https://doi.org/10.5194/acp-22-8973-2022",
)

#pub(
  "The Effects of Ice Habit on Simulated Orographic Snowfall",
  "2021",
  [Sterzinger, L. J., & Igel, A. L.],
  venue: "Journal of Hydrometeorology",
  doi: "https://doi.org/10.1175/JHM-D-20-0253.1",
)

#pub(
  "Models in the Cloud: A Cost Exploration of Cloud Computing for the Atmospheric Sciences",
  "2017",
  [],
  venue: "News@Unidata Blog",
  doi: "https://www.unidata.ucar.edu/blogs/news/entry/models-in-the-cloud-a",
)

#section[Service]

#entry(
  "UC Davis Graduate Student Association",
  body: [
    - General Assembly Representative #h(1fr) 2019 – 2022
    - Elections Committee #h(1fr) 2019 – 2020
  ],
)

#entry(
  "UC Davis Academic Senate, Committee on Information Technology",
  date: "2020 – 2021",
  lines: ("Graduate Student Representative",),
)

#section[Selected Conference Presentations]

#entry(
  "Open Science Success Stories",
  date: "Dec. 2022",
  lines: ("Session Co-Convener", "American Geophysics Union Fall Meeting 2022 – Chicago, IL"),
)

#entry(
  "Arctic Mixed-Phase Clouds Sometimes Dissipate Due to Insufficient Aerosol – Evidence from Idealized Large Eddy Simulations",
  date: "May 2022",
  lines: ("Oral Presentation", "European Geosciences Union General Assembly 2022 – Vienna, Austria"),
)

#entry(
  "Arctic Mixed-Phase Clouds Sometimes Dissipate due to Insufficient Aerosol: Evidence from Idealized Large Eddy Simulations",
  date: "Apr. 2022",
  lines: ("Oral Presentation", "2nd QuIESCENT Workshop – Tromsø, Norway"),
)

#entry(
  "Fake it until you make it – Reading GOES NetCDF4 data on AWS S3 as Zarr for rapid data access",
  date: "Jan. 2022",
  lines: ("Oral Presentation and Interactive Workshop", "2022 ESIP January Meeting"),
)

#entry(
  "Cloud-performant reading of NetCDF4/HDF5/Grib2 using the Zarr library",
  date: "Dec. 2021",
  lines: ("Oral Presentation", "American Geophysics Union Fall Meeting 2021"),
)

#entry(
  "Effects of Aerosol Concentration on the Dissipation of Arctic Mixed-Phase Clouds",
  date: "Dec. 2020",
  lines: ("eLightning", "American Geophysics Union Fall Meeting 2020"),
)

#section[Memberships]

American Meteorological Society \
American Geophysics Union \
European Geosciences Union

#section[Languages]

English \
French (Bilingual Fluency)
