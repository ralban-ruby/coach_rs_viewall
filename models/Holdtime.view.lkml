view: Holdtime {
    derived_table: {
      sql: SELECT cast(HOLD_START_TIME AS date) AS date, E."NAME" ,E.EMPLOYEEID , count(RUBYCALLID) AS count_of_holdtime
              FROM FIVETRAN_DB.OHKITTENS_DBO.CALL_HOLD_TIMEOUT_DETAIL H JOIN FIVETRAN_DB.PEARL_EDW_OPS.EMPLOYEE_LOOKUP_ALL E
              ON H.ICUSERID =E.ICUSERID
              WHERE E."_FIVETRAN_DELETED" != 1
              GROUP BY cast(HOLD_START_TIME AS date), E."NAME" ,E.EMPLOYEEID
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: date {
      type: date
      sql: ${TABLE}."DATE" ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}."NAME" ;;
    }

    dimension: employeeid {
      type: number
      sql: ${TABLE}."EMPLOYEEID" ;;
    }

    dimension: count_of_holdtime {
      type: number
      sql: ${TABLE}."COUNT_OF_HOLDTIME" ;;
    }

    set: detail {
      fields: [date, name, employeeid, count_of_holdtime]
    }
  }
