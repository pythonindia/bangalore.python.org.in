---
layout: post
title: "import_ bengaluru 2026"
authors:
  - ramgopalsiddh
description: "Across Bengaluru, Python communities often meet inside their own circles. import_ bengaluru brings those circles together for one day of practical talks, honest conversations and useful connections"
categories: [meetup, talks, open-source, import_ bengaluru]
image: "https://secure.meetupstatic.com/photos/event/8/9/a/c/highres_536015244.webp"
featured: true
---

Python in Bengaluru isn't just one single ecosystem. Across the city, vibrant communities meet regularly inside their own spheres—building with web frameworks like Django, crunching numbers in scientific computing with NumPy and PyData, pushing AI frontiers with PyTorch, orchestrating massive data pipelines with Apache Airflow, and managing scalable document stores with MongoDB. While each group thrives in its own domain, we rarely get a unified space to witness what the broader Python ecosystem is creating.

On Sunday, September 6, 2026, **[import_ bengaluru](https://bangpypers.github.io/import_bengaluru/)** brought those circles together under one roof. Organized by **[BangPypers](https://bangalore.pythonindia.org/)** in association with **Bengaluru Tech Week**, and hosted at the **[InMobi](https://www.inmobi.com/)** , the gathering united developers, researchers, student builders, maintainers, and open-source enthusiasts for a full day of practical talks, deep dives, and honest technical conversations.

## Details

- **Date**: September 6, 2026
- **Time**: 10:00 AM – 6:00 PM IST
- **Website**: [bangpypers.github.io/import_bengaluru](https://bangpypers.github.io/import_bengaluru)
- **Presented by**: [BangPypers](https://bangalore.pythonindia.org)
- **Venue Partner**: [InMobi](https://www.inmobi.com/) [Glance](https://www.glance.com/)
- **Agenda**: [See here for detailed agenda](https://bangpypers.github.io/import_bengaluru/?utm_source=luma#agenda)

## Photos & Media

You can browse all the pictures from the event and upload yours on the **[Meetup photo album](https://www.meetup.com/bangpypers/photos/36159083/)**.

> Catch the event highlights and photos at [meetup.com/bangpypers/photos/36159083](https://www.meetup.com/bangpypers/photos/36159083/)! If you captured pictures, recorded clips, or made a vlog during the event, feel free to add them to the album or share them with the community on social media.

## Participating Communities

A core principle behind *import_ bengaluru* was that it was community-led: each participating group brought a session directly from its own ecosystem, highlighting real-world lessons, production experiences, and open-source craftsmanship rather than sponsored product pitches.

- **[BangPypers](https://bangalore.pythonindia.org/)** (Host Community) — Bengaluru's Python user group, bringing developers together through meetups, workshops, and open-source collaboration.
- **[PyData Bengaluru](https://www.meetup.com/pydata-bangalore/)** — Bringing together data analysis, machine learning, and scientific computing practitioners across Python, R, and Julia.
- **[Point Blank](https://www.pointblank.club/)** — A student-run tech community building, researching, and contributing across systems and open source.
- **[Django India](https://www.djangoindia.org/)** — Developers learning, collaborating, and contributing across the Django and web development ecosystem.
- **[Bangalore Apache Airflow® Meetup Group](https://www.meetup.com/bangalore-apache-airflow-meetup/)** — Connecting data engineers and distributed systems practitioners around Apache Airflow and workflow orchestration.
- **[PyTorch India](https://www.meetup.com/pytorch-bengaluru/)** — A community uniting PyTorch users, ML researchers, and practitioners to learn and contribute to open-source AI.
- **[MongoDB User Group Bengaluru (Namma MUG)](https://www.meetup.com/mongodb-user-groups-bengaluru/)** — Community for MongoDB users, backend developers, and data practitioners to connect and share experiences.

## Sponsors & Partners

We are deeply grateful to our sponsors and partners whose generous support made this event accessible to everyone:

- **Gold Sponsor**: **[SerpApi](https://serpapi.com/)** — Providing real-time search APIs that empower developers and AI agents to query and retrieve structured web data.
- **Silver Sponsor**: **[MongoDB](https://www.mongodb.com/)** — Supporting developers with modern document databases and vector search capabilities for AI applications.
- **Venue Partner**: **[InMobi](https://www.inmobi.com/) [Glance](https://www.glance.com/)** — For warmly welcoming the Python community into their Bengaluru campus and providing exceptional facilities and catering.

## Agenda

[See here for detailed agenda](https://bangpypers.github.io/import_bengaluru/?utm_source=luma#agenda).

1. *How NumPy divides integers really fast (and the bugs I caused doing it)* by [Ganesh Kathiresan](https://www.linkedin.com/in/ganesh-kathiresan/)
2. *Point Blank and Writing GPU Kernels in Pure Python* by [Shubhang Sinha](https://www.linkedin.com/in/shubhangsinha/) & [GiGi Koneti](https://www.linkedin.com/in/gigikoneti/)
3. *Building Smarter AI Agents with Real-Time Search* by [Adarsh Divakaran](https://www.linkedin.com/in/adarsh-d/)
4. *Don't Migrate Your DAGs. Compile Them.* by [Purushotham Pushpavanthar](https://www.linkedin.com/in/purushotham-pushpavanthar/)
5. *PyTorch Foundations and deep dive into ExecuTorch* by [Arkadip Maitra](https://www.linkedin.com/in/arkadip-maitra/)
6. *Building RAG Applications with MongoDB Vector Search & Python* by [Pranav Kumar](https://www.linkedin.com/in/pranav-kumar-verma/)
7. *WTF AI Agent Harness? Let's build a Baby Codex* by [AbdulMajed Raja](https://www.linkedin.com/in/amrrs/)

---

## Talks & Sessions

### How NumPy Divides Integers Really Fast (and the bugs I caused doing it)
**Speaker**: [Ganesh Kathiresan](https://www.linkedin.com/in/ganesh-kathiresan/) (PyData Bangalore / NumPy Core Dev)

![Ganesh Kathiresan presenting How NumPy divides integers really fast](https://secure.meetupstatic.com/photos/event/8/8/7/d/highres_536014941.webp "Ganesh Kathiresan presenting How NumPy divides integers really fast")

Every AI framework, dataframe library, and scientific tool in Python eventually bottoms out in NumPy. Yet, integer division is notoriously one of the most computationally expensive operations a CPU can perform. 

Ganesh walked the audience through a multi-year open-source contribution journey:
- Replacing expensive division by constants with reciprocal multiplication and bitwise shifts.
- Writing portable SIMD implementations targeting Intel, AMD, and ARM architectures.
- Uncovering tricky hardware edge cases such as `INT_MIN // -1` that can cause hardware traps.
- Reflecting on what happened when a regression slipped through to millions of end users, and what rigorous benchmarking, code review, and remediation teach maintainers about real-world performance engineering.

### Point Blank and Writing GPU Kernels in Pure Python
**Speakers**: [Shubhang Sinha](https://www.linkedin.com/in/shubhangsinha/) & [GiGi Koneti](https://www.linkedin.com/in/gigikoneti/) (Point Blank)

![Shubhang Sinha and GiGi Koneti presenting Point Blank and Writing GPU Kernels in Pure Python](https://secure.meetupstatic.com/photos/event/8/8/9/8/highres_536014968.webp "Shubhang Sinha and GiGi Koneti presenting Point Blank and Writing GPU Kernels in Pure Python")

![Writing GPU Kernels in Pure Python with Triton](https://secure.meetupstatic.com/photos/event/8/8/c/2/highres_536015010.webp "Writing GPU Kernels in Pure Python with Triton")

Shubhang and GiGi kicked off with the story of Point Blank—how a dedicated group of students built one of Bengaluru's most active open-source and systems programming communities. 

They then tackled GPU programming from Python:
- The historical barrier of having to drop down to C++ and CUDA to write high-throughput GPU kernels.
- How OpenAI's **Triton** compiler enables developers to write fast, highly concurrent GPU kernels directly in pure Python.
- Live walkthroughs demonstrating performance gains, memory management, and how Python developers can harness modern accelerator hardware without leaving Python.

### Building Smarter AI Agents with Real-Time Search
**Speaker**: [Adarsh Divakaran](https://www.linkedin.com/in/adarsh-d/) (SerpApi)

![Adarsh Divakaran presenting Building Smarter AI Agents with Real-Time Search](https://secure.meetupstatic.com/photos/event/8/8/d/e/highres_536015038.webp "Adarsh Divakaran presenting Building Smarter AI Agents with Real-Time Search")

Parametric knowledge stored in LLM weights quickly gets outdated, and LLM reasoning on its own is often insufficient for complex production tasks. 

Adarsh demonstrated how to ground autonomous agents with live data:
- Using Python and SerpApi to equip AI agents with real-time web search capabilities.
- Leveraging tool calling and the Model Context Protocol (MCP) to design modular, interoperable agent skills.
- Practical architectures for letting agents verify facts, synthesize fresh information, and carry out multi-step external workflows autonomously.

### Don't Migrate Your DAGs. Compile Them.
**Speaker**: [Purushotham Pushpavanthar](https://www.linkedin.com/in/purushotham-pushpavanthar/) (InMobi)

![Purushotham Pushpavanthar presenting Don't Migrate Your DAGs. Compile Them.](https://secure.meetupstatic.com/photos/event/8/9/0/6/highres_536015078.webp "Purushotham Pushpavanthar presenting Don't Migrate Your DAGs. Compile Them.")

Building an Offline Job Orchestration Platform—a declarative abstraction over Apache Airflow where DAGs specify intent (data, application, and runtime) rather than low-level Kubernetes manifests and SparkConf—was the straightforward part. The true roadblock was adoption: over 600 production DAGs remained untouched because teams couldn't prioritize manual rewrites.

Purushotham shared how InMobi eliminated the migration tax:
- Recognizing that adoption is an economic problem, not a persuasion problem: stop writing documentation and start shipping automated code transformations.
- Developing a custom transpiler built on Python's standard-library `ast` module to automatically rewrite legacy DAGs onto the new platform.
- Using triage classifiers to detect automatable DAG patterns and prioritize AST transform rules.
- Key takeaways: why generating an accurate diff that proves zero functional change matters far more than code generation alone, and why rejected DAGs are the ultimate design review of your platform.


### PyTorch Foundations and Deep Dive into ExecuTorch
**Speaker**: [Arkadip Maitra](https://www.linkedin.com/in/arkadip-maitra/) (PyTorch India)

![Arkadip Maitra presenting PyTorch Foundations and ExecuTorch](https://secure.meetupstatic.com/photos/event/8/9/2/8/highres_536015112.webp "Arkadip Maitra presenting PyTorch Foundations and ExecuTorch")

Arkadip took attendees on a journey from high-level PyTorch modeling down to bare-metal edge execution:
- The fundamental runtime and tensor execution architecture underpinning PyTorch.
- Introduction to **ExecuTorch**, PyTorch's native framework for exporting and running models on edge, mobile, and embedded hardware.
- How model capture, lowering, and memory-aware quantization make it possible to run modern machine learning models with tight compute and energy envelopes.

### Building RAG Applications with MongoDB Vector Search & Python
**Speaker**: [Pranav Kumar](https://www.linkedin.com/in/pranav-kumar-verma/) (Namma MUG / MongoDB)

![Pranav Kumar presenting Building RAG Applications with MongoDB Vector Search](https://secure.meetupstatic.com/photos/event/8/9/3/b/highres_536015131.webp "Pranav Kumar presenting Building RAG Applications with MongoDB Vector Search")

Pranav presented an end-to-end guide to designing production-grade Retrieval-Augmented Generation (RAG) pipelines in Python:
- Why isolated vector databases introduce sync overhead and operational complexity.
- Storing high-dimensional embeddings directly alongside operational data using MongoDB Atlas Vector Search.
- Implementing vector similarity indexing, semantic retrieval, and prompt augmentation to ground LLM outputs in proprietary data while preventing hallucinations.

### WTF AI Agent Harness? Let's Build a Baby Codex
**Speaker**: [AbdulMajed Raja](https://www.linkedin.com/in/amrrs/) (BangPypers)

![AbdulMajed Raja presenting WTF AI Agent Harness? Let's build a Baby Codex](https://secure.meetupstatic.com/photos/event/8/9/7/5/highres_536015189.webp "AbdulMajed Raja presenting WTF AI Agent Harness? Let's build a Baby Codex")

In an energetic, live-coding session, AbdulMajed demystified the internals of modern autonomous coding assistants:
- Dissecting the core agent loop: prompt construction, model streaming, tool execution, and error recovery.
- Implementing context window management, token budgeting, and persistent memory.
- Building a functional "Baby Codex" harness from scratch to show the mechanics behind systems like Claude Code and OpenAI Codex.

### Unconference & Lightning Talks

The afternoon featured an exciting track of lightning talks with quick, insightful presentations from community members:

1. **Having fun with text in Python** by Pulsar17
![Having fun with text in Python by Pulsar17](https://secure.meetupstatic.com/photos/event/8/9/7/a/highres_536015194.webp "Having fun with text in Python - Pulsar17")

2. **Knowledge Fabric** by Abhay Dhar
![Knowledge Fabric by Abhay Dhar](https://secure.meetupstatic.com/photos/event/8/9/8/7/highres_536015207.webp "Knowledge Fabric - Abhay Dhar")

3. **SmolVM — Sandboxes for AI Agents** by Aniket Maurya
![SmolVM — Sandboxes for AI Agents by Aniket Maurya](https://secure.meetupstatic.com/photos/event/8/9/9/1/highres_536015217.webp "SmolVM — Sandboxes for AI Agents - Aniket Maurya")

4. **Why Do We Need DSLs?** by Abhik
![Why Do We Need DSLs? by Abhik](https://secure.meetupstatic.com/photos/event/8/9/9/5/highres_536015221.webp "Why Do We Need DSLs? - Abhik")

5. **Finlens** by Suresh
![Finlens by Suresh](https://secure.meetupstatic.com/photos/event/8/9/9/d/highres_536015229.webp "Finlens - Suresh")

6. **Fun fact in hugging acquisition by NVIDIA** by Pradyuman
![Fun fact in hugging acquisition by NVIDIA by Pradyuman](https://secure.meetupstatic.com/photos/event/8/9/a/2/highres_536015234.webp "Fun fact in hugging acquisition by NVIDIA - Pradyuman")

---


## Volunteers & Acknowledgments

An event bringing together seven distinct tech communities would not have been possible without our dedicated team of volunteers and community organizers. You can find the full list of organizers and volunteers on the **[Volunteers page](https://bangpypers.github.io/import_bengaluru/volunteers.html)**.


Special thanks to **InMobi** for being wonderful venue hosts, to our sponsors **SerpApi** and **MongoDB** for their support, and to every speaker, community partner lead, and attendee who brought their curiosity, shared knowledge, and made *import_ bengaluru* a memorable milestone for Bengaluru's tech ecosystem!

---

## Community Announcements

### SerpApi India Hackathon 2026 — Build with Live Search Data

Our gold sponsor **[SerpApi](https://serpapi.com/)** has announced the **SerpApi India Hackathon 2026**, running from **September 1 to October 5, 2026**!

Build something useful with live search data—create AI agents, open-source integrations, and applications powered by SerpApi.

#### Prizes (Worth ₹3 Lakh+)
- **First Prize**: ₹1,00,000 cash + 15,000 SerpApi credits
- **BangPypers Special Prize**: Best submission from the BangPypers community wins **₹10,000 cash + 5,000 SerpApi credits**!

#### Details & Timeline
- **Dates**: September 1 – October 5, 2026
- **Submission Deadline**: October 5, 2026, 11:59 PM IST
- **Format**: Online (open to India residents aged 18+)
- **Teams**: Participate solo or in a team of up to 5 members
- **How to Participate**: Visit **[serpapi.com/indiahackathon](https://serpapi.com/indiahackathon)** to register and review the full rules, eligibility, and prize details.

---

## Stay Connected

To stay updated on upcoming meetups, workshops, and community events:

- **Website**: [bangalore.pythonindia.org](https://bangalore.pythonindia.org)
- **Discord**: [Join the BangPypers Discord](https://discord.gg/YkvsBBEZgt)
- **Twitter / X**: [@__bangpypers__](https://x.com/__bangpypers__)
- **LinkedIn**: [BangPypers on LinkedIn](https://www.linkedin.com/company/bangpypers)
- **Meetup**: [BangPypers Meetup Group](https://www.meetup.com/BangPypers/)
- **Mailing List**: [BangPypers Mailman](https://mail.python.org/mailman/listinfo/bangpypers)
