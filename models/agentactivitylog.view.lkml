view: agentactivitylog {
  sql_table_name: "RS"."AGENTACTIVITYLOG"
    ;;

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: legalname {
    type: string
    sql: ${TABLE}."LEGALNAME" ;;
  }

  dimension: minutes {
    type: number
    sql: ${TABLE}."MINUTES" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: seconds {
    type: number
    sql: ${TABLE}."SECONDS" ;;
  }

  dimension: statuskey {
    type: string
    sql: ${TABLE}."STATUSKEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [legalname, name]
  }

  measure: minutes_sum {
    type: sum
    sql:  ${TABLE}."MINUTES"/1 ;;
  }
}
