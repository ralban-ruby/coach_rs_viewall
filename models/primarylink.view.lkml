view: primarylink {
  sql_table_name: "RS"."PRIMARYLINK"
    ;;

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: supervisor_primary {
    type: string
    sql: ${TABLE}."SUPERVISOR_PRIMARY" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: Tenure {
    type : number
    sql: ${TABLE}."TENURE";;
  }

  dimension: tenure_tier {
    group_label: "Tenure"
    label: "By Tier"
    style: integer
    type: tier
    tiers: [0,60,120]
    sql: ${Tenure};;
  }

  dimension: ROS_test_team {
    type :  string
    case: {
      when: {
        sql: ${TABLE}.name IN ('Chris Page','Angelica Thomas','Hailey Fuller')  ;;
        label: "Alpha"
      }
      when: {
        sql: ${TABLE}.name IN ('Amy Gray','Anthony Contreras','Cameron Esch','Charles Williams',
                                'Crystal Castro','Jenn Schaaf','Jodie Hess', 'Karrie Elkins', 'Katy Aman',
                                'Keri Stewart','Lauren Phillips','Maria Guzman','Marissa Hunt','Mellissa Dowd',
                                'Mercedes Alvarado','Neena Nuhring','Rachel Rhodus','Sharene Neidig','Zach Duling','Zach Kramberg');;
        label: "Beta"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
