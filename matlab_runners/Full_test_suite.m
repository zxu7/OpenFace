% This is sort of the unit test for the whole module (needs datasets)
% Will take several hours to run all
clear
tic
%% Head pose
cd('Head Pose Experiments');
run_head_pose_tests_OpenFace_CECLM;
assert(median(all_errors_biwi_OF(:)) < 3.0);
assert(median(all_errors_bu_OF(:)) < 1.9);
assert(median(all_errors_ict_OF(:)) < 2.1);
run_head_pose_tests_OpenFace;
assert(median(all_errors_biwi_OF(:)) < 2.8);
assert(median(all_errors_bu_OF(:)) < 2.0);
assert(median(all_errors_ict_OF(:)) < 2.0);
cd('../');

%% Features
cd('Feature Point Experiments');
run_OpenFace_feature_point_tests_300W;
assert(median(err_ceclm) < 0.036);
assert(median(err_clnf) < 0.039);
run_yt_dataset;
assert(median(ceclm_error) < 0.045);
assert(median(clnf_error) < 0.053);
cd('../');

%% AUs
cd('Action Unit Experiments');
run_AU_prediction_DISFA
assert(mean(au_res) > 0.7);

run_AU_prediction_SEMAINE
assert(mean(f1s) > 0.41);

run_AU_prediction_FERA2011
assert(mean(au_res) > 0.5);

cd('../');

%% Gaze
cd('Gaze Experiments');
extract_mpii_gaze_test
assert(mean_error < 9.5)
assert(median_error < 9.0)
cd('../');

%% Demos
cd('Demos');
run_demo_images;
run_demo_videos;
run_demo_video_multi;
feature_extraction_demo_vid;
feature_extraction_demo_img_seq;
gaze_extraction_demo_vid;
cd('../');
toc