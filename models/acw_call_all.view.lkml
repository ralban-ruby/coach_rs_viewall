view: acw_call_all {
  sql_table_name: "RS"."ACW_CALL_ALL"
    ;;

  dimension: acw_second {
    type: number
    sql: ${TABLE}."ACW_SECOND" ;;
  }

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

  dimension: receptionist_description {
    type: string
    sql: ${TABLE}."RECEPTIONIST_DESCRIPTION" ;;
  }

  dimension: seconds {
    type: number
    sql: ${TABLE}."SECONDS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
