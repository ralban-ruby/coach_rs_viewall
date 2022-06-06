view: employee_fact_all {
  sql_table_name: "RS"."EMPLOYEE_FACT_ALL"
    ;;

  dimension: active {
    type: yesno
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: department_desc {
    type: string
    sql: ${TABLE}."DEPARTMENT_DESC" ;;
  }

  dimension: employee_status {
    type: string
    sql: ${TABLE}."EMPLOYEE_STATUS" ;;
  }

  dimension: employeecode {
    type: string
    sql: ${TABLE}."EMPLOYEECODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}."FIRSTNAME" ;;
  }

  dimension_group: hire {
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
    sql: ${TABLE}."HIRE_DATE" ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}."LASTNAME" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: shortname {
    type: string
    sql: ${TABLE}."SHORTNAME" ;;
  }

  dimension: supervisor_primary {
    type: string
    sql: ${TABLE}."SUPERVISOR_PRIMARY" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: tenure_days {
    type: number
    sql: ${TABLE}."TENURE_DAYS" ;;
  }

  dimension: tenure_month {
    type: number
    sql: ${TABLE}."TENURE_MONTH" ;;
  }

  dimension_group: termination {
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
    sql: ${TABLE}."TERMINATION_DATE" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [shortname, firstname, lastname, name]
  }

  dimension: Terminated {
    type: yesno
    sql: ${termination_date} IS NOT NULL;;
  }

  dimension: Tenure_Range {
    type: string
    sql: case when (${tenure_days} <=15) THEN 'a- 1-15 Days'
          WHEN (${tenure_days} >15 AND ${tenure_days} <=30) THEN 'b- 15-60 Days'
          WHEN (${tenure_days} >30 AND ${tenure_days} <=60) THEN 'c- 30-60 Days'
          WHEN (${tenure_days} >60 AND ${tenure_days} <=90) THEN 'd- 60-90 Days'
          WHEN (${tenure_days} >90 AND ${tenure_days} <=120) THEN 'e- 90-120 Days'
          WHEN (${tenure_days} >120 AND ${tenure_days} <=150) THEN 'f- 120-150 Days'
          WHEN (${tenure_days} >150 AND ${tenure_days} <=180) THEN 'g- 150-180 Days'
          WHEN (${tenure_days} >180 AND ${tenure_days} <=365) THEN 'h- 180-365 Days'
          WHEN (${tenure_days} >365) THEN 'i- 365+ Days'
          ENd ;;
  }
}
