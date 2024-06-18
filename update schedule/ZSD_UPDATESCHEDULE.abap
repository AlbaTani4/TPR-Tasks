REPORT zsd_updateschedule.

INCLUDE zsd_updateschedule_top.
INCLUDE zsd_updateschedule_impl.

INITIALIZATION.
  lcl_updateschedule=>initialization( ).

AT SELECTION-SCREEN.
  lcl_updateschedule=>at_selection_screen( ).

AT SELECTION-SCREEN OUTPUT.
  lcl_updateschedule=>at_selection_screen_output( ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  lcl_updateschedule=>f4_path( ).

START-OF-SELECTION.
  NEW lcl_updateschedule( )->execute( ).
