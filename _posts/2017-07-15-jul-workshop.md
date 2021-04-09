---
layout: post
title:  "Device Interfacing Workshop – July, 2017"
authors: 
  - bangpypers
description: "Device Interfacing Workshop – July, 2017"
categories: [ meetup, talks, workshop ]
image:
featured: false
hidden: false
---

BangPypers organized a full-day workshop on 15/July/2017, titled, 'Device interfacing with Python'. Workshop was conducted by folks from Zilogic Systems, Chennai -- Vijay Kumar, Deepak, Babusubashchandar, and Rashid Muhammed -- and the venue for the workshop was the corporate office of Treebo Hotels. Intent of the workshop was to initiate the participants on how to use Python programming language to interface with embedded hardware.

Workshop began with introduction to basics of embedded systems, understanding different types of operating systems, quick run through the GNU/Linux OS, then progressing towards hardware interfacing, device drivers, and serial communication, concluding with note on sysfs and how to use sysfs to control hardware. Workshop was a mix of theoritical concepts that preceded the hands-on sessions -- Zilogic folks split the tasks of speaking as the slides rolled out for each session and helping the participants as part of the hands-on.

## Embedded Linux Introduction

Deepak began this session where he explained the various embedded software models, and the technical differences between firmware, threaded OS, GPOS, and RTOS. Then he proceeded to explain GNU/Linux OS with emphasis on Linux Kernel, it's design model and the distinction between kernel and user space. This was followed by how files and file systems are managed in the kernel, the layout and the need for file systems. This concept was highlighted using an example of different file system formats including pseudo file systems like proc and sysfs. Linux's boot process and rootfs was quickly talked through.

After touching upon the idea of embedded Linux, it's pros and cons and the reasons why individuals are inclined to go for it, he explained the specifications and peripheral details of the Zilogic Zkit-ARM-VF51 and DietIO add-on board; this served as the target board for the workshop.

## Device Interfacing and Introduction to Device Drivers

Focus of this session was device interfacing and Vijay discussed two concepts -- memory interfacing and device interfacing. He explained how memory interfacing works under the hood i.e. how blocks are addressed in memory and how read and write transaction happens in memory and also, how the same transaction with multiple RAM chips (using decoding logic.)

He went on to explain how memory interfacing can be used to do device interfacing via the concept called, memory-mapped I/O. He gave an overview of what memory map is and how hardware devices are mapped as memory addresses and simplified this with examples of using display controller and serial controller. At this point, he mentioned that memory mapped I/O cannot be used for all devices and moved on to the concept called controller based IO where a controller interfaces between the CPU and the device, acting as a translator.

This was  illustrated with examples like serial controller, I2C controller, and USB controller. The slides and talk were interspersed with tinkering on the target HW by asking the participants to try out code snippets.

Next major topic began with brief tntroduction to device drivers wherein the speaker explained how the OS abstracts away the differences in the hardware from the applications, using device drivers. Device drivers provide a consistent interface for the applications which is made possible because Unix kernel considers everything as file including physical devices. This presents a similarity in accessing files and IO devices.

This session covered details of how device files work, major and minor mode, and how the kernel uses these modes to invoke the respective driver required by the device. This was emphasized with code examples to show how to read (and interpret) inputs of mouse events, audio playback, read hard-disk partition table -- all of this aided by reading from or writing to only device files.  He highlighted the limitations with this approach -- it's not possible to model all device operations, like control and configuration of the device, via reading and writing to files -- and how it can be overcome with system call, `ioctl` with live example of ejecting the CD-ROM tray using ioctl.

## Serial Interface

Babu handled this session in which the primary focus was about 'Serial Communication'. With the short introduction on the internals of UART, it's cost effective in comparison to communication via Parallel Ports. He highlighted problems like, interference, attenuation caused due to out of board (or band ???) connections and solutions to overcome them. This was followed by a working exampple of a GSM modem listening to incoming text messages whose text was displayed on the LCD of the target HW using Python module, `PySerial.`

'I2C', an acronym for 'Inter-Integrated Circuit', a low speed serial bus developed by Philips, was taken up next. Outlining it's features, like, clock rates, master-slave architecture, he went on to describe the I2C controller and how it's used to connect I2C devices. Continuing with I2C protocol and how a transaction occurs, the participants, assisted by Babu and the rest of Zilogic folks, tried their hands on accessing accelerometer data and four way key using SMBus -- this technology provides APIs for communicating with I2C slave.

## Sysfs

Vijay started off this session by explaining about /proc  filesystem, how it was used to obtain system and active processes from the kernel. With the grwoth of complex hardware, it became a necessity to export hardware information to system programs and eventually '/proc' got cluttered with lots of non-process information. And also, the information in '/proc' was not programmatically parsable though it was human readable. And hence, sysfs was born, which is an in-memory file system that exports information from kernel space to user space.

With few slides to show the characteristics of sysfs and it's hierarchy, he explained as to how devices, using /sys/class, are grouped based on functionality and, /sys/bus, where devices are grouped based on their interface. The concepts of sysfs were demonstrated with a simple task involving how to read configuration information of network interfaces, device backlight, controlling radio switches (WiFi) using sysfs. The session ended with a comparison between ioctl and sysfs for controlling/configuring devices, and when to use what.

## GPIOs and PWM interface

Deepak explained the concepts of binary state high or low with simple devices like LEDs and how GPIOs can be used to switch between either of the two states thus allowing to turn ON/OFF the LEDs. With brief description of how to set the direction of GPIO pins depending on whether they act as output or input, he showed how GPIO interfaces can be accessed from user space applications through sysfs. Participants tried controlling an RGB LED and reading input from key (with the help of sysfs) on the target HW via GPIO pins.

PWM, which stands for 'Pulse Width Modulation', was lined up next -- Deepak explained what is PWM, duty cycle and how they can be used to control the power generated from the source. Session ended with the partcipants attempting to control the oscillations of the piezzon buzzer on the target HW and, the speed of a DC motor , both achieved through PWM using sysfs.

## ADC interface

Babu took this final session which was about Analog-to-Digital Convertor(ADC) -- need for ADC, which helps to convert analog values to digital and why there are hardware devices that generate analog values that cannot be directly consumed by microcontroller(s). He showcased how to read the voltage changes in the Light Dependent Resistor(LDR) on th target HW through ADC using sysfs.

BangPypers team is very thankful to the amazing folks from Zilogic for their time and effort in conducting this workshop on embedded systems. We also thank Treebo for hosting the workshop. Hope the workshop participants had great fun and learning!

# Some pics from the workshop

![p1](https://secure.meetupstatic.com/photos/event/9/f/3/b/highres_462880763.jpeg)
![p2](https://secure.meetupstatic.com/photos/event/9/f/6/1/highres_462880801.jpeg)
![p3](https://secure.meetupstatic.com/photos/event/9/f/6/c/highres_462880812.jpeg)
