
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name brom-demo -dir "C:/Users/IEUser/Developer/VHLD/brom-demo/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/IEUser/Developer/VHLD/brom-demo/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/IEUser/Developer/VHLD/brom-demo} {ipcore_dir/Counter30} {ipcore_dir/Rom} }
add_files [list {ipcore_dir/Counter30/Counter30.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/Rom/Rom.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
