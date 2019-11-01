/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
use [Telecaster]
CREATE procedure [dbo].[shop_login]
@avatarId int,
@accountId int,
@passWord int

as
SET NOCOUNT ON                  
SET LOCK_TIMEOUT 60000 
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT name, race, sex, lv, job, immoral_point, otp_date 
FROM dbo.Character WITH(NOLOCK) 
WHERE sid=@avatarId 
AND account_id = @accountId 
AND otp_value = @passWord 
AND datediff(s, otp_date, getdate()) < 30
AND login_time > logout_time