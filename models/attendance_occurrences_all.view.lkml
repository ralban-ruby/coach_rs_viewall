view: attendance_occurrences_all {
  sql_table_name: "RS"."ATTENDANCE_OCCURRENCES_ALL"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension_group: absencestart {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ABSENCESTART" ;;
  }

  dimension_group: absencestop {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ABSENCESTOP" ;;
  }

  dimension: coach {
    type: string
    sql: ${TABLE}."COACH" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: diff {
    type: number
    sql: ${TABLE}."DIFF" ;;
  }

  dimension_group: effectivethrough_actual {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EFFECTIVETHROUGH_ACTUAL" ;;
  }

  dimension: empid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPID" ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}."HOURS" ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}."MEMO" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: newoccurrence {
    type: number
    sql: ${TABLE}."NEWOCCURRENCE" ;;
  }

  dimension_group: occurrenceend {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."OCCURRENCEEND" ;;
  }

  dimension_group: occurrencestart {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."OCCURRENCESTART" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: count_occurrences {
    type: sum_distinct
    sql: ${TABLE}."NEWOCCURRENCE" ;;
    # html:
    # {% if value >= 5 %}
    # <p style="color: red; font-size: 100%">{{ rendered_value }}</p>
    # {% else %}
    # <p style="color: black; font-size:100%">{{ rendered_value }}</p>
    # {% endif %};;
  }

  measure: sum_hours {
    type: sum_distinct
    value_format_name: decimal_2
    sql: ${TABLE}."HOURS" ;;
  }

}
