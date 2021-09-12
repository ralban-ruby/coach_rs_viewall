- dashboard: master__receptionist_dashboard__coachesmanagers
  title: MASTER - Receptionist Dashboard - Coaches/Managers
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Availability
    name: Availability
    model: rs_coach_view_all
    explore: avail
    type: looker_column
    fields: [sum_of_total, sum_of_avail, avail.nominaldate_date]
    fill_fields: [avail.nominaldate_date]
    sorts: [avail.nominaldate_date]
    limit: 500
    dynamic_fields: [{measure: sum_of_total, based_on: avail.total, expression: '',
        label: Sum of Total, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_avail, based_on: avail.avail, expression: '', label: Sum of
          Avail, type: sum, _kind_hint: measure, _type_hint: number}, {_kind_hint: measure,
        table_calculation: availability, _type_hint: number, category: table_calculation,
        expression: "${sum_of_avail}/${sum_of_total}", label: Availability, value_format: !!null '',
        value_format_name: percent_1}, {_kind_hint: measure, table_calculation: meets_goal,
        _type_hint: number, category: table_calculation, expression: 'if(${availability}
          >= 0.86, ${availability}, null)', label: Meets Goal, value_format: !!null '',
        value_format_name: percent_1}, {_kind_hint: measure, table_calculation: below_goal,
        _type_hint: number, category: table_calculation, expression: 'if(${availability}
          < 0.86, ${availability}, null)', label: Below Goal, value_format: !!null '',
        value_format_name: percent_1}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: availability, id: availability,
            name: Availability}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    series_types: {}
    series_colors:
      availability: "#F09CA1"
      meets_goal: "#31959D"
      below_goal: "#DDD9E1"
    label_color: ["#132656"]
    x_axis_datetime_label: "%b %e"
    reference_lines: [{reference_type: range, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#b8b5ba", line_value: ".86",
        label: Goal, range_end: '1', range_start: ".86"}]
    column_group_spacing_ratio: 0.1
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [sum_of_total, sum_of_avail, availability]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Availability:

      Availability ensures that Receptionists are available when scheduled to be on phones throughout the day to both meet the needs of our customers, and support maintaining a healthy floor.


      How it’s calculated:

      The sum of minutes in "Available", "On an Inbound Call", and "After Call Work" statuses divided by minutes of scheduled queue time (your receptionist shift minus breaks, meetings, etc.)
      Goal: At or above 86%
    listen:
      Date: avail.nominaldate_date
      Receptionist Name: primarylink.name
    row: 4
    col: 2
    width: 10
    height: 6
  - title: Me
    name: Me
    model: rs_coach_view_all
    explore: avail
    type: single_value
    fields: [sum_of_avail, sum_of_total]
    limit: 500
    dynamic_fields: [{measure: sum_of_avail, based_on: avail.avail, expression: '',
        label: Sum of Avail, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_total, based_on: avail.total, expression: '', label: Sum of
          Total, type: sum, _kind_hint: measure, _type_hint: number}, {category: table_calculation,
        expression: "${sum_of_avail}/${sum_of_total}", label: Availability, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: availability,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_avail, sum_of_total]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    showComparison: false
    minValue: 0
    maxValue: 1
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#b22577"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#F09CA1"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 0.9
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    series_types: {}
    defaults_version: 1
    listen:
      Date: avail.nominaldate_date
      Receptionist Name: primarylink.name
    row: 4
    col: 12
    width: 2
    height: 3
  - title: Long Offer
    name: Long Offer
    model: rs_coach_view_all
    explore: longoffers
    type: looker_column
    fields: [sum_of_longoffers, sum_of_total_calls, longoffers.date_date, sum_of_ana]
    fill_fields: [longoffers.date_date]
    sorts: [longoffers.date_date]
    limit: 500
    dynamic_fields: [{measure: sum_of_longoffers, based_on: longoffers.longoffers,
        expression: '', label: Sum of Longoffers, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_total_calls, based_on: longoffers.total_calls,
        expression: '', label: Sum of Total Calls, type: sum, _kind_hint: measure,
        _type_hint: number}, {_kind_hint: measure, table_calculation: long_offers,
        _type_hint: number, category: table_calculation, expression: "(${sum_of_longoffers}\
          \ + ${sum_of_ana})/(${sum_of_total_calls} + ${sum_of_ana})", label: Long
          Offers, value_format: !!null '', value_format_name: percent_1}, {_kind_hint: measure,
        table_calculation: meets_goal, _type_hint: number, category: table_calculation,
        expression: 'if(${long_offers} <= 0.05, ${long_offers}, null)', label: Meets
          Goal, value_format: !!null '', value_format_name: percent_1}, {_kind_hint: measure,
        table_calculation: below_goal, _type_hint: number, category: table_calculation,
        expression: 'if(${long_offers} > 0.05, ${long_offers}, null)', label: Below
          Goal, value_format: !!null '', value_format_name: percent_1}, {measure: sum_of_ana,
        based_on: longoffers.ANA, expression: '', label: Sum of ANA, type: sum, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: long_offers, id: long_offers,
            name: Long Offers}], showLabels: false, showValues: false, maxValue: 0.15,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    series_colors:
      long_offers: "#F09CA1"
      meets_goal: "#31959D"
      below_goal: "#DDD9E1"
    label_color: ["#132656"]
    x_axis_datetime_label: "%b %e"
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#c7c4c9",
        range_start: '0', range_end: ".05", label: Goal}]
    defaults_version: 1
    hidden_fields: [sum_of_longoffers, sum_of_total_calls, long_offers, sum_of_ana]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Long Offer:

      By keeping your Long Offer Time below 5% you are helping support the promise we make to our customers that their calls will be answered live by the 4th ring.


      How it’s calculated:

      Offer time starts when the call begins alerting at your desk and ends when you pick up the call. A “Long Offer” is a call that spends 10 or more seconds in offer time -- including calls that turn into AgentNotAnswering after 15 seconds. This metric counts the number of Long Offers divided by the total number of calls.
      Goal: Below 5%
    listen:
      Date: longoffers.date_date
      Receptionist Name: primarylink.name
    row: 4
    col: 14
    width: 8
    height: 6
  - title: After Call Work
    name: After Call Work
    model: rs_coach_view_all
    explore: acw_call
    type: looker_column
    fields: [sum_of_seconds, sum_of_calls, acw_call.date_date]
    fill_fields: [acw_call.date_date]
    sorts: [acw_call.date_date]
    limit: 500
    dynamic_fields: [{measure: sum_of_seconds, based_on: acw_call.seconds, expression: '',
        label: Sum of Seconds, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_calls, based_on: acw_call.calls, expression: '', label: Sum
          of Calls, type: sum, _kind_hint: measure, _type_hint: number}, {_kind_hint: measure,
        table_calculation: acw_per_call, _type_hint: number, category: table_calculation,
        expression: "${sum_of_seconds}/${sum_of_calls}", label: ACW per Call, value_format: !!null '',
        value_format_name: decimal_1}, {_kind_hint: measure, table_calculation: meets_goal,
        _type_hint: number, category: table_calculation, expression: 'if(${acw_per_call}
          <= 25.0, ${acw_per_call}, null)', label: Meets Goal, value_format: !!null '',
        value_format_name: decimal_1}, {_kind_hint: measure, table_calculation: below_goal,
        _type_hint: number, category: table_calculation, expression: 'if(${acw_per_call}
          > 25.0, ${acw_per_call}, null)', label: Below Goal, value_format: !!null '',
        value_format_name: decimal_1}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: acw_per_call, id: acw_per_call,
            name: ACW per Call}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    series_types: {}
    series_colors:
      acw_per_call: "#F09CA1"
      meets_goal: "#31959D"
      below_goal: "#DDD9E1"
    label_color: ["#132656"]
    x_axis_datetime_label: "%b %e"
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#c7c4c9",
        range_start: '0', range_end: '25', label: Goal}]
    hidden_fields: [sum_of_seconds, sum_of_calls, acw_per_call]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: |
      After Call Work:

      This status is used to complete every call with a proper tag, wrap-up code, and message if appropriate. However, too much time in this status can affect our ability to meet the needs of our customers and staffing requirements. It’s important to ensure you’re accurately and completely wrapping up a call without jeopardizing our ability to answer incoming calls promptly.


      How it’s calculated:

      Total time spent in ACW divided by the number of wrapped up calls.
    listen:
      Date: acw_call.date_date
      Receptionist Name: primarylink.name
    row: 10
    col: 5
    width: 9
    height: 6
  - title: BRB
    name: BRB
    model: rs_coach_view_all
    explore: brb
    type: looker_column
    fields: [sum_of_seconds, sum_of_total, brb.date_date]
    fill_fields: [brb.date_date]
    sorts: [brb.date_date]
    limit: 500
    dynamic_fields: [{measure: sum_of_seconds, based_on: brb.seconds, expression: '',
        label: Sum of Seconds, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_total, based_on: brb.total, expression: '', label: Sum of Total,
        type: sum, _kind_hint: measure, _type_hint: number}, {_kind_hint: measure,
        table_calculation: brb, _type_hint: number, category: table_calculation, expression: "${sum_of_seconds}/${sum_of_total}",
        label: BRB, value_format: !!null '', value_format_name: percent_1}, {_kind_hint: measure,
        table_calculation: meets_goal, _type_hint: number, category: table_calculation,
        expression: 'if(${brb} <= 0.05, ${brb}, null)', label: Meets Goal, value_format: !!null '',
        value_format_name: percent_1}, {_kind_hint: measure, table_calculation: below_goal,
        _type_hint: number, category: table_calculation, expression: 'if(${brb} >
          0.05, ${brb}, null)', label: Below Goal, value_format: !!null '', value_format_name: percent_1}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: brb, id: brb, name: BRB}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    series_types: {}
    series_colors:
      brb: "#F09CA1"
      meets_goal: "#31959D"
      below_goal: "#DDD9E1"
    label_color: ["#132656"]
    x_axis_datetime_label: "%b %e"
    reference_lines: [{reference_type: range, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#c7c4c9", line_value: ".05",
        label: Goal, range_start: '0', range_end: ".05"}]
    hidden_fields: [sum_of_seconds, sum_of_total, brb]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: |-
      Be Right Back:

      This status is used whenever you need to step away while you’re scheduled to be taking calls -- to use the restroom, refill a glass of water, or grab an item from the business center. Keeping this status below 5% of your time on calls (Floor Time) helps us stay reliably well-staffed to answer incoming calls.


      How it’s calculated:

      Total time spent in Be Right Back divided by scheduled queue time (your receptionist shift minus breaks, meetings, etc.)
      Goal: Below 5%
    listen:
      Date: brb.date_date
      Receptionist Name: primarylink.name
    row: 10
    col: 16
    width: 6
    height: 6
  - title: Connections
    name: Connections
    model: rs_coach_view_all
    explore: connections
    type: looker_column
    fields: [connections.type, sum_of_total, connections.datecreated_date]
    pivots: [connections.type]
    fill_fields: [connections.datecreated_date]
    sorts: [connections.type, connections.datecreated_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_total, based_on: connections.total, expression: '',
        label: Sum of Total, type: sum, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: sum_of_total, id: Bomb
              Bomb - sum_of_total, name: Bomb Bomb}, {axisId: sum_of_total, id: Note
              Card - sum_of_total, name: Note Card}, {axisId: sum_of_total, id: WoW
              Gift - sum_of_total, name: WoW Gift}], showLabels: false, showValues: false,
        maxValue: 4, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    series_colors:
      Note Card - sum_of_total: "#802161"
      Bomb Bomb - sum_of_total: "#F09CA1"
      WoW Gift - sum_of_total: "#FB762E"
    x_axis_datetime_label: "%b %e"
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: |-
      Connections:

      Making connections with our customers is something that sets us apart. Following up on the authentic and genuine connections that you're making with our customers reminds them that we're here to answer their phones and support them in the growth of their business.


      How it’s calculated:

      The total number of notecards, Bombbombs, and WOW gifts sent to a Ruby customer!
      There is no minimum expectation for how many connections you should make.
    listen:
      Date: connections.datecreated_date
      Receptionist Name: primarylink.name
    row: 16
    col: 16
    width: 8
    height: 9
  - title: Error Notes
    name: Error Notes
    model: rs_coach_view_all
    explore: errors
    type: looker_grid
    fields: [errors.date_error_occurred_c_date, errors.account_name, errors.error_type_c,
      errors.error_notes_c]
    sorts: [errors.date_error_occurred_c_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      errors.date_error_occurred_c_date: Date
      errors.error_type_c: Type
      errors.error_notes_c: Notes
    series_types: {}
    defaults_version: 1
    listen:
      Date: errors.date_error_occurred_c_date
      Receptionist Name: primarylink.name
    row: 44
    col: 0
    width: 5
    height: 8
  - title: Average Rate per Item
    name: Average Rate per Item
    model: rs_coach_view_all
    explore: scores_rollup
    type: looker_column
    fields: [scores_rollup.q_id, sum_of_q_count, sum_of_q_score_2]
    sorts: [scores_rollup.q_id]
    limit: 500
    dynamic_fields: [{measure: sum_of_q_score_2, based_on: scores_rollup.q_score,
        expression: '', label: Sum of Q Score, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_q_count, based_on: scores_rollup.q_count, expression: '', label: Sum
          of Q Count, type: sum, _kind_hint: measure, _type_hint: number}, {_kind_hint: measure,
        table_calculation: new_calculation, _type_hint: number, category: table_calculation,
        expression: "${sum_of_q_score_2}/${sum_of_q_count}", label: New Calculation,
        value_format: !!null '', value_format_name: percent_0}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Score, orientation: left, series: [{axisId: new_calculation,
            id: new_calculation, name: New Calculation}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: 'Question #'
    series_types: {}
    series_colors:
      new_calculation: "#802161"
    series_labels:
      new_calculation: Score
    label_color: ["#132656"]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [sum_of_q_count, sum_of_q_score_2]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Average Rate Per Item:

      Review your average evaluation rate in each of the 10 foundational items on the scorecard. Knowing where you’re excelling and where you can focus to improve helps ensure we’re all delivering consistently excellent service.


      How it’s calculated:

      Each item is graded either Yes, No, or Not Applicable. This shows the number of “Yes” scores for a specific item out of the total times this item was scored.
    listen:
      Date: scores_rollup.date_date
      Receptionist Name: primarylink.name
    row: 0
    col: 12
    width: 12
    height: 4
  - title: Summary
    name: Summary
    model: rs_coach_view_all
    explore: scorecards
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [count_of_id, average_of_score_actual]
    limit: 500
    dynamic_fields: [{based_on: scorecards.id, _kind_hint: measure, measure: count_of_id,
        type: count_distinct, _type_hint: number, category: measure, expression: '',
        label: Count of ID, value_format: !!null '', value_format_name: decimal_0},
      {based_on: scorecards.score_actual, _kind_hint: measure, measure: average_of_score_actual,
        type: average, _type_hint: number, category: measure, expression: '', label: Average
          of Score Actual, value_format: !!null '', value_format_name: percent_0}]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '10'
    orientation: auto
    style_count_of_id: "#3A4245"
    show_title_count_of_id: true
    title_override_count_of_id: Scorecards
    title_placement_count_of_id: above
    value_format_count_of_id: ''
    style_scorecards.score: "#3A4245"
    show_title_scorecards.score: true
    title_override_scorecards.score: Overall Score
    title_placement_scorecards.score: above
    value_format_scorecards.score: ''
    show_comparison_scorecards.score: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: |-
      Service Quality Summary:

      Your summary data shows your overall Service Quality Rate performance data. You can see how many total scorecards you’ve received in the selected timeframe, what your average scorecards per week are, and your overall Service Quality Rate score. Your Overall Score is an evaluation of your performance successfully delivering the foundational elements of our service.


      How it’s calculated:

      There are 10 foundational items (can be reviewed by clicking on “Service Scorecard Report link), and your Service Quality Rate is determined by how many are met or missed in an evaluated call.
      Score Guide: 90-100% = Meeting Expectations, 70-89% = Needs Improvement, 69% or below = Missing
    listen:
      Date: scorecards.submittime_date
      Receptionist Name: primarylink.name
    row: 0
    col: 0
    width: 12
    height: 4
  - title: NoACD & Unavailable
    name: NoACD & Unavailable
    model: rs_coach_view_all
    explore: rs_ic_status_fact
    type: looker_column
    fields: [rs_ic_status_fact.statuskey, aspect_superstate_hours.nominal_date, rs_ic_status_fact.sum_minutes]
    pivots: [rs_ic_status_fact.statuskey]
    fill_fields: [aspect_superstate_hours.nominal_date]
    filters:
      rs_ic_status_fact.statuskey: Unavailable,"Available, No Acd"
    sorts: [aspect_superstate_hours.nominal_date desc, rs_ic_status_fact.statuskey]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Minutes, orientation: left, series: [{axisId: 'Available, No
              Acd - rs_ic_status_fact.sum_minutes', id: 'Available, No Acd - rs_ic_status_fact.sum_minutes',
            name: 'Available, No Acd'}, {axisId: Unavailable - rs_ic_status_fact.sum_minutes,
            id: Unavailable - rs_ic_status_fact.sum_minutes, name: Unavailable}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: 11px
    label_value_format: 0.##
    series_types: {}
    series_colors:
      Unavailable - rs_ic_status_fact.sum_minutes: "#F09CA1"
      Available, No Acd - rs_ic_status_fact.sum_minutes: "#FBB555"
    x_axis_datetime_label: "%b %e"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: |-
      NoACD & Unavailable:

      NoACD and Unavailable are both statuses that are useful in helping you manage your day. However, too much time in these statuses can affect your overall availability and therefore our ability to meet the needs of our customers. You will automatically roll into NoACD status if you have stayed in ACW for 90 seconds, and NoACD should only be used if you need extended time to wrap up a call. Unavailable status happens when you close a POP, and is a helpful tool if you need to take an extra moment before going back into Available status.


      How it’s calculated:

      Total time spent in NoACD and Unavailable divided by the number of wrapped up calls.
    listen:
      Date: aspect_superstate_hours.nominal_date
      Receptionist Name: rs_ic_status_fact.name
    row: 16
    col: 0
    width: 16
    height: 9
  - title: Hours Worked
    name: Hours Worked
    model: rs_coach_view_all
    explore: rs_ic_status_fact
    type: looker_column
    fields: [rs_ic_status_fact.day_of_shift_date, rs_ic_status_fact.sum_hours]
    fill_fields: [rs_ic_status_fact.day_of_shift_date]
    filters:
      rs_ic_status_fact.statuskey: "-At Lunch,-Gone Home"
    sorts: [rs_ic_status_fact.day_of_shift_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Hours Worked, orientation: left, series: [{axisId: rs_ic_status_fact.sum_hours,
            id: rs_ic_status_fact.sum_hours, name: Sum Hours}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    label_value_format: '0'
    series_types: {}
    series_colors:
      rs_ic_status_fact.sum_hours: "#F09CA1"
    series_labels:
      rs_ic_status_fact.sum_hours: Hours Worked
    label_color: ["#b22577"]
    x_axis_datetime_label: "%b %e"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: |-
      Hours Worked:

      Maintaining a reliable and consistent schedule ensures our ability to adequately staff to match our projected call volume.


      How it’s calculated:

      Total hours worked divided by total scheduled hours. (Scheduled paid holidays are not included in scheduled hours.)
      A minimum of 75% is required for quarterly Legendary status. However, there are expectations regarding unplanned time off and limits to planned time off.
    listen:
      Date: aspect_superstate_hours.nominal_date
      Receptionist Name: rs_ic_status_fact.name
    row: 38
    col: 0
    width: 24
    height: 6
  - title: Absences
    name: Absences
    model: rs_coach_view_all
    explore: attendance_occurrences
    type: looker_grid
    fields: [attendance_occurrences.absencestart_time, attendance_occurrences.absencestop_time,
      attendance_occurrences.description, attendance_occurrences.effectivethrough_date,
      attendance_occurrences.memo, attendance_occurrences.sum_hours, attendance_occurrences.count_occurrences]
    filters:
      attendance_occurrences.occurrencestart_date: NOT NULL
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      attendance_occurrences.occurrencestart_date: Start Date
      attendance_occurrences.occurrenceend_date: End Date
      attendance_occurrences.sum_hours: Hours
      attendance_occurrences.count_occurrences: Occurrence Count
    series_cell_visualizations:
      attendance_occurrences.sum_hours:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Receptionist Name: employee_lookup_all.name
    row: 44
    col: 5
    width: 17
    height: 8
  - title: See More
    name: See More
    model: rs_coach_view_all
    explore: seemore_rollup
    type: looker_grid
    fields: [seemore_rollup.date_date, seemore_rollup.weekday, seemore_rollup.hoursworked,
      seemore_rollup.absence_hours, seemore_rollup.plannedleave, seemore_rollup.hourstrimmed,
      seemore_rollup.openhours, seemore_rollup.avail, seemore_rollup.meeting_minutes,
      seemore_rollup.noacd_minutes, seemore_rollup.brb_minutes, seemore_rollup.techissues_minutes,
      seemore_rollup.unavail_minutes, seemore_rollup.calls, seemore_rollup.calls_per_floor_hour,
      seemore_rollup.noacd_seconds, seemore_rollup.handletime_seconds, seemore_rollup.talktime_seconds,
      seemore_rollup.acw_seconds, seemore_rollup.ana, seemore_rollup.longoffers]
    sorts: [seemore_rollup.date_date]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      seemore_rollup.date_date: Date
      seemore_rollup.hoursworked: Worked (Hours)
      seemore_rollup.absence_hours: Absence (Hours)
      seemore_rollup.plannedleave: Planned Leave (Hours)
      seemore_rollup.hourstrimmed: Trimmed (Hours)
      seemore_rollup.openhours: Open Hours
      seemore_rollup.avail: Available (Minutes)
      seemore_rollup.noacd_minutes: NoACD (Minutes)
      seemore_rollup.brb_minutes: BRB (Minutes)
      seemore_rollup.techissues_minutes: Tech Issues (Minutes)
      seemore_rollup.unavail_minutes: Unavailable (Minutes)
      seemore_rollup.calls_per_floor_hour: Calls/Floor Hour
      seemore_rollup.noacd_seconds: NoACD per Call (Sec)
      seemore_rollup.handletime_seconds: Handle Time (Sec)
      seemore_rollup.talktime_seconds: Call Length (Sec)
      seemore_rollup.acw_seconds: ACW (Sec)
    series_column_widths:
      seemore_rollup.date_date: 99
      seemore_rollup.weekday: 76
      seemore_rollup.hoursworked: 113
      seemore_rollup.absence_hours: 119
      seemore_rollup.plannedleave: 150
      seemore_rollup.hourstrimmed: 120
      seemore_rollup.openhours: 91
      seemore_rollup.avail: 133
      seemore_rollup.meeting_minutes: 119
      seemore_rollup.noacd_minutes: 123
      seemore_rollup.brb_minutes: 106
      seemore_rollup.techissues_minutes: 148
      seemore_rollup.unavail_minutes: 145
      seemore_rollup.calls: 75
      seemore_rollup.calls_per_floor_hour: 116
      seemore_rollup.noacd_seconds: 156
      seemore_rollup.handletime_seconds: 128
      seemore_rollup.talktime_seconds: 120
      seemore_rollup.acw_seconds: 86
      seemore_rollup.ana: 75
      seemore_rollup.longoffers: 88
    series_value_format:
      seemore_rollup.avail:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.noacd_minutes:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.brb_minutes:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.calls_per_floor_hour:
        name: decimal_1
        decimals: '1'
        format_string: "#,##0.0"
        label: Decimals (1)
        label_prefix: Decimals
      seemore_rollup.unavail_minutes:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      seemore_rollup.noacd_seconds:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.handletime_seconds:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.talktime_seconds:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.acw_seconds:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      seemore_rollup.techissues_minutes:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    series_types: {}
    defaults_version: 1
    listen:
      Date: seemore_rollup.date_date
      Receptionist Name: primarylink.name
    row: 52
    col: 0
    width: 24
    height: 11
  - title: Ruby
    name: Ruby
    model: rs_coach_view_all
    explore: avail
    type: single_value
    fields: [sum_of_avail, sum_of_total]
    limit: 500
    dynamic_fields: [{measure: sum_of_avail, based_on: avail.avail, expression: '',
        label: Sum of Avail, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_total, based_on: avail.total, expression: '', label: Sum of
          Total, type: sum, _kind_hint: measure, _type_hint: number}, {category: table_calculation,
        expression: "${sum_of_avail}/${sum_of_total}", label: Availability, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: availability,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_avail, sum_of_total]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    showComparison: false
    minValue: 0
    maxValue: 1
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: "#b22577"
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#F09CA1"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 0.9
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    series_types: {}
    defaults_version: 1
    listen:
      Date: avail.nominaldate_date
    row: 7
    col: 12
    width: 2
    height: 3
  - title: Me
    name: Me (2)
    model: rs_coach_view_all
    explore: longoffers
    type: single_value
    fields: [sum_of_longoffers, sum_of_total_calls]
    limit: 500
    dynamic_fields: [{measure: sum_of_longoffers, based_on: longoffers.longoffers,
        expression: '', label: Sum of Longoffers, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_total_calls, based_on: longoffers.total_calls,
        expression: '', label: Sum of Total Calls, type: sum, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${sum_of_longoffers}/${sum_of_total_calls}",
        label: Long Offer %, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: long_offer, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_longoffers, sum_of_total_calls]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    series_types: {}
    defaults_version: 1
    listen:
      Date: longoffers.date_date
      Receptionist Name: primarylink.name
    row: 4
    col: 22
    width: 2
    height: 3
  - title: Ruby
    name: Ruby (2)
    model: rs_coach_view_all
    explore: longoffers
    type: single_value
    fields: [sum_of_longoffers, sum_of_total_calls]
    limit: 500
    dynamic_fields: [{measure: sum_of_longoffers, based_on: longoffers.longoffers,
        expression: '', label: Sum of Longoffers, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_total_calls, based_on: longoffers.total_calls,
        expression: '', label: Sum of Total Calls, type: sum, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${sum_of_longoffers}/${sum_of_total_calls}",
        label: Long Offer %, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: long_offer, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [sum_of_longoffers, sum_of_total_calls]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    series_types: {}
    defaults_version: 1
    listen:
      Date: longoffers.date_date
    row: 7
    col: 22
    width: 2
    height: 3
  - title: Ruby
    name: Ruby (3)
    model: rs_coach_view_all
    explore: acw_call
    type: single_value
    fields: [sum_of_seconds, sum_of_calls]
    limit: 500
    dynamic_fields: [{measure: sum_of_seconds, based_on: acw_call.seconds, expression: '',
        label: Sum of Seconds, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_calls, based_on: acw_call.calls, expression: '', label: Sum
          of Calls, type: sum, _kind_hint: measure, _type_hint: number}, {category: table_calculation,
        expression: "${sum_of_seconds}/${sum_of_calls}", label: ACW, value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, table_calculation: acw,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [sum_of_seconds, sum_of_calls]
    listen:
      Date: acw_call.date_date
    row: 13
    col: 14
    width: 2
    height: 3
  - title: Ruby
    name: Ruby (4)
    model: rs_coach_view_all
    explore: brb
    type: single_value
    fields: [sum_of_seconds, sum_of_total]
    limit: 500
    dynamic_fields: [{measure: sum_of_seconds, based_on: brb.seconds, expression: '',
        label: Sum of Seconds, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_total, based_on: brb.total, expression: '', label: Sum of Total,
        type: sum, _kind_hint: measure, _type_hint: number}, {category: table_calculation,
        expression: "${sum_of_seconds}/${sum_of_total}", label: BRB, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: brb,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [sum_of_seconds, sum_of_total]
    listen:
      Date: brb.date_date
    row: 13
    col: 22
    width: 2
    height: 3
  - title: Me
    name: Me (3)
    model: rs_coach_view_all
    explore: brb
    type: single_value
    fields: [sum_of_seconds, sum_of_total]
    limit: 500
    dynamic_fields: [{measure: sum_of_seconds, based_on: brb.seconds, expression: '',
        label: Sum of Seconds, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_total, based_on: brb.total, expression: '', label: Sum of Total,
        type: sum, _kind_hint: measure, _type_hint: number}, {category: table_calculation,
        expression: "${sum_of_seconds}/${sum_of_total}", label: BRB, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: brb,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [sum_of_seconds, sum_of_total]
    listen:
      Date: brb.date_date
      Receptionist Name: primarylink.name
    row: 10
    col: 22
    width: 2
    height: 3
  - title: Me
    name: Me (4)
    model: rs_coach_view_all
    explore: acw_call
    type: single_value
    fields: [sum_of_calls, sum_of_seconds]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${sum_of_seconds}/${sum_of_calls}",
        label: ACW, value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        table_calculation: acw, _type_hint: number}, {measure: sum_of_calls, based_on: acw_call.calls,
        expression: '', label: Sum of Calls, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_seconds, based_on: acw_call.seconds, expression: '', label: Sum
          of Seconds, type: sum, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [sum_of_calls, sum_of_seconds]
    listen:
      Date: acw_call.date_date
      Receptionist Name: primarylink.name
    row: 10
    col: 14
    width: 2
    height: 3
  - title: Recognitions Received
    name: Recognitions Received
    model: rs_coach_view_all
    explore: recognitions_received
    type: looker_grid
    fields: [recognitions_received.badge, count_of_id]
    filters:
      recognitions_received.badge: "-64199,-64200"
    sorts: [count_of_id desc]
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: recognitions_received.id, expression: '',
        label: Count of ID, type: count_distinct, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      count_of_id: Total
    series_cell_visualizations:
      count_of_id:
        is_active: false
    series_types: {}
    defaults_version: 1
    listen:
      Receptionist Name: primarylink.name
    row: 31
    col: 0
    width: 3
    height: 7
  - title: Recognitions Given
    name: Recognitions Given
    model: rs_coach_view_all
    explore: recognitions_given
    type: looker_grid
    fields: [recognitions_given.badge, count_of_id]
    filters:
      recognitions_given.badge: "-64199,-64200"
    sorts: [count_of_id desc]
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: recognitions_given.id, expression: '',
        label: Count of ID, type: count_distinct, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      count_of_id: Total
    series_cell_visualizations:
      count_of_id:
        is_active: false
    series_types: {}
    defaults_version: 1
    listen:
      Receptionist Name: primarylink.name
    row: 25
    col: 0
    width: 3
    height: 6
  - title: Recognitions Received - Detail
    name: Recognitions Received - Detail
    model: rs_coach_view_all
    explore: recognitions_received
    type: looker_grid
    fields: [recognitions_received.created_date, recognitions_received.badge, recognitions_received.message]
    filters:
      recognitions_received.badge: "-64199,-64200"
    sorts: [recognitions_received.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recognitions_received.created_date: Date
      recognitions_received.badge: Badge
    series_types: {}
    defaults_version: 1
    listen:
      Receptionist Name: primarylink.name
    row: 31
    col: 3
    width: 21
    height: 7
  - title: Recognitions Given - Detail
    name: Recognitions Given - Detail
    model: rs_coach_view_all
    explore: recognitions_given
    type: looker_grid
    fields: [recognitions_given.created_date, recognitions_given.badge, recognitions_given.message]
    filters:
      recognitions_given.badge: "-64199,-64200"
    sorts: [recognitions_given.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recognitions_given.created_date: Date
      recognitions_given.badge: Badge
      recognitions_given.message: Message
    series_text_format:
      recognitions_given.message: {}
      recognitions_given.badge: {}
    series_types: {}
    defaults_version: 1
    listen:
      Receptionist Name: primarylink.name
    row: 25
    col: 3
    width: 21
    height: 6
  - title: Hours
    name: Hours
    model: rs_coach_view_all
    explore: attendance_occurrences
    type: single_value
    fields: [attendance_occurrences.sum_hours, attendance_occurrences.count_occurrences]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 71, background_color: "#b2232c",
        font_color: !!null '', color_application: {collection_id: ruby, palette_id: ruby-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: between,
        value: [64, 71], background_color: "#FBB555", font_color: !!null '', color_application: {
          collection_id: ruby, palette_id: ruby-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 64, background_color: "#089e18",
        font_color: !!null '', color_application: {collection_id: ruby, palette_id: ruby-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [attendance_occurrences.count_occurrences]
    series_types: {}
    listen:
      Receptionist Name: employee_lookup_all.name
    row: 44
    col: 22
    width: 2
    height: 4
  - title: Occurrences
    name: Occurrences
    model: rs_coach_view_all
    explore: attendance_occurrences
    type: single_value
    fields: [attendance_occurrences.count_occurrences]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 6, background_color: "#b2232c",
        font_color: !!null '', color_application: {collection_id: ruby, palette_id: ruby-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: between,
        value: [4.99999, 6], background_color: "#FBB555", font_color: !!null '', color_application: {
          collection_id: ruby, palette_id: ruby-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 5, background_color: "#089e18",
        font_color: !!null '', color_application: {collection_id: ruby, palette_id: ruby-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Receptionist Name: employee_lookup_all.name
    row: 48
    col: 22
    width: 2
    height: 4
  - title: Avail Today
    name: Avail Today
    model: ruby
    explore: rs_avail_tda
    type: single_value
    fields: [rs_avail_tda.availability, employee_lookup_all.name]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [employee_lookup_all.name]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 1
    listen:
      Receptionist Name: employee_lookup_all.name
    row: 4
    col: 0
    width: 2
    height: 6
  - title: Status Today
    name: Status Today
    model: ruby
    explore: agentactivitylog
    type: looker_pie
    fields: [agentactivitylog.statuskey, agentactivitylog.stateduration_minutes, employee_lookup_all.name]
    filters:
      agentactivitylog.statuskey: "-gone home"
      agentactivitylog.statusdatetime_date: Today
    sorts: [agentactivitylog.stateduration_minutes desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    series_labels:
      on an inbound call: On an Inbound Call
      after call work: ACW
      away from desk: Away from Desk
      available: Avail
      available, no acd: Avail, no ACD
      at lunch: At Lunch
      break: Break
      in a meeting: In a Meeting
      unavailable: Unavailable
      tech issues: Tech Issues
    series_types: {}
    defaults_version: 1
    hidden_fields: [employee_lookup_all.name]
    listen:
      Receptionist Name: employee_lookup_all.name
    row: 10
    col: 0
    width: 5
    height: 6
  filters:
  - name: Receptionist Name
    title: Receptionist Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: rs_coach_view_all
    explore: primarylink
    listens_to_filters: []
    field: primarylink.name
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: rs_coach_view_all
    explore: topbar
    listens_to_filters: []
    field: topbar.scorecard_date
