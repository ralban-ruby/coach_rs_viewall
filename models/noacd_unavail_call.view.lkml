view: noacd_unavail_call {
  sql_table_name: "RS"."NOACD_UNAVAIL_CALL"
    ;;

  dimension: calls {
    type: number
    sql: ${TABLE}."CALLS" ;;
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

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: noacd_second_per_call{
    label: "noacd_second_per_call"
    type: number
    sql: ${TABLE}."NOACD_SECOND_per_call" ;;
  }

  dimension: receptionistdescription {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  dimension: seconds {
    label: "NoAcd_second"
    type: number
    sql: ${TABLE}."NOACD_SECONDS" ;;
  }

  dimension: unavail_second {
    type: number
    sql: ${TABLE}."UNAVAIL_SECOND" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
