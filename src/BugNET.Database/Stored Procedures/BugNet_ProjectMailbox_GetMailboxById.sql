﻿CREATE PROCEDURE [dbo].[BugNet_ProjectMailbox_GetMailboxById]
    @ProjectMailboxId int
AS

SET NOCOUNT ON
    
SELECT 
	BugNet_ProjectMailboxes.*,
	u.UserName AssignToUserName,
	u.DisplayName AssignToDisplayName,
	BugNet_ProjectIssueTypes.IssueTypeName
FROM 
	BugNet_ProjectMailBoxes
	INNER JOIN AspNetUsers u ON u.Id = AssignToUserId
	INNER JOIN BugNet_ProjectIssueTypes ON BugNet_ProjectIssueTypes.IssueTypeId = BugNet_ProjectMailboxes.IssueTypeId	
WHERE
	BugNet_ProjectMailBoxes.ProjectMailboxId = @ProjectMailboxId
