view: rs_recap_longoffer_ana_data {
  sql_table_name: "RS"."RS_RECAP_LONGOFFER_ANA_DATA"
    ;;

  dimension: ana {
    type: number
    sql: ${TABLE}."ANA" ;;
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

  dimension: longoffer {
    type: number
    sql: ${TABLE}."LONGOFFER" ;;
  }

  dimension: receptionist_description {
    type: string
    label: "Name"
    sql: ${TABLE}."RECEPTIONIST_DESCRIPTION" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_longoffer {
    type: sum
    sql: ${longoffer} ;;
  }

  measure: sum_ana {
    type: sum
    sql: ${ana} ;;
  }

  measure: sum_calls {
    type: sum
    sql: ${calls} ;;
  }

  measure: longoffer_rate {
    type: number
    value_format: "0.00\%"
    sql: SUM(${longoffer})/SUM(${calls}) * 100 ;;

  }

}
