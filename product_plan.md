## Product Plan

GoogleDoc with project notes(https://docs.google.com/document/d/1VfyTpYPLiKyFfcS762wjLxfRX27s6k7Z9VBCH8pTmP8/edit?usp=sharing)

## Problem Statement -- busy pet owners (cats or small dogs) often have to rely on leaving a lot of food out for their pets, or counting on friends to stop by when they are out of town or working late. Additionally, tracking a pet's weight and health can difficult if they are extrememly fluffy. This product, a combination of hardware and software, takes care of two issues. A DIY remote controlled feeder allows you to feed your pet remotely, and keep track of how many feedings they have receieved. The web app provides the mechanism for remotely feeding.

## Market Research
  _ Competition:
    - Programmable commercial feeders and other pet trackers can be purchased for pets. Very few come with a web or smartphone interface for managing the hardware.
    - A feeder that responds to smartphone requests was created with funding from Indigogo and a three person dev team, costs $150. It doesn't have browser support (only iOS), and complaints of it being unrealiable.
  - User Issues:
    - Highly rated programmable feeders cost ~$130, and users complain they are a pain to program. These usually do not have a web or phone component.
    - With many feeders, owners complain that their pets can break into them and the result is a super fat pet.
  - Differentiation:
    - Other DIY feeders have been built; however, I have found none that successfully integrate with a web app that is freely available
    - Have not seen a touch sensor feeder (which is my next idea should I finish the basic implementation)
    - Login via FB or Twitter may allow for social media posting, another feature I have not seen on the market.


## User Personas
  - Main target users are busy pet owners who occasionally need to remotely care for their pet, or who are interested in tracking food intake/feedings.
  - Not suitable for longterm care, but for unexpected events that might keep you from getting home to feed a pet, or the occasional night away.
  - Pet owners wanting the ability to set timed feedings.
  - The feeding metrics are good for multi-person household with pets who are deceitful about how often they have been fed.
  - Possible extensions:
    - A webcam to both ensure food was dispensed, as well to remotely check in on a pet.
    - Touch sensor that allows pet to trigger food dispensor, with restrictions on how many per day.

## Progress so far:
- All hardware parts are ordered and last pieces arrive today (10/9)
- Configured the Raspberry Pi and set up the wifi
- Identified some starter projects to get familar with the Pi
- Boilerplate for a rails app
- High level plan for transfer of data from browser to Pi

## Plan for next week:
Hardware
  - Complete starter projects with Pi
    - Download Python libraries to aid in GPIO usage
  - Build up to moving servo using external power source
Software
  - Begin build out of Rails app
    - Home page design
    - Endpoints for sending true/false for whether a feed request has been made
  - Research ways to set up background job for Pi
   - goal is to hit browser endpoints once a minute to check for requests
  - Register domain name, set up DNS, deploy on heroku or EC2 in order to build Pi job w/ correct urls

