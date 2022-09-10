
--
-- Dumping routines for database 'bsapp_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `asp_notification_subscribe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `asp_notification_subscribe`(
	IN in_device_token_id INT,
    IN in_subscribe BOOLEAN
)
BEGIN
   UPDATE bsapp_db.device_token_mast
	SET
	subscribe = in_subscribe,
    modified_at = now()
	WHERE idd = in_device_token_id;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_mast_delete`(
	IN in_ads_id bigint
)
BEGIN
	DELETE FROM bsapp_db.ads_mast WHERE ads_id = in_ads_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_mast_fill`(
	IN in_user_id INT,
    IN in_limit INT,
    IN in_page_no INT,
    IN in_ad_status VARCHAR(125)
)
BEGIN
DECLARE in_offset INT;
SET in_offset = (in_page_no -1) * in_limit;

select *,count(*) over() as total_record FROM(
(SELECT 
	AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    CS.c_picture_link_1 AS Image,
    CS.car_title AS Name,
    FORMAT(CS.c_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CS.c_location as location,
    DATE_FORMAT(CS.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(CS.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN CS.modified_at > CS.created_at THEN CS.modified_at ELSE CS.created_at END AS ORDER_DATE,
    SM.state_name AS car_registration_state,
    CS.c_km AS car_km,
    CO.name AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    YM.value AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_sell_inventory_mast CS
        LEFT JOIN  bsapp_db.ads_mast AD ON CS.car_sell_inventory_id = AD.inventory_id   AND CS.car_sell_inventory_code = AD.inventory_code   AND CS.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
WHERE  AD.user_id = in_user_id)
UNION 
   (SELECT 
   AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y')  AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    AI.picture_link_1 AS Image,
    AI.title AS Name,
    FORMAT(AI.price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    AI.location as location,
    DATE_FORMAT(AI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(AI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN AI.modified_at > AI.created_at THEN AI.modified_at ELSE AI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
  bsapp_db.all_inventory_mast  AI
        LEFT JOIN bsapp_db.ads_mast AD ON AI.all_inventory_id = AD.inventory_id    AND AI.all_inventory_code = AD.inventory_code   AND AI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
UNION 
    (SELECT 
    AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y')AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y')   AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    CR.c_picture_link_1 AS Image,
    CR.car_title AS Name,
    FORMAT(CR.c_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CR.c_location as location,
    DATE_FORMAT(CR.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(CR.modified_at,'%d %b %y')  AS Modify_Date,
    CASE WHEN CR.modified_at > CR.created_at THEN CR.modified_at ELSE CR.created_at END AS ORDER_DATE,
	'' AS car_registration_state,
    c_km_limit AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_id = AD.inventory_id   AND CR.car_rent_inventory_code = AD.inventory_code     AND CR.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
    UNION 
	(SELECT 
    AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y')  AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')   AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    JI.j_picture_link_1 AS Image,
    JI.j_title AS Name,
    0 AS price,
    JI.from_salary AS From_salary,
    JI.to_salary AS To_salary,
    JI.j_location as location,
    DATE_FORMAT(JI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(JI.modified_at,'%d %b %y')  AS Modify_Date,
    CASE WHEN JI.modified_at > JI.created_at THEN JI.modified_at ELSE JI.created_at END AS ORDER_DATE,
	'' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    JT.j_type_name AS Job_type,
    SP.s_p_name AS Job_salary_period
FROM
     bsapp_db.job_inventory_mast JI
		LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_id = AD.inventory_id   AND JI.job_inventory_code = AD.inventory_code  AND JI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
WHERE  AD.user_id = in_user_id)
    UNION 
        (SELECT 
    AD.ads_id AS Ads_id,    
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y') AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    MI.mo_picture_link_1 AS Image,
    MI.mo_title AS Name,
    FORMAT(MI.mo_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    MI.location as location,
    DATE_FORMAT(MI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(MI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN MI.modified_at > MI.created_at THEN MI.modified_at ELSE MI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    RAM.value AS Mobile_ram,
    ROM.value AS Mobile_rom,
    BR.brand_name AS Mobile_brand,
    MI.mo_colour AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.mobile_inventory_mast MI
	    LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_id = AD.inventory_id  AND MI.mo_inventory_code = AD.inventory_code  AND MI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
WHERE  AD.user_id = in_user_id)
UNION
      (SELECT 
    AD.ads_id AS Ads_id,  
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y') AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    OI.o_picture_link_1 AS Image,
    OI.o_title AS Name,
    FORMAT(OI.o_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    OI.o_location as location,
    DATE_FORMAT(OI.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(OI.modified_at,'%d %b %y')  AS Modify_Date,
    CASE WHEN OI.modified_at > OI.created_at THEN OI.modified_at ELSE OI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    OC.value as Cabin,
	OW.value as Washroom,
    OI.o_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.office_inventory_mast OI
		LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_id = AD.inventory_id  AND OI.office_inventory_code = AD.inventory_code  AND OI.inventory_type = AD.inventory_type
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
UNION 
(SELECT 
	AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    PI.p_picture_link_1 AS Image,
    PI.p_title AS Name,
    FORMAT(PI.p_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    PI.p_location as location,
    DATE_FORMAT(PI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(PI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN PI.modified_at > PI.created_at THEN PI.modified_at ELSE PI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    BED.value as Bedroom,
	BAT.value as Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    PI.p_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
      bsapp_db.property_inventory_mast PI
	   LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_id = AD.inventory_id  AND PI.property_inventory_code = AD.inventory_code AND PI.inventory_type = AD.inventory_type
       LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
	   LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
       LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
       LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
 UNION 
    (SELECT 
    AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    VI.v_picture_link_1 AS Image,
    VI.v_title AS Name,
    FORMAT(VI.v_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    VI.v_location as location,
    DATE_FORMAT(VI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(VI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN VI.modified_at > VI.created_at THEN VI.modified_at ELSE VI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    YM.value AS year_of_registration,
    VI.kms AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
    bsapp_db.vehicle_inventory_mast VI
		LEFT JOIN bsapp_db.ads_mast AD  ON VI.vehicle_inventory_id = AD.inventory_id   AND VI.vehicle_inventory_code  = AD.inventory_code  AND VI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
        LEFT JOIN  bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id        
WHERE  AD.user_id = in_user_id))AS SUBQ WHERE find_in_set(Ad_status_code,in_ad_status) 
ORDER BY ORDER_DATE DESC
limit in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_mast_save`(
	IN in_ads_id INT,
    IN in_inventory_id INT,
    IN in_user_id INT,
    IN in_inventory_code VARCHAR(126),
    IN in_inventory_type VARCHAR(126),
    IN in_ad_status_id INT
)
BEGIN
DECLARE in_ads_seq_id BIGINT;
IF NOT EXISTS(SELECT user_id,inventory_id,inventory_code,UPPER(inventory_type),inventory_type FROM bsapp_db.ads_mast WHERE  user_id = in_user_id AND inventory_id = in_inventory_id AND inventory_code = in_inventory_code AND UPPER(inventory_type) = in_inventory_code AND inventory_type = in_inventory_type ) THEN
 call sp_ads_sequence();
   SET in_ads_seq_id = (select  seq_id  from bsapp_db.ads_sequence_mast where seq_date = CURDATE());
 	INSERT INTO bsapp_db.ads_mast
		(ads_id,inventory_id,user_id,inventory_code,inventory_type,from_date,to_date,ad_status_id,likes,views,created_at)
	VALUES
		(in_ads_seq_id,in_inventory_id,in_user_id,in_inventory_code,in_inventory_type,now(),ADDDATE(from_date, INTERVAL 28 DAY),in_ad_status_id,0,0,now());
	SELECT * FROM bsapp_db.ads_mast WHERE ads_id = LAST_INSERT_ID();
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_sequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_sequence`()
BEGIN

DECLARE max_seq_id BIGINT;
SET max_seq_id =(select  max(seq_id)  + 1  from bsapp_db.ads_sequence_mast where seq_date = CURDATE());
IF NOT EXISTS (SELECT seq_date FROM bsapp_db.ads_sequence_mast WHERE seq_date = CURDATE()) THEN

	INSERT INTO bsapp_db.ads_sequence_mast
		(seq_date,seq_id)
	VALUES
		(CURDATE(),(select concat((date_format(now(),'%y') * 10000 + date_format(now(),'%m') * 100 + date_format(now(),'%d')),'000001')));
	-- SELECT seq_id from bsapp_db.login_sequence_mast where seq_date = CURDATE();
    ELSE
		UPDATE bsapp_db.ads_sequence_mast
		SET
        seq_id = max_seq_id
        WHERE seq_date = CURDATE();

	-- SELECT max_seq_id as seq_id;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_status_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_status_update`(
	IN in_ads_id BIGINT,
    IN in_ad_status_id INT
)
BEGIN

   UPDATE bsapp_db.ads_mast
	SET
    ad_status_id = in_ad_status_id,
    modified_at = now()
	WHERE ads_id = in_ads_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_delete`(
	IN in_ad_status_id INT
)
BEGIN
	DELETE FROM bsapp_db.ad_status_mast WHERE ad_status_id = in_ad_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_fill`(
)
BEGIN
	SELECT * FROM bsapp_db.ad_status_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_save`(
	IN in_ad_status_id INT,
    IN in_ad_status VARCHAR(126),
    IN in_ad_status_message VARCHAR(512),
    IN in_ad_status_filter_name VARCHAR(256)
)
BEGIN
IF NOT EXISTS(SELECT ad_status_id FROM bsapp_db.ad_status_mast WHERE ad_status_id = in_ad_status_id) THEN
 	INSERT INTO bsapp_db.ad_status_mast
		(ad_status,ad_status_message,ad_status_filter_name,created_at)
	VALUES
		(in_ad_status,in_ad_status_message,in_ad_status_filter_name,now());
ELSE
   UPDATE bsapp_db.ad_status_mast
	SET
	ad_status = in_ad_status,
    ad_status_message = in_ad_status_message,
    ad_status_filter_name = in_ad_status_filter_name,
    modified_at = now()
	WHERE ad_status_id = in_ad_status_id;
	
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_save_update`(
)
BEGIN
  UPDATE bsapp_db.ads_mast INNER JOIN bsapp_db.ad_status_mast on "IN PROGRESS" = bsapp_db.ad_status_mast.ad_status
  SET bsapp_db.ads_mast.ad_status_id = bsapp_db.ad_status_mast.ad_status_id
  WHERE bsapp_db.ads_mast.ad_status_id IS NULL 
  OR bsapp_db.ads_mast.ad_status_id = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_inventory_mast_delete`(
  IN in_all_inventory_id INT,
  IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.all_inventory_mast AI  ON  AD.inventory_code= AI.all_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_all_inventory_id );
   DELETE FROM bsapp_db.all_inventory_mast WHERE all_inventory_id = in_all_inventory_id AND user_id = in_user_id ;
   call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_inventory_mast_fill`(
  IN in_all_inventory_code VARCHAR(126),
  IN in_cat_id INT
)
BEGIN
		SELECT 
			AI.all_inventory_id, IFNULL(AD.ads_id, "-") AS ads_id, IFNULL(AI.user_id, "-") AS user_id, 
			IFNULL(AI.all_inventory_code, "-") AS all_inventory_code, IFNULL(AI.inventory_type, "-") AS inventory_type, 
            IFNULL(CAT.cat_name, "-") AS cat_name, IFNULL(SUB.sub_cat_name, "-") AS sub_cat_name, 
            IFNULL(AI.title, "-") AS title, IFNULL(FORMAT(AI.price, 0), "-") AS Price, 
            AI.picture_link_1, AI.picture_link_2, AI.picture_link_3, AI.picture_link_4,
            AI.picture_link_5, AI.picture_link_6, AI.picture_link_7, AI.picture_link_8,
            AI.picture_link_9, AI.picture_link_10, 
            IFNULL(AI.show_mo_no, "-") AS show_mo_no, IFNULL(AI.description, "-") AS description,
            IFNULL(AI.location, "-") AS location, IFNULL(AI.latitude, "-") AS latitude, 
            IFNULL(AI.longitude, "-") AS longitude, 
            IFNULL(DATE_FORMAT(AI.created_at,'%d %b %y'), "-") as ad_created, 
            IFNULL(AI.modified_at, "-") AS modified_at,
            IFNULL(UM.profile_picture_link, "-") as profile_picture, IFNULL(UM.name, "-") as user_name,
            IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        CAT.id as cat_id, SUB.id as sub_cat_id
        FROM bsapp_db.all_inventory_mast AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = AI.all_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = AI.user_id
        WHERE AI.all_inventory_code = in_all_inventory_code AND AI.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_inventory_mast_save`(
	IN in_all_inventory_id INT,
    IN in_user_id INT,
    IN in_inventory_type VARCHAR(126),
    IN in_cat_id INT,
    IN in_sub_cat_id INT,
	IN in_title VARCHAR(126),
	IN in_price INT,
	IN in_picture_link_1 VARCHAR(512),
    IN in_picture_link_2 VARCHAR(512),
    IN in_picture_link_3 VARCHAR(512),
    IN in_picture_link_4 VARCHAR(512),
    IN in_picture_link_5 VARCHAR(512),
    IN in_picture_link_6 VARCHAR(512),
    IN in_picture_link_7 VARCHAR(512),
    IN in_picture_link_8 VARCHAR(512),
    IN in_picture_link_9 VARCHAR(512),
    IN in_picture_link_10 VARCHAR(512),
    IN in_show_mo_no  BOOLEAN,
	IN in_description VARCHAR(512),
	IN in_location VARCHAR(126),
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8)
)
BEGIN
DECLARE get_max_inventory_id INT;

;select COALESCE(MAX(all_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.all_inventory_mast

IF NOT EXISTS(select all_inventory_id from bsapp_db.all_inventory_mast where all_inventory_id = in_all_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.all_inventory_mast
    		(all_inventory_id,user_id,all_inventory_code,inventory_type,cat_id,sub_cat_id,title,price,picture_link_1,picture_link_2,picture_link_3,picture_link_4,picture_link_5,picture_link_6,picture_link_7,picture_link_8,picture_link_9,picture_link_10,show_mo_no,description,location,latitude,longitude,created_at)
	VALUES
			(get_max_inventory_id,in_user_id,concat("all_",get_max_inventory_id),IFNULL(in_inventory_type,'ALL'),in_cat_id,in_sub_cat_id,in_title,in_price,in_picture_link_1,in_picture_link_2,in_picture_link_3,in_picture_link_4,in_picture_link_5,in_picture_link_6,in_picture_link_7,in_picture_link_8,in_picture_link_9,in_picture_link_10,in_show_mo_no,in_description,in_location,in_latitude,in_longitude,now());
		call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("all_",get_max_inventory_id),"all",1);
        select * from bsapp_db.all_inventory_mast where all_inventory_id = get_max_inventory_id;
ELSE
	UPDATE bsapp_db.all_inventory_mast
	SET
    cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id,
	title = in_title,
    price = in_price,
    picture_link_1 = in_picture_link_1,
    picture_link_2 = in_picture_link_2,
    picture_link_3 = in_picture_link_3,
    picture_link_4 = in_picture_link_4,
    picture_link_5 = in_picture_link_5,
    picture_link_6 = in_picture_link_6,
    picture_link_7 = in_picture_link_7,
    picture_link_8 = in_picture_link_8,
    picture_link_9 = in_picture_link_9,
    picture_link_10 = in_picture_link_10,
	show_mo_no = in_show_mo_no,
    description = in_description,
	location = in_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now()
	WHERE all_inventory_id = in_all_inventory_id AND user_id = in_user_id;
    select * from bsapp_db.all_inventory_mast where all_inventory_id = in_all_inventory_id AND user_id = in_user_id;
END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_table_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_table_mast_fill`(
        IN in_cat_id INT,
        IN in_sub_cat_id INT
)
BEGIN

 call sp_dd_bike_brand_mast_fill();
 call sp_dd_car_brand_mast_fill();
 
-- SELECT j_type_id as id,j_type_name as value  FROM bsapp_db.job_type_mast union
-- SELECT s_p_id as id,s_p_name as value  FROM bsapp_db.salary_period_mast union
-- select p_type_id as id,p_type_name as value  from bsapp_db.position_type_mast union
-- select id as id,value as value from bsapp_db.year_mast;


    
	  --  SELECT JB.j_type_id,JB.j_type_name 
      -- PT.p_type_id,PT.p_type_name,  YM.id, YM.value
        -- VT.v_type_id,VT.v_type_name,  CB.id,CB.name,  BB.id,BB.name,  OT.id,OT.value,  OC.id,OC.value,
        -- OFU.id,OFU.value,  OW.id,OW.value,  OCP.id,OCP.value,  OL.id,OL.value,  OEC.id,OCP.value,
        -- PRT.p_type_id,PRT.p_type_name,  PRL.p_listed_by_id,PRL.p_listed_by_name,
        -- PRF.p_furnishing_id,PRF.p_furnishing_name,  PRC.p_car_parking_id,PRC.p_car_parking_name,
        -- PPR.p_preferred_renters_id,PPR.p_preferred_renters_name,  PRB.id,PRB.value,
        -- PRBH.id,PRBH.value,  CRB.car_brand_id,CRB.car_brand_name,  CFT.car_fuel_id,CFT.car_fuel_name,
        -- CRT.id,CRT.value,  CRO.id,CRO.name
        
		 -- from bsapp_db.job_type_mast JB
		-- select SP.s_p_id,SP.s_p_name from bsapp_db.salary_period_mast SP; 
        -- , bsapp_db.position_type_mast PT
        -- , bsapp_db.year_mast YM
        -- , bsapp_db.vehicle_type_mast VT
        -- , bsapp_db.commercial_brand_mast CB
        -- , bsapp_db.bike_brand_mast BB
        -- , bsapp_db.office_type_mast OT
        -- , bsapp_db.office_cabin_mast OC
        -- , bsapp_db.office_furnishing_mast OFU
        -- , bsapp_db.office_washroom_mast OW 
        -- , bsapp_db.office_car_parking_mast OCP
        -- , bsapp_db.office_listed_by_mast OL
        -- , bsapp_db.office_employee_capacity_mast OEC
        -- , bsapp_db.property_type_mast PRT
        -- , bsapp_db.property_listed_by_mast PRL
        -- , bsapp_db.property_furnishing_mast PRF
        -- , bsapp_db.property_car_parking_mast PRC
		-- , bsapp_db.property_preferred_renters_mast PPR
        -- , bsapp_db.property_bedroom_mast PRB
        -- , bsapp_db.property_bathroom_mast PRBH
		-- , bsapp_db.car_brand_mast CRB
        -- , bsapp_db.car_fuel_type_mast CFT
        -- , bsapp_db.car_type_mast CRT
        -- , bsapp_db.car_owner_mast CRO
        -- where JB.j_type_id = in_cat_id and  SP.s_p_id = in_sub_cat_id;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autocomplete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_autocomplete`(
	IN in_searchtxt VARCHAR(126),
	IN in_limit INT,
    IN in_page_no INT
)
BEGIN
DECLARE  in_offset INT;
SET in_offset = (in_page_no -1) * in_limit;
select *,COUNT(*) OVER() AS "total_count" FROM(
	(SELECT 
		CS.car_sell_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CS.c_picture_link_1 as Image,
        CS.car_title as Name,
        FORMAT(CS.c_price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        CS.c_location as location,
		CS.latitude,
		CS.longitude,
        DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
        CS.modified_at as Modify_Date,
        "" as  office_furnished,
		SM.state_name as car_registration_state,
        CS.c_km as car_km,
        CS.c_owner as owner,
        0 as Bedroom,
		0 as Bathroom,
        0 as Cabin,
        0 as Washroom,
		0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		YM.value as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast AS CS
        LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
        LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
        LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code
    WHERE AD.ad_status_id = 1 ) 
    UNION 
    (SELECT 
		AI.all_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        AI.picture_link_1 as Image,
        AI.title as Name,
        FORMAT(AI.price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        AI.location as location,
		AI.latitude,
		AI.longitude,
		DATE_FORMAT(AI.created_at,'%d %b %y')as Create_Date,
        AI.modified_at as Modify_Date,
        "" as  office_furnished,
		'' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.all_inventory_mast AS AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code
        WHERE AD.ad_status_id = 1) 
    UNION 
    (SELECT 
		CR.car_rent_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CR.c_picture_link_1 as Image,
        CR.car_title as Name,
        FORMAT(CR.c_price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        CR.c_location as location,
		CR.latitude,
		CR.longitude,
        DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
        CR.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
        c_km_limit as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) UNION (SELECT 
		JI.job_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
	    JI.j_picture_link_1 as Image,
        JI.j_title as Name,
        0 as price,
        JI.from_salary as From_salary,
        JI.to_salary as To_salary,
        JI.j_location as location,
		JI.latitude,
		JI.longitude,
        DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
        JI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
        0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		JT.j_type_name as Job_type,
		SP.s_p_name as Job_salary_period
      
	FROM
		bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
        LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) 
    UNION 
    (SELECT 
		MI.mo_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		MI.mo_picture_link_1 as Image,
        MI.mo_title as Name,
        FORMAT(MI.mo_price, 0) as Price,
		0 as from_salary,
		0 as to_salary,
        MI.location as location,
        MI.latitude,
		MI.longitude,
        DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
        MI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		MI.mo_ram as Mobile_ram,
        MI.mo_rom as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) UNION (SELECT 
		OI.office_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		OI.o_picture_link_1 as Image,
        OI.o_title as Name,
        FORMAT(OI.o_price, 0) as Price,
		0 as from_salary,
		0 as to_salary,
        OI.o_location as location,
        OI.latitude,
		OI.longitude,
        DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
        OI.modified_at as Modify_Date,
        PF.p_furnishing_name as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
        OI.cabin as Cabin,
        OI.washroom as Washroom,
		OI.o_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
        
	FROM
		bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code) 
    UNION 
    (SELECT 
		PI.property_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        PI.p_picture_link_1 as Image,
        PI.p_title as Name,
        FORMAT(PI.p_price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        PI.p_location as location,
		PI.latitude,
		PI.longitude,
        DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
        PI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        PI.p_bedroom as Bedroom,
        PI.p_bathroom as Bathroom,
		0 as Cabin,
        0 as Washroom,
        PI.p_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) 
    UNION 
    (SELECT 
		VI.vehicle_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		VI.v_picture_link_1 as Image,
        VI.v_title as Name,
        FORMAT(VI.v_price, 0) as Price,
		0 as from_salary,
		0 as to_salary,
        VI.v_location as location,
        VI.latitude,
		VI.longitude,
		DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
        VI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		VI.year as year_of_registration,
		VI.kms as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
        LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1))AS SUBQ WHERE 
    (Name LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Job_type LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Category LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Sub_category LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR location LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Mobile_ram LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Mobile_rom LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR office_furnished LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%'))
            ORDER BY Create_Date DESC limit in_limit offset in_offset ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autocomplete_title` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_autocomplete_title`(
	IN in_searchtxt VARCHAR(126),
	IN in_limit INT,
    IN in_page_no INT
)
BEGIN
	DECLARE in_offset INT;
	SET in_offset = (in_page_no -1) * in_limit;
    
	SELECT Name
    FROM
    ((SELECT 
        CS.car_title AS Name,
            CB.car_brand_name AS Brand,
            '' AS Type,
            CS.inventory_type AS Itype,
            CS.c_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            CS.c_location AS Location,
            CM.name AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            CS.c_colour AS Colour,
            CF.car_fuel_name AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(CS.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.car_sell_inventory_mast AS CS
    LEFT JOIN bsapp_db.car_brand_mast CB ON CS.car_brand_id = CB.car_brand_id
    LEFT JOIN bsapp_db.category_mast C ON CS.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON CS.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.car_model_name_mast CM ON CS.car_model_name = CM.name
    LEFT JOIN bsapp_db.car_fuel_type_mast CF ON CS.car_fuel_id = CF.car_fuel_id
    LEFT JOIN bsapp_db.ads_mast AD ON CS.car_sell_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        AI.title AS Name,
            '' AS Brand,
            '' AS Type,
            AI.inventory_type AS Itype,
            AI.description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            AI.location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(AI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.all_inventory_mast AS AI
    LEFT JOIN bsapp_db.category_mast C ON AI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON AI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON AI.all_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        CR.car_title AS Name,
            '' AS Brand,
            CT.value AS Type,
            CR.inventory_type AS Itype,
            CR.c_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            CR.c_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(CR.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.car_rent_inventory_mast CR
    LEFT JOIN bsapp_db.car_type_mast CT ON CR.c_car_type = CT.id
    LEFT JOIN bsapp_db.category_mast C ON CR.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON CR.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        JI.j_title AS Name,
            '' AS Brand,
            JT.j_type_name AS Type,
            JI.inventory_type AS Itype,
            JI.j_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            JI.j_location AS Location,
            '' AS Model,
            JI.j_designation AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(JI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.job_inventory_mast JI
    LEFT JOIN bsapp_db.job_type_mast JT ON JI.j_type_id = JT.j_type_id
    LEFT JOIN bsapp_db.category_mast C ON JI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON JI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        MI.mo_title AS Name,
            MB.brand_name AS Brand,
            '' AS Type,
            MI.inventory_type AS Itype,
            MI.description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            MI.location AS Location,
            MI.model_name AS Model,
            '' AS Designation,
            RA.value AS RAM,
            RO.value AS ROM,
            MI.mo_colour AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(MI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.mobile_inventory_mast MI
    LEFT JOIN bsapp_db.mobile_brand_mast MB ON MI.brand_id = MB.brand_id
    LEFT JOIN bsapp_db.category_mast C ON MI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON MI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.mobile_ram_mast RA ON MI.mo_ram = RA.id
    LEFT JOIN bsapp_db.mobile_rom_mast RO ON MI.mo_rom = RO.id
    LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        OI.o_title AS Name,
            '' AS Brand,
            PT.p_type_name AS Type,
            OI.inventory_type AS Itype,
            OI.o_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            OI.o_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            PF.p_furnishing_name AS Furnished,
            '' AS Status,
            DATE_FORMAT(OI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.office_inventory_mast OI
    LEFT JOIN bsapp_db.property_type_mast PT ON OI.p_type_id = PT.p_type_id
    LEFT JOIN bsapp_db.category_mast C ON OI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON OI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.property_furnishing_mast PF ON OI.p_furnishing_id = PF.p_furnishing_id
    LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        PI.p_title AS Name,
            '' AS Brand,
            PT.p_type_name AS Type,
            PI.inventory_type AS Itype,
            PI.p_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            PI.p_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            PF.p_furnishing_name AS Furnished,
            PS.p_status_title AS Status,
            DATE_FORMAT(PI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.property_inventory_mast PI
    LEFT JOIN bsapp_db.property_type_mast PT ON PI.p_type_id = PT.p_type_id
    LEFT JOIN bsapp_db.category_mast C ON PI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON PI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.property_furnishing_mast PF ON PI.p_furnishing_id = PF.p_furnishing_id
    LEFT JOIN bsapp_db.property_status_mast PS ON PI.p_status_id = PS.p_status_id
    LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        VI.v_title AS Name,
            BB.name AS Brand,
            VT.v_type_name AS Type,
            VI.inventory_type AS Itype,
            VI.v_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            VI.v_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(VI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.bike_brand_mast BB ON VI.brand = BB.id
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.category_mast C ON VI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON VI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1
            AND VI.inventory_type = 'bike') UNION (SELECT 
        VI.v_title AS Name,
            VI.brand AS Brand,
            VT.v_type_name AS Type,
            VI.inventory_type AS Itype,
            VI.v_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            VI.v_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(VI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.category_mast C ON VI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON VI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1
            AND VI.inventory_type <> 'bike')) AS SUBQ
WHERE
    (Name LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Brand LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Type LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Itype LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Description LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Category LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Subcategory LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Location LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Model LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Designation LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR RAM LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR ROM LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Colour LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Fuel LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Furnished LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%'))
ORDER BY Create_Date DESC
LIMIT IN_LIMIT OFFSET IN_OFFSET;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_banner_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_banner_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.banner_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_banner_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_banner_mast_fill`(
	IN in_from_date DATE,
    IN in_to_date DATE
)
BEGIN
	SELECT * FROM bsapp_db.banner_mast WHERE from_date = in_from_date AND to_date = in_to_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_banner_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_banner_mast_save`(
	IN in_id INT,
    IN in_url VARCHAR(255),
    IN in_from_date DATE,
    IN in_to_date DATE,
    IN in_is_active BOOL
)
BEGIN
	IF NOT EXISTS (SELECT id FROM bsapp_db.banner_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.banner_mast (url, from_date, to_date, is_active, created_at)
        VALUES (in_url, in_from_date, in_to_date, in_is_active, now());
	ELSE
		UPDATE bsapp_db.banner_mast
        SET
        url = in_url,
        from_date = in_from_date,
        to_date = in_to_date,
        is_active = in_is_active,
        modified_at = now()
        WHERE id = in_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_brand_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.bike_brand_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_brand_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.bike_brand_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_brand_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.bike_brand_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.bike_brand_mast (name,created_at) VALUES (in_name,now());
	ELSE
		UPDATE bsapp_db.bike_brand_mast 
        SET 
        name = in_name ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_inventory_mast_delete`(
	IN in_vehicle_inventory_id INT,
	IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.vehicle_inventory_mast VI  ON  AD.inventory_code= VI.vehicle_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_vehicle_inventory_id );
		DELETE FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id  ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_inventory_mast_fill`(
	IN in_vehicle_inventory_code VARCHAR(126),
	IN in_cat_id INT
)
BEGIN
IF EXISTS(SELECT cat_id FROM bsapp_db.vehicle_inventory_mast WHERE cat_id = 9) THEN
	SELECT VI.vehicle_inventory_id, IFNULL(VI.user_id, "-") AS user_id, IFNULL(AD.ads_id, "-") AS ads_id, 
		IFNULL(VI.vehicle_inventory_code, "-") AS vehicle_inventory_code, IFNULL(VI.inventory_type, "-") AS inventory_type,
        IFNULL(VI.v_title, "-") AS v_title, IFNULL(FORMAT(VI.v_price, 0), "-") AS v_price, 
        VI.v_picture_link_1, VI.v_picture_link_2, VI.v_picture_link_3, VI.v_picture_link_4, 
        VI.v_picture_link_5, VI.v_picture_link_6, VI.v_picture_link_7, VI.v_picture_link_8, 
        VI.v_picture_link_9, VI.v_picture_link_10, 
        IFNULL(BM.name, "-") as brand, IFNULL(VI.kms, "-") AS kms, IFNULL(YM.value, "-") as year, 
        IFNULL(VI.insuarance, "-") AS insuarance, IFNULL(VI.i_description, "-") AS i_description, 
        IFNULL(VI.v_show_mo_no, "-") AS v_show_mo_no, IFNULL(VI.v_description, "-") AS v_description, 
        IFNULL(VI.v_location, "-") AS v_location, IFNULL(VI.latitude, "-") AS latitude, 
        IFNULL(VI.longitude, "-") AS longitude, IFNULL(DATE_FORMAT(VI.created_at,'%d %b %y'), "-") as ad_created, 
        IFNULL(VI.modified_at, "-") AS modified_at, IFNULL(CAT.cat_name, "-") AS cat_name, 
        IFNULL(SUB.sub_cat_name, "-") AS sub_cat_name, IFNULL(UM.profile_picture_link, "-") as profile_picture,
        IFNULL(UM.name, "-") as user_name , IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created
    FROM bsapp_db.vehicle_inventory_mast VI
	LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.bike_brand_mast BM ON VI.brand = BM.id 
    LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = VI.vehicle_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = VI.user_id
    WHERE VI.vehicle_inventory_code = in_vehicle_inventory_code AND VI.cat_id = in_cat_id  ;
    
ELSE
	SELECT  VI.vehicle_inventory_id, IFNULL(VI.user_id, "-") as user_id,
    IFNULL(VI.vehicle_inventory_code, "-") as vehicle_inventory_code, IFNULL(VI.inventory_type, "-") as inventory_type,
    IFNULL(VI.v_title, "-") as v_title, IFNULL(FORMAT(VI.v_price, 0), "-") as v_price,
    VI.v_picture_link_1, VI.v_picture_link_2, VI.v_picture_link_3, VI.v_picture_link_4, VI.v_picture_link_5,
    VI.v_picture_link_6, VI.v_picture_link_7, VI.v_picture_link_8, VI.v_picture_link_9, VI.v_picture_link_10,
    IFNULL(VT.v_type_name, "-") as v_type_name, IFNULL(CBM.name, "-") as brand,
    IFNULL(VI.kms, "-") as kms, IFNULL(VI.month, "-") as month,
    IFNULL(YM.value, "-") as year, IFNULL(VI.insuarance, "-") as insuarance,
    IFNULL(VI.i_description, "-") as i_description, IFNULL(VI.v_show_mo_no, "-") as v_show_mo_no,
    IFNULL(VI.v_description, "-") as v_description, IFNULL(VI.v_location, "-") as v_location,
    IFNULL(DATE_FORMAT(VI.created_at,'%d %b %y'), "-") as ad_created,
    IFNULL(VI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
    IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
    IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
    IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
    FROM bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
    LEFT JOIN bsapp_db.commercial_brand_mast CBM ON VI.brand = CBM.id 
    LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = VI.vehicle_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = VI.user_id
    WHERE VI.vehicle_inventory_code = in_vehicle_inventory_code AND VI.cat_id = in_cat_id  ;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_inventory_mast_save`(
	IN in_vehicle_inventory_id INT,
    IN in_user_id INT,
    IN in_v_title VARCHAR(126),
	IN in_v_price INT,
	IN in_v_picture_link_1 VARCHAR(512),
    IN in_v_picture_link_2 VARCHAR(512),
    IN in_v_picture_link_3 VARCHAR(512),
    IN in_v_picture_link_4 VARCHAR(512),
    IN in_v_picture_link_5 VARCHAR(512),
    IN in_v_picture_link_6 VARCHAR(512),
    IN in_v_picture_link_7 VARCHAR(512),
    IN in_v_picture_link_8 VARCHAR(512),
    IN in_v_picture_link_9 VARCHAR(512),
    IN in_v_picture_link_10 VARCHAR(512),
    IN in_brand INT,
    IN in_kms INT,
    IN in_year INT,
    IN in_insuarance BOOLEAN,
    IN in_i_description VARCHAR(512),
    IN in_v_show_mo_no  BOOLEAN,
	IN in_v_description VARCHAR(512),
	IN in_v_location VARCHAR(512),
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
	IN in_cat_id INT,
    IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(vehicle_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.vehicle_inventory_mast;

IF NOT EXISTS(select vehicle_inventory_id from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.vehicle_inventory_mast
    		(vehicle_inventory_id,user_id,vehicle_inventory_code,inventory_type,v_title,v_price,v_picture_link_1,v_picture_link_2,v_picture_link_3,v_picture_link_4,v_picture_link_5,v_picture_link_6,v_picture_link_7,v_picture_link_8,v_picture_link_9,v_picture_link_10,brand,kms,year,insuarance,i_description,v_show_mo_no,v_description,v_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
			(get_max_inventory_id,in_user_id,concat("bike_",get_max_inventory_id),"bike",in_v_title,in_v_price,in_v_picture_link_1,in_v_picture_link_2,in_v_picture_link_3,in_v_picture_link_4,in_v_picture_link_5,in_v_picture_link_6,in_v_picture_link_7,in_v_picture_link_8,in_v_picture_link_9,in_v_picture_link_10,in_brand,in_kms,in_year,in_insuarance,CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,in_v_show_mo_no,in_v_description,in_v_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
	call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("bike_",get_max_inventory_id),"bike",1);
    select * from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = get_max_inventory_id  AND user_id = in_user_id;
ELSE
	UPDATE bsapp_db.vehicle_inventory_mast
	SET
	v_title = in_v_title,
    v_price = in_v_price,
    v_picture_link_1 = in_v_picture_link_1,
    v_picture_link_2 = in_v_picture_link_2,
    v_picture_link_3 = in_v_picture_link_3,
    v_picture_link_4 = in_v_picture_link_4,
    v_picture_link_5 = in_v_picture_link_5,
    v_picture_link_6 = in_v_picture_link_6,
    v_picture_link_7 = in_v_picture_link_7,
    v_picture_link_8 = in_v_picture_link_8,
    v_picture_link_9 = in_v_picture_link_9,
    v_picture_link_10 = in_v_picture_link_10,
    brand = in_brand,
    kms = in_kms,
    year = in_year,
    insuarance = in_insuarance,
    i_description = CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,
	v_show_mo_no = in_v_show_mo_no,
    v_description = in_v_description,
	v_location = in_v_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
    cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
select * from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_brand_mast_delete`(
    in in_car_brand_id int
)
BEGIN
     DELETE FROM bsapp_db.car_brand_mast where car_brand_id = in_car_brand_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_brand_mast_fill`()
BEGIN
    SELECT * FROM bsapp_db.car_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_brand_mast_save`(
    in in_car_brand_id int,
    in in_car_brand_name varchar(126)
)
BEGIN
IF NOT EXISTS(select car_brand_id from bsapp_db.car_brand_mast where car_brand_id = in_car_brand_id) THEN
 	INSERT INTO bsapp_db.car_brand_mast
		(car_brand_name,created_at)
	VALUES
		(in_car_brand_name,now());
ELSE
   UPDATE bsapp_db.car_brand_mast
	SET
	car_brand_name = in_car_brand_name,
    modified_at = now()
	WHERE car_brand_id = in_car_brand_id;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_fuel_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_fuel_type_mast_delete`(
 IN in_car_fuel_id int
)
BEGIN
	DELETE FROM bsapp_db.car_fuel_type_mast WHERE car_fuel_id = in_car_fuel_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_fuel_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_fuel_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_fuel_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_fuel_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_fuel_type_mast_save`(
	IN in_car_fuel_id INT,
    IN in_car_fuel_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select car_fuel_id from bsapp_db.car_fuel_type_mast where car_fuel_id = in_car_fuel_id) THEN
 	INSERT INTO bsapp_db.car_fuel_type_mast
		(car_fuel_name,created_at)
	VALUES
		(in_car_fuel_name,now());
ELSE
   UPDATE bsapp_db.car_fuel_type_mast
	SET
	car_fuel_name = in_car_fuel_name,
    modified_at = now()
	WHERE car_fuel_id = in_car_fuel_id;
  END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_model_name_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_model_name_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_model_name_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_model_name_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_model_name_mast_fill`(
	IN in_brand_id INT
)
BEGIN
	SELECT * FROM bsapp_db.car_model_name_mast WHERE brand_id = in_brand_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_model_name_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_model_name_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(255),
    IN in_brand_id INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_model_name_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_model_name_mast (name, brand_id,created_at) VALUES (in_name, in_brand_id,now());
	ELSE
		UPDATE bsapp_db.car_model_name_mast
        SET 
        name = in_name, 
        brand_id = in_brand_id ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_owner_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_owner_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_owner_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_owner_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_owner_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_owner_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_owner_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_owner_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(255)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_owner_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_owner_mast (name,created_at) VALUES (in_name,now());
	ELSE
		UPDATE bsapp_db.car_owner_mast 
        SET 
        name = in_name ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_registration_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_registration_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_registration_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_registration_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_registration_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_registration_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_registration_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_registration_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_registration_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_registration_mast (value,  created_at) 
        VALUES (in_value,  now());
	ELSE
		UPDATE bsapp_db.car_registration_mast
        SET
        value = in_value,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_rent_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_rent_inventory_mast_delete`(
   IN in_car_rent_inventory_id INT,
   IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.car_rent_inventory_mast CRI  ON  AD.inventory_code= CRI.car_rent_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_car_rent_inventory_id );
       DELETE FROM bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_rent_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_rent_inventory_mast_fill`(
	IN in_car_rent_inventory_code VARCHAR(126),
    IN in_cat_id INT
)
BEGIN
    	SELECT car_rent_inventory_id, 
			IFNULL(CR.user_id, "-") AS user_id, 
			IFNULL(AD.ads_id, "-") AS ads_id,
			IFNULL(CR.car_rent_inventory_code, "-") AS car_rent_inventory_code, 
			IFNULL(CR.car_title, "-") AS car_title,
			IFNULL(FORMAT(CR.c_price, 0), "-") AS c_price, CR.c_picture_link_1, 
			CR.c_picture_link_2, CR.c_picture_link_3, CR.c_picture_link_4, CR.c_picture_link_5, 
			CR.c_picture_link_6, CR.c_picture_link_7, CR.c_picture_link_8, CR.c_picture_link_9, 
			CR.c_picture_link_10, IFNULL(CR.c_km_limit, "-") AS c_km_limit,
			IFNULL(CT.value, "-") as c_car_type, 
			IFNULL(CR.c_extra_charge, "-") AS c_extra_charge,
			IFNULL(CR.c_per_day_charge, "-") AS c_per_day_charge, 
			IFNULL(CFT.car_fuel_name, "-") AS car_fuel_name,
			IFNULL(CR.c_with_fuel, "-") AS c_with_fuel, 
			IFNULL(CR.c_driver, "-") AS c_driver, 
			IFNULL(CR.c_transmission, "-") AS c_transmission,
			IFNULL(CR.c_show_mo_no, "-") AS c_show_mo_no,
			IFNULL(CR.c_description, "-") AS c_description, 
			IFNULL(CR.c_location, "-") AS c_location,
			IFNULL(CR.latitude, "-") AS latitude, 
			IFNULL(CR.longitude, "-") AS longitude,
			IFNULL(DATE_FORMAT(CR.created_at,'%d %b %y'), "-") AS ad_created,
			IFNULL(CAT.cat_name, "-") AS cat_name, 
			IFNULL(SUB.sub_cat_name, "-") AS sub_cat_name,
			IFNULL(UM.profile_picture_link, "-") as profile_picture, 
			IFNULL(UM.name, "-") as user_name,
			IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
			IFNULL(CR.cat_id, "-") as cat_id, 
			IFNULL(CR.sub_cat_id, "-") as sub_cat_id 
        FROM bsapp_db.car_rent_inventory_mast as CR
        LEFT JOIN bsapp_db.car_fuel_type_mast CFT ON CR.car_fuel_id = CFT.car_fuel_id
        LEFT JOIN bsapp_db.car_type_mast CT ON CT.id = CR.c_car_type
		LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = CR.car_rent_inventory_id 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = CR.user_id
        WHERE CR.car_rent_inventory_code = in_car_rent_inventory_code AND CR.cat_id = in_cat_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_rent_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_rent_inventory_mast_save`(
        IN in_car_rent_inventory_id INT,
        IN in_user_id INT,
		IN in_car_title VARCHAR(126),
		IN in_c_price INT,
		IN in_c_picture_link_1 VARCHAR(512),
		IN in_c_picture_link_2 VARCHAR(512),
		IN in_c_picture_link_3 VARCHAR(512),
		IN in_c_picture_link_4 VARCHAR(512),
		IN in_c_picture_link_5 VARCHAR(512),
		IN in_c_picture_link_6 VARCHAR(512),
		IN in_c_picture_link_7 VARCHAR(512),
		IN in_c_picture_link_8 VARCHAR(512),
		IN in_c_picture_link_9 VARCHAR(512),
		IN in_c_picture_link_10 VARCHAR(512),
		IN in_c_km_limit INT,
		IN in_c_car_type INT,
		IN in_c_extra_charge INT,
		IN in_c_per_day_charge INT,
        IN in_car_fuel_id INT,
		IN in_c_with_fuel BOOLEAN,
		IN in_c_driver BOOLEAN,
		IN in_c_transmission BOOLEAN,
		IN in_c_show_mo_no BOOLEAN,
        IN in_c_description VARCHAR(512),
		IN in_c_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(car_rent_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.car_rent_inventory_mast;

IF NOT EXISTS(select car_rent_inventory_id from bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.car_rent_inventory_mast
		(car_rent_inventory_id,user_id,car_rent_inventory_code,car_title,c_price,c_picture_link_1,c_picture_link_2,c_picture_link_3,c_picture_link_4,c_picture_link_5,c_picture_link_6,c_picture_link_7,c_picture_link_8,c_picture_link_9,c_picture_link_10,c_km_limit,c_car_type,c_extra_charge,c_per_day_charge,car_fuel_id,c_with_fuel,c_driver,c_transmission,c_show_mo_no,c_description,c_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("car_rent_",get_max_inventory_id),in_car_title,in_c_price,in_c_picture_link_1,in_c_picture_link_2,in_c_picture_link_3,in_c_picture_link_4,in_c_picture_link_5,in_c_picture_link_6,in_c_picture_link_7,in_c_picture_link_8,in_c_picture_link_9,in_c_picture_link_10,in_c_km_limit,in_c_car_type,in_c_extra_charge,in_c_per_day_charge,in_car_fuel_id,in_c_with_fuel,in_c_driver,in_c_transmission,in_c_show_mo_no,in_c_description,in_c_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("car_rent_",get_max_inventory_id),"car",1);
select * from  bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = get_max_inventory_id AND user_id = in_user_id;

ELSE
   UPDATE bsapp_db.car_rent_inventory_mast
	SET
	car_title = in_car_title,
    c_price = in_c_price,
    c_picture_link_1 = in_c_picture_link_1,
    c_picture_link_2 = in_c_picture_link_2,
    c_picture_link_3 = in_c_picture_link_3,
    c_picture_link_4 = in_c_picture_link_4,
    c_picture_link_5 = in_c_picture_link_5,
    c_picture_link_6 = in_c_picture_link_6,
    c_picture_link_7 = in_c_picture_link_7,
    c_picture_link_8 = in_c_picture_link_8,
    c_picture_link_9 = in_c_picture_link_9,
    c_picture_link_10 = in_c_picture_link_10,
    c_km_limit = in_c_km_limit,
    c_car_type = in_c_car_type,
    c_extra_charge = in_c_extra_charge,    
    c_per_day_charge = in_c_per_day_charge,
    car_fuel_id = in_car_fuel_id,
    c_with_fuel = in_c_with_fuel,
    c_driver = in_c_driver,
    c_transmission = in_c_transmission,
    c_show_mo_no = in_c_show_mo_no,
    c_description = in_c_description,
    c_location = in_c_location,
	latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id;
select * from  bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_sell_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_sell_inventory_mast_delete`(
	 IN in_car_sell_inventory_id INT,
     IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.car_sell_inventory_mast CSI  ON  AD.inventory_code= CSI.car_sell_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_car_sell_inventory_id );
	DELETE FROM bsapp_db.car_sell_inventory_mast WHERE car_sell_inventory_id=in_car_sell_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_sell_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_sell_inventory_mast_fill`(
    IN in_car_sell_inventory_code VARCHAR(126),
    IN in_cat_id INT
)
BEGIN
    SELECT 
		CSI.car_sell_inventory_id, IFNULL(CSI.user_id, "-") as user_id, 
        IFNULL(AD.ads_id, "-") as ads_id, IFNULL(CSI.car_sell_inventory_code, "-") as car_sell_inventory_code, 
        IFNULL(CSI.inventory_type, "-") as inventory_type, IFNULL(CSI.car_title, "-") as car_title, 
        IFNULL(CBR.car_brand_name, "-") as car_brand_name, IFNULL(CM.name, "-") as car_model_name, 
        IFNULL(CO.name, "-") as c_owner, IFNULL(YM.value, "-") as year, 
        IFNULL(SM.state_name, "-") as c_registration_state, IFNULL(CSI.c_km, "-") as c_km, 
        IFNULL(FORMAT(CSI.c_price, 0), "-") as c_price, CSI.c_picture_link_1,
        CSI.c_picture_link_2, CSI.c_picture_link_3, CSI.c_picture_link_4, CSI.c_picture_link_5, 
        CSI.c_picture_link_6, CSI.c_picture_link_7, CSI.c_picture_link_8, CSI.c_picture_link_9, 
        CSI.c_picture_link_10, IFNULL(CSI.year_of_registration, "-") as year_of_registration, 
        IFNULL(CSI.c_colour, "-") as c_colour, IFNULL(CSI.engine_capacity, "-") as engine_capacity, 
        IFNULL(CSI.mileage, "-") as mileage, IFNULL(CFT.car_fuel_name, "-") as car_fuel_name,
        IFNULL(CSI.transmission, "-") as transmission, IFNULL(CSI.c_insurance, "-") as c_insurance, 
        IFNULL(CSI.i_description, "-") as i_description, IFNULL(CSI.c_show_mo_no, "-") as c_show_mo_no, 
        IFNULL(CSI.c_description, "-") as c_description, IFNULL(CSI.c_location, "-") as c_location, 
        IFNULL(DATE_FORMAT(CSI.created_at,'%d %b %y'), "-") as ad_created, IFNULL(CSI.modified_at, "-") as modified_at, 
        IFNULL(UM.profile_picture_link, "-") as profile_picture, IFNULL(UM.name, "-") as user_name,
        IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created, 
        IFNULL(CSI.cat_id, "-") as cat_id, IFNULL(CSI.sub_cat_id, "-") as sub_cat_id,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name
	FROM bsapp_db.car_sell_inventory_mast CSI  
    LEFT JOIN bsapp_db.car_brand_mast CBR   ON  CSI.car_brand_id = CBR.car_brand_id 
    LEFT JOIN bsapp_db.car_fuel_type_mast CFT ON CSI.car_fuel_id = CFT.car_fuel_id
	LEFT JOIN bsapp_db.category_mast CAT ON CSI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON CSI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = CSI.car_sell_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = CSI.user_id
    LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CSI.car_model_name
    LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CSI.c_owner
    LEFT JOIN bsapp_db.year_mast YM ON YM.id = CSI.year
    LEFT JOIN bsapp_db.state_mast SM ON SM.id = CSI.c_registration
    WHERE CSI.car_sell_inventory_code = in_car_sell_inventory_code AND CSI.cat_id = in_cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_sell_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_sell_inventory_mast_save`(
		IN in_car_sell_inventory_id INT,
        IN in_user_id INT,
		IN in_car_title VARCHAR(126),
		IN in_car_brand_id INT,
		IN in_car_model_name INT,
		IN in_c_owner  INT,
		IN in_year INT,
		IN in_c_registration INT,
		IN in_c_km INT,
		IN in_c_price INT,
		IN in_c_picture_link_1 VARCHAR(512),
		IN in_c_picture_link_2 VARCHAR(512),
		IN in_c_picture_link_3 VARCHAR(512),
		IN in_c_picture_link_4 VARCHAR(512),
		IN in_c_picture_link_5 VARCHAR(512),
		IN in_c_picture_link_6 VARCHAR(512),
		IN in_c_picture_link_7 VARCHAR(512),
		IN in_c_picture_link_8 VARCHAR(512),
		IN in_c_picture_link_9 VARCHAR(512),
		IN in_c_picture_link_10 VARCHAR(512),
		IN in_year_of_registration VARCHAR(126),
		IN in_c_colour VARCHAR(45),
		IN in_engine_capacity VARCHAR(126),
		IN in_mileage VARCHAR(126),
        IN in_car_fuel_id INT,
		IN in_transmission BOOLEAN,
		IN in_c_insurance BOOLEAN,
        IN in_i_description VARCHAR(512),
		IN in_c_show_mo_no BOOLEAN,
		IN in_c_description VARCHAR(512),
		IN in_c_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
        
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(car_sell_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.car_sell_inventory_mast;

IF NOT EXISTS(select car_sell_inventory_id from bsapp_db.car_sell_inventory_mast where car_sell_inventory_id = in_car_sell_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.car_sell_inventory_mast
		(car_sell_inventory_id,user_id,car_sell_inventory_code,car_title,car_brand_id,car_model_name,c_owner,year,c_registration,c_km,c_price,c_picture_link_1,c_picture_link_2,c_picture_link_3,c_picture_link_4,c_picture_link_5,c_picture_link_6,c_picture_link_7,c_picture_link_8,c_picture_link_9,c_picture_link_10,year_of_registration,c_colour,engine_capacity,mileage,car_fuel_id,transmission,c_insurance,i_description,c_show_mo_no,c_description,c_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("car_sell_",get_max_inventory_id),in_car_title,in_car_brand_id,in_car_model_name,in_c_owner,in_year,in_c_registration,in_c_km,in_c_price,in_c_picture_link_1,in_c_picture_link_2,in_c_picture_link_3,in_c_picture_link_4,in_c_picture_link_5,in_c_picture_link_6,in_c_picture_link_7,in_c_picture_link_8,in_c_picture_link_9,in_c_picture_link_10,in_year_of_registration,in_c_colour,in_engine_capacity,in_mileage,in_car_fuel_id,in_transmission,in_c_insurance,CASE WHEN c_insurance=TRUE THEN  in_i_description ELSE null END,in_c_show_mo_no,in_c_description,in_c_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("car_sell_",get_max_inventory_id),"car",1);
	select * from bsapp_db.car_sell_inventory_mast where car_sell_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.car_sell_inventory_mast
	SET
	car_title = in_car_title,
    car_brand_id = in_car_brand_id,
    car_model_name = in_car_model_name,
    c_owner = in_c_owner,
    year = in_year,
    c_registration = in_c_registration,
    c_km = in_c_km,
    c_price = in_c_price,
    c_picture_link_1 = in_c_picture_link_1,
    c_picture_link_2 = in_c_picture_link_2,
    c_picture_link_3 = in_c_picture_link_3,
    c_picture_link_4 = in_c_picture_link_4,
    c_picture_link_5 = in_c_picture_link_5,
    c_picture_link_6 = in_c_picture_link_6,
    c_picture_link_7 = in_c_picture_link_7,
    c_picture_link_8 = in_c_picture_link_8,
    c_picture_link_9 = in_c_picture_link_9,
    c_picture_link_10 = in_c_picture_link_10,
    year_of_registration = in_year_of_registration,
    c_colour = in_c_colour,
    engine_capacity = in_engine_capacity,    
    mileage = in_mileage,
    car_fuel_id = in_car_fuel_id,
    transmission = in_transmission,
    c_insurance = in_c_insurance,
    i_description = CASE WHEN c_insurance=TRUE THEN  in_i_description ELSE null END,
    c_show_mo_no = in_c_show_mo_no,
    c_description = in_c_description,
    c_location = in_c_location,
	latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE car_sell_inventory_id = in_car_sell_inventory_id AND user_id = in_user_id;
select * from bsapp_db.car_sell_inventory_mast where car_sell_inventory_id = in_car_sell_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_type_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_type_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_type_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_type_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(50)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_type_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_type_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.car_type_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_category_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_category_mast_delete`(
	IN  in_id int
)
BEGIN
	DELETE FROM bsapp_db.category_mast WHERE id = in_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_category_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_category_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.category_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_category_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_category_mast_save`(
	in in_id int,
    in in_cat_name varchar(126),
    IN in_cat_picture_link varchar(512)
)
BEGIN
IF NOT EXISTS(select id from bsapp_db.category_mast where id = in_id) THEN
 	INSERT INTO bsapp_db.category_mast
		(cat_name,cat_picture_link,created_at)
	VALUES
		(in_cat_name,in_cat_picture_link,now());
ELSE
   UPDATE bsapp_db.category_mast
	SET
	cat_name = in_cat_name,
     cat_picture_link = in_cat_picture_link,
     modified_at = now()
	WHERE id = in_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_commercial_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_commercial_brand_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.commercial_brand_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_commercial_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_commercial_brand_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.commercial_brand_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_commercial_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_commercial_brand_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.commercial_brand_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.commercial_brand_mast (name,created_at) VALUES (in_name,now());
	ELSE
		UPDATE bsapp_db.commercial_brand_mast
        SET 
        name = in_name ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_count_active_ads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_count_active_ads`(
	IN in_user_id INT,
    IN in_ad_status_id INT
)
BEGIN
	SELECT COUNT(*) AS 'Active Ads' FROM bsapp_db.ads_mast 
    WHERE user_id = in_user_id AND ad_status_id = in_ad_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_bike_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_bike_brand_mast_fill`(

)
BEGIN
	SELECT id as id,name as value FROM bsapp_db.bike_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_brand_mast_fill`(

)
BEGIN
	SELECT car_brand_id as id,car_brand_name as value FROM bsapp_db.car_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_fuel_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_fuel_type_mast_fill`(

)
BEGIN
	SELECT car_fuel_id as id,car_fuel_name as value FROM bsapp_db.car_fuel_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_owner_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_owner_mast_fill`(

)
BEGIN
	SELECT id as id,name as value FROM bsapp_db.car_owner_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_type_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.car_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_commercial_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_commercial_brand_mast_fill`(

)
BEGIN
	SELECT id as id,name as value FROM bsapp_db.commercial_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_job_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_job_type_mast_fill`(

)
BEGIN
	SELECT j_type_id as id,j_type_name as value FROM bsapp_db.job_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_mobile_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_mobile_brand_mast_fill`(

)
BEGIN
	SELECT brand_id as id, brand_name as value FROM bsapp_db.mobile_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_mobile_ram_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_mobile_ram_mast_fill`(

)
BEGIN
	SELECT id as id, value as value FROM bsapp_db.mobile_ram_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_mobile_rom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_mobile_rom_mast_fill`(

)
BEGIN
	SELECT id as id, value as value FROM bsapp_db.mobile_rom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_cabin_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_cabin_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_cabin_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_car_parking_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_car_parking_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_employee_capacity_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_employee_capacity_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_employee_capacity_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_furnishing_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_furnishing_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_listed_by_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_listed_by_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_type_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_washroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_washroom_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_washroom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_position_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_position_type_mast_fill`(

)
BEGIN
	SELECT p_type_id as id,p_type_name as value FROM bsapp_db.position_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_bathroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_bathroom_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.property_bathroom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_bedroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_bedroom_mast_fill`(

)
BEGIN
	SELECT id,value FROM bsapp_db.property_bedroom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_car_parking_mast_fill`(

)
BEGIN
	SELECT p_car_parking_id as id,p_car_parking_name as value FROM bsapp_db.property_car_parking_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_furnishing_mast_fill`(

)
BEGIN
	SELECT p_furnishing_id as id,p_furnishing_name as value FROM bsapp_db.property_furnishing_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_listed_by_mast_fill`(

)
BEGIN
	SELECT p_listed_by_id as id,p_listed_by_name as value FROM bsapp_db.property_listed_by_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_preferred_renters_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_preferred_renters_mast_fill`(

)
BEGIN
	SELECT p_preferred_renters_id as id,p_preferred_renters_name as value FROM bsapp_db.property_preferred_renters_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_type_mast_fill`(

)
BEGIN
	SELECT p_type_id as id,p_type_name as value FROM bsapp_db.property_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_salary_period_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_salary_period_mast_fill`(

)
BEGIN
	SELECT s_p_id as id,s_p_name as value FROM bsapp_db.salary_period_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_vehicle_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_vehicle_type_mast_fill`(

)
BEGIN
	SELECT v_type_id as id,v_type_name as value FROM bsapp_db.vehicle_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_year_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_year_mast_fill`(

)
BEGIN
	SELECT id,value FROM bsapp_db.year_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_mast_delete`(
	IN in_device_id INT
)
BEGIN
	DELETE FROM bsapp_db.device_mast WHERE id = in_device_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_mast_fill`(
)
BEGIN
select *  from bsapp_db.device_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_mast_save`(
    in in_device_id int,
    in in_device_name varchar(45)
    
)
BEGIN

IF NOT EXISTS(select id from bsapp_db.device_mast where id = in_device_id) THEN
 	INSERT INTO bsapp_db.device_mast
		(name,created_at)
	VALUES
		(in_device_name,now());
ELSE
   UPDATE bsapp_db.device_mast
	SET
	name = in_device_name,
    modified_at= now()
	WHERE id = in_device_id;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_token_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_token_mast_delete`(
	IN in_device_token_id INT
)
BEGIN
	DELETE FROM bsapp_db.device_token_mast WHERE id = in_device_token_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_token_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_token_mast_fill`(
)
BEGIN
select *  from bsapp_db.device_token_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_token_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_token_mast_save`(
    in in_device_token_id int,
    in in_device_type int,
    in in_device_unq_id int,
    in in_user_id int  ,
    in in_device_token varchar(244)
)
BEGIN
IF EXISTS(SELECT user_id from bsapp_db.device_token_mast where user_id = in_user_id) THEN
	 UPDATE bsapp_db.device_token_mast
	SET
	device_type = in_device_type,
    device_unq_id= in_device_unq_id,
    user_id = in_user_id,
    modified_at= now(),
    device_token = in_device_token
	WHERE user_id = in_user_id;
ELSEIF exists(select device_unq_id from bsapp_db.device_token_mast where device_unq_id = in_device_unq_id) THEN
	UPDATE bsapp_db.device_token_mast
	SET
	device_type = in_device_type,
    device_unq_id= in_device_unq_id,
    user_id = in_user_id,
    modified_at= now(),
    device_token = in_device_token
	WHERE device_token = in_device_token;
ELSE 
		INSERT INTO bsapp_db.device_token_mast
		(device_type,device_unq_id,user_id,created_at,device_token)
	VALUES
		(in_device_type,in_device_unq_id,in_user_id,now(),in_device_token);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dispaly_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dispaly_type_mast_save`(
    in in_display_type_id int,
    in in_display_type_type varchar(256)
    
)
BEGIN
IF NOT EXISTS(select display_type_id from bsapp_db.display_type_mast where display_type_id = in_display_type_id) THEN
 	INSERT INTO bsapp_db.display_type_mast
		(display_type_type,display_type_created_date)
	VALUES
		(in_display_type_type,now());
ELSE
   UPDATE bsapp_db.display_type_mast
	SET
	display_type_type = in_display_type_type,
    display_type_modified_date= now()
	WHERE display_type_id = in_display_type_id;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_display_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_display_type_mast_delete`(
	IN in_display_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.display_type_mast WHERE display_type_id = in_display_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_display_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_display_type_mast_fill`(
)
BEGIN
	SELECT * FROM bsapp_db.display_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dynamic_field_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dynamic_field_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.dynamic_field_mast
    WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dynamic_field_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dynamic_field_mast_fill`(
    IN in_display_type_id INT,
	IN in_cat_id INT
)
BEGIN
	SELECT bsapp_db.display_type_mast.display_type_type,
    bsapp_db.dynamic_field_mast.db_field,bsapp_db.dynamic_field_mast.display_name,
    bsapp_db.dynamic_field_mast.display_type_id,
    bsapp_db.dynamic_field_mast.cat_id,
    bsapp_db.dynamic_field_mast.sequence
    ,bsapp_db.dynamic_field_mast.icon,bsapp_db.dynamic_field_mast.is_active FROM bsapp_db.dynamic_field_mast 
    left join bsapp_db.display_type_mast on bsapp_db.dynamic_field_mast.display_type_id= bsapp_db.display_type_mast.display_type_id
    WHERE bsapp_db.dynamic_field_mast.display_type_id = in_display_type_id AND bsapp_db.dynamic_field_mast.cat_id = in_cat_id and is_active = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dynamic_field_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dynamic_field_mast_save`(
	IN in_id INT,
    IN in_db_field VARCHAR(126),
    IN in_display_name VARCHAR(256),
    IN in_display_type_id INT,
    IN in_cat_id INT,
    IN in_sequence INT,
    IN in_icon VARCHAR(256),
    IN in_is_active BOOL
)
BEGIN
	IF NOT EXISTS(SELECT * FROM bsapp_db.dynamic_field_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.dynamic_field_mast 
        (db_field, display_name, display_type_id, cat_id, sequence, icon, is_active)
        VALUES (in_db_field, in_display_name, in_display_type_id, in_cat_id, in_sequence, in_icon, in_is_active);
    ELSE
		UPDATE bsapp_db.dynamic_field_mast
        SET
        db_field = in_db_field,
        display_name = in_display_name,
        display_type_id = in_display_type_id,
        cat_id = in_cat_id,
        sequence = in_sequence,
        icon = in_icon,
        is_active = in_is_active
        WHERE
		id = in_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_favourites_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_favourites_mast_delete`(
	IN in_fav_id INT
)
BEGIN
	DELETE FROM bsapp_db.favourites_mast WHERE fav_id = in_fav_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_favourites_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_favourites_mast_fill`(
    IN in_user_id INT,
    IN in_limit INT,
    IN in_page_no INT
)
BEGIN
DECLARE  in_offset INT;
SET in_offset = (in_page_no -1) * in_limit;

select *,COUNT(*) OVER() AS "total_count" FROM(
(SELECT 
	FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    CS.c_picture_link_1 AS Image,
    CS.car_title AS Name,
    CS.c_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CS.c_location as location,
    DATE_FORMAT(CS.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(CS.modified_at,'%d %b %y') AS Modify_Date,
    CS.year AS car_year_of_registration,
    CS.c_km AS car_km,
    CS.c_owner AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_sell_inventory_mast CS
        LEFT JOIN  bsapp_db.favourites_mast FAV ON CS.car_sell_inventory_id = FAV.inventory_id   AND CS.car_sell_inventory_code = FAV.inventory_code   AND CS.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION 
   (SELECT 
	FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    AI.picture_link_1 AS Image,
    AI.title AS Name,
    AI.price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    AI.location as location,
    DATE_FORMAT(AI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(AI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
  bsapp_db.all_inventory_mast  AI
        LEFT JOIN bsapp_db.favourites_mast FAV ON AI.all_inventory_id = FAV.inventory_id    AND AI.all_inventory_code = FAV.inventory_code   AND AI.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION 
    (SELECT 
    FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y')   AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    CR.c_picture_link_1 AS Image,
    CR.car_title AS Name,
    CR.c_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CR.c_location as location,
    DATE_FORMAT(CR.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(CR.modified_at,'%d %b %y')  AS Modify_Date,
    0 AS car_year_of_registration,
    c_km_limit AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.favourites_mast FAV ON CR.car_rent_inventory_id = FAV.inventory_id   AND CR.car_rent_inventory_code = FAV.inventory_code     AND CR.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
    UNION 
	(SELECT 
    FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    JI.j_picture_link_1 AS Image,
    JI.j_title AS Name,
    0 AS price,
    JI.from_salary AS From_salary,
    JI.to_salary AS To_salary,
    JI.j_location as location,
    DATE_FORMAT(JI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(JI.modified_at,'%d %b %y')  AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    JT.j_type_name AS Job_type,
    SP.s_p_name AS Job_salary_period
FROM
     bsapp_db.job_inventory_mast JI
		LEFT JOIN bsapp_db.favourites_mast FAV ON JI.job_inventory_id = FAV.inventory_id   AND JI.job_inventory_code = FAV.inventory_code  AND JI.inventory_type = FAV.inventory_type
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
WHERE  FAV.user_id = in_user_id)
    UNION 
        (SELECT 
    FAV.fav_id AS Fav_id,    
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    MI.mo_picture_link_1 AS Image,
    MI.mo_title AS Name,
    MI.mo_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    MI.location as location,
    DATE_FORMAT(MI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(MI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    MI.mo_ram AS Mobile_ram,
    MI.mo_rom AS Mobile_rom,
    BR.brand_name AS Mobile_brand,
    MI.mo_colour AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.mobile_inventory_mast MI
	    LEFT JOIN bsapp_db.favourites_mast FAV ON MI.mo_inventory_id = FAV.inventory_id  AND MI.mo_inventory_code = FAV.inventory_code  AND MI.inventory_type = FAV.inventory_type
		LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION
      (SELECT 
    FAV.fav_id AS Fav_id,  
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    OI.o_picture_link_1 AS Image,
    OI.o_title AS Name,
    OI.o_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    OI.o_location as location,
    DATE_FORMAT(OI.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(OI.modified_at,'%d %b %y')  AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    OI.cabin AS Cabin,
    OI.washroom AS Washroom,
    OI.o_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.office_inventory_mast OI
       LEFT JOIN bsapp_db.favourites_mast FAV ON OI.office_inventory_id = FAV.inventory_id  AND OI.office_inventory_code = FAV.inventory_code  AND OI.inventory_type = FAV.inventory_type
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION 
(SELECT 
	FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    PI.p_picture_link_1 AS Image,
    PI.p_title AS Name,
    PI.p_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    PI.p_location as location,
    DATE_FORMAT(PI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(PI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    PI.p_bedroom AS Bedroom,
    PI.p_bathroom AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    PI.p_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
      bsapp_db.property_inventory_mast PI
	   LEFT JOIN bsapp_db.favourites_mast FAV ON PI.property_inventory_id = FAV.inventory_id  AND PI.property_inventory_code = FAV.inventory_code AND PI.inventory_type = FAV.inventory_type
	   LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
       LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
 UNION 
    (SELECT 
    FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    VI.v_picture_link_1 AS Image,
    VI.v_title AS Name,
    VI.v_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    VI.v_location as location,
    DATE_FORMAT(VI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(VI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    VI.year AS year_of_registration,
    VI.kms AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
    bsapp_db.vehicle_inventory_mast VI
		LEFT JOIN bsapp_db.favourites_mast FAV  ON VI.vehicle_inventory_id = FAV.inventory_id   AND VI.vehicle_inventory_code  = FAV.inventory_code  AND VI.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id        
WHERE  FAV.user_id = in_user_id))AS SUBQ limit in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_favourites_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_favourites_mast_save`(
	IN in_fav_id INT,
    IN in_inventory_id INT,
    IN in_user_id INT,
    IN in_inventory_code VARCHAR(126),
    IN in_inventory_type VARCHAR(126)
)
BEGIN

IF NOT EXISTS(SELECT user_id,inventory_id,inventory_code,inventory_type FROM bsapp_db.favourites_mast WHERE  user_id = in_user_id AND inventory_code = in_inventory_code AND inventory_id = in_inventory_id AND inventory_type = in_inventory_type ) THEN
 	INSERT INTO bsapp_db.favourites_mast
		(inventory_id,user_id,inventory_code,inventory_type,created_at)
	VALUES
		(in_inventory_id,in_user_id,in_inventory_code,in_inventory_type,now());
	
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_filter_mast_delete`(	
	IN in_f_id INT
)
BEGIN
	DELETE FROM bsapp_db.filter_mast where f_id = in_f_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_filter_mast_fill`(
	IN in_cat_id INT,
    IN in_sub_cat_id INT
)
BEGIN
	SELECT FM.f_id,CAT.cat_name,SUB.sub_cat_name,FORMAT(FM.from_price, 0) AS from_price, FORMAT(FM.to_price, 0) AS to_price,FM.price_description,FM.from_distance,FM.to_distance,FM.distance_description,FM.publish_date,MBM.brand_name,PTM.p_type_name,FM.p_bedroom,FM.p_bathroom,PSM.p_status_title,FM.car_brand,FM.car_year,FM.car_kms,VTM.v_type_name,JTM.j_type_name,PO.p_type_name,SPM.s_p_name,FM.from_salary,FM.to_salary,FM.salary_description,FM.budget,FM.created_at,FM.modified_at 
    FROM bsapp_db.filter_mast FM
	LEFT JOIN bsapp_db.mobile_brand_mast MBM   ON  FM.m_brand_id = MBM.brand_id 
    LEFT JOIN bsapp_db.property_type_mast PTM ON FM.p_type_id = PTM.p_type_id
    LEFT JOIN bsapp_db.property_status_mast PSM ON FM.p_status_id = PSM.p_status_id
    LEFT JOIN bsapp_db.vehicle_type_mast VTM ON FM.v_type_id = VTM.v_type_id
    LEFT JOIN bsapp_db.job_type_mast JTM ON FM.j_type_id = JTM.j_type_id
    LEFT JOIN bsapp_db.position_type_mast PO ON FM.j_position_type_id = PO.p_type_id
    LEFT JOIN bsapp_db.salary_period_mast SPM ON FM.j_s_period_id = SPM.s_p_id
	LEFT JOIN bsapp_db.category_mast CAT ON FM.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON FM.sub_cat_id = SUB.id
    WHERE FM.cat_id = in_cat_id AND FM.sub_cat_id = in_sub_cat_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_filter_mast_save`(
	IN in_f_id INT,
	IN in_cat_id INT,
    IN in_sub_cat_id INT,
    IN in_from_price INT,
    IN in_to_price INT,
    IN in_from_distance INT,
    IN in_to_distance INT,
    IN in_publish_date DATETIME,
    IN in_m_brand_id INT,
    IN in_p_type_id INT,
    IN in_p_bedroom INT,
    IN in_p_bathroom INT,
    IN in_p_status_id INT,
    IN in_car_brand VARCHAR(126),
    IN in_car_year INT,
    IN in_car_kms INT,
    IN in_v_type_id INT,
    IN in_j_type_id INT,
    IN in_j_position_type_id INT,
    IN in_j_s_period_id INT,
    IN in_from_salary INT,
    IN in_to_salary INT,
    IN in_budget INT

)
BEGIN
IF NOT EXISTS(select f_id from bsapp_db.filter_mast where f_id = in_f_id) THEN
	INSERT INTO bsapp_db.filter_mast
    		(f_id,cat_id,sub_cat_id,from_price,to_price,price_description,from_distance,to_distance,distance_description,publish_date,m_brand_id,p_type_id,p_bedroom,p_bathroom,p_status_id,car_brand,car_year,car_kms,v_type_id,j_type_id,j_position_type_id,j_s_period_id,from_salary,to_salary,salary_description,budget,created_at)
	VALUES
			(in_f_id,in_cat_id,in_sub_cat_id,in_from_price,in_to_price,concat("Rs.",in_from_price,"  -  Rs.",in_to_price),in_from_distance,in_to_distance,concat(in_from_distance," Km  -  ",in_to_distance," Km"),in_publish_date,in_m_brand_id,in_p_type_id,in_p_bedroom,in_p_bathroom,in_p_status_id,in_car_brand,in_car_year,in_car_kms,in_v_type_id,in_j_type_id,in_j_position_type_id,in_j_s_period_id,in_from_salary,in_to_salary,concat("Rs.",in_from_salary,"  -  Rs.",in_to_salary),in_budget,now());
ELSE
 UPDATE bsapp_db.filter_mast
	SET
	f_id = in_f_id,
    cat_id = in_cat_id,
    sub_cat_id = in_sub_cat_id,
    from_price = in_from_price,
    to_price = in_to_price,
    price_description = concat("Rs.",in_from_price,"  -  Rs.",in_to_price),
    from_distance = in_from_distance,
    to_distance = in_to_distance,
    distance_description = concat(in_from_distance," Km  -  ",in_to_distance," Km"),
    publish_date = in_publish_date,
    m_brand_id = in_m_brand_id,
    p_type_id = in_p_type_id,
    p_bedroom = in_p_bedroom,
    p_bathroom = in_p_bathroom,
    p_status_id = in_p_status_id,
    car_brand = in_car_brand,
    car_year = in_car_year,    
    car_kms = in_car_kms,
    v_type_id = in_v_type_id,
    j_type_id = in_j_type_id,
    j_position_type_id = in_j_position_type_id,
    j_s_period_id = in_j_s_period_id,
    from_salary = in_from_salary,
    to_salary = in_to_salary,
    salary_description = concat("Rs.",in_from_salary,"  -  Rs.",in_to_salary),
    budget = in_budget,
    modified_at = now()
	WHERE f_id = in_f_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_firebase_authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_firebase_authentication`(

in in_mobile_no varchar(16),
in in_mail_id varchar(64),
in in_name varchar(126),
in in_bio_description varchar(512),
in in_profile_picture_link varchar(512),
in in_mobile_cc_code varchar(8),
in in_user_cat varchar(5),
in in_password varchar(126),
in in_firebase_auth_token varchar(250)
)
BEGIN
DECLARE in_login_seq_id BIGINT;

IF NOT EXISTS(select firebase_auth_token from bsapp_db.user_mast where  firebase_auth_token = in_firebase_auth_token) THEN
 	call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
    INSERT INTO bsapp_db.user_mast
		(login_id,mobile_no,mail_id,name,bio_description,profile_picture_link,mobile_cc_code,user_cat,password,firebase_auth_token,created_at)
	VALUES
		(in_login_seq_id,in_mobile_no,in_mail_id,in_name,in_bio_description,in_profile_picture_link,in_mobile_cc_code,in_user_cat,in_password,in_firebase_auth_token,now());
	select * from bsapp_db.user_mast where firebase_auth_token = in_firebase_auth_token;
ELSE
   UPDATE bsapp_db.user_mast
	SET
	mail_id = in_mail_id,
    name = in_name,
    bio_description = in_bio_description,
    profile_picture_link = in_profile_picture_link,
    user_cat = in_user_cat,
    modified_at = now()
	WHERE firebase_auth_token = in_firebase_auth_token;
select * from bsapp_db.user_mast where firebase_auth_token = in_firebase_auth_token;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_forgot_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_forgot_password`(
	IN in_mobile_no  VARCHAR(16),
	IN in_mobile_cc_code VARCHAR(8),
    IN in_mail_id VARCHAR(64),
    IN in_password VARCHAR(126)
)
BEGIN
IF(in_mobile_no = "from_email") THEN
IF NOT EXISTS(
	   SELECT mail_id
	   FROM bsapp_db.user_mast 
	   WHERE mail_id = in_mail_id)
	THEN
	SELECT "EMAIL ID NOT EXIST" as MSG;
ELSE
    UPDATE bsapp_db.user_mast
		SET
		password = in_password,
        modified_at = now()
		WHERE mail_id = in_mail_id ;
      SELECT "UPDATE PASSWORD" as SUCCESS_MSG;
  END IF;
	
  ELSE
  IF NOT EXISTS(
	   SELECT mobile_no,mobile_cc_code
	   FROM bsapp_db.user_mast 
	   WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code )
	THEN
	SELECT "MOBILE NUMBER NOT EXIST" as MSG;
ELSE
    UPDATE bsapp_db.user_mast
		SET
		password = in_password,
        modified_at = now()
		WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code ;
      SELECT "UPDATE PASSWORD" as SUCCESS_MSG;
    END IF;  
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_ad_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_ad_details`(
	IN in_user_id INT,
    IN in_ad_status_id INT
)
BEGIN
    SELECT * FROM(
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		CS.c_picture_link_1 AS Image,
		CS.car_title AS Name,
		FORMAT(CS.c_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		CS.c_location as location,
		SM.state_name AS car_registration_state,
		CS.c_km AS car_km,
		CO.name AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		YM.value AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast CS
        LEFT JOIN  bsapp_db.ads_mast AD ON CS.car_sell_inventory_id = AD.inventory_id   AND CS.car_sell_inventory_code = AD.inventory_code   AND CS.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
	WHERE AD.user_id = in_user_id)
	UNION 
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		AI.picture_link_1 AS Image,
		AI.title AS Name,
		FORMAT(AI.price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		AI.location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.all_inventory_mast  AI
        LEFT JOIN bsapp_db.ads_mast AD ON AI.all_inventory_id = AD.inventory_id    AND AI.all_inventory_code = AD.inventory_code   AND AI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
	WHERE  AD.user_id = in_user_id)
	UNION 
    (SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		CR.c_picture_link_1 AS Image,
		CR.car_title AS Name,
		FORMAT(CR.c_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		CR.c_location as location,
		'' AS car_registration_state,
		c_km_limit AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_id = AD.inventory_id   AND CR.car_rent_inventory_code = AD.inventory_code     AND CR.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
	WHERE  AD.user_id = in_user_id)
    UNION 
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		JI.j_picture_link_1 AS Image,
		JI.j_title AS Name,
		0 AS price,
		JI.from_salary AS From_salary,
		JI.to_salary AS To_salary,
		JI.j_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		JT.j_type_name AS Job_type,
		SP.s_p_name AS Job_salary_period
	FROM
		bsapp_db.job_inventory_mast JI
		LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_id = AD.inventory_id   AND JI.job_inventory_code = AD.inventory_code  AND JI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
	WHERE AD.user_id = in_user_id)
    UNION 
	(SELECT 
		AD.ads_id AS Ads_id,    
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		MI.mo_picture_link_1 AS Image,
		MI.mo_title AS Name,
		FORMAT(MI.mo_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		MI.location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		RAM.value AS Mobile_ram,
		ROM.value AS Mobile_rom,
		BR.brand_name AS Mobile_brand,
		MI.mo_colour AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
	    LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_id = AD.inventory_id  AND MI.mo_inventory_code = AD.inventory_code  AND MI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
	WHERE AD.user_id = in_user_id)
	UNION
	(SELECT 
		AD.ads_id AS Ads_id,  
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		OI.o_picture_link_1 AS Image,
		OI.o_title AS Name,
		FORMAT(OI.o_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		OI.o_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		OC.value as Cabin,
		OW.value as Washroom,
		OI.o_sq_ft AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.office_inventory_mast OI
		LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_id = AD.inventory_id  AND OI.office_inventory_code = AD.inventory_code  AND OI.inventory_type = AD.inventory_type
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
	WHERE  AD.user_id = in_user_id)
	UNION 
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		PI.p_picture_link_1 AS Image,
		PI.p_title AS Name,
		FORMAT(PI.p_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		PI.p_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		BED.value as Bedroom,
		BAT.value as Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		PI.p_sq_ft AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
		LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_id = AD.inventory_id  AND PI.property_inventory_code = AD.inventory_code AND PI.inventory_type = AD.inventory_type
		LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
		LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
		LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
		LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
	WHERE AD.user_id = in_user_id)
	UNION 
    (SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		VI.v_picture_link_1 AS Image,
		VI.v_title AS Name,
		FORMAT(VI.v_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		VI.v_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		YM.value AS year_of_registration,
		VI.kms AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
		LEFT JOIN bsapp_db.ads_mast AD  ON VI.vehicle_inventory_id = AD.inventory_id AND VI.vehicle_inventory_code  = AD.inventory_code  AND VI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
        LEFT JOIN  bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id        
	WHERE AD.user_id = in_user_id)) AS SUBQ
    WHERE ad_status_code = in_ad_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_followers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_followers`(
	IN in_user_id VARCHAR(126)
)
BEGIN
	SELECT UM.*
    FROM bsapp_db.user_followers_mast UF
    LEFT JOIN bsapp_db.user_mast UM ON UF.user_id = UM.user_id
    WHERE UF.user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_followers_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_followers_count`(
	IN in_user_id INT
)
BEGIN
	SELECT COUNT(DISTINCT follower_id) AS "followers" 
    FROM bsapp_db.user_followers_mast
    WHERE user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_following` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_following`(
	IN in_user_id INT
)
BEGIN
	SELECT UM.*
    FROM bsapp_db.user_followers_mast UF
    LEFT JOIN bsapp_db.user_mast UM ON UF.user_id = UM.login_id
    WHERE UF.follower_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_following_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_following_count`(
	IN in_user_id INT
)
BEGIN
	SELECT COUNT(DISTINCT user_id) AS "following" 
    FROM bsapp_db.user_followers_mast
    WHERE follower_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_by_inventory_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_user_by_inventory_code`(
	IN in_inventory_code VARCHAR(126)
)
BEGIN
	SELECT login_id, mail_id, name, mobile_no, created_at
    FROM bsapp_db.user_mast UM
    WHERE login_id IN (
		SELECT user_id FROM bsapp_db.car_sell_inventory_mast WHERE car_sell_inventory_code = in_inventory_code
        UNION
		SELECT user_id FROM bsapp_db.car_rent_inventory_mast WHERE car_rent_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.all_inventory_mast WHERE all_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.job_inventory_mast WHERE job_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.mobile_inventory_mast WHERE mo_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.office_inventory_mast WHERE office_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.property_inventory_mast WHERE property_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_code = in_inventory_code
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_ad_status_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_ad_status_mast_save_update`(
)
BEGIN
	UPDATE bsapp_db.ads_mast
	SET ad_status_id = 2
    WHERE ad_status_id IS NULL 
	OR ad_status_id = 0 
    OR ad_status_id = 1 ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_inventory_mast_delete`(
	IN in_job_inventory_id INT,
    IN in_user_id INT	
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.job_inventory_mast JI  ON  AD.inventory_code= JI.job_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_job_inventory_id );
		DELETE FROM bsapp_db.job_inventory_mast WHERE job_inventory_id = in_job_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_inventory_mast_fill`(
	IN in_job_inventory_code VARCHAR(126),
    IN in_cat_id INT	
)
BEGIN
		SELECT JI.job_inventory_id, IFNULL(JI.user_id, "-") as user_id, 
			IFNULL(AD.ads_id, "-") as ads_id, IFNULL(JI.job_inventory_code, "-") as job_inventory_code,
			IFNULL(JI.j_title, "-") as j_title, IFNULL(FORMAT(JI.from_salary, 0), "-") as from_salary,
			IFNULL(FORMAT(JI.to_salary, 0), "-") as to_salary, JI.j_picture_link_1, 
			JI.j_picture_link_2, JI.j_picture_link_3, JI.j_picture_link_4, JI.j_picture_link_5,
			JI.j_picture_link_6, JI.j_picture_link_7, JI.j_picture_link_8, JI.j_picture_link_9,
			JI.j_picture_link_10, IFNULL(JT.j_type_name, "-") as j_type_name,
			IFNULL(SP.s_p_name, "-") as s_p_name, IFNULL(PT.p_type_name, "-") as p_type_name,
			IFNULL(JI.j_designation, "-") as j_designation, IFNULL(JI.j_show_mo_no, "-") as j_show_mo_no,
			IFNULL(JI.j_description, "-") as j_description , IFNULL(JI.j_location, "-") as j_location,
			IFNULL(DATE_FORMAT(JI.created_at,'%d %b %y'), "-") as ad_created,
			IFNULL(JI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
			IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
			IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
			IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.job_type_mast JT ON JI.j_type_id = JT.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON JI.s_p_id = SP.s_p_id
        LEFT JOIN bsapp_db.position_type_mast PT ON JI.p_type_id = PT.p_type_id
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = JI.job_inventory_id 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = JI.user_id
        WHERE JI.job_inventory_code = in_job_inventory_code AND JI.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_inventory_mast_save`(
IN in_job_inventory_id INT,
    IN in_user_id INT,
	IN in_j_title VARCHAR(126),
	IN in_from_salary INT,
    IN in_to_salary INT,
	IN in_j_picture_link_1 VARCHAR(512),
    IN in_j_picture_link_2 VARCHAR(512),
    IN in_j_picture_link_3 VARCHAR(512),
    IN in_j_picture_link_4 VARCHAR(512),
    IN in_j_picture_link_5 VARCHAR(512),
    IN in_j_picture_link_6 VARCHAR(512),
    IN in_j_picture_link_7 VARCHAR(512),
    IN in_j_picture_link_8 VARCHAR(512),
    IN in_j_picture_link_9 VARCHAR(512),
    IN in_j_picture_link_10 VARCHAR(512),
    IN in_j_type_id INT,
    IN in_s_p_id INT,
    IN in_p_type_id INT,
    IN in_j_designation VARCHAR(126),
    IN in_j_show_mo_no  BOOLEAN,
	IN in_j_description VARCHAR(512),
	IN in_j_location VARCHAR(126),
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
	IN in_cat_id INT,
	IN in_sub_cat_id INT)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(job_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.job_inventory_mast;

IF NOT EXISTS(select job_inventory_id from bsapp_db.job_inventory_mast where job_inventory_id = in_job_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.job_inventory_mast
    		(job_inventory_id,user_id,job_inventory_code,j_title,from_salary,to_salary,j_picture_link_1,j_picture_link_2,j_picture_link_3,j_picture_link_4,j_picture_link_5,j_picture_link_6,j_picture_link_7,j_picture_link_8,j_picture_link_9,j_picture_link_10,j_type_id,s_p_id,p_type_id,j_designation,j_show_mo_no,j_description,j_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
			(get_max_inventory_id,in_user_id,concat("job_",get_max_inventory_id),in_j_title,in_from_salary,in_to_salary,in_j_picture_link_1,in_j_picture_link_2,in_j_picture_link_3,in_j_picture_link_4,in_j_picture_link_5,in_j_picture_link_6,in_j_picture_link_7,in_j_picture_link_8,in_j_picture_link_9,in_j_picture_link_10,in_j_type_id,in_s_p_id,in_p_type_id,in_j_designation,in_j_show_mo_no,in_j_description,in_j_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("job_",get_max_inventory_id),"job",1);	
select * from bsapp_db.job_inventory_mast where job_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
	UPDATE bsapp_db.job_inventory_mast
	SET
	j_title = in_j_title,
    from_salary = in_from_salary,
    to_salary = in_to_salary,
    j_picture_link_1 = in_j_picture_link_1,
    j_picture_link_2 = in_j_picture_link_2,
    j_picture_link_3 = in_j_picture_link_3,
    j_picture_link_4 = in_j_picture_link_4,
    j_picture_link_5 = in_j_picture_link_5,
    j_picture_link_6 = in_j_picture_link_6,
    j_picture_link_7 = in_j_picture_link_7,
    j_picture_link_8 = in_j_picture_link_8,
    j_picture_link_9 = in_j_picture_link_9,
    j_picture_link_10 = in_j_picture_link_10,
    j_type_id = in_j_type_id,
    s_p_id = in_s_p_id,
    p_type_id = in_p_type_id,
    j_designation = in_j_designation,
	j_show_mo_no = in_j_show_mo_no,
    j_description = in_j_description,
	j_location = in_j_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE job_inventory_id = in_job_inventory_id AND user_id = in_user_id;
select * from bsapp_db.job_inventory_mast where job_inventory_id = in_job_inventory_id AND user_id = in_user_id;
END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_package_inventory_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_package_inventory_mast_save_update`(
)
BEGIN
  UPDATE bsapp_db.package_inventory_mast 
  SET bsapp_db.package_inventory_mast.is_active = 0
  WHERE bsapp_db.package_inventory_mast.end_date < now();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_purchase_ads_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_purchase_ads_mast_save_update`(
)
BEGIN
  UPDATE bsapp_db.purchase_ads_mast 
  SET bsapp_db.purchase_ads_mast.is_active = 0
  WHERE bsapp_db.purchase_ads_mast.end_date_time < now();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_type_mast_delete`(
	IN in_j_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.job_type_mast WHERE j_type_id = in_j_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.job_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_type_mast_save`(
	IN in_j_type_id INT,
    IN in_j_type_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select j_type_id from bsapp_db.job_type_mast where j_type_id = in_j_type_id) THEN
 	INSERT INTO bsapp_db.job_type_mast
		(j_type_name,created_at)
	VALUES
		(in_j_type_name,now());
ELSE
	UPDATE bsapp_db.job_type_mast
	SET
	j_type_name = in_j_type_name,
    modified_at = now()
	WHERE j_type_id = in_j_type_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_likes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_likes`(
	IN in_ads_id INT,
    IN in_likes BOOLEAN
)
BEGIN

   UPDATE bsapp_db.ads_mast 
	SET
    likes = CASE WHEN in_likes = true  then  likes + 1 
                 WHEN in_likes = false  then   case when likes <= 0 then 0 else likes -1 END
    END
    WHERE ads_id = in_ads_id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_sequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_login_sequence`()
BEGIN

DECLARE max_seq_id BIGINT;
SET max_seq_id =(select  max(seq_id)  + 1  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
IF NOT EXISTS (SELECT seq_date FROM bsapp_db.login_sequence_mast WHERE seq_date = CURDATE()) THEN

	INSERT INTO bsapp_db.login_sequence_mast
		(seq_date,seq_id)
	VALUES
		(CURDATE(),(select concat((date_format(now(),'%y') * 10000 + date_format(now(),'%m') * 100 + date_format(now(),'%d')),'000001')));
	-- SELECT seq_id from bsapp_db.login_sequence_mast where seq_date = CURDATE();
    ELSE
		UPDATE bsapp_db.login_sequence_mast
		SET
        seq_id = max_seq_id
        WHERE seq_date = CURDATE();

	-- SELECT max_seq_id as seq_id;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_main_category_menu_web` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_main_category_menu_web`()
BEGIN
	SELECT SCM.id, SCM.cat_id, CM.cat_name, CM.cat_picture_link, CM.created_at, CM.modified_at, SCM.sub_cat_name
    FROM bsapp_db.category_mast CM
    LEFT JOIN 
    bsapp_db.sub_category_mast SCM 
	ON SCM.cat_id = CM.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_brand_mast_delete`(
   in in_brand_id int
)
BEGIN
   DELETE FROM bsapp_db.mobile_brand_mast where brand_id = in_brand_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_brand_mast_fill`()
BEGIN
   SELECT * FROM bsapp_db.mobile_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_brand_mast_save`(
    in in_brand_id int,
    in in_brand_name varchar(126)
)
BEGIN
IF NOT EXISTS(select brand_id from bsapp_db.mobile_brand_mast where brand_id = in_brand_id) THEN
 	INSERT INTO bsapp_db.mobile_brand_mast
		(brand_name,created_at)
	VALUES
		(in_brand_name,now());
ELSE
   UPDATE bsapp_db.mobile_brand_mast
	SET
	brand_name = in_brand_name,
    modified_at = now()
	WHERE brand_id = in_brand_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_inventory_mast_delete`(
	IN in_mo_inventory_id INT,
	IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.mobile_inventory_mast MI  ON  AD.inventory_code= MI.mo_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_mo_inventory_id );
  DELETE FROM bsapp_db.mobile_inventory_mast WHERE mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_inventory_mast_fill`(
   IN in_mo_inventory_code VARCHAR(126),
   IN in_cat_id INT
)
BEGIN
	SELECT 
		MI.mo_inventory_id, IFNULL(MI.mo_inventory_code, "-") as mo_inventory_code,
        IFNULL(MI.inventory_type, "-") as inventory_type, IFNULL(MI.mo_title, "-") as mo_title,
        IFNULL(BR.brand_name, "-") as brand_name, IFNULL(MI.model_name, "-") as model_name,
        IFNULL(RAM.value, "-") as mo_ram, IFNULL(ROM.value, "-") as mo_rom,
        IFNULL(MI.mo_colour, "-") as mo_colour, IFNULL(FORMAT(MI.mo_price, 0), "-") as mo_price,
        MI.mo_picture_link_1, MI.mo_picture_link_2, MI.mo_picture_link_3, MI.mo_picture_link_4, 
        MI.mo_picture_link_5, MI.mo_picture_link_6, MI.mo_picture_link_7, MI.mo_picture_link_8, 
        MI.mo_picture_link_9, MI.mo_picture_link_10, 
        IFNULL(MI.mo_front_camera, "-") as mo_front_camera, IFNULL(MI.mo_rear_camera, "-") as mo_rear_camera,
        IFNULL(MI.mo_battery, "-") as mo_battery, IFNULL(MI.mo_bill, "-") as mo_bill,
        IFNULL(mo_box, "-") as mo_box, IFNULL(MI.mo_charger, "-") as mo_charger,
        IFNULL(MI.mo_headset, "-") as mo_headset, IFNULL(MI.mo_warranty, "-") as mo_warranty,
        IFNULL(MI.insurance, "-") as insurance, IFNULL(MI.show_mo_no, "-") as show_mo_no,
        IFNULL(MI.description, "-") as description, IFNULL(MI.location, "-") as location,
        IFNULL(DATE_FORMAT(MI.created_at,'%d %b %y'), "-") as ad_created, IFNULL(MI.modified_at, "-") as modified_at,
        IFNULL(UM.profile_picture_link, "-") as profile_picture, IFNULL(UM.name, "-") as user_name,
        IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name, 
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
	FROM bsapp_db.mobile_inventory_mast MI  
    LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
	LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = MI.mo_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = MI.user_id
	LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
    LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
    WHERE MI.mo_inventory_code = in_mo_inventory_code AND MI.cat_id = in_cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_inventory_mast_save`(
		IN in_mo_inventory_id INT,
		IN in_user_id INT,
		IN in_mo_title VARCHAR(126),
		IN in_brand_id INT,
		IN in_model_name VARCHAR(126),
		IN in_mo_ram  INT,
		IN in_mo_rom INT,
		IN in_mo_colour VARCHAR(45),
		IN in_mo_price INT,
		IN in_mo_picture_link_1 VARCHAR(512),
		IN in_mo_picture_link_2 VARCHAR(512),
		IN in_mo_picture_link_3 VARCHAR(512),
		IN in_mo_picture_link_4 VARCHAR(512),
		IN in_mo_picture_link_5 VARCHAR(512),
		IN in_mo_picture_link_6 VARCHAR(512),
		IN in_mo_picture_link_7 VARCHAR(512),
		IN in_mo_picture_link_8 VARCHAR(512),
		IN in_mo_picture_link_9 VARCHAR(512),
		IN in_mo_picture_link_10 VARCHAR(512),
		IN in_mo_front_camera VARCHAR(126),
		IN in_mo_rear_camera VARCHAR(126),
		IN in_mo_battery VARCHAR(45),
		IN in_mo_bill BOOLEAN,
		IN in_mo_box BOOLEAN,
		IN in_mo_charger BOOLEAN,
		IN in_mo_headset BOOLEAN,
		IN in_mo_warranty BOOLEAN,
		IN in_insurance BOOLEAN,
		IN in_show_mo_no BOOLEAN,
		IN in_description VARCHAR(512),
		IN in_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(mo_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.mobile_inventory_mast;

IF NOT EXISTS(select mo_inventory_id from bsapp_db.mobile_inventory_mast where mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.mobile_inventory_mast
		(mo_inventory_id,user_id,mo_inventory_code,mo_title,brand_id,model_name,mo_ram,mo_rom,mo_colour,mo_price,mo_picture_link_1,mo_picture_link_2,mo_picture_link_3,mo_picture_link_4,mo_picture_link_5,mo_picture_link_6,mo_picture_link_7,mo_picture_link_8,mo_picture_link_9,mo_picture_link_10,mo_front_camera,mo_rear_camera,mo_battery,mo_bill,mo_box,mo_charger,mo_headset,mo_warranty,insurance,show_mo_no,description,location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("mobile_",get_max_inventory_id),in_mo_title,in_brand_id,in_model_name,in_mo_ram,in_mo_rom,in_mo_colour,in_mo_price,in_mo_picture_link_1,in_mo_picture_link_2,in_mo_picture_link_3,in_mo_picture_link_4,in_mo_picture_link_5,in_mo_picture_link_6,in_mo_picture_link_7,in_mo_picture_link_8,in_mo_picture_link_9,in_mo_picture_link_10,in_mo_front_camera,in_mo_rear_camera,in_mo_battery,in_mo_bill,in_mo_box,in_mo_charger,in_mo_headset,in_mo_warranty,in_insurance,in_show_mo_no,in_description,in_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("mobile_",get_max_inventory_id),"mobile",1);
	select * from bsapp_db.mobile_inventory_mast where mo_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.mobile_inventory_mast
	SET
	mo_title = mo_title,
    brand_id = in_brand_id,
    model_name = in_model_name,
    mo_ram = in_mo_ram,
    mo_rom = in_mo_rom,
    mo_colour = in_mo_colour,
    mo_price = in_mo_price,
    mo_picture_link_1 = in_mo_picture_link_1,
    mo_picture_link_2 = in_mo_picture_link_2,
    mo_picture_link_3 = in_mo_picture_link_3,
    mo_picture_link_4 = in_mo_picture_link_4,
    mo_picture_link_5 = in_mo_picture_link_5,
    mo_picture_link_6 = in_mo_picture_link_6,
    mo_picture_link_7 = in_mo_picture_link_7,
    mo_picture_link_8 = in_mo_picture_link_8,
    mo_picture_link_9 = in_mo_picture_link_9,
    mo_picture_link_10 = in_mo_picture_link_10,
    mo_front_camera = in_mo_front_camera,
    mo_rear_camera = in_mo_rear_camera,
    mo_battery = in_mo_battery,    
    mo_bill = in_mo_bill,
    mo_box = in_mo_box,
    mo_charger = in_mo_charger,
    mo_headset = in_mo_headset,
    mo_warranty = in_mo_warranty,
    insurance = in_insurance,
    show_mo_no = in_show_mo_no,
    description = in_description,
    location = in_location,
    latitude = in_latitude,
    longitude = in_longitude,    
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id;
	select * from bsapp_db.mobile_inventory_mast WHERE mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_ram_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_ram_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.mobile_ram_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_ram_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_ram_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.mobile_ram_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_ram_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_ram_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.mobile_ram_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.mobile_ram_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.mobile_ram_mast 
        SET 
        value = in_value,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_rom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_rom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.mobile_rom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_rom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_rom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.mobile_rom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_rom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_rom_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.mobile_rom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.mobile_rom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.mobile_rom_mast
        SET
        value = in_value,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_my_purchase_ads_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_my_purchase_ads_mast_fill`(
	IN in_user_id INT,
    IN in_is_active INT
)
BEGIN
	SELECT pa.id, pa.user_id, c.cat_name, pa.pkt_id,pkg.package_days,pkg.message, pa.price, pa.is_active, pa.total_ad, pa.use_ad, pa.ava_ad, pa.start_date_time, pa.end_date_time, pa.created_at
    FROM bsapp_db.purchase_ads_mast pa
    LEFT JOIN bsapp_db.package_price_mast pkg ON pa.pkt_id = pkg.id
    LEFT JOIN bsapp_db.category_mast c ON pkg.cat_id = c.id 
    WHERE user_id = in_user_id AND pa.is_active = in_is_active;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_near_by_location_category_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_near_by_location_category_data`(
	IN in_cat_id INT,
    IN in_sub_cat_id  varchar(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_price_from INT,
    IN in_price_to INT,
    IN in_brand_id VARCHAR(126),
    IN in_job_salary_from INT,
    IN in_job_salary_to INT,
    IN in_distance_from INT,
    IN in_distance_to INT,
    IN in_distance_sorting VARCHAR(126),
    IN in_date_sorting VARCHAR(126),
    IN in_price_sorting VARCHAR(126),
    IN in_sponser_near_by_location_category BOOLEAN
)
BEGIN
	CASE WHEN in_sponser_near_by_location_category = true 
    THEN
    call bsapp_db.sp_sponcer_near_by_location_category_show(in_cat_id,in_sub_cat_id,in_limit,in_page_no,in_latitude,in_longitude,in_price_from,in_price_to,in_brand_id,in_job_salary_from,in_job_salary_to,in_distance_from,in_distance_to,in_distance_sorting,in_date_sorting,in_price_sorting);
    ELSE
    call bsapp_db.sp_show_category_data(in_cat_id,in_sub_cat_id,in_limit,in_page_no,in_latitude,in_longitude,in_price_from,in_price_to,in_brand_id,in_job_salary_from,in_job_salary_to,in_distance_from,in_distance_to,in_distance_sorting,in_date_sorting,in_price_sorting);
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_near_by_location_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_near_by_location_data`(
	IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_from INT,
    IN in_to INT,
    IN in_limit INT,
    IN in_page_no INT,
    IN in_sponser_near_by_location BOOLEAN
)
BEGIN
	CASE WHEN in_sponser_near_by_location = true 
    THEN
    call bsapp_db.sp_sponcer_near_by_location_show(in_latitude,in_longitude,in_from,in_to,in_limit,in_page_no);
    ELSE
    call bsapp_db.sp_near_by_location_show(in_latitude,in_longitude,in_from,in_to,in_limit,in_page_no);
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_near_by_location_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_near_by_location_show`(
    IN in_latitude DECIMAL(11, 8),
    IN in_longitude DECIMAL(11, 8),
    IN in_from INT,
    IN in_to INT,
    IN in_limit INT,
    IN in_page_no INT
)
BEGIN DECLARE in_offset INT;

SET
    in_offset = (in_page_no - 1) * in_limit;

select *, count(*) over() AS total_record from
    (
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CS.c_picture_link_1 as Image,
                CS.car_title as Name,
                CS.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CS.c_location as location,
                DATE_FORMAT(CS.created_at, '%d %b %y') as Create_Date,
                CS.modified_at as Modify_Date,
                CASE
                    WHEN CS.modified_at > CS.created_at THEN CS.modified_at
                    ELSE CS.created_at
                END AS ORDER_DATE,
                SM.state_name AS car_registration_state,
                CS.c_km AS car_km,
                CO.name AS owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                YM.value as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_sell_inventory_mast AS CS
                LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CS.car_sell_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
                LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
                LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
                LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
                LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                AI.picture_link_1 as Image,
                AI.title as Name,
                AI.price as Price,
                0 as from_salary,
                0 as to_salary,
                AI.location as location,
                DATE_FORMAT(AI.created_at, '%d %b %y') as Create_Date,
                AI.modified_at as Modify_Date,
                CASE
                    WHEN AI.modified_at > AI.created_at THEN AI.modified_at
                    ELSE AI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.all_inventory_mast AS AI
                LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON AI.inventory_type = AD.inventory_type
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CR.c_picture_link_1 as Image,
                CR.car_title as Name,
                CR.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CR.c_location as location,
                DATE_FORMAT(CR.created_at, '%d %b %y') as Create_Date,
                CR.modified_at as Modify_Date,
                CASE
                    WHEN CR.modified_at > CR.created_at THEN CR.modified_at
                    ELSE CR.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                c_km_limit as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_rent_inventory_mast CR
                LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                JI.j_picture_link_1 as Image,
                JI.j_title as Name,
                0 as price,
                JI.from_salary as From_salary,
                JI.to_salary as To_salary,
                JI.j_location as location,
                DATE_FORMAT(JI.created_at, '%d %b %y') as Create_Date,
                JI.modified_at as Modify_Date,
                CASE
                    WHEN JI.modified_at > JI.created_at THEN JI.modified_at
                    ELSE JI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                JT.j_type_name as Job_type,
                SP.s_p_name as Job_salary_period
            FROM
                bsapp_db.job_inventory_mast JI
                LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
                LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
                LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                MI.mo_picture_link_1 as Image,
                MI.mo_title as Name,
                MI.mo_price as Price,
                0 as from_salary,
                0 as to_salary,
                MI.location as location,
                DATE_FORMAT(MI.created_at, '%d %b %y') as Create_Date,
                MI.modified_at as Modify_Date,
                CASE
                    WHEN MI.modified_at > MI.created_at THEN MI.modified_at
                    ELSE MI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                RAM.value AS Mobile_ram,
                ROM.value AS Mobile_rom,
                BR.brand_name AS Mobile_brand,
                MI.mo_colour AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.mobile_inventory_mast MI
                LEFT JOIN bsapp_db.mobile_brand_mast BR ON MI.brand_id = BR.brand_id
                LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
                LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                OI.o_picture_link_1 as Image,
                OI.o_title as Name,
                OI.o_price as Price,
                0 as from_salary,
                0 as to_salary,
                OI.o_location as location,
                DATE_FORMAT(OI.created_at, '%d %b %y') as Create_Date,
                OI.modified_at as Modify_Date,
                CASE
                    WHEN OI.modified_at > OI.created_at THEN OI.modified_at
                    ELSE OI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                OC.value as Cabin,
                OW.value as Washroom,
                OI.o_sq_ft as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.office_inventory_mast OI
                LEFT JOIN bsapp_db.office_cabin_mast OC ON OI.cabin = OC.id
                LEFT JOIN bsapp_db.office_washroom_mast OW ON OI.washroom = OW.id
                LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_furnishing_mast PF ON OI.p_furnishing_id = PF.p_furnishing_id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
                  WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
				AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                PI.p_picture_link_1 as Image,
                PI.p_title as Name,
                PI.p_price as Price,
                0 as from_salary,
                0 as to_salary,
                PI.p_location as location,
                DATE_FORMAT(PI.created_at, '%d %b %y') as Create_Date,
                PI.modified_at as Modify_Date,
                CASE
                    WHEN PI.modified_at > PI.created_at THEN PI.modified_at
                    ELSE PI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                BED.value as Bedroom,
                BAT.value as Bathroom,
                0 as Cabin,
                0 as Washroom,
                PI.p_sq_ft as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.property_inventory_mast PI
                LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_bathroom_mast BAT ON PI.p_bathroom = BAT.id
                LEFT JOIN bsapp_db.property_bedroom_mast BED ON PI.p_bedroom = BED.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                VI.v_picture_link_1 as Image,
                VI.v_title as Name,
                VI.v_price as Price,
                0 as from_salary,
                0 as to_salary,
                VI.v_location as location,
                DATE_FORMAT(VI.created_at, '%d %b %y') as Create_Date,
                VI.modified_at as Modify_Date,
                CASE
                    WHEN VI.modified_at > VI.created_at THEN VI.modified_at
                    ELSE VI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                YM.value as year_of_registration,
                VI.kms as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.vehicle_inventory_mast VI
                LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id
                LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
    ) AS SUBQ
ORDER BY
    ORDER_DATE DESC
limit
    in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_notification_subscribe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_notification_subscribe`(
	IN in_device_token_id INT,
    IN in_subscribe BOOLEAN
)
BEGIN
   UPDATE bsapp_db.device_token_mast
	SET
	subscribe = in_subscribe,
    modified_at = now()
	WHERE id = in_device_token_id;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_cabin_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_cabin_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_cabin_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_cabin_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_cabin_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_cabin_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_cabin_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_cabin_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_cabin_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_cabin_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.office_cabin_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_car_parking_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_car_parking_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_car_parking_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_car_parking_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_car_parking_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_car_parking_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_car_parking_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_car_parking_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_car_parking_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_car_parking_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_employee_capacity_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_employee_capacity_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_employee_capacity_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_employee_capacity_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_employee_capacity_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_employee_capacity_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_employee_capacity_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_employee_capacity_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(255)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_employee_capacity_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_employee_capacity_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.office_employee_capacity_mast 
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_furnishing_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_furnishing_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_furnishing_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_furnishing_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_furnishing_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_furnishing_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_furnishing_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(255)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_furnishing_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_furnishing_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_furnishing_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_inventory_mast_delete`(
		IN in_office_inventory_id INT,
        IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.office_inventory_mast OI  ON  AD.inventory_code= OI.office_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_office_inventory_id );
        DELETE FROM bsapp_db.office_inventory_mast WHERE office_inventory_id = in_office_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_inventory_mast_fill`(
		IN in_office_inventory_code VARCHAR(126),
        IN in_cat_id INT
)
BEGIN
        SELECT OI.office_inventory_id, IFNULL(OI.office_inventory_code, "-") as office_inventory_code,
			IFNULL(OI.user_id, "-") as user_id, IFNULL(OI.o_title, "-") as o_title,
			IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(OI.p_name, "-") as p_name,
            IFNULL(OC.value, "-") as cabin, IFNULL(OW.value, "-") as washroom,
            IFNULL(OI.o_sq_ft, "-") as o_sq_ft, IFNULL(FORMAT(OI.o_price, 0), "-") as o_price,
            OI.o_picture_link_1, OI.o_picture_link_2, OI.o_picture_link_3, OI.o_picture_link_4, 
            OI.o_picture_link_5, OI.o_picture_link_6, OI.o_picture_link_7, OI.o_picture_link_8,
            OI.o_picture_link_9, OI.o_picture_link_10, 
            IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name,
            IFNULL(OI.o_sup_builtup_area, "-") as o_sup_builtup_area, IFNULL(OI.o_carpet_area, "-") as o_carpet_area,
            IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(OEC.value, "-") as employee_capacity,
            IFNULL(FORMAT(OI.o_maintenance, 0), "-") as o_maintenance, IFNULL(OI.o_show_mo_no, "-") as o_show_mo_no,
            IFNULL(OI.o_description, "-") as o_description, IFNULL(OI.o_location, "-") as o_location,
            IFNULL(DATE_FORMAT(OI.created_at,'%d %b %y'), "-") as ad_created,
            IFNULL(OI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
            IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
			IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name, 
            IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  OI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  OI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  OI.p_listed_by_id =PL.p_listed_by_id
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.office_employee_capacity_mast OEC ON OI.employee_capacity = OEC.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = OI.office_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = OI.user_id
        WHERE OI.office_inventory_code = in_office_inventory_code AND OI.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_inventory_mast_save`(
        IN in_office_inventory_id INT,
        IN in_user_id INT,
		IN in_o_title VARCHAR(126),
		IN in_p_type_id INT,
        IN in_p_name VARCHAR(126),
        IN in_cabin INT,
        IN in_washroom INT,
        IN in_o_sq_ft DECIMAL(12,6),
        IN in_o_price INT,
		IN in_o_picture_link_1 VARCHAR(512),
		IN in_o_picture_link_2 VARCHAR(512),
		IN in_o_picture_link_3 VARCHAR(512),
		IN in_o_picture_link_4 VARCHAR(512),
		IN in_o_picture_link_5 VARCHAR(512),
		IN in_o_picture_link_6 VARCHAR(512),
		IN in_o_picture_link_7 VARCHAR(512),
		IN in_o_picture_link_8 VARCHAR(512),
		IN in_o_picture_link_9 VARCHAR(512),
		IN in_o_picture_link_10 VARCHAR(512),
		IN in_p_furnishing_id INT,
        IN in_p_car_parking_id INT,
        IN in_o_sup_builtup_area DECIMAL(12,6),
        IN in_o_carpet_area DECIMAL(12,6),
        IN in_p_listed_by_id INT,		
		IN in_employee_capacity INT,
		IN in_o_maintenance INT,
		IN in_o_show_mo_no BOOLEAN,
        IN in_o_description VARCHAR(512),
		IN in_o_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(office_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.office_inventory_mast;

IF NOT EXISTS(select office_inventory_id from bsapp_db.office_inventory_mast where office_inventory_id = in_office_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.office_inventory_mast
		(office_inventory_id,user_id,office_inventory_code,o_title,p_type_id,p_name,cabin,washroom,o_sq_ft,o_price,o_picture_link_1,o_picture_link_2,o_picture_link_3,o_picture_link_4,o_picture_link_5,o_picture_link_6,o_picture_link_7,o_picture_link_8,o_picture_link_9,o_picture_link_10,p_furnishing_id,p_car_parking_id,o_sup_builtup_area,o_carpet_area,p_listed_by_id,employee_capacity,o_maintenance,o_show_mo_no,o_description,o_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("office_",get_max_inventory_id),in_o_title,in_p_type_id,in_p_name,in_cabin,in_washroom,in_o_sq_ft,in_o_price,in_o_picture_link_1,in_o_picture_link_2,in_o_picture_link_3,in_o_picture_link_4,in_o_picture_link_5,in_o_picture_link_6,in_o_picture_link_7,in_o_picture_link_8,in_o_picture_link_9,in_o_picture_link_10,in_p_furnishing_id,in_p_car_parking_id,in_o_sup_builtup_area,in_o_carpet_area,in_p_listed_by_id,in_employee_capacity,in_o_maintenance,in_o_show_mo_no,in_o_description,in_o_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("office_",get_max_inventory_id),"office",1);
select * from bsapp_db.office_inventory_mast where office_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.office_inventory_mast
	SET
	o_title = in_o_title,
    p_type_id = in_p_type_id,
    p_name = in_p_name,
    cabin = in_cabin,
    washroom = in_washroom,
    o_sq_ft = in_o_sq_ft,
    o_price = in_o_price,
    o_picture_link_1 = in_o_picture_link_1,
    o_picture_link_2 = in_o_picture_link_2,
    o_picture_link_3 = in_o_picture_link_3,
    o_picture_link_4 = in_o_picture_link_4,
    o_picture_link_5 = in_o_picture_link_5,
    o_picture_link_6 = in_o_picture_link_6,
    o_picture_link_7 = in_o_picture_link_7,
    o_picture_link_8 = in_o_picture_link_8,
    o_picture_link_9 = in_o_picture_link_9,
    o_picture_link_10 = in_o_picture_link_10,
    p_furnishing_id = in_p_furnishing_id,
    p_car_parking_id = in_p_car_parking_id,
    o_sup_builtup_area = in_o_sup_builtup_area,
    o_carpet_area = in_o_carpet_area,
    p_listed_by_id =in_p_listed_by_id,
    employee_capacity = in_employee_capacity,
    o_maintenance = in_o_maintenance,
    o_show_mo_no = in_o_show_mo_no,
    o_description = in_o_description,
    o_location = in_o_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE office_inventory_id = in_office_inventory_id AND user_id = in_user_id;
select * from bsapp_db.office_inventory_mast where office_inventory_id = in_office_inventory_id AND user_id = in_user_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_listed_by_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_listed_by_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_listed_by_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_listed_by_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_listed_by_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_listed_by_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_listed_by_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_listed_by_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_listed_by_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_listed_by_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_type_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_type_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_type_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_type_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_type_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_type_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_type_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_washroom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_washroom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_washroom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_washroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_washroom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_washroom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_washroom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_washroom_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_washroom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_washroom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.office_washroom_mast 
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_inventory_mast_fill`(
	IN in_user_id INT
)
BEGIN
	SELECT * FROM bsapp_db.package_inventory_mast WHERE user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_inventory_mast_save`(
    IN in_user_id INT,
    IN in_inventory_code VARCHAR(126),
    IN in_inventory_type VARCHAR(126),
    IN in_purchase_ads_id INT
)
BEGIN

declare pktid INT;
declare packagday INT;

   
    select pkt_id into pktid from bsapp_db.purchase_ads_mast where id = in_purchase_ads_id;
    select package_days into packagday from bsapp_db.package_price_mast where id = pktid;
    
	UPDATE bsapp_db.purchase_ads_mast 
    SET 
	use_ad = use_ad + 1,
	ava_ad = ava_ad - 1
	WHERE id = in_purchase_ads_id AND user_id = in_user_id AND is_active = 1 AND ava_ad > 0;

    IF(ROW_COUNT() > 0) THEN 
    
		INSERT INTO bsapp_db.package_inventory_mast 
		(user_id, inventory_code, inventory_type, purchase_ads_id, created_at,start_date,end_date )
		VALUES (in_user_id, in_inventory_code, in_inventory_type, in_purchase_ads_id, now(),now(), ADDDATE(now(), INTERVAL packagday DAY));
        SELECT "SUCCESS" as MSG;
	ELSE
		SELECT "DON'T HAVE ENOUGH ADS OR THEY ARE EXPIRED" as MSG;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_price_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_price_mast_delete`(
   IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.package_price_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_price_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_price_mast_fill`(
	IN in_cat_id INT
)
BEGIN
	SELECT * FROM bsapp_db.package_price_mast WHERE cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_price_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_price_mast_save`(
	IN in_id INT,
    IN in_package_days INT,
    IN in_total_ads INT,
    IN in_package_price INT,
    IN in_cat_id INT,
    IN in_message VARCHAR(126),
    IN in_total_month INT
)
BEGIN
IF NOT EXISTS(SELECT id FROM bsapp_db.package_price_mast WHERE id = in_id) THEN
 	INSERT INTO bsapp_db.package_price_mast
		(package_days,total_ads,package_price,created_at,cat_id,message,total_month)
	VALUES
		(in_package_days,in_total_ads,in_package_price,now(),in_cat_id,in_message,in_total_month);
ELSE
   UPDATE bsapp_db.package_price_mast
	SET
	package_days = in_package_days,
    total_ads = in_total_ads,
    package_price = in_package_price,
    modified_at = now(),
    cat_id = in_cat_id,
    message = in_message,
    total_month = in_total_month
	WHERE id = in_id;	
 END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_position_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_position_type_mast_delete`(
	IN in_p_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.position_type_mast WHERE p_type_id = in_p_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_position_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_position_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.position_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_position_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_position_type_mast_save`(
	IN in_p_type_id INT,
    IN in_p_type_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select p_type_id from bsapp_db.position_type_mast where p_type_id = in_p_type_id) THEN
 	INSERT INTO bsapp_db.position_type_mast
		(p_type_name,created_at)
	VALUES
		(in_p_type_name,now());
ELSE
   UPDATE bsapp_db.position_type_mast
	SET
	p_type_name = in_p_type_name,
    modified_at = now()
	WHERE p_type_id = in_p_type_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_product_detail`(
	 IN in_inventory_code VARCHAR(126),
	 IN in_cat_id INT
)
BEGIN
CASE WHEN in_inventory_code = (select all_inventory_code FROM bsapp_db.all_inventory_mast WHERE all_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_all_inventory_mast_fill(in_inventory_code,in_cat_id);

		WHEN in_inventory_code = (select car_rent_inventory_code FROM bsapp_db.car_rent_inventory_mast WHERE car_rent_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_car_rent_inventory_mast_fill(in_inventory_code,in_cat_id);
            
		WHEN in_inventory_code = (select car_sell_inventory_code FROM bsapp_db.car_sell_inventory_mast WHERE car_sell_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_car_sell_inventory_mast_fill(in_inventory_code,in_cat_id);
            
		WHEN in_inventory_code = (select job_inventory_code FROM bsapp_db.job_inventory_mast WHERE job_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_job_inventory_mast_fill(in_inventory_code,in_cat_id);
            
        WHEN in_inventory_code = (select mo_inventory_code FROM bsapp_db.mobile_inventory_mast WHERE mo_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_mobile_inventory_mast_fill(in_inventory_code,in_cat_id); 
        
        WHEN in_inventory_code = (select office_inventory_code FROM bsapp_db.office_inventory_mast WHERE office_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_office_inventory_mast_fill(in_inventory_code,in_cat_id); 
            
        WHEN in_inventory_code = (select property_inventory_code FROM bsapp_db.property_inventory_mast WHERE property_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_property_inventory_rent_mast_fill(in_inventory_code,in_cat_id); 

         WHEN in_inventory_code = (select vehicle_inventory_code FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_bike_inventory_mast_fill(in_inventory_code,in_cat_id); 
        
        ELSE BEGIN END;
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bathroom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bathroom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_bathroom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bathroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bathroom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_bathroom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bathroom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bathroom_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.property_bathroom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.property_bathroom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.property_bathroom_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bedroom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bedroom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_bedroom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bedroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bedroom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_bedroom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bedroom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bedroom_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.property_bedroom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.property_bedroom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.property_bedroom_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_car_parking_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_car_parking_mast_delete`(
  IN in_p_car_parking_id INT
)
BEGIN
    DELETE  FROM bsapp_db.property_car_parking_mast WHERE p_car_parking_id = in_p_car_parking_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_car_parking_mast_fill`()
BEGIN
    	SELECT * FROM bsapp_db.property_car_parking_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_car_parking_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_car_parking_mast_save`(
  IN in_p_car_parking_id INT,
  IN in_p_car_parking_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_car_parking_id from bsapp_db.property_car_parking_mast where p_car_parking_id = in_p_car_parking_id) THEN
 	INSERT INTO bsapp_db.property_car_parking_mast
		(p_car_parking_name,created_at)
	VALUES
		(in_p_car_parking_name,now());
ELSE
   UPDATE bsapp_db.property_car_parking_mast
	SET
	p_car_parking_name = in_p_car_parking_name,
    modified_at = now()
	WHERE p_car_parking_id = in_p_car_parking_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_furnishing_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_furnishing_mast_delete`(
	IN in_p_furnishing_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_furnishing_mast WHERE p_furnishing_id = in_p_furnishing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_furnishing_mast_fill`()
BEGIN
		SELECT * FROM bsapp_db.property_furnishing_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_furnishing_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_furnishing_mast_save`(
	IN in_p_furnishing_id INT,
    IN in_p_furnishing_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_furnishing_id from bsapp_db.property_furnishing_mast where p_furnishing_id = in_p_furnishing_id) THEN
 	INSERT INTO bsapp_db.property_furnishing_mast
		(p_furnishing_name,created_at)
	VALUES
		(in_p_furnishing_name,now());
ELSE
   UPDATE bsapp_db.property_furnishing_mast
	SET
	p_furnishing_name = in_p_furnishing_name,
    modified_at = now()
	WHERE p_furnishing_id = in_p_furnishing_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_rent_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_rent_mast_delete`(
  IN in_property_inventory_id INT,
  IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.property_inventory_mast PI  ON  AD.inventory_code= PI.property_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_property_inventory_id );
   DELETE FROM  bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_rent_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_rent_mast_fill`(
        IN in_property_inventory_code  VARCHAR(126),
        IN in_cat_id INT
)
BEGIN
declare code varchar(20);
set code = (SELECT SUBSTRING(in_property_inventory_code, 10, 4) as code);

	IF(code = 'rent') THEN
        SELECT PI.property_inventory_id, IFNULL(PI.user_id, "-") as user_id, 
        IFNULL(PI.property_inventory_code, "-") as property_inventory_code, IFNULL(PI.p_title, "-") as p_title, 
        IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(PI.p_name, "-") as p_name, 
        IFNULL(BED.value, "-") as p_bedroom, IFNULL(BAT.value, "-") as p_bathroom, 
        IFNULL(PI.p_sq_ft, "-") as p_sq_ft, IFNULL(FORMAT(PI.p_price, 0), "-") as p_price, 
        PI.p_picture_link_1, PI.p_picture_link_2, PI.p_picture_link_3, PI.p_picture_link_4, PI.p_picture_link_5,
        PI.p_picture_link_6, PI.p_picture_link_7, PI.p_picture_link_8, PI.p_picture_link_9, PI.p_picture_link_10, 
        IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name, 
        IFNULL(PI.p_sup_builtup_area, "-") as p_sup_builtup_area, IFNULL(PI.p_carpet_area, "-") as p_carpet_area, 
        IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(PR.p_preferred_renters_name, "-") as p_preferred_renters_name, 
        IFNULL(PI.p_maintenance, "-") as p_maintenance, IFNULL(PI.p_show_mo_no, "-") as p_show_mo_no, 
        IFNULL(PI.p_description, "-") as p_description, IFNULL(PI.p_location, "-") as p_location, 
        IFNULL(DATE_FORMAT(PI.created_at,'%d %b %y'), "-") as ad_created, 
        IFNULL(PI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture , 
        IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name, 
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id        
        FROM bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  PI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  PI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  PI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  PI.p_listed_by_id =PL.p_listed_by_id
		LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.property_preferred_renters_mast  PR  ON  PI.p_preferred_renters_id =PR.p_preferred_renters_id 
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = PI.property_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = PI.user_id
        WHERE PI.property_inventory_code = in_property_inventory_code AND PI.cat_id = in_cat_id;

ELSE
		SELECT PI.property_inventory_id, IFNULL(PI.user_id, "-") as user_id,
        IFNULL(PI.property_inventory_code, "-") as property_inventory_code, IFNULL(PI.p_title, "-") as p_title, 
        IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(PI.p_name, "-") as p_name, 
        IFNULL(BED.value, "-") as p_bedroom, IFNULL(BAT.value, "-") as p_bathroom,
        IFNULL(PI.p_sq_ft, "-") as p_sq_ft, IFNULL(FORMAT(PI.p_price, 0), "-") as p_price,
        PI.p_picture_link_1, PI.p_picture_link_2, PI.p_picture_link_3, PI.p_picture_link_4, PI.p_picture_link_5,
        PI.p_picture_link_6, PI.p_picture_link_7, PI.p_picture_link_8, PI.p_picture_link_9, PI.p_picture_link_10,
        IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name,
        IFNULL(PI.p_sup_builtup_area, "-") as p_sup_builtup_area, IFNULL(PI.p_carpet_area, "-") as p_carpet_area,
        IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(PS.p_status_title, "-") as p_status_title,
        IFNULL(PI.p_maintenance, "-") as p_maintenance, IFNULL(PI.p_show_mo_no, "-") as p_show_mo_no,
        IFNULL(PI.p_description, "-") as p_description, IFNULL(PI.p_location, "-") as p_location,
        IFNULL(DATE_FORMAT(PI.created_at,'%d %b %y'), "-") as ad_created,
        IFNULL(PI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
        IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.property_inventory_mast PI 
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.property_status_mast  PS  ON  PI.p_status_id =PS.p_status_id
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  PI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  PI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  PI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  PI.p_listed_by_id =PL.p_listed_by_id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = PI.property_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = PI.user_id
        WHERE PI.property_inventory_code = in_property_inventory_code AND PI.cat_id = in_cat_id ;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_rent_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_rent_mast_save`(
IN in_property_inventory_id INT,
        IN in_user_id INT,
		IN in_p_title VARCHAR(126),
		IN in_p_type_id INT,
        IN in_p_name VARCHAR(126),
        IN in_p_bedroom INT,
        IN in_p_bathroom INT,
        IN in_p_sq_ft DECIMAL(12,8),
        IN in_p_price INT,
		IN in_p_picture_link_1 VARCHAR(512),
		IN in_p_picture_link_2 VARCHAR(512),
		IN in_p_picture_link_3 VARCHAR(512),
		IN in_p_picture_link_4 VARCHAR(512),
		IN in_p_picture_link_5 VARCHAR(512),
		IN in_p_picture_link_6 VARCHAR(512),
		IN in_p_picture_link_7 VARCHAR(512),
		IN in_p_picture_link_8 VARCHAR(512),
		IN in_p_picture_link_9 VARCHAR(512),
		IN in_p_picture_link_10 VARCHAR(512),
		IN in_p_furnishing_id INT,
        IN in_p_car_parking_id INT,
        IN in_p_sup_builtup_area DECIMAL(12,8),
        IN in_p_carpet_area DECIMAL(12,8),
        IN in_p_listed_by_id INT,
		IN in_p_preferred_renters_id INT,
		IN in_p_maintenance INT,
		IN in_p_show_mo_no BOOLEAN,
        IN in_p_description VARCHAR(512),
		IN in_p_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(property_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.property_inventory_mast;

IF NOT EXISTS(select property_inventory_id from bsapp_db.property_inventory_mast where property_inventory_id = in_property_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.property_inventory_mast
		(property_inventory_id,user_id,property_inventory_code,p_title,p_type_id,p_name,p_bedroom,p_bathroom,p_sq_ft,p_price,p_picture_link_1,p_picture_link_2,p_picture_link_3,p_picture_link_4,p_picture_link_5,p_picture_link_6,p_picture_link_7,p_picture_link_8,p_picture_link_9,p_picture_link_10,p_furnishing_id,p_car_parking_id,p_sup_builtup_area,p_carpet_area,p_listed_by_id,p_preferred_renters_id,p_maintenance,p_show_mo_no,p_description,p_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("property_rent_",get_max_inventory_id),in_p_title,in_p_type_id,in_p_name,in_p_bedroom,in_p_bathroom,in_p_sq_ft,in_p_price,in_p_picture_link_1,in_p_picture_link_2,in_p_picture_link_3,in_p_picture_link_4,in_p_picture_link_5,in_p_picture_link_6,in_p_picture_link_7,in_p_picture_link_8,in_p_picture_link_9,in_p_picture_link_10,in_p_furnishing_id,in_p_car_parking_id,in_p_sup_builtup_area,in_p_carpet_area,in_p_listed_by_id,in_p_preferred_renters_id,in_p_maintenance,in_p_show_mo_no,in_p_description,in_p_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("property_rent_",get_max_inventory_id),"property",1);
select * from bsapp_db.property_inventory_mast where property_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.property_inventory_mast
	SET
	p_title = in_p_title,
    p_type_id = in_p_type_id,
    p_name = in_p_name,
    p_bedroom = in_p_bedroom,
    p_bathroom = in_p_bathroom,
    p_sq_ft = in_p_sq_ft,
    p_price = in_p_price,
    p_picture_link_1 = in_p_picture_link_1,
    p_picture_link_2 = in_p_picture_link_2,
    p_picture_link_3 = in_p_picture_link_3,
    p_picture_link_4 = in_p_picture_link_4,
    p_picture_link_5 = in_p_picture_link_5,
    p_picture_link_6 = in_p_picture_link_6,
    p_picture_link_7 = in_p_picture_link_7,
    p_picture_link_8 = in_p_picture_link_8,
    p_picture_link_9 = in_p_picture_link_9,
    p_picture_link_10 = in_p_picture_link_10,
    p_furnishing_id = in_p_furnishing_id,
    p_car_parking_id = in_p_car_parking_id,
    p_sup_builtup_area = in_p_sup_builtup_area,
    p_carpet_area = in_p_carpet_area,
    p_listed_by_id =in_p_listed_by_id,
    p_preferred_renters_id = in_p_preferred_renters_id,
    p_maintenance = in_p_maintenance,
    p_show_mo_no = in_p_show_mo_no,
    p_description = in_p_description,
    p_location = in_p_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
select * from bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_sell_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_sell_mast_delete`(
        IN in_property_inventory_id INT,
        IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.property_inventory_mast PI  ON  AD.inventory_code= PI.property_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_property_inventory_id );
   DELETE FROM  bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_sell_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_sell_mast_fill`(
        IN in_property_inventory_code VARCHAR(126),
        IN in_cat_id INT
)
BEGIN
        SELECT PI.property_inventory_id, IFNULL(PI.user_id, "-") as user_id,
        IFNULL(PI.property_inventory_code, "-") as property_inventory_code, IFNULL(PI.p_title, "-") as p_title, 
        IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(PI.p_name, "-") as p_name, 
        IFNULL(BED.value, "-") as p_bedroom, IFNULL(BAT.value, "-") as p_bathroom,
        IFNULL(PI.p_sq_ft, "-") as p_sq_ft, IFNULL(FORMAT(PI.p_price, 0), "-") as p_price,
        PI.p_picture_link_1, PI.p_picture_link_2, PI.p_picture_link_3, PI.p_picture_link_4, PI.p_picture_link_5,
        PI.p_picture_link_6, PI.p_picture_link_7, PI.p_picture_link_8, PI.p_picture_link_9, PI.p_picture_link_10,
        IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name,
        IFNULL(PI.p_sup_builtup_area, "-") as p_sup_builtup_area, IFNULL(PI.p_carpet_area, "-") as p_carpet_area,
        IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(PS.p_status_title, "-") as p_status_title,
        IFNULL(PI.p_maintenance, "-") as p_maintenance, IFNULL(PI.p_show_mo_no, "-") as p_show_mo_no,
        IFNULL(PI.p_description, "-") as p_description, IFNULL(PI.p_location, "-") as p_location,
        IFNULL(DATE_FORMAT(PI.created_at,'%d %b %y'), "-") as ad_created,
        IFNULL(PI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
        IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.property_inventory_mast PI 
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.property_status_mast  PS  ON  PI.p_status_id =PS.p_status_id
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  PI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  PI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  PI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  PI.p_listed_by_id =PL.p_listed_by_id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = PI.property_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = PI.user_id
        WHERE PI.property_inventory_code = in_property_inventory_code AND PI.cat_id = in_cat_id ;
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_sell_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_sell_mast_save`(
		IN in_property_inventory_id INT,
        IN in_user_id INT,
		IN in_p_title VARCHAR(126),
		IN in_p_type_id INT,
        IN in_p_name VARCHAR(126),
        IN in_p_bedroom INT,
        IN in_p_bathroom INT,
        IN in_p_sq_ft DECIMAL(20,8),
        IN in_p_price INT,
		IN in_p_picture_link_1 VARCHAR(512),
		IN in_p_picture_link_2 VARCHAR(512),
		IN in_p_picture_link_3 VARCHAR(512),
		IN in_p_picture_link_4 VARCHAR(512),
		IN in_p_picture_link_5 VARCHAR(512),
		IN in_p_picture_link_6 VARCHAR(512),
		IN in_p_picture_link_7 VARCHAR(512),
		IN in_p_picture_link_8 VARCHAR(512),
		IN in_p_picture_link_9 VARCHAR(512),
		IN in_p_picture_link_10 VARCHAR(512),
		IN in_p_furnishing_id INT,
        IN in_p_car_parking_id INT,
        IN in_p_sup_builtup_area DECIMAL(12,8),
        IN in_p_carpet_area DECIMAL(12,8),
        IN in_p_listed_by_id INT,		
		IN in_p_status_id INT,
		IN in_p_maintenance INT,
		IN in_p_show_mo_no BOOLEAN,
        IN in_p_description VARCHAR(512),
		IN in_p_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(property_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.property_inventory_mast;

IF NOT EXISTS(select property_inventory_id from bsapp_db.property_inventory_mast where property_inventory_id = in_property_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.property_inventory_mast
		(property_inventory_id,user_id,property_inventory_code,p_title,p_type_id,p_name,p_bedroom,p_bathroom,p_sq_ft,p_price,p_picture_link_1,p_picture_link_2,p_picture_link_3,p_picture_link_4,p_picture_link_5,p_picture_link_6,p_picture_link_7,p_picture_link_8,p_picture_link_9,p_picture_link_10,p_furnishing_id,p_car_parking_id,p_sup_builtup_area,p_carpet_area,p_listed_by_id,p_status_id,p_maintenance,p_show_mo_no,p_description,p_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("property_sell_",get_max_inventory_id),in_p_title,in_p_type_id,in_p_name,in_p_bedroom,in_p_bathroom,in_p_sq_ft,in_p_price,in_p_picture_link_1,in_p_picture_link_2,in_p_picture_link_3,in_p_picture_link_4,in_p_picture_link_5,in_p_picture_link_6,in_p_picture_link_7,in_p_picture_link_8,in_p_picture_link_9,in_p_picture_link_10,in_p_furnishing_id,in_p_car_parking_id,in_p_sup_builtup_area,in_p_carpet_area,in_p_listed_by_id,in_p_status_id,in_p_maintenance,in_p_show_mo_no,in_p_description,in_p_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("property_sell_",get_max_inventory_id),"property",1);
select * from bsapp_db.property_inventory_mast where property_inventory_id = get_max_inventory_id  AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.property_inventory_mast
	SET
	p_title = in_p_title,
    p_type_id = in_p_type_id,
    p_name = in_p_name,
    p_bedroom = in_p_bedroom,
    p_bathroom = in_p_bathroom,
    p_sq_ft = in_p_sq_ft,
    p_price = in_p_price,
    p_picture_link_1 = in_p_picture_link_1,
    p_picture_link_2 = in_p_picture_link_2,
    p_picture_link_3 = in_p_picture_link_3,
    p_picture_link_4 = in_p_picture_link_4,
    p_picture_link_5 = in_p_picture_link_5,
    p_picture_link_6 = in_p_picture_link_6,
    p_picture_link_7 = in_p_picture_link_7,
    p_picture_link_8 = in_p_picture_link_8,
    p_picture_link_9 = in_p_picture_link_9,
    p_picture_link_10 = in_p_picture_link_10,
    p_furnishing_id = in_p_furnishing_id,
    p_car_parking_id = in_p_car_parking_id,
    p_sup_builtup_area = in_p_sup_builtup_area,
    p_carpet_area = in_p_carpet_area,
    p_listed_by_id =in_p_listed_by_id,
    p_status_id = in_p_status_id,
    p_maintenance = in_p_maintenance,
    p_show_mo_no = in_p_show_mo_no,
    p_description = in_p_description,
    p_location = in_p_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
select * from bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_listed_by_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_listed_by_mast_delete`(
   IN in_p_listed_by_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_listed_by_mast WHERE p_listed_by_id = in_p_listed_by_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_listed_by_mast_fill`()
BEGIN
		SELECT * FROM bsapp_db.property_listed_by_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_listed_by_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_listed_by_mast_save`(
	IN in_p_listed_by_id INT,
    IN in_p_listed_by_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_listed_by_id from bsapp_db.property_listed_by_mast where p_listed_by_id = in_p_listed_by_id) THEN
 	INSERT INTO bsapp_db.property_listed_by_mast
		(p_listed_by_name,created_at)
	VALUES
		(in_p_listed_by_name,now());
ELSE
   UPDATE bsapp_db.property_listed_by_mast
	SET
	p_listed_by_name = in_p_listed_by_name,
    modified_at = now()
	WHERE p_listed_by_id = in_p_listed_by_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_preferred_renters_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_preferred_renters_mast_delete`(
	IN in_p_preferred_renters_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_preferred_renters_mast WHERE p_preferred_renters_id = in_p_preferred_renters_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_preferred_renters_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_preferred_renters_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_preferred_renters_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_preferred_renters_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_preferred_renters_mast_save`(
	IN in_p_preferred_renters_id INT,
    IN in_p_preferred_renters_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_preferred_renters_id from bsapp_db.property_preferred_renters_mast where p_preferred_renters_id = in_p_preferred_renters_id) THEN
 	INSERT INTO bsapp_db.property_preferred_renters_mast
		(p_preferred_renters_name,created_at)
	VALUES
		(in_p_preferred_renters_name,now());
ELSE
   UPDATE bsapp_db.property_preferred_renters_mast
	SET
	p_preferred_renters_name = in_p_preferred_renters_name,
    modified_at = now()
	WHERE p_preferred_renters_id = in_p_preferred_renters_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_status_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_status_mast_delete`(
	IN in_p_status_id INT
)
BEGIN
	DELETE FROM  bsapp_db.property_status_mast WHERE p_status_id = in_p_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_status_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_status_mast_fill`()
BEGIN
	SELECT * FROM  bsapp_db.property_status_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_status_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_status_mast_save`(
	IN in_p_status_id INT,
    IN in_p_status_title VARCHAR(126)
)
BEGIN
IF NOT EXISTS (SELECT p_status_id FROM  bsapp_db.property_status_mast WHERE p_status_id = in_p_status_id) THEN
    INSERT INTO bsapp_db.property_status_mast
		(p_status_title,created_at)
	VALUES
		(in_p_status_title,now());
ELSE
   UPDATE bsapp_db.property_status_mast
	SET
	p_status_title = in_p_status_title,
    modified_at = now()
	WHERE p_status_id = in_p_status_id;
END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_type_mast_delete`(
	IN in_p_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_type_mast WHERE p_type_id = in_p_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_type_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_type_mast_save`(
  IN in_p_type_id INT,
  IN in_p_type_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_type_id from bsapp_db.property_type_mast where p_type_id = in_p_type_id) THEN
 	INSERT INTO bsapp_db.property_type_mast
		(p_type_name,created_at)
	VALUES
		(in_p_type_name,now());
ELSE
   UPDATE bsapp_db.property_type_mast
	SET
	p_type_name = in_p_type_name,
    modified_at = now()
	WHERE p_type_id = in_p_type_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_purchase_ads_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_purchase_ads_mast_fill`(
	IN in_user_id INT,
    IN in_cat_id INT
)
BEGIN
	SELECT pa.id, pa.user_id, c.cat_name, pa.pkt_id,pkg.package_days,pkg.message, pa.price, pa.is_active, pa.total_ad, pa.use_ad, pa.ava_ad, pa.start_date_time, pa.end_date_time, pa.created_at
    FROM bsapp_db.purchase_ads_mast pa
    LEFT JOIN bsapp_db.package_price_mast pkg ON pa.pkt_id = pkg.id
    LEFT JOIN bsapp_db.category_mast c ON pkg.cat_id = c.id 
    WHERE user_id = in_user_id AND pkg.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_purchase_ads_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_purchase_ads_mast_save`(
    IN in_user_id INT,
	IN in_pkt_id INT,
	IN in_price INT,
    IN in_is_active BOOL,
    IN in_total_ad INT,
    IN in_use_ad INT,
	IN in_ava_ad INT
)
BEGIN
	DECLARE months INT;
    SELECT total_month INTO months FROM package_price_mast WHERE id = in_pkt_id;
 	INSERT INTO bsapp_db.purchase_ads_mast
		(user_id, pkt_id, price, is_active, start_date_time, end_date_time, created_at, total_ad, use_ad, ava_ad)
	VALUES
		(in_user_id, in_pkt_id, in_price, in_is_active, now(), ADDDATE(now(), INTERVAL months MONTH), now(), in_total_ad, in_use_ad, in_ava_ad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_purchase_ads_mast_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_purchase_ads_mast_update`(
	IN in_id INT,
    IN in_is_active BOOL
)
BEGIN
	UPDATE bsapp_db.purchase_ads_mast 
    SET is_active = in_is_active
    WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ram_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ram_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.ram_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ram_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ram_mast_fill`(
	IN in_id INT
)
BEGIN
	SELECT * FROM bsapp_db.ram_mast WHERE id = in_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ram_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ram_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.ram_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.ram_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.ram_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rate_us_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rate_us_mast_save`(
	IN in_rate_id INT,
    IN in_user_id INT,
    IN in_rate DECIMAL(10,2)
)
BEGIN
IF NOT EXISTS(SELECT rate_id FROM bsapp_db.rate_us_mast WHERE  user_id = in_user_id ) THEN
 	INSERT INTO bsapp_db.rate_us_mast
		(user_id,rate,created_at)
	VALUES
		(in_user_id,in_rate,now());
ELSE 
	UPDATE bsapp_db.rate_us_mast
    SET 
    rate = in_rate,
    modified_at = now()
    WHERE user_id = in_user_id AND rate_id = in_rate_id;
END IF;
select avg(rate) as rating from bsapp_db.rate_us_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rejected_reasons_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rejected_reasons_mast_delete`(
	IN in_reject_id INT
)
BEGIN
	DELETE FROM bsapp_db.rejected_reasons_mast 
    WHERE reject_id = in_reject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rejected_reasons_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rejected_reasons_mast_fill`(
	IN in_is_active INT
)
BEGIN
	SELECT * FROM bsapp_db.rejected_reasons_mast 
    WHERE is_active = in_is_active
    ORDER BY sequence_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rejected_reasons_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rejected_reasons_mast_save`(
	IN in_reject_id INT,
    IN in_reasons VARCHAR(512),
    IN in_sequence_no INT,
    IN in_is_active BOOL
)
BEGIN
	IF NOT EXISTS (SELECT reject_id FROM bsapp_db.rejected_reasons_mast WHERE reject_id = in_reject_id ) THEN
		INSERT INTO bsapp_db.rejected_reasons_mast (reasons, sequence_no, created_at, is_active)
        VALUES (in_reasons, in_sequence_no, now(), in_is_active);
	ELSE
		UPDATE bsapp_db.rejected_reasons_mast
        SET
        reasons = in_reasons,
        sequence_no = in_sequence_no,
        modified_at = now(),
        is_active = in_is_active
        WHERE reject_id = in_reject_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_mast_fill`(
	IN in_user_id INT
)
BEGIN
	SELECT * FROM bsapp_db.report_mast WHERE user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_mast_save`(
	IN in_id INT,
    IN in_user_id INT,
    IN in_report_msg_id INT,
    IN in_comment VARCHAR(255)
)
BEGIN
	IF NOT EXISTS (SELECT id FROM bsapp_db.report_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.report_mast (user_id, report_msg_id, comment, created_at)
        VALUES (in_user_id, in_report_msg_id, in_comment, now());
	ELSE
		UPDATE bsapp_db.report_mast 
        SET 
        user_id = in_user_id,
        report_msg_id = in_report_msg_id,
        comment = in_comment,
        modified_at = now()
        WHERE id = in_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_message_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_message_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.report_message_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_message_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_message_mast_fill`(
	IN in_type VARCHAR(11)
)
BEGIN
	SELECT * FROM bsapp_db.report_message_mast WHERE type = in_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_message_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_message_mast_save`(
	IN in_id INT,
	IN in_report_msg VARCHAR(255),
    IN in_type VARCHAR(11)
)
BEGIN
	IF NOT EXISTS (SELECT id FROM bsapp_db.report_message_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.report_message_mast (report_msg, type, created_at)
		VALUES (in_report_msg, in_type, now());
	ELSE
		UPDATE bsapp_db.report_message_mast
        SET 
        report_msg = in_report_msg,
        type = in_type,
        modified_at = now()
        WHERE id = in_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.rom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rom_mast_fill`(
	IN in_id INT
)
BEGIN
	SELECT * FROM bsapp_db.rom_mast WHERE id = in_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rom_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.rom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.rom_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.rom_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_salary_period_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_salary_period_mast_delete`(
	IN in_s_p_id INT
)
BEGIN
	DELETE FROM bsapp_db.salary_period_mast WHERE s_p_id = in_s_p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_salary_period_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_salary_period_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.salary_period_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_salary_period_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_salary_period_mast_save`(
	IN in_s_p_id INT,
    IN in_s_p_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select s_p_id from bsapp_db.salary_period_mast where s_p_id = in_s_p_id) THEN
 	INSERT INTO bsapp_db.salary_period_mast
		(s_p_name,created_at)
	VALUES
		(in_s_p_name,now());
ELSE
   UPDATE bsapp_db.salary_period_mast
	SET
	s_p_name = in_s_p_name,
    modified_at = now()
	WHERE s_p_id = in_s_p_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_send_email_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_send_email_otp`(
	IN in_email VARCHAR(64),
    IN in_otp INT
)
BEGIN
DECLARE in_login_seq_id BIGINT;
	IF NOT EXISTS (SELECT login_id FROM bsapp_db.user_mast WHERE mail_id = in_email) THEN
    call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
		INSERT INTO bsapp_db.user_mast (login_id,mail_id, user_cat, otp, is_verify,created_at)
        VALUES (in_login_seq_id,in_email, "U", in_otp, 0,now());
    ELSE
		UPDATE bsapp_db.user_mast
        SET 
        otp = in_otp,
        is_verify = 0
        WHERE mail_id = in_email;
    END IF;
    SELECT * FROM bsapp_db.user_mast WHERE mail_id = in_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_send_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_send_otp`(
 in in_mobile_no  varchar(16),
 in in_mobile_cc_code varchar(8),
 in in_name varchar(126),
 in in_otp int
)
BEGIN
DECLARE in_login_seq_id BIGINT;
   IF NOT EXISTS(
   SELECT  login_id
   FROM bsapp_db.user_mast 
   WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND name = in_name )
   THEN
   call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
	INSERT INTO bsapp_db.user_mast
			(login_id,mobile_no,mobile_cc_code,user_cat,is_verify,otp,created_at,name)
	VALUES
			(in_login_seq_id,in_mobile_no,in_mobile_cc_code,"U",false,in_otp,now(),in_name);
ELSE
	UPDATE bsapp_db.user_mast
	SET
    otp = in_otp,
    is_verify = false
	WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND name = in_name;
END IF;
  SELECT login_id,name,mobile_no,mobile_cc_code,otp,is_verify FROM bsapp_db.user_mast WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND name = in_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_show_category_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_show_category_data`(
	IN in_cat_id INT,
    IN in_sub_cat_id  varchar(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_price_from INT,
    IN in_price_to INT,
    IN in_brand_id VARCHAR(126),
    IN in_job_salary_from INT,
    IN in_job_salary_to INT,
    IN in_distance_from INT,
    IN in_distance_to INT,
    IN in_distance_sorting VARCHAR(126),
    IN in_date_sorting VARCHAR(126),
    IN in_price_sorting VARCHAR(126)
)
BEGIN
	DECLARE  in_offset INT;
	SET in_offset = (in_page_no -1) * in_limit;

	SELECT *, COUNT(*) OVER() AS "total_count" 
    FROM(
	(SELECT 
		CS.car_sell_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CS.c_picture_link_1 as Image,
        CS.car_title as Name,
        FORMAT(CS.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        CS.c_location as location,
        CS.latitude,
		CS.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CS.latitude)) * COS(RADIANS(CS.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CS.latitude))) * 6371) AS distance_in_km,
	    DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
        CS.modified_at as Modify_Date,
        "" as  office_furnished,
        SM.state_name AS car_registration_state,
		CS.c_km AS car_km,
		CO.name AS owner,
        0 as Bedroom,
		0 as Bathroom,
        0 as Cabin,
        0 as Washroom,
		0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast AS CS
        LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code 
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
		  WHERE CS.cat_id=in_cat_id AND find_in_set(CS.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1
    ) 
    UNION 
    (SELECT 
		AI.all_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        AI.picture_link_1 as Image,
        AI.title as Name,
		FORMAT(AI.price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
		AI.location as location,
        AI.latitude,
		AI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(AI.latitude)) * COS(RADIANS(AI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(AI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(AI.created_at,'%d %b %y') as Create_Date,
        AI.modified_at as Modify_Date,
        "" as  office_furnished,
		'' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.all_inventory_mast AS AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id 
        LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code 
	  WHERE AI.cat_id=in_cat_id AND find_in_set(AI.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1 )  
    UNION 
    (SELECT 
		CR.car_rent_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CR.c_picture_link_1 as Image,
        CR.car_title as Name,
		FORMAT(CR.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,	
        CR.c_location as location,
        CR.latitude,
		CR.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CR.latitude)) * COS(RADIANS(CR.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CR.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
        CR.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        c_km_limit as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
		LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
      WHERE CR.cat_id=in_cat_id AND find_in_set(CR.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  )
    UNION (SELECT 
		JI.job_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
	    JI.j_picture_link_1 as Image,
        JI.j_title as Name,
        FORMAT(0, 2) as price,
        JI.from_salary as From_salary,
        JI.to_salary as To_salary,
        JI.j_location as location,
        JI.latitude,
		JI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(JI.latitude)) * COS(RADIANS(JI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(JI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
        JI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		JT.j_type_name as Job_type,
		SP.s_p_name as Job_salary_period
      
	FROM
		bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
        LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
	  WHERE JI.cat_id=in_cat_id AND find_in_set(JI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 HAVING  CASE WHEN in_job_salary_to <> 0 THEN ((JI.from_salary >= in_job_salary_from OR  JI.to_salary <= in_job_salary_to)) ELSE JI.from_salary >= 0 END  ) 
    UNION 
    (SELECT 
		MI.mo_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		MI.mo_picture_link_1 as Image,
        MI.mo_title as Name,
        FORMAT(MI.mo_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
        MI.location as location,
        MI.latitude,
		MI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(MI.latitude)) * COS(RADIANS(MI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(MI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
        MI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		RAM.value AS Mobile_ram,
		ROM.value AS Mobile_rom,
        BR.brand_name as Mobile_brand,
        MI.mo_colour as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
        LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
	  WHERE  MI.cat_id=in_cat_id  AND find_in_set(MI.sub_cat_id,in_sub_cat_id)AND AD.ad_status_id = 1 AND CASE WHEN in_brand_id <> "" THEN find_in_set(MI.brand_id,in_brand_id) ELSE MI.brand_id > 0 END   )
    UNION (SELECT 
		OI.office_inventory_code AS ID,
		CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		OI.o_picture_link_1 as Image,
        OI.o_title as Name,
        FORMAT(OI.o_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
		OI.o_location as location,
        OI.latitude,
		OI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(OI.latitude)) * COS(RADIANS(OI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(OI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
        OI.modified_at as Modify_Date,
        PF.p_furnishing_name as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
        OC.value as Cabin,
        OW.value as Washroom,
		OI.o_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
        
	FROM
		bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
	  WHERE OI.cat_id=in_cat_id AND find_in_set(OI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  ) 
    UNION 
    (SELECT 
		PI.property_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        PI.p_picture_link_1 as Image,
        PI.p_title as Name,
        FORMAT(PI.p_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        PI.p_location as location,
        PI.latitude,
		PI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(PI.latitude)) * COS(RADIANS(PI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(PI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
        PI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        BED.value as Bedroom,
        BAT.value as Bathroom,
		0 as Cabin,
        0 as Washroom,
        PI.p_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
	  WHERE PI.cat_id=in_cat_id AND find_in_set(PI.sub_cat_id,in_sub_cat_id)   ) 
    UNION 
    (SELECT 
		VI.vehicle_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		VI.v_picture_link_1 as Image,
        VI.v_title as Name,
        FORMAT(VI.v_price, 2) as Price,
		0 as from_salary,
		0 as to_salary,    
        VI.v_location as location,
        VI.latitude,
		VI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(VI.latitude)) * COS(RADIANS(VI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(VI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
        VI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		VI.kms as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
        LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
	  WHERE VI.cat_id=in_cat_id AND find_in_set(VI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  ))AS SUBQ 
      HAVING CASE WHEN in_price_to <> 0 THEN   price BETWEEN in_price_from AND in_price_to  ELSE price >= 0 END AND 
		distance_in_km BETWEEN in_distance_from AND in_distance_to 
      ORDER BY	CASE WHEN in_distance_sorting='ASC' THEN distance_in_km END,
				CASE WHEN in_distance_sorting='DESC' THEN distance_in_km  END DESC,
				CASE WHEN in_date_sorting='ASC' THEN Create_Date END,
				CASE WHEN in_date_sorting='DESC' THEN Create_Date  END DESC,
                CASE WHEN in_price_sorting='ASC' THEN Price END ,
                CASE WHEN in_price_sorting='DESC' THEN Price END DESC
	  limit in_limit offset in_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sponcer_near_by_location_category_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sponcer_near_by_location_category_show`(
	IN in_cat_id INT,
    IN in_sub_cat_id  varchar(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_price_from INT,
    IN in_price_to INT,
    IN in_brand_id VARCHAR(126),
    IN in_job_salary_from INT,
    IN in_job_salary_to INT,
    IN in_distance_from INT,
    IN in_distance_to INT,
    IN in_distance_sorting VARCHAR(126),
    IN in_date_sorting VARCHAR(126),
    IN in_price_sorting VARCHAR(126)
)
BEGIN
DECLARE  in_offset INT;
	SET in_offset = (in_page_no -1) * in_limit;

	SELECT *, COUNT(*) OVER() AS "total_count" 
    FROM(
	(SELECT 
		CS.car_sell_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CS.c_picture_link_1 as Image,
        CS.car_title as Name,
        FORMAT(CS.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        CS.c_location as location,
        CS.latitude,
		CS.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CS.latitude)) * COS(RADIANS(CS.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CS.latitude))) * 6371) AS distance_in_km,
	    DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
        CS.modified_at as Modify_Date,
        "" as  office_furnished,
        SM.state_name AS car_registration_state,
		CS.c_km AS car_km,
		CO.name AS owner,
        0 as Bedroom,
		0 as Bathroom,
        0 as Cabin,
        0 as Washroom,
		0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast AS CS
        LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code 
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
        LEFT JOIN bsapp_db.package_inventory_mast PI ON CS.car_sell_inventory_code = PI.inventory_code AND CS.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
		  WHERE CS.cat_id=in_cat_id AND find_in_set(CS.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1 AND PA.is_active = 1) 
    UNION 
    (SELECT 
		AI.all_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        AI.picture_link_1 as Image,
        AI.title as Name,
		FORMAT(AI.price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
		AI.location as location,
        AI.latitude,
		AI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(AI.latitude)) * COS(RADIANS(AI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(AI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(AI.created_at,'%d %b %y') as Create_Date,
        AI.modified_at as Modify_Date,
        "" as  office_furnished,
		'' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.all_inventory_mast AS AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id 
        LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PI ON AI.all_inventory_code = PI.inventory_code and AI.inventory_type = PI.inventory_type
		LEFT JOIN  bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE AI.cat_id=in_cat_id AND find_in_set(AI.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1  AND PA.is_active = 1)  
    UNION 
    (SELECT 
		CR.car_rent_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CR.c_picture_link_1 as Image,
        CR.car_title as Name,
		FORMAT(CR.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,	
        CR.c_location as location,
        CR.latitude,
		CR.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CR.latitude)) * COS(RADIANS(CR.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CR.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
        CR.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        c_km_limit as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
		LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PI ON CR.car_rent_inventory_code = PI.inventory_code and CR.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
      WHERE CR.cat_id=in_cat_id AND find_in_set(CR.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 AND PA.is_active = 1)
    UNION (SELECT 
		JI.job_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
	    JI.j_picture_link_1 as Image,
        JI.j_title as Name,
        FORMAT(0, 2) as price,
        JI.from_salary as From_salary,
        JI.to_salary as To_salary,
        JI.j_location as location,
        JI.latitude,
		JI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(JI.latitude)) * COS(RADIANS(JI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(JI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
        JI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		JT.j_type_name as Job_type,
		SP.s_p_name as Job_salary_period
      
	FROM
		bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
        LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PI ON JI.job_inventory_code = PI.inventory_code and JI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE JI.cat_id=in_cat_id AND find_in_set(JI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 AND PA.is_active = 1
      HAVING  CASE WHEN in_job_salary_to <> 0 THEN ((JI.from_salary >= in_job_salary_from OR  JI.to_salary <= in_job_salary_to)) ELSE JI.from_salary >= 0 END   ) 
    UNION 
    (SELECT 
		MI.mo_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		MI.mo_picture_link_1 as Image,
        MI.mo_title as Name,
        FORMAT(MI.mo_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
        MI.location as location,
        MI.latitude,
		MI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(MI.latitude)) * COS(RADIANS(MI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(MI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
        MI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		RAM.value AS Mobile_ram,
		ROM.value AS Mobile_rom,
        BR.brand_name as Mobile_brand,
        MI.mo_colour as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
        LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
        LEFT JOIN bsapp_db.package_inventory_mast PI ON MI.mo_inventory_code = PI.inventory_code and MI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE  MI.cat_id=in_cat_id  AND find_in_set(MI.sub_cat_id,in_sub_cat_id)AND AD.ad_status_id = 1 AND CASE WHEN in_brand_id <> "" THEN find_in_set(MI.brand_id,in_brand_id) ELSE MI.brand_id > 0 END  AND PA.is_active = 1 )
    UNION (SELECT 
		OI.office_inventory_code AS ID,
		CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		OI.o_picture_link_1 as Image,
        OI.o_title as Name,
        FORMAT(OI.o_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
		OI.o_location as location,
        OI.latitude,
		OI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(OI.latitude)) * COS(RADIANS(OI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(OI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
        OI.modified_at as Modify_Date,
        PF.p_furnishing_name as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
        OC.value as Cabin,
        OW.value as Washroom,
		OI.o_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
        
	FROM
		bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.package_inventory_mast PI ON OI.office_inventory_code = PI.inventory_code and OI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE OI.cat_id=in_cat_id AND find_in_set(OI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  AND  PA.is_active = 1) 
    UNION 
    (SELECT 
		PI.property_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        PI.p_picture_link_1 as Image,
        PI.p_title as Name,
        FORMAT(PI.p_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        PI.p_location as location,
        PI.latitude,
		PI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(PI.latitude)) * COS(RADIANS(PI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(PI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
        PI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        BED.value as Bedroom,
        BAT.value as Bathroom,
		0 as Cabin,
        0 as Washroom,
        PI.p_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PIM ON PI.property_inventory_code = PIM.inventory_code and PI.inventory_type = PIM.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PIM.purchase_ads_id = PA.id
	  WHERE PI.cat_id=in_cat_id AND find_in_set(PI.sub_cat_id,in_sub_cat_id) AND  PA.is_active = 1 ) 
    UNION 
    (SELECT 
		VI.vehicle_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		VI.v_picture_link_1 as Image,
        VI.v_title as Name,
        FORMAT(VI.v_price, 2) as Price,
		0 as from_salary,
		0 as to_salary,    
        VI.v_location as location,
        VI.latitude,
		VI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(VI.latitude)) * COS(RADIANS(VI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(VI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
        VI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		VI.kms as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
        LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
        LEFT JOIN bsapp_db.package_inventory_mast PI ON VI.vehicle_inventory_code = PI.inventory_code and VI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE VI.cat_id=in_cat_id AND find_in_set(VI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 AND PA.is_active = 1 ))AS SUBQ 
      HAVING CASE WHEN in_price_to <> 0 THEN   price BETWEEN in_price_from AND in_price_to  ELSE price >= 0 END AND 
		distance_in_km BETWEEN in_distance_from AND in_distance_to 
      ORDER BY	CASE WHEN in_distance_sorting='ASC' THEN distance_in_km END,
				CASE WHEN in_distance_sorting='DESC' THEN distance_in_km  END DESC,
				CASE WHEN in_date_sorting='ASC' THEN Create_Date END,
				CASE WHEN in_date_sorting='DESC' THEN Create_Date  END DESC,
                CASE WHEN in_price_sorting='ASC' THEN Price END ,
                CASE WHEN in_price_sorting='DESC' THEN Price END DESC
	  limit in_limit offset in_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sponcer_near_by_location_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sponcer_near_by_location_show`(
    IN in_latitude DECIMAL(11, 8),
    IN in_longitude DECIMAL(11, 8),
    IN in_from INT,
    IN in_to INT,
    IN in_limit INT,
    IN in_page_no INT
)
BEGIN DECLARE in_offset INT;

SET
    in_offset = (in_page_no - 1) * in_limit;

select
    *,
    count(*) over() AS total_record
from
    (
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                CS.car_sell_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CS.c_picture_link_1 as Image,
                CS.car_title as Name,
                CS.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CS.c_location as location,
                DATE_FORMAT(CS.created_at, '%d %b %y') as Create_Date,
                CS.modified_at as Modify_Date,
                CASE
                    WHEN CS.modified_at > CS.created_at THEN CS.modified_at
                    ELSE CS.created_at
                END AS ORDER_DATE,
                SM.state_name AS car_registration_state,
                CS.c_km AS car_km,
                CO.name AS owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                YM.value as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_sell_inventory_mast AS CS
                LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CS.car_sell_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
                LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
                LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
                LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
                left join bsapp_db.package_inventory_mast PI ON CS.car_sell_inventory_code = PI.inventory_code
                and CS.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                AI.all_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                AI.picture_link_1 as Image,
                AI.title as Name,
                AI.price as Price,
                0 as from_salary,
                0 as to_salary,
                AI.location as location,
                DATE_FORMAT(AI.created_at, '%d %b %y') as Create_Date,
                AI.modified_at as Modify_Date,
                CASE
                    WHEN AI.modified_at > AI.created_at THEN AI.modified_at
                    ELSE AI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.all_inventory_mast AS AI
                LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON AI.inventory_type = AD.inventory_type
                left join bsapp_db.package_inventory_mast PI ON AI.all_inventory_code = PI.inventory_code
                and AI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                CR.car_rent_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CR.c_picture_link_1 as Image,
                CR.car_title as Name,
                CR.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CR.c_location as location,
                DATE_FORMAT(CR.created_at, '%d %b %y') as Create_Date,
                CR.modified_at as Modify_Date,
                CASE
                    WHEN CR.modified_at > CR.created_at THEN CR.modified_at
                    ELSE CR.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                c_km_limit as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_rent_inventory_mast CR
                LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON CR.car_rent_inventory_code = PI.inventory_code
                and CR.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                 JI.job_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                JI.j_picture_link_1 as Image,
                JI.j_title as Name,
                0 as price,
                JI.from_salary as From_salary,
                JI.to_salary as To_salary,
                JI.j_location as location,
                DATE_FORMAT(JI.created_at, '%d %b %y') as Create_Date,
                JI.modified_at as Modify_Date,
                CASE
                    WHEN JI.modified_at > JI.created_at THEN JI.modified_at
                    ELSE JI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                JT.j_type_name as Job_type,
                SP.s_p_name as Job_salary_period
            FROM
                bsapp_db.job_inventory_mast JI
                LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
                LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
                LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON JI.job_inventory_code = PI.inventory_code
                and JI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                MI.mo_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                MI.mo_picture_link_1 as Image,
                MI.mo_title as Name,
                MI.mo_price as Price,
                0 as from_salary,
                0 as to_salary,
                MI.location as location,
                DATE_FORMAT(MI.created_at, '%d %b %y') as Create_Date,
                MI.modified_at as Modify_Date,
                CASE
                    WHEN MI.modified_at > MI.created_at THEN MI.modified_at
                    ELSE MI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                MI.mo_colour AS Mobile_colour,
                '' AS Mobile_brand,
                RAM.value AS Mobile_ram,
                ROM.value AS Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.mobile_inventory_mast MI
                LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
                LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
                left join bsapp_db.package_inventory_mast PI ON MI.mo_inventory_code = PI.inventory_code
                and MI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                OI.office_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                OI.o_picture_link_1 as Image,
                OI.o_title as Name,
                OI.o_price as Price,
                0 as from_salary,
                0 as to_salary,
                OI.o_location as location,
                DATE_FORMAT(OI.created_at, '%d %b %y') as Create_Date,
                OI.modified_at as Modify_Date,
                CASE
                    WHEN OI.modified_at > OI.created_at THEN OI.modified_at
                    ELSE OI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                OC.value as Cabin,
                OW.value as Washroom,
                OI.o_sq_ft as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.office_inventory_mast OI
                LEFT JOIN bsapp_db.office_cabin_mast OC ON OI.cabin = OC.id
                LEFT JOIN bsapp_db.office_washroom_mast OW ON OI.washroom = OW.id
                LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_furnishing_mast PF ON OI.p_furnishing_id = PF.p_furnishing_id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON OI.office_inventory_code = PI.inventory_code
                and OI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            where
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                '' AS Inventory_code,
                PI.property_inventory_code AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                PI.p_picture_link_1 as Image,
                PI.p_title as Name,
                PI.p_price as Price,
                0 as from_salary,
                0 as to_salary,
                PI.p_location as location,
                DATE_FORMAT(PI.created_at, '%d %b %y') as Create_Date,
                PI.modified_at as Modify_Date,
                CASE
                    WHEN PI.modified_at > PI.created_at THEN PI.modified_at
                    ELSE PI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                BED.value as Bedroom,
                BAT.value as Bathroom,
                0 as Cabin,
                0 as Washroom,
                PI.p_sq_ft as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.property_inventory_mast PI
                LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_bathroom_mast BAT ON PI.p_bathroom = BAT.id
                LEFT JOIN bsapp_db.property_bedroom_mast BED ON PI.p_bedroom = BED.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PIM ON PI.property_inventory_code = PIM.inventory_code
                and PI.inventory_type = PIM.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PIM.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                VI.vehicle_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                VI.v_picture_link_1 as Image,
                VI.v_title as Name,
                VI.v_price as Price,
                0 as from_salary,
                0 as to_salary,
                VI.v_location as location,
                DATE_FORMAT(VI.created_at, '%d %b %y') as Create_Date,
                VI.modified_at as Modify_Date,
                CASE
                    WHEN VI.modified_at > VI.created_at THEN VI.modified_at
                    ELSE VI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                YM.value as year_of_registration,
                VI.kms as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.vehicle_inventory_mast VI
                LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id
                LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON VI.vehicle_inventory_code = PI.inventory_code
                and VI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
    ) AS SUBQ
ORDER BY
    ORDER_DATE DESC
limit
    in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sponsored_recommendations_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sponsored_recommendations_list`(
	IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_limit INT,
    IN in_page_no INT
    
)
BEGIN
	DECLARE  in_offset INT;
	SET in_offset = (in_page_no - 1) * in_limit;
	SELECT  
		ID, is_active, Category,Sub_category, Image, Name, FORMAT(Price, 0) AS Price, FORMAT(from_salary, 0) AS from_salary, 
        FORMAT(to_salary, 0) AS to_salary, location,
        latitude, longitude, distance_in_km, Create_Date, Modify_Date, office_furnished, car_registration_state, 
        car_km, owner, Bedroom, Bathroom, Cabin, Washroom, Square_Feet, Mobile_ram, Mobile_rom, 
        year_of_registration, vehicle_km, Job_type, Job_salary_period,count(*) over() as total_record
    FROM
    (SELECT 
		SUBQ.ID, Category, Sub_category, Image, Name, SUBQ.Price, from_salary, to_salary, location, latitude, 
        longitude, distance_in_km, Create_Date, Modify_Date, office_furnished, car_registration_state, car_km, 
        owner, Bedroom, Bathroom, Cabin, Washroom, Square_Feet, Mobile_ram, Mobile_rom, 
        year_of_registration, vehicle_km, Job_type, Job_salary_period, is_active,
        ROW_NUMBER() OVER (partition by result.SUBQ.ID) AS RowNumber
    FROM
		((SELECT 
			CS.car_sell_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			CS.c_picture_link_1 as Image,
			CS.car_title as Name,
			CS.c_price as Price,
			0 as from_salary,
			0 as to_salary,
			CS.c_location as location,
			CS.latitude,
			CS.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CS.latitude)) * COS(RADIANS(CS.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CS.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
			CS.modified_at as Modify_Date,
			"" as  office_furnished,
			SM.state_name AS car_registration_state,
			CS.c_km AS car_km,
			CO.name AS owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			YM.value as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.car_sell_inventory_mast AS CS
			LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code
			LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
			LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
			LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
			LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
		WHERE AD.ad_status_id = 1 
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			AI.all_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			AI.picture_link_1 as Image,
			AI.title as Name,
			AI.price as Price,
			0 as from_salary,
			0 as to_salary,
			AI.location as location,
			AI.latitude,
			AI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(AI.latitude)) * COS(RADIANS(AI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(AI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(AI.created_at,'%d %b %y')as Create_Date,
			AI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.all_inventory_mast AS AI
			LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			CR.car_rent_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			CR.c_picture_link_1 as Image,
			CR.car_title as Name,
			CR.c_price as Price,
			0 as from_salary,
			0 as to_salary,
			CR.c_location as location,
			CR.latitude,
			CR.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CR.latitude)) * COS(RADIANS(CR.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CR.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
			CR.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			c_km_limit as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.car_rent_inventory_mast CR
			LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
        UNION 
        (SELECT 
			JI.job_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			JI.j_picture_link_1 as Image,
			JI.j_title as Name,
			0 as price,
			JI.from_salary as From_salary,
			JI.to_salary as To_salary,
			JI.j_location as location,
			JI.latitude,
			JI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(JI.latitude)) * COS(RADIANS(JI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(JI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
			JI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			JT.j_type_name as Job_type,
			SP.s_p_name as Job_salary_period
		FROM
			bsapp_db.job_inventory_mast JI
			LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
			LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
			LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			MI.mo_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			MI.mo_picture_link_1 as Image,
			MI.mo_title as Name,
			MI.mo_price as Price,
			0 as from_salary,
			0 as to_salary,
			MI.location as location,
			MI.latitude,
			MI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(MI.latitude)) * COS(RADIANS(MI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(MI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
			MI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			RAM.value AS Mobile_ram,
			ROM.value AS Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.mobile_inventory_mast MI
			LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
			LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
			LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
        UNION 
        (SELECT 
			OI.office_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			OI.o_picture_link_1 as Image,
			OI.o_title as Name,
			OI.o_price as Price,
			0 as from_salary,
			0 as to_salary,
			OI.o_location as location,
			OI.latitude,
			OI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(OI.latitude)) * COS(RADIANS(OI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(OI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
			OI.modified_at as Modify_Date,
			PF.p_furnishing_name as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			OC.value as Cabin,
			OW.value as Washroom,
			OI.o_sq_ft as Square_Feet, 
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.office_inventory_mast OI
			LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
			LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
			LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
			LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			PI.property_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			PI.p_picture_link_1 as Image,
			PI.p_title as Name,
			PI.p_price as Price,
			0 as from_salary,
			0 as to_salary,
			PI.p_location as location,
			PI.latitude,
			PI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(PI.latitude)) * COS(RADIANS(PI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(PI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
			PI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			BED.value as Bedroom,
			BAT.value as Bathroom,
			0 as Cabin,
			0 as Washroom,
			PI.p_sq_ft as Square_Feet, 
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.property_inventory_mast PI
			LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
			LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
			LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			VI.vehicle_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			VI.v_picture_link_1 as Image,
			VI.v_title as Name,
			VI.v_price as Price,
			0 as from_salary,
			0 as to_salary,
			VI.v_location as location,
			VI.latitude,
			VI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(VI.latitude)) * COS(RADIANS(VI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(VI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
			VI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			YM.value as year_of_registration,
			VI.kms as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.vehicle_inventory_mast VI
			LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
			LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC)) AS SUBQ  
	INNER JOIN bsapp_db.package_inventory_mast PKG ON SUBQ.ID = PKG.inventory_code
    INNER JOIN bsapp_db.purchase_ads_mast PA ON PKG.purchase_ads_id = PA.id AND PA.is_active = 1
    ORDER BY PA.created_at DESC) as result
    WHERE result.RowNumber = 1 limit in_limit 
    offset in_offset ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_state_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.state_mast
    WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_state_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.state_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_state_mast_save`(
	IN in_id INT,
    IN in_state_name VARCHAR(126)
)
BEGIN
	IF NOT EXISTS(SELECT * FROM bsapp_db.state_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.state_mast (state_name, created_at)
        VALUES (in_state_name, now());
    ELSE
		UPDATE bsapp_db.state_mast
        SET
		state_name = in_state_name,
        modified_at = now()
        WHERE id = in_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_category_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sub_category_mast_delete`(
	in in_id int
)
BEGIN
DELETE FROM bsapp_db.sub_category_mast where id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_category_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sub_category_mast_fill`(
 IN in_cat_id int
)
BEGIN
	SELECT 
		SCM.id as sub_cat_id,SCM.cat_id,SCM.sub_cat_name,CM.cat_name
	FROM bsapp_db.sub_category_mast SCM  
    LEFT JOIN bsapp_db.category_mast CM  
    ON  SCM.cat_id = CM.id  where CM.id  = in_cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_category_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sub_category_mast_save`(
	in in_id int,
    in in_cat_id int,
    in in_sub_cat_name varchar(126)
)
BEGIN

IF NOT EXISTS(select id from bsapp_db.sub_category_mast where id = in_id) THEN
	INSERT INTO bsapp_db.sub_category_mast
			(cat_id,
			sub_cat_name,
            created_at)
	VALUES
			(in_cat_id,
			in_sub_cat_name,
            now());
ELSE
	UPDATE bsapp_db.sub_category_mast
	SET
	cat_id = in_cat_id,
	sub_cat_name = in_sub_cat_name,
    modified_at = now()
	WHERE id = in_id;

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_category_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_category_mast_delete`(
in in_cat_id varchar(5)
)
BEGIN
DELETE FROM bsapp_db.user_category_mast where cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_category_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_category_mast_fill`()
BEGIN
  SELECT cat_id, cat_name FROM bsapp_db.user_category_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_category_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_category_mast_save`(
in in_cat_id varchar(5),
in in_cat_name varchar(16)
)
BEGIN
IF NOT EXISTS(select cat_id from bsapp_db.user_category_mast where cat_id = in_cat_id) THEN
 	INSERT INTO bsapp_db.user_category_mast
		(cat_id,cat_name,created_at)
	VALUES
		(in_cat_id,in_cat_name,now());
ELSE
   UPDATE bsapp_db.user_category_mast
	SET
	cat_name = in_cat_name,
    modified_at = now()
	WHERE cat_id = in_cat_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_followers_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_followers_mast_delete`(
	IN in_user_id INT,
    IN in_following_id INT
)
BEGIN
	DELETE FROM bsapp_db.user_followers_mast 
    WHERE user_id = in_following_id AND follower_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_followers_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_followers_mast_save`(
	IN in_user_id INT,
    IN in_following_id INT
)
BEGIN
	INSERT INTO bsapp_db.user_followers_mast (user_id, follower_id, created_at)
    VALUES(in_following_id, in_user_id, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_mast_delete`(
 in in_login_id int
)
BEGIN
DELETE FROM bsapp_db.user_mast where login_id = in_login_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_mast_fill`(
in in_login_id int
)
BEGIN
SELECT * FROM bsapp_db.user_mast where login_id=in_login_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_mast_save`(
in in_login_id int,
in in_mobile_no varchar(16),
in in_mail_id varchar(64),
in in_name varchar(126),
in in_bio_description varchar(512),
in in_profile_picture_link varchar(512),
in in_mobile_cc_code varchar(8),
in in_user_cat varchar(5),
in in_password varchar(126),
in in_otp int,
in in_is_verify boolean

)
BEGIN
DECLARE in_login_seq_id BIGINT;

IF NOT EXISTS(select login_id from bsapp_db.user_mast where  mobile_no = in_mobile_no  AND mail_id = in_mail_id) THEN
 	call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
    INSERT INTO bsapp_db.user_mast
		(login_id,mobile_no,mail_id,name,bio_description,profile_picture_link,mobile_cc_code,user_cat,password,otp,is_verify,created_at)
	VALUES
		(in_login_seq_id,in_mobile_no,in_mail_id,in_name,in_bio_description,in_profile_picture_link,in_mobile_cc_code,in_user_cat,in_password,in_otp,in_is_verify,now());
	
ELSE
   UPDATE bsapp_db.user_mast
	SET
	mail_id = in_mail_id,
    name = in_name,
    bio_description = in_bio_description,
    profile_picture_link = in_profile_picture_link,
    user_cat = in_user_cat,
    modified_at = now()
	WHERE login_id = in_login_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_inventory_mast_delete`(
	IN in_vehicle_inventory_id INT,
	IN in_user_id INT
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.vehicle_inventory_mast VI  ON  AD.inventory_code= VI.vehicle_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_vehicle_inventory_id );
	DELETE FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_inventory_mast_fill`(
	IN in_vehicle_inventory_code VARCHAR(126),
	IN in_cat_id INT
)
BEGIN
	SELECT  VI.vehicle_inventory_id, IFNULL(VI.user_id, "-") as user_id,
    IFNULL(VI.vehicle_inventory_code, "-") as vehicle_inventory_code, IFNULL(VI.inventory_type, "-") as inventory_type,
    IFNULL(VI.v_title, "-") as v_title, IFNULL(FORMAT(VI.v_price, 0), "-") as v_price,
    VI.v_picture_link_1, VI.v_picture_link_2, VI.v_picture_link_3, VI.v_picture_link_4, VI.v_picture_link_5,
    VI.v_picture_link_6, VI.v_picture_link_7, VI.v_picture_link_8, VI.v_picture_link_9, VI.v_picture_link_10,
    IFNULL(VT.v_type_name, "-") as v_type_name, IFNULL(CBM.name, "-") as brand,
    IFNULL(VI.kms, "-") as kms, IFNULL(VI.month, "-") as month,
    IFNULL(YM.value, "-") as year, IFNULL(VI.insuarance, "-") as insuarance,
    IFNULL(VI.i_description, "-") as i_description, IFNULL(VI.v_show_mo_no, "-") as v_show_mo_no,
    IFNULL(VI.v_description, "-") as v_description, IFNULL(VI.v_location, "-") as v_location,
    IFNULL(DATE_FORMAT(VI.created_at,'%d %b %y'), "-") as ad_created,
    IFNULL(VI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
    IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
    IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
    IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
    FROM bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
    LEFT JOIN bsapp_db.commercial_brand_mast CBM ON VI.brand = CBM.id 
    LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = VI.vehicle_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.login_id = VI.user_id
    WHERE VI.vehicle_inventory_code = in_vehicle_inventory_code AND VI.cat_id = in_cat_id  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_inventory_mast_save`(
	IN in_vehicle_inventory_id INT,
    IN in_user_id INT,
    IN in_v_title VARCHAR(126),
	IN in_v_price INT,
	IN in_v_picture_link_1 VARCHAR(512),
    IN in_v_picture_link_2 VARCHAR(512),
    IN in_v_picture_link_3 VARCHAR(512),
    IN in_v_picture_link_4 VARCHAR(512),
    IN in_v_picture_link_5 VARCHAR(512),
    IN in_v_picture_link_6 VARCHAR(512),
    IN in_v_picture_link_7 VARCHAR(512),
    IN in_v_picture_link_8 VARCHAR(512),
    IN in_v_picture_link_9 VARCHAR(512),
    IN in_v_picture_link_10 VARCHAR(512),
    IN in_v_type_id INT,
    IN in_brand VARCHAR(126),
    IN in_kms INT,
    IN in_month INT,
    IN in_year INT,
    IN in_insuarance BOOLEAN,
    IN in_i_description VARCHAR(512),
    IN in_v_show_mo_no  BOOLEAN,
	IN in_v_description VARCHAR(512),
	IN in_v_location VARCHAR(512),
	IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
	IN in_cat_id INT,
	IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(vehicle_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.vehicle_inventory_mast;

IF NOT EXISTS(select vehicle_inventory_id from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.vehicle_inventory_mast
    		(vehicle_inventory_id,user_id,vehicle_inventory_code,inventory_type,v_title,v_price,v_picture_link_1,v_picture_link_2,v_picture_link_3,v_picture_link_4,v_picture_link_5,v_picture_link_6,v_picture_link_7,v_picture_link_8,v_picture_link_9,v_picture_link_10,v_type_id,brand,kms,month,year,insuarance,i_description,v_show_mo_no,v_description,v_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
			(get_max_inventory_id,in_user_id,concat("comm_vehicle_",get_max_inventory_id),"commercial vehicle",in_v_title,in_v_price,in_v_picture_link_1,in_v_picture_link_2,in_v_picture_link_3,in_v_picture_link_4,in_v_picture_link_5,in_v_picture_link_6,in_v_picture_link_7,in_v_picture_link_8,in_v_picture_link_9,in_v_picture_link_10,in_v_type_id,in_brand,in_kms,in_month,in_year,in_insuarance,CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,in_v_show_mo_no,in_v_description,in_v_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
	call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("comm_vehicle_",get_max_inventory_id),"commercial vehicle",1);
    select * from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = get_max_inventory_id and user_id = in_user_id;
ELSE
	UPDATE bsapp_db.vehicle_inventory_mast
	SET
	v_title = in_v_title,
    v_price = in_v_price,
    v_picture_link_1 = in_v_picture_link_1,
    v_picture_link_2 = in_v_picture_link_2,
    v_picture_link_3 = in_v_picture_link_3,
    v_picture_link_4 = in_v_picture_link_4,
    v_picture_link_5 = in_v_picture_link_5,
    v_picture_link_6 = in_v_picture_link_6,
    v_picture_link_7 = in_v_picture_link_7,
    v_picture_link_8 = in_v_picture_link_8,
    v_picture_link_9 = in_v_picture_link_9,
    v_picture_link_10 = in_v_picture_link_10,
    v_type_id = in_v_type_id,
    brand = in_brand,
    month = in_month,
    kms = in_kms,
    year = in_year,
    insuarance = in_insuarance,
    i_description = CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,
	v_show_mo_no = in_v_show_mo_no,
    v_description = in_v_description,
	v_location = in_v_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
	select * from bsapp_db.vehicle_inventory_mast where  vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_type_mast_delete`(
	IN 	in_v_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.vehicle_type_mast WHERE v_type_id = in_v_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_type_mast_fill`(
	IN v_type_id int
)
BEGIN
	SELECT * FROM bsapp_db.vehicle_type_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_type_mast_save`(
	IN 	in_v_type_id INT,
    IN  in_v_type_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(SELECT v_type_id FROM bsapp_db.vehicle_type_mast WHERE v_type_id = in_v_type_id) THEN
 	INSERT INTO bsapp_db.vehicle_type_mast
		(v_type_name,created_at)
	VALUES
		(in_v_type_name,now());
ELSE
   UPDATE bsapp_db.vehicle_type_mast
	SET
	v_type_name = in_v_type_name,
    modified_at = now()
	WHERE v_type_id = in_v_type_id;

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_verify_email_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_verify_email_otp`(
	IN in_email VARCHAR(64),
    IN in_otp INT
)
BEGIN
	IF NOT EXISTS (SELECT mail_id , otp FROM bsapp_db.user_mast WHERE mail_id = in_email AND otp = in_otp) THEN
		SELECT "OTP NOT MATCH" AS MSG;
    ELSE
		UPDATE bsapp_db.user_mast
        SET 
        is_verify = 1
        WHERE mail_id = in_email AND otp = in_otp;
        SELECT login_id FROM bsapp_db.user_mast WHERE mail_id = in_email AND otp = in_otp;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_verify_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_verify_otp`(
 in in_mobile_no  varchar(16),
 in in_mobile_cc_code varchar(8),
 in in_otp int
)
BEGIN
   IF NOT EXISTS(
	   SELECT mobile_no,mobile_cc_code,otp
	   FROM bsapp_db.user_mast 
	   WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND otp=in_otp)
   THEN
	SELECT "OTP NOT MATCH" as MSG;
ELSE
	UPDATE bsapp_db.user_mast
	SET
    is_verify = true
	WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND otp=in_otp;
    SELECT login_id,name,mobile_no,mobile_cc_code,otp,is_verify FROM bsapp_db.user_mast WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND otp=in_otp;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_views_count_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_views_count_mast_save`(
    IN in_ads_id INT,
    IN in_user_id INT
)
BEGIN
IF NOT EXISTS(select ads_id,user_id from bsapp_db.views_count_mast where ads_id = in_ads_id AND user_id = in_user_id ) THEN
 	INSERT INTO bsapp_db.views_count_mast
		(ads_id,user_id,views_count)
	VALUES
		(in_ads_id,in_user_id,1);
		
END IF;
 UPDATE bsapp_db.ads_mast SET  views = (select COUNT(views_count)  from bsapp_db.views_count_mast WHERE ads_id = in_ads_id  ) WHERE ads_id = in_ads_id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_year_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_year_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.year_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_year_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_year_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.year_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_year_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_year_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.year_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.year_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.year_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 11:05:23