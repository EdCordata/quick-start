DATETIME_FORMATS = {
  date:            '%d.%m.%Y',
  date_short:      '%d.%m',
  time:            '%H:%M:%S',
  short_time:      '%H:%M',
  datetime:        '%d.%m.%Y %H:%M:%S',
  short_datetime:  '%d.%m.%Y %H:%M',
  date_input:      '%Y-%m-%d',
  js:              {
    date:       'DD.MM.YYYY',
    date_short: 'DD.MM',
    date_input: 'YYYY-MM-DD'
  },
  datetime_picker: {
    time:     'HH:mm',
    date:     'DD.MM.YYYY',
    datetime: 'DD.MM.YYYY HH:mm'
  }
}

# time formats
Time::DATE_FORMATS[:datetime]       = DATETIME_FORMATS[:datetime]
Time::DATE_FORMATS[:short_datetime] = DATETIME_FORMATS[:short_datetime]
Time::DATE_FORMATS[:time]           = DATETIME_FORMATS[:time]
Time::DATE_FORMATS[:short_time]     = DATETIME_FORMATS[:short_time]
Time::DATE_FORMATS[:date]           = DATETIME_FORMATS[:date]
Time::DATE_FORMATS[:date_short]     = DATETIME_FORMATS[:date_short]
Time::DATE_FORMATS[:date_input]     = DATETIME_FORMATS[:date_input]

# date
Date::DATE_FORMATS[:date]       = DATETIME_FORMATS[:date]
Date::DATE_FORMATS[:date_short] = DATETIME_FORMATS[:date_short]
Date::DATE_FORMATS[:date_input] = DATETIME_FORMATS[:date_input]

# default
Date::DATE_FORMATS[:default]    = DATETIME_FORMATS[:date]
Time::DATE_FORMATS[:default]    = DATETIME_FORMATS[:time]
Time::DATE_FORMATS[:date_input] = DATETIME_FORMATS[:date_input]
