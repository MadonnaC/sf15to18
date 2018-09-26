CREATE FUNCTION sf15to18 
(
	@id15 char(15)
)
RETURNS char(18)
AS
BEGIN
declare @id18 char(18)
declare @num1 int
declare @num2 int
declare @num3 int
declare @Str char(32)='ABCDEFGHIJKLMNOPQRSTUVWXYZ012345'

set @num1= iif(ascii(substring(@id15,5,1)) between 65 and 90,16,0)+
			iif(ascii(substring(@id15,4,1)) between 65 and 90,8,0)+
			iif(ascii(substring(@id15,3,1)) between 65 and 90,4,0)+
			iif(ascii(substring(@id15,2,1)) between 65 and 90,2,0)+
			iif(ascii(substring(@id15,1,1)) between 65 and 90,1,0)

set @num2= iif(ascii(substring(@id15,10,1)) between 65 and 90,16,0)+
			iif(ascii(substring(@id15,9,1)) between 65 and 90,8,0)+
			iif(ascii(substring(@id15,8,1)) between 65 and 90,4,0)+
			iif(ascii(substring(@id15,7,1)) between 65 and 90,2,0)+
			iif(ascii(substring(@id15,6,1)) between 65 and 90,1,0)

set @num3= iif(ascii(substring(@id15,15,1)) between 65 and 90,16,0)+
			iif(ascii(substring(@id15,14,1)) between 65 and 90,8,0)+
			iif(ascii(substring(@id15,13,1)) between 65 and 90,4,0)+
			iif(ascii(substring(@id15,12,1)) between 65 and 90,2,0)+
			iif(ascii(substring(@id15,11,1)) between 65 and 90,1,0)

set @id18=@id15+substring(@str,@num1+1,1)+substring(@str,@num2+1,1)+substring(@str,@num3+1,1)

return @id18

END
GO

