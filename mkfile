APE=/sys/src/ape
<$APE/config

LIB=/$objtype/lib/ape/libopus.a

OFILES=\
# silk \
	CNG.$O \
	code_signs.$O \
	init_decoder.$O \
	decode_core.$O \
	decode_frame.$O \
	decode_parameters.$O \
	decode_indices.$O \
	decode_pulses.$O \
	decoder_set_fs.$O \
	dec_API.$O \
	enc_API.$O \
	encode_indices.$O \
	encode_pulses.$O \
	gain_quant.$O \
	interpolate.$O \
	LP_variable_cutoff.$O \
	NLSF_decode.$O \
	NSQ.$O \
	NSQ_del_dec.$O \
	PLC.$O \
	shell_coder.$O \
	tables_gain.$O \
	tables_LTP.$O \
	tables_NLSF_CB_NB_MB.$O \
	tables_NLSF_CB_WB.$O \
	tables_other.$O \
	tables_pitch_lag.$O \
	tables_pulses_per_block.$O \
	VAD.$O \
	control_audio_bandwidth.$O \
	quant_LTP_gains.$O \
	VQ_WMat_EC.$O \
	HP_variable_cutoff.$O \
	NLSF_encode.$O \
	NLSF_VQ.$O \
	NLSF_unpack.$O \
	NLSF_del_dec_quant.$O \
	process_NLSFs.$O \
	stereo_LR_to_MS.$O \
	stereo_MS_to_LR.$O \
	check_control_input.$O \
	control_SNR.$O \
	init_encoder.$O \
	control_codec.$O \
	A2NLSF.$O \
	ana_filt_bank_1.$O \
	biquad_alt.$O \
	bwexpander_32.$O \
	bwexpander.$O \
	debug.$O \
	decode_pitch.$O \
	inner_prod_aligned.$O \
	lin2log.$O \
	log2lin.$O \
	LPC_analysis_filter.$O \
	LPC_inv_pred_gain.$O \
	table_LSF_cos.$O \
	NLSF2A.$O \
	NLSF_stabilize.$O \
	NLSF_VQ_weights_laroia.$O \
	pitch_est_tables.$O \
	resampler.$O \
	resampler_down2_3.$O \
	resampler_down2.$O \
	resampler_private_AR2.$O \
	resampler_private_down_FIR.$O \
	resampler_private_IIR_FIR.$O \
	resampler_private_up2_HQ.$O \
	resampler_rom.$O \
	sigm_Q15.$O \
	sort.$O \
	sum_sqr_shift.$O \
	stereo_decode_pred.$O \
	stereo_encode_pred.$O \
	stereo_find_predictor.$O \
	stereo_quant_pred.$O \
	LPC_fit.$O \
# silk/float \
	apply_sine_window_FLP.$O \
	corrMatrix_FLP.$O \
	encode_frame_FLP.$O \
	find_LPC_FLP.$O \
	find_LTP_FLP.$O \
	find_pitch_lags_FLP.$O \
	find_pred_coefs_FLP.$O \
	LPC_analysis_filter_FLP.$O \
	LTP_analysis_filter_FLP.$O \
	LTP_scale_ctrl_FLP.$O \
	noise_shape_analysis_FLP.$O \
	process_gains_FLP.$O \
	regularize_correlations_FLP.$O \
	residual_energy_FLP.$O \
	warped_autocorrelation_FLP.$O \
	wrappers_FLP.$O \
	autocorrelation_FLP.$O \
	burg_modified_FLP.$O \
	bwexpander_FLP.$O \
	energy_FLP.$O \
	inner_product_FLP.$O \
	k2a_FLP.$O \
	LPC_inv_pred_gain_FLP.$O \
	pitch_analysis_core_FLP.$O \
	scale_copy_vector_FLP.$O \
	scale_vector_FLP.$O \
	schur_FLP.$O \
	sort_FLP.$O \
# celt \
	bands.$O \
	celt.$O \
	celt_encoder.$O \
	celt_decoder.$O \
	cwrs.$O \
	entcode.$O \
	entdec.$O \
	entenc.$O \
	kiss_fft.$O \
	laplace.$O \
	mathops.$O \
	mdct.$O \
	modes.$O \
	pitch.$O \
	celt_lpc.$O \
	quant_bands.$O \
	rate.$O \
	vq.$O \
# src \
	analysis.$O \
	mlp.$O \
	mlp_data.$O \
	opus.$O \
	opus_decoder.$O \
	opus_encoder.$O \
	opus_multistream.$O \
	opus_multistream_encoder.$O \
	opus_multistream_decoder.$O \
	repacketizer.$O \
	opus_projection_encoder.$O \
	opus_projection_decoder.$O \
	mapping_matrix.$O

HFILES=\
	/sys/include/ape/opus/opus.h \
	/sys/include/ape/opus/opus_custom.h \
	/sys/include/ape/opus/opus_defines.h \
	/sys/include/ape/opus/opus_multistream.h \
	/sys/include/ape/opus/opus_projection.h \
	/sys/include/ape/opus/opus_types.h \

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\

</sys/src/cmd/mksyslib

CFLAGS=$CFLAGS -c -Iinclude -Isilk -Isilk/fixed -Isilk/float -Icelt \
	-DPACKAGE_VERSION="$VERSION" \
	-DOPUS_BUILD \
	-DCUSTOM_MODES \
	-DNONTHREADSAFE_PSEUDOSTACK \
	-DHAVE_STDINT_H

%.$O:	silk/%.c
	$CC $CFLAGS silk/$stem.c

%.$O:	silk/fixed/%.c
	$CC $CFLAGS silk/fixed/$stem.c

%.$O:	silk/float/%.c
	$CC $CFLAGS silk/float/$stem.c

%.$O:	celt/%.c
	$CC $CFLAGS celt/$stem.c

%.$O:	src/%.c
	$CC $CFLAGS src/$stem.c

$HFILES:
	mkdir -p /sys/include/ape/opus
	dircp include /sys/include/ape/opus
