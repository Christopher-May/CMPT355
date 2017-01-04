
-- Tests constraints

BEGIN;

ALTER TABLE ns_Parties ADD PRIMARY KEY (p_partyName);

ALTER TABLE ns_Works ADD PRIMARY KEY (w_numKey, w_charKey, w_partyName);
ALTER TABLE ns_Works ADD FOREIGN KEY (w_partyName) REFERENCES ns_Parties(p_partyName);

ALTER TABLE ns_Locations ADD PRIMARY KEY (l_locationName, l_partyName);
ALTER TABLE ns_Locations ADD FOREIGN KEY (l_partyName) REFERENCES ns_Parties(p_partyName);

ALTER TABLE ns_Exhibitions ADD PRIMARY KEY (e_exhibName, e_musDate_start, e_partyName);
ALTER TABLE ns_Exhibitions ADD FOREIGN KEY (e_partyName) REFERENCES ns_Parties(p_partyName);

ALTER TABLE ns_WorksValues ADD PRIMARY KEY (wv_numKey, wv_charKey, wv_partyName, wv_musDate_start);
ALTER TABLE ns_WorksValues ADD FOREIGN KEY (wv_numKey, wv_charKey, wv_partyName) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);

ALTER TABLE ns_WorksMedia ADD PRIMARY KEY (wm_numKey, wm_charKey, wm_partyName, wm_workMedia);
ALTER TABLE ns_WorksMedia ADD FOREIGN KEY (wm_numKey, wm_charKey, wm_partyName) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);

ALTER TABLE ns_WorksOwners ADD PRIMARY KEY (wo_numKey, wo_charKey, wo_partyName, wo_partyName_owner, wo_musTime_start);
ALTER TABLE ns_WorksOwners ADD FOREIGN KEY (wo_numKey, wo_charKey, wo_partyName) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);
ALTER TABLE ns_WorksOwners ADD FOREIGN KEY (wo_partyName) REFERENCES ns_Parties(p_partyName);

ALTER TABLE ns_Doors ADD PRIMARY KEY (d_locationName_gallery1, d_partyName_gallery1, d_locationName_gallery2, d_partyName_gallery2);
ALTER TABLE ns_Doors ADD FOREIGN KEY (d_locationName_gallery1, d_partyName_gallery1) REFERENCES ns_Locations(l_locationName, l_partyName);
ALTER TABLE ns_Doors ADD FOREIGN KEY (d_locationName_gallery2, d_partyName_gallery2) REFERENCES ns_Locations(l_locationName, l_partyName);

ALTER TABLE ns_WorksLocations ADD PRIMARY KEY (wl_charKey, wl_numKey, wl_partyName_mus, wl_musTime_start, wl_locationName, wl_partyName_loc);
ALTER TABLE ns_WorksLocations ADD FOREIGN KEY (wl_numKey, wl_charKey, wl_partyName_mus) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);
ALTER TABLE ns_WorksLocations ADD FOREIGN KEY (wl_locationName, wl_partyName_loc) REFERENCES ns_Locations(l_locationName, l_partyName);

ALTER TABLE ns_ExhibitionLocations ADD PRIMARY KEY (el_exhibName, el_musDate_start, el_partyName_exhib, el_locationName, el_partyName_location);
ALTER TABLE ns_ExhibitionLocations ADD FOREIGN KEY (el_exhibName, el_musDate_start, el_partyName_exhib) REFERENCES ns_Exhibitions(e_exhibName, e_musDate_start, e_partyName);
ALTER TABLE ns_ExhibitionLocations ADD FOREIGN KEY (el_locationName, el_partyName_location) REFERENCES ns_Locations(l_locationName, l_partyName);

ALTER TABLE ns_ExhibitionStaff ADD PRIMARY KEY (ex_partyName_staff, ex_job, ex_exhibName, ex_musDate_start, ex_partyName_exhib, ex_musDate_staffStart);
ALTER TABLE ns_ExhibitionStaff ADD FOREIGN KEY (ex_exhibName, ex_musDate_start, ex_partyName_exhib) REFERENCES ns_Exhibitions(e_exhibName, e_musDate_start, e_partyName);

ALTER TABLE ns_ExhibitionSponsor ADD PRIMARY KEY (es_partyName_sponsor, es_exhibName, es_musDate_start, es_partyName_exhib);
ALTER TABLE ns_ExhibitionSponsor ADD FOREIGN KEY (es_exhibName, es_musDate_start, es_partyName_exhib) REFERENCES ns_Exhibitions(e_exhibName, e_musDate_start, e_partyName);
ALTER TABLE ns_ExhibitionSponsor ADD FOREIGN KEY (es_partyName_sponsor) REFERENCES ns_Parties(p_partyName);

ALTER TABLE ns_ExhibitionWorks ADD PRIMARY KEY (ew_numKey, ew_charKey, ew_partyName_work, ew_exhibName, ew_musDate_start, ew_partyName_exhib);
ALTER TABLE ns_ExhibitionWorks ADD FOREIGN KEY (ew_exhibName, ew_musDate_start, ew_partyName_exhib) REFERENCES ns_Exhibitions(e_exhibName, e_musDate_start, e_partyName);
ALTER TABLE ns_ExhibitionWorks ADD FOREIGN KEY (ew_numKey, ew_charKey, ew_partyName_work) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);

ALTER TABLE ns_Transactions ADD PRIMARY KEY (t_charKey, t_numKey, t_musTime_start, t_transType);
ALTER TABLE ns_Transactions ADD FOREIGN KEY (t_numKey, t_charKey, t_partyName) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);
ALTER TABLE ns_Transactions ADD FOREIGN KEY (t_numKey_other, t_charKey_other, t_partyName_other) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);

ALTER TABLE ns_WorksFlightMethod ADD PRIMARY KEY (wft_numKey, wft_charKey, wft_partyName, wft_flightMethod);
ALTER TABLE ns_WorksFlightMethod ADD FOREIGN KEY (wft_numKey, wft_charKey, wft_partyName) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);

ALTER TABLE ns_WorksPlaneUsage ADD PRIMARY KEY (wpu_numKey, wpu_charKey, wpu_partyName, wpu_planeUsage);
ALTER TABLE ns_WorksPlaneUsage ADD FOREIGN KEY (wpu_numKey, wpu_charKey, wpu_partyName) REFERENCES ns_Works(w_numKey, w_charKey, w_partyName);

ROLLBACK;
