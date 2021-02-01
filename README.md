# Thailand COVID-19 Report API

The API backend system for reporting COVID-19 pandemic data in Thailand.

The sequence diagram below gives an overview of how the system works.

<img width="500" src="https://raw.githubusercontent.com/nimid/covid-19-report-backend/main/doc/sequence_diagram.png">

## Getting Started

### Prerequisites

1. Ruby on Rails
2. PostgreSQL

### Installation

```shell
$ git clone https://github.com/nimid/covid-19-report-backend.git
$ cd covid-19-report-backend
$ bundle install
```

## Usage

Start the backend API system.

```shell
$ bin/rails server
```

```shell
$ curl 127.0.0.1:3000
{
  "new_cases": 836,
  "new_recovered": 899,
  "new_deaths": 0,
  "total_cases": 19618,
  "total_recovered": 12514,
  "total_deaths": 77,
  "updated_date": "2021-02-01 11:59:00 UTC"
}
```

### Sample Online

https://young-shelf-74766.herokuapp.com/


### Response

| Name            | Type     | Description
|---              |---       |---
| new_cases       | integer  | The number of new infected people for today.
| new_recovered   | integer  | The number of people who have recovered for today.
| new_deaths      | integer  | The number of new deaths for today.
| total_cases     | integer  | The total number of infected people since 1st January 2020.
| total_recovered | integer  | The total number of people who have recovered since 1st January 2020.
| total_deaths    | integer  | The total number of deaths since 1st January 2020.
| updated_date    | datetime | The date and time that report has been updated in format of YYYY-MM-DD HH:MM:ss.

## License

[MIT License](https://github.com/nimid/covid-19-report-backend/blob/main/LICENSE).
