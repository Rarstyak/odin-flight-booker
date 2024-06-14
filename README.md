# README

This project implements the [Flight Booker](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) application for The Odin Project.

Introduction
In this project, you’ll get a chance to tackle some more advanced forms. This is the kind of thing you’ll have to work with when handling user orders for anything more complicated than an e-book. In this case, we’ll build the first three steps of a typical checkout process for booking a one-way flight:

A typical airline booking flow:

Enter desired dates / airports and click “Search”
Choose from among a list of available flights
Enter passenger information for all passengers
Enter billing information

## Models

Airport
- city
- country
- continent
- code : GRR MCO

Flight
-> departure_airport
-> arrival_airport
- start datetime
- flight duration
! number of passengers

Booking
-> Flight
-> Passenger

Passenger
- Name
- Email

## Views

## Controllers

BookingsController

```
rails g model Airport city:string country:string continent:string code:string

rails db:migrate
rails db:seed or db:reset

rails g model Flight
- belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'airport_id'
- belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'airport_id'
- has_many :bookings
- has_many :passengers, through: :bookings

rails g model Booking
- belongs_to :flight
- belongs_to :passenger

rails g model Passenger name:string email:string
- has_many :bookings
- has_many :flights, through: :bookings
```