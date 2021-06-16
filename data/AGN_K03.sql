SELECT TOP 1000000
  G.objID,
  P.DR7ObjID,
  GSI.specObjID,
  G.ra, 
  G.dec, 
  S.z, 
  S.zErr, 
  S.velDisp, 
  S.velDispErr,
  
  G.modelMag_u, 
  G.modelMag_g, 
  G.modelMag_r, 
  G.modelMag_i, 
  G.modelMag_z,
  G.petroMag_r,
  G.petroR50_r, 
  G.petroR90_r,
  
  GSE.bptclass,
  GSE.oh_p50,
  GSE.lgm_tot_p50,
  GSE.sfr_tot_p50,
  
  GSL.nii_6584_flux,
  GSL.nii_6584_flux_err,
  GSL.h_alpha_flux,
  GSL.h_alpha_flux_err,
  GSL.oiii_5007_flux,
  GSL.oiii_5007_flux_err,
  GSL.h_beta_flux,
  GSL.h_beta_flux_err,
  
  GSI.reliable
  
INTO mydb.AGN_K03
FROM SpecObj AS S
  JOIN Galaxy AS G        ON G.objID = S.bestObjID
  JOIN GalSpecLine as GSL ON GSL.specObjID = S.specObjID
  JOIN GalSpecInfo AS GSI ON GSI.specObjID = S.specObjID
  JOIN GalSpecExtra AS GSE ON GSE.specObjID = S.specObjID
  JOIN PhotoObjDR7 AS P    ON P.DR8ObjID = S.bestObjID
  
WHERE G.z > 0.02
  AND G.petroMag_r > 14
  AND G.petroMag_r <= 17.77
  AND GSL.nii_6584_flux > 0
  AND GSL.h_alpha_flux > 0
  AND GSL.oiii_5007_flux > 0
  AND GSL.h_beta_flux > 0