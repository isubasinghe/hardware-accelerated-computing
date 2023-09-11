open_project baseline 
set_top fir

add_files fir.cpp
add_files fir.h

add_files -tb fir_test.cpp
add_files -tb out.gold.dat
add_files -tb input.dat

open_solution "solution1"

set_part {xck26-sfvc784-2LV-c}

create_clock -period 10
