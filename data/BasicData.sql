SELECT TOP 2000000
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
  G.modelMagErr_u, 
  G.modelMag_g, 
  G.modelMagErr_g,
  G.modelMag_r, 
  G.modelMagErr_r, 
  G.modelMag_i, 
  G.modelMagErr_i,
  G.modelMag_z, 
  G.modelMagErr_z, 
  G.petroR50_r, 
  G.petroR90_r,
  
  GSE.bptclass,
  GSE.oh_p16,
  GSE.oh_p50,
  GSE.oh_p84,
  GSE.lgm_tot_p16,
  GSE.lgm_tot_p50,
  GSE.lgm_tot_p84,
  GSE.sfr_tot_p16,
  GSE.sfr_tot_p50,
  GSE.sfr_tot_p84
INTO mydb.BasicData
FROM SpecObj AS S
  JOIN Galaxy AS G        ON G.objID = S.bestObjID
  JOIN GalSpecLine as GSL ON GSL.specObjID = S.specObjID
  JOIN GalSpecInfo AS GSI ON GSI.specObjID = S.specObjID
  JOIN GalSpecExtra AS GSE ON GSE.specObjID = S.specObjID
  JOIN PhotoObjDR7 AS P    ON P.DR8ObjID = S.bestObjID