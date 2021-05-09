---
layout: post
title:  "Talks – April, 2021"
authors: 
  - rahul
description: "In collaboration with PythonPune"
categories: [ meetup, talks, workshop ]
image:
featured: false
---


We had three talks lined up for this meetup and saw an attendance of around 35 people of which around 20% were attending a Bangpyper meetup for the first time. Also, thanks to the online format of the meetup we are seeing more and more people attending from outside Bangalore. The three talks were:

-   Understanding Concurrency in Python
-   A Starter's Kit to Federated Learning
-   Solving LP optimization problems using Python

We started the Meetup at around 10:30am with Anirudha giving a small shoutout to [PyCon India](https://in.pycon.org/2021/) conference

The first talk was presented by [Anshul Sharma](https://www.linkedin.com/in/raunify/?originalSubdomain=in), a Product Engineer at Udaan and a Career coach at Scaler Academy. Anshul set out with an agenda to educate the audience on what concurrency was and to familiarise them with the three available means of achieving it in python through Threading, AsyncIO and multiprocessing. Threading was suggested as a method of achieving Pre-emptive multitasking where the OS decides when the tasks are to be switched between each other and AsynIO as a solution for Cooperative multitasking where the code announces when it is ready to be swapped out for the execution of another task.

The next section of the talk involved going over the code snippets comparing how the above-mentioned approaches solved the concurrency problem in CPU bound and I/O bound tasks, parallelising the task of hitting multiple URLs from a list was chosen for this. We went about identifying a synchronous, non-concurrent solution for the problem first and the corresponding solutions in their threading, AsyncIO and multiprocessing enabled versions. Anshul took us over the nuances of the implementations in an interactive fashion clarifying the pro and cons of each approach and performance comparison between them. That covered the I/O bound tasks and in the process, we were introduced to factors to note while choosing between threading and asyncIO, the overheads involved in picking the optimum number of threads for threading and meticulous crafting of method calls accounting for awaits in asyncIO. In the next set of CPU bound tasks we understood how Multiprocess beats the other two methods through its ability to squeeze out the complete compute resource of the system. Anshul concluded the talk by giving us pointers on choosing the concurrency approaches that best suited the task at hand.

The next talk was presented by [Rakshit Naidu](https://www.linkedin.com/in/rakshit-naidu-8b3431166/), a senior at Manipal Institute of Technology and an incoming MS in Privacy Engineering student at CMU. Rakshit presented about [Federated Learning](https://arxiv.org/abs/1602.05629). The talk started with an introduction to the spheres of AI and took us through the advent and the advancement of the ML models and we understood one of the harsh abilities gained through this advancement was the ability to deanonymise data as shown in this [paper](https://arxiv.org/abs/cs/0610105). This set the stage for the need and importance of privacy in Machine learning, Federated learning solved this issue. Federated learning was introduced as an alternative to training mechanism that's typically seen in a server-client setup where instead of getting all the data from the clients and training the data on the server, we have the machine intelligence models sent to the client machines for training and evaluation locally with only the summaries of the improved model being shared to the server where it is aggregated into a new model, ensuring that the data only resides on the client devices and never leaves it. We went on the see the different representations of this learning and the properties of Federated learning were defined as the following:

-   Non-Independent and Identically Distributed nature of data
-   Unbalanced and varying amounts of local training data
-   Massively distributed client participation
-   Limited Communication owing to the nature of mobile device usage

This was followed by a run-through of the Federated learning example over simulated clients with MNSIT data. Rakshit concluded the talk with a brief discussion of FLoC('Federate Learning of Cohorts), sharing his views around its impacts and how Federated learning can be put to use as a solution.


Last of the talks was from our veteran speaker [Sashidar Donaparthi](https://www.linkedin.com/in/sasidonaparthi/) who has been a frequent speaker at Bangpyper events, this time it was on solving LP optimisation problems through python. Sashidar introduced us to what analytics was by defining it as a means of developing actionable items through the data and we were introduced to our first real world problem that this class of problems solved- the Travelling salesman problem that's noticed in Akshaya pathra organisation. We went on to identify the different Decision making models and the different problems that can be solved ranging from those in the domains of manufacturing, Logistics, Finance and Marketing.

Linear programming was introduced to us with the components involved, notations used and its properties, which were listed as:

-   Proportionality
-   Additivity
-   Divisibility
-   Certainty
-   Linearity
-   Non-negativity

We got to identify this method of optimisation put to use in the dead kilometre optimisation in the UTRO of cities followed by an example of solving this set of problems graphically.

  

Finally we learnt ways of programatically solving LP set of problems through the use of Modelers and solvers in python. [puLP](https://pypi.org/project/PuLP/) was used to model the problem of profit maximisation in a furniture shop with the different constraints being labour, warehouse space etc. We also got to see the use [amply](https://pypi.org/project/amply/) to define the problem in the AMPL format to be used by the modeller in python. [LINGO](https://www.lindo.com/index.php/products/lingo-and-optimization-modeling) an optimization modeling software that was also demoed to solve the exported problem from the previous steps. That concluded a very informative talk opening the space for the open house session.


Open House session saw discussions ranging from weighing the options available for concurrency in the web requests domain, this lead us to compare the use of [fastAPI](https://fastapi.tiangolo.com/), [falcon](https://falcon.readthedocs.io/en/stable/) and at one point had us compare the performance of the different web-frameworks that are avaible in the market on this [site](https://www.techempower.com/benchmarks/). We also tried understanding how different organisations have adopted public cloud and to wind up the open house we pondered on the idea of starting a study group if we have any good topics that folks can gather to work on. That brought an end to yet another informative session of the Bangalore python meetup.

Look out for PyCon India!
[PyCon India 2021](https://in.pycon.org/2021/) , the four day conference from the 17th through the 20th of September.

- To volunteer please check the 'Call for volunteers' here: [https://in.pycon.org/blog/2021/call-for-volunteers.html](https://in.pycon.org/blog/2021/call-for-volunteers.html)

- If you are interested in presenting at PyCon check the 'Call for proposals' here: [https://in.pycon.org/blog/2021/call-for-volunteers.html](https://in.pycon.org/blog/2021/call-for-volunteers.html)

Missed the meetup? No worries, you can check out the stream here - [Youtube stream](https://www.youtube.com/watch?v=aJeKeglCp-E)

---

Additional Links:

-  Realpython : [Speed Up Your Python Program With Concurrency](https://realpython.com/python-concurrency/)
- Adversarial approaches to Federated Learning
	 - [How To Backdoor Federated Learning](https://arxiv.org/abs/1807.00459)
	- [Local Model Poisoning attacks](https://www.usenix.org/conference/usenixsecurity20/presentation/fang)
