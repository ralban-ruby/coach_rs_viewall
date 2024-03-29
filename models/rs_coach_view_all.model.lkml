connection: "elt_connector"

#testing for rs coach view all dash

include: "*.view"
#include: "/**/*.dashboard"

explore: Holdtime {}

explore: acw_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${acw_call.employeeid} = ${primarylink.employeeid};;
  }
}

explore: acw_call_all {
  hidden: no
  join:  employee_fact_all {
    relationship: many_to_one
    type: left_outer
    sql_on: ${acw_call_all.employeeid} = ${employee_fact_all.employeeid};;
  }
}

explore: agentactivitylog {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${agentactivitylog.employeeid} = ${primarylink.employeeid};;
  }
}

explore: activity_inbound_calls {
  join: activity_inbound_call_detail {
    relationship: one_to_many
    type: left_outer
    sql_on:  UPPER(${activity_inbound_calls.ruby_call_id}) = ${activity_inbound_call_detail.ruby_call_id};;
  }
  join: primarylink {
    relationship: many_to_one
    type: left_outer
    sql_on:  upper(${activity_inbound_calls.receptionist_name}) = upper(${primarylink.name});;
  }
  join:acw_tda {
    relationship: many_to_one
    type: left_outer
    sql_on:  ${acw_tda.employeeid} = ${primarylink.employeeid};;
  }
}

explore: avail {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${avail.employeeid} = ${primarylink.employeeid};;
  }
}

explore: avail_all {
  hidden: no
  join:  employee_fact_all {
    relationship: many_to_one
    type: left_outer
    sql_on: ${avail_all.employeeid} = ${employee_fact_all.employeeid};;
  }
}

explore: seemore_rollup {
    hidden: no
    join: primarylink {
      relationship: many_to_one
      type: full_outer
      sql_on: ${seemore_rollup.employeeid} = ${primarylink.employeeid} ;;
    }
}
explore: seemore_rollup_new {
  hidden: no
  join: primarylink {
    relationship: many_to_one
    type: full_outer
    sql_on: ${seemore_rollup_new.employeeid} = ${primarylink.employeeid} ;;
  }
}
explore: seemore_rollup_new_all {
  hidden: no
  join: employee_fact_all {
    relationship: many_to_one
    type: full_outer
    sql_on: ${seemore_rollup_new_all.employeeid} = ${employee_fact_all.employeeid};;
  }
}
explore: brb {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb.employeeid} = ${primarylink.employeeid};;
  }
}

explore: brb_all {
  hidden: no
  join:  employee_fact_all {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb_all.employeeid} = ${employee_fact_all.employeeid};;
  }
}

explore: brb_tda {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb_tda.employeeid} = ${primarylink.employeeid};;
  }
}

explore: connections {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${connections.employeeid} = ${primarylink.employeeid};;
  }
}
explore: errors {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${errors.employeeid} = ${primarylink.employeeid};;
  }
}
explore: longoffers {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${longoffers.employeeid} = ${primarylink.employeeid};;
  }
}
explore: rs_recap_longoffer_ana_data {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${rs_recap_longoffer_ana_data.employeeid} = ${primarylink.employeeid};;
  }
}
explore: noacd_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_call.employeeid} = ${primarylink.employeeid};;
  }
}
explore: ontime {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${ontime.employeeid} = ${primarylink.employeeid};;
  }
}
explore: primarylink { hidden:no}
explore: talktime_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${talktime_call.employeeID} = ${primarylink.employeeid} ;;
  }
}
explore: topbar {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${topbar.employeeid} = ${primarylink.employeeid} ;;
  }
}
explore: totalcalls {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${totalcalls.employeeid} = ${primarylink.employeeid};;
  }
}

explore: scores_rollup {
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scores_rollup.receptionistempcode} = ${primarylink.employee_code};;
  }
}

explore: scorecards {
  hidden: no
  #access_filter: {field:primarylink.employeeid}
  #user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scorecards.receptionistempcode} = ${primarylink.employee_code};;
  }
}

explore: noacd_unavail_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_unavail_call.employeeid} = ${primarylink.employeeid};;
  }
}

explore: rs_ic_status_fact {
  label: "Receptionist Stats"
  view_label: "IC Statuses"
  join: rs_recp_call_stats_fact {
    view_label: "Calls"
    relationship: many_to_one
    type: full_outer
    sql_on: upper(${rs_ic_status_fact.name}) = upper(${rs_recp_call_stats_fact.name})
      and ${rs_ic_status_fact.day_of_shift_date} = ${rs_recp_call_stats_fact.day_of_shift_date} ;;
  }
  join: employee_lookup_all {
    view_label: "Current Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  upper(${rs_ic_status_fact.name}) = upper(${employee_lookup_all.name});;
  }
  join: aspect_superstate_hours {
    view_label: "Aspect Superstate Hours"
    relationship: many_to_many
    type: full_outer
    sql_on: upper(${rs_ic_status_fact.name}) = upper(${aspect_superstate_hours.name})
      and ${rs_ic_status_fact.day_of_shift_date} = ${aspect_superstate_hours.nominal_date} ;;
  }
}

explore: attendance_occurrences {
  label: "Attendance Occurrences"
  join: employee_lookup_all {
    view_label: "Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  ${attendance_occurrences.empid} = ${employee_lookup_all.employeeid};;
  }
}

explore: fact_adherence_occurrences {
  label: "Attendance Occurrences Calabrio"
  join: employee_lookup_all {
    view_label: "Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  ${fact_adherence_occurrences.employee_code} = ${employee_lookup_all.employee_code};;
  }
}

explore: attendance_occurrences_all {
  label: "Attendance Occurrences_all"
  join: employee_fact_all {
    relationship: many_to_one
    type: full_outer
    sql_on:  ${attendance_occurrences_all.empid} = ${employee_fact_all.employeeid};;
  }
}

explore: recognitions_given {
  join: primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${recognitions_given.creator_emp_id} = ${primarylink.employee_code};;
  }
}

explore: recognitions_received {
  join: primarylink {
    relationship: many_to_one
    type: left_outer
    sql_on: ${recognitions_received.recipient_emp_id} = ${primarylink.employee_code};;
  }
}
explore: totalseconds {hidden: no}

datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
