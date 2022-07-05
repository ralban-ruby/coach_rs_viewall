view: longoffers_new {
sql_table_name:"RS"."RS_RECAP_LONGOFFER_ANA_DATA"
;;


measure: count {
  type: count
  drill_fields: [name]
}

dimension: name {
  type: string
  sql: ${TABLE}."RECEPTIONIST_DESCRIPTION" ;;
}

dimension: employeeid {
  type: number
  sql: ${TABLE}."EMPLOYEEID" ;;
}

# dimension: date {
#   type: date
#   sql: ${TABLE}."DATE" ;;
# }

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
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

dimension: longoffers {
  type: number
  sql: ${TABLE}."LONGOFFER" ;;
}

dimension: ANA {
  type: number
  sql: ${TABLE}."ANA" ;;
}

dimension: total_calls {
  type: number
  sql: ${TABLE}."CALLS" ;;
}

dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
}

# set: detail {
#   fields: [
#     name,
#     employeeid,
#     date,
#     longoffers,
#     ANA,
#     total_calls
#   ]
}
# }
