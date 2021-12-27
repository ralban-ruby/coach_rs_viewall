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
    sql: ${TABLE}."NAME";;
    suggest_persist_for: "0 minutes"
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
    tiers: [0,60,120,365]
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
      when: {
        sql: ${TABLE}.name IN ('Jennifer Engelhart','Jessica Gonzalez','Jessica Brown', 'Kat Oconnor',
                              'Kerry Connor','Liana Walker','Mari Dujohn','Noah Pierce','Rachel Shepard','Reshah Francois','Sue Earle',
                              'Taylor Defraties','Teja Carlen','Tiarah Greenwood','Tracie Hill','Ana Espinoza-Rodriguez','Emma Mullins',
                              'Holly Nelson','Jade Jackman','Jodi Hoffman','Jordan Haney','Karla Goehring','Mary Powell','Nicci Munn','Scottie Myers',
                              'Sequaia Anderson','Sherida Price','Tra Erby','Anna Scott','Tristan Clemons','Dylan Wright','Erika Vargas',
                              'Hannah Boger','Heather Schuman','Isabella Perdomo','Joanna Barber','Kaitlin Nelms','Kourtney Wood','Maria Balleza',
                              'Morgan Osborne','Nia Chandler','Siobhan Gies','Stephanie Byrd','Susanne Yarmer','Tatiana Galaz','Jessaca Brown-Maruhn');;
        label: "Beta 2"
      }
      when: {
        sql: ${TABLE}.name IN ('Anthony Manietta','Erika Leibelt','Jessi Ip','Olivia Odell','Taylor Urfer','Allison Maschhoff','Ash Henrion',
                              'Cara Coon','CC Ceballos','Charity Bryant','Jamie Travis','Janna Kipling','Jessica Morgan','Megan Thompson',
                              'Megan Lomeli','Noemi Montero','Shay Carr','Stephanie Raasch','Traci Schafer','Addy Lindberg','Brandie Gilbert',
                              'Carrie Askinas','Corey Christiansen','Monica Swayzer','Nicole Romero','Phoenix Rambo','Shanna Walker','Tae Joseph',
                              'Tana Chandler','Tracey Brown','Malanya Cam','Mary Loudermilk');;
        label: "Rollout Group 1"
      }
      when: {
        sql: ${TABLE}.name IN ('Felicia Wilson','Lynn Young','Morgan Norman','Bill Cory','Julie Lewis','Leslie Tena-Diaz','Nicholl Kaput',
                              'Sarah Page','Shelly Gray','Stephanie Laaker','Alex Phompat','Casandra Tappin','Jackie Manning','Krystyn Easley',
                              'Lyric Montgomery','MacRista Barber-Smith','Mari Jean Arscott','Misty Harding','Natalie Albert','Shanna Henson',
                              'Adrianna Luna','Amber Meade','Ashley Thomas','Brittney Harris','Brittney Baysinger','Connie Shieh','Jocelin Woods',
                              'Lexi Palmer','Michael Brooks','Porche Grant','Sarah Courter','Sheika Derrell');;
        label: "Rollout Group 2"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
