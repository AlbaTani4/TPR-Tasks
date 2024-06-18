*&---------------------------------------------------------------------*
*&  Include           ZSD_UPDATESCHEDULE_TOP
*&---------------------------------------------------------------------*

TABLES sscrfields.

SELECTION-SCREEN: FUNCTION KEY 1.

SELECTION-SCREEN BEGIN OF BLOCK b01 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_file TYPE string ,
            p_test AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK b01.

CLASS lcl_updateschedule DEFINITION FINAL.
  PUBLIC SECTION.
    METHODS execute.

    CLASS-METHODS f4_path.
    CLASS-METHODS initialization.
    CLASS-METHODS at_selection_screen.
    CLASS-METHODS at_selection_screen_output.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_upload,
             vbeln           TYPE bapivbeln-vbeln,                "Sales order number
             itm_number      TYPE bapischdl-itm_number,           "Item number
             sched_line      TYPE bapischdl-sched_line,           "Schedule line
             req_date        TYPE bapischdl-req_date,             "Delivery date
             date_type       TYPE bapischdl-date_type,            "Date type
             req_qty         TYPE bapischdl-req_qty,              "Quantity
             plan_sched_type TYPE bapischdl-plan_sched_type,      "Schedule line type
             dlvschedno      TYPE bapisddelsched_in-dlvschedno,   "Dlv. Schedule
             dlvscheddate    TYPE bapisddelsched_in-dlvscheddate, "Dlv. Sched. Date
           END OF ty_upload.

    TYPES: BEGIN OF ty_logs,
             vbeln    TYPE vbak-vbeln,
             line_msg TYPE i,
             status   TYPE icon_d,
             msg(220) TYPE c,
           END OF ty_logs.

    DATA: mt_logs      TYPE STANDARD TABLE OF ty_logs,
          mt_upload    TYPE STANDARD TABLE OF ty_upload,
          mo_salv_logs TYPE REF TO cl_salv_table.

    CONSTANTS: cv_update_flag TYPE updkz_d VALUE 'U',
               cv_insert_flag TYPE updkz_d VALUE 'I'.

    METHODS upload_file.
    METHODS change_sales_document.
    METHODS display_logs.
    METHODS set_tooltips.
    METHODS format_date IMPORTING iv_date        TYPE string
                        RETURNING VALUE(rv_date) TYPE d.
    METHODS
      get_status_icon
        IMPORTING iv_type        TYPE sy-msgty
        RETURNING VALUE(rv_icon) TYPE icon_d.

    METHODS add_log
      IMPORTING
        iv_vbeln    TYPE vbeln
        iv_line_msg TYPE i
        is_return   TYPE bapiret2.

    METHODS set_columns.
    CLASS-METHODS download_excel_template.
ENDCLASS.
