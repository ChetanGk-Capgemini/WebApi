create database [HospitalDB]
go
USE [HospitalDB]
GO
/****** Object:  Table [dbo].[Bill_Data]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Data](
	[Bill_No] [int] NOT NULL,
	[Pid] [int] NULL,
	[Bill_Date] [datetime] NULL,
	[Patient_Type] [varchar](30) NULL,
	[Doctor_Id] [int] NULL,
	[Doctor_Fees] [money] NULL,
	[Room_Charge] [money] NULL,
	[Operation_Charges] [money] NULL,
	[Medicine_Fees] [money] NULL,
	[Total_Days] [smallint] NULL,
	[Lab_Fees] [money] NULL,
	[Total_Amount] [money] NULL,
	[Billing_Status] [varchar](10) NULL,
 CONSTRAINT [Pk_BNo] PRIMARY KEY CLUSTERED 
(
	[Bill_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptId] [int] NOT NULL,
	[DepartmentName] [varchar](30) NULL,
 CONSTRAINT [Pk_deptid] PRIMARY KEY CLUSTERED 
(
	[DeptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_Id] [int] NOT NULL,
	[Doctor_Name] [varchar](30) NULL,
	[DeptId] [int] NULL,
 CONSTRAINT [Pk_DoctorId] PRIMARY KEY CLUSTERED 
(
	[Doctor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inpatient](
	[Pid] [int] NOT NULL,
	[Room_No] [int] NULL,
	[Doctor_Id] [int] NULL,
	[Admission_Date] [date] NOT NULL,
	[Discharge_Date] [date] NULL,
	[Amount_Per_Day] [money] NULL,
 CONSTRAINT [Pk_Inpatient] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC,
	[Admission_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lab_Information]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab_Information](
	[Lab_Id] [int] NOT NULL,
	[LabTestName] [varchar](30) NULL,
	[Price] [money] NULL,
 CONSTRAINT [Pk_LabId] PRIMARY KEY CLUSTERED 
(
	[Lab_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lab_Patient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab_Patient](
	[Lab_Id] [int] NOT NULL,
	[PId] [int] NULL,
	[Doctor_Id] [int] NULL,
	[Test_Date] [date] NULL,
	[Price] [money] NULL,
	[Billing_Status] [varchar](10) NULL,
	[Test_Id] [int] NULL,
 CONSTRAINT [Pk_Labid_Lab] PRIMARY KEY CLUSTERED 
(
	[Lab_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [Login_pk] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outpatient](
	[Pid] [int] NOT NULL,
	[Treatment_Date] [date] NOT NULL,
	[Doctor_Id] [int] NULL,
 CONSTRAINT [Pk_Outpatient] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC,
	[Treatment_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_Id] [int] NOT NULL,
	[Name] [varchar](30) NULL,
	[Age] [smallint] NULL,
	[Weight] [smallint] NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](50) NULL,
	[Phone_No] [bigint] NULL,
	[Disease] [varchar](30) NULL,
 CONSTRAINT [Pk_PatientId] PRIMARY KEY CLUSTERED 
(
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Data]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Data](
	[Room_No] [int] NOT NULL,
	[Room_Specification] [varchar](20) NULL,
	[Price] [money] NULL,
 CONSTRAINT [Pk_Roomdata] PRIMARY KEY CLUSTERED 
(
	[Room_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Info]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Info](
	[Room_no] [int] NULL,
	[Room_Status] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill_Data]  WITH CHECK ADD  CONSTRAINT [Fk_Did] FOREIGN KEY([Doctor_Id])
REFERENCES [dbo].[Doctor] ([Doctor_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill_Data] CHECK CONSTRAINT [Fk_Did]
GO
ALTER TABLE [dbo].[Bill_Data]  WITH CHECK ADD  CONSTRAINT [Fk_Pid] FOREIGN KEY([Pid])
REFERENCES [dbo].[Patient] ([Patient_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill_Data] CHECK CONSTRAINT [Fk_Pid]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Fk_deptid_dept] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Fk_deptid_dept]
GO
ALTER TABLE [dbo].[Inpatient]  WITH CHECK ADD  CONSTRAINT [Fk_Inpaitent_DoctorId] FOREIGN KEY([Doctor_Id])
REFERENCES [dbo].[Doctor] ([Doctor_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inpatient] CHECK CONSTRAINT [Fk_Inpaitent_DoctorId]
GO
ALTER TABLE [dbo].[Inpatient]  WITH CHECK ADD  CONSTRAINT [Fk_Inpatient_Pid] FOREIGN KEY([Pid])
REFERENCES [dbo].[Patient] ([Patient_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inpatient] CHECK CONSTRAINT [Fk_Inpatient_Pid]
GO
ALTER TABLE [dbo].[Inpatient]  WITH CHECK ADD  CONSTRAINT [Fk_Inpatient_Roomno] FOREIGN KEY([Room_No])
REFERENCES [dbo].[Room_Data] ([Room_No])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inpatient] CHECK CONSTRAINT [Fk_Inpatient_Roomno]
GO
ALTER TABLE [dbo].[Lab_Patient]  WITH CHECK ADD  CONSTRAINT [Fk_Docid_Lab] FOREIGN KEY([Doctor_Id])
REFERENCES [dbo].[Doctor] ([Doctor_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lab_Patient] CHECK CONSTRAINT [Fk_Docid_Lab]
GO
ALTER TABLE [dbo].[Lab_Patient]  WITH CHECK ADD  CONSTRAINT [Fk_Lab_Id] FOREIGN KEY([Test_Id])
REFERENCES [dbo].[Lab_Information] ([Lab_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lab_Patient] CHECK CONSTRAINT [Fk_Lab_Id]
GO
ALTER TABLE [dbo].[Lab_Patient]  WITH CHECK ADD  CONSTRAINT [Fk_Patient_Lab] FOREIGN KEY([PId])
REFERENCES [dbo].[Patient] ([Patient_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lab_Patient] CHECK CONSTRAINT [Fk_Patient_Lab]
GO
ALTER TABLE [dbo].[Outpatient]  WITH CHECK ADD  CONSTRAINT [Fk_Outpaitent_DoctorId] FOREIGN KEY([Doctor_Id])
REFERENCES [dbo].[Doctor] ([Doctor_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Outpatient] CHECK CONSTRAINT [Fk_Outpaitent_DoctorId]
GO
ALTER TABLE [dbo].[Outpatient]  WITH CHECK ADD  CONSTRAINT [Fk_outpatient_Pid] FOREIGN KEY([Pid])
REFERENCES [dbo].[Patient] ([Patient_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Outpatient] CHECK CONSTRAINT [Fk_outpatient_Pid]
GO
ALTER TABLE [dbo].[Room_Info]  WITH CHECK ADD  CONSTRAINT [Fk_Room_No] FOREIGN KEY([Room_no])
REFERENCES [dbo].[Room_Data] ([Room_No])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Room_Info] CHECK CONSTRAINT [Fk_Room_No]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddBill]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[usp_AddBill]
@Bill_No int,
@Pid int,
@Bill_Date date,
@Patient_Type varchar(30),
@Doctor_Id int,
@Doctor_Fees money,
@Room_Charge money,
@Operation_Charges money,
@Medicine_Fees money,
@Total_Days smallint,
@Lab_Fees money,
@Total_Amount money,
@Billing_Status varchar(10)
as begin
INSERT INTO Bill_Data values(@Bill_No,@Pid,@Bill_Date,@Patient_Type,@Doctor_Id,@Doctor_Fees,@Room_Charge,@Operation_Charges,@Medicine_Fees,@Total_Days,@Lab_Fees,@Total_Amount,@Billing_Status);			
end;

GO
/****** Object:  StoredProcedure [dbo].[Usp_AddDoctor]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[Usp_AddDoctor] @doctorid varchar(10),
@doctorname varchar(30),
@deptid int
as
begin
insert into Doctor values( @doctorid,@doctorname,@deptid);
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_AddInpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[usp_AddInpatient] @pid varchar(10),
@roomno int,
@doctor_id int,
@admission_date date,
@discharge_date date,
@amountperday money
as
declare @Room_Charge varchar(10),@Bill_No varchar(10)
begin 
set @Room_Charge = '0'--(select Price from Room_Data where Room_No = @roomno)
set @Bill_No = (select isnull((max(Bill_No)+1),0) from Bill_Data)
insert into Inpatient  values( @pid,@roomno,@doctor_id,@admission_date ,@discharge_date,NULL);
update Room_Info set Room_Status = '1' where Room_no =@roomno;
INSERT INTO Bill_Data values(@Bill_No,@pid,@admission_date,'InPatient',@Doctor_Id,'0',@Room_Charge,'0','0','0','0','0','0');
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddOutpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create procedure [dbo].[Usp_AddOutpatient] @pid varchar(10),
@treatment_date date,
@doctor_id int
as
declare @Bill_No int
begin
set @Bill_No = (select isnull((max(Bill_No)+1),0) from Bill_Data)
insert into Outpatient values( @pid,@treatment_date,@doctor_id);
INSERT INTO Bill_Data values(@Bill_No,@pid,@treatment_date,'OutPatient',@Doctor_Id,'0','0','0','0','0','0','0','0');
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddPatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Usp_AddPatient] @patientid int,
@name varchar(30),
@age smallint,@weight smallint,@gender varchar(10),@address varchar(30),@phonenumber bigint,@disease varchar(30)
as
begin
insert into Patient values(@patientid,@name,@age,@weight,@gender,@address,@phonenumber,@disease)
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteBill]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_DeleteBill]
@Bill_No int
as begin
DELETE from Bill_Data Where Bill_No=@Bill_No
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteDoctor]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usp_DeleteDoctor] @doctorid int
as
begin
delete from Doctor where Doctor_Id=@doctorid;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteInpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create procedure [dbo].[Usp_DeleteInpatient] @pid int,
@admission_date date
as
declare @Bill int
begin
update Room_Info set Room_Status = '0' where Room_no =
(select Room_No from Inpatient where Pid=@pid and Admission_Date=@admission_date);
delete from Inpatient where Pid=@pid and Admission_Date=@admission_date;
set @Bill = (select max(Bill_No) from Bill_Data where Pid = @pid and Billing_Status = '0')
if((select Total_Amount from Bill_Data where Bill_No = @Bill) ='0')
begin
delete from Bill_Data where Bill_No =@Bill;
end
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteLabDetails]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeleteLabDetails] @Id int
  as begin 
  delete from Lab_Information where Lab_Id = @Id
  end;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteLabTestDetails]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create procedure [dbo].[usp_DeleteLabTestDetails] 
   @Lab_Id int
   as begin
   delete from Lab_Patient where Lab_Id = @Lab_Id
   end
   
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteOutpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Usp_DeleteOutpatient] @pid int,
@treatment_date date
as
declare @Bill int
begin
delete from Outpatient where Pid=@pid and Treatment_Date=@treatment_date;
set @Bill = (select max(Bill_No) from Bill_Data where Pid = @pid and Billing_Status = '0')
if((select Total_Amount from Bill_Data where Bill_No = @Bill) ='0')
begin
delete from Bill_Data where Bill_No =@Bill;
end
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeletePaidPatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeletePaidPatient] @Pid int
as begin
delete from Inpatient where Pid = @Pid
delete from Outpatient where Pid = @Pid
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeletePatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usp_DeletePatient] @patientid int
as
begin
delete from Patient where Patient_Id=@patientid;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteRoom_Info]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_DeleteRoom_Info] @pid int,
@admission_date date
as
begin
update Room_Info set Room_Status = '0' where Room_no =
(select Room_No from Inpatient where Pid=@pid and Admission_Date=@admission_date);
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteRoomData]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Usp_DeleteRoomData] @roomno int
as
begin
delete from Room_Data where Room_No=@roomno;
delete from Room_Info where Room_No=@roomno;
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeletetDep]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeletetDep] @DId  int
as begin
Delete from Department where DeptId=@DId
end;

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllBills]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create procedure [dbo].[Usp_GetAllBills]
as begin 
select * from Bill_Data order by Billing_Status ;
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllDep]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_GetAllDep]
as begin
select * from Department
end;

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllDoctor]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_GetAllDoctor]
as begin 
select * from Doctor ;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllInpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    create procedure [dbo].[Usp_GetAllInpatient]
as begin
select * from Inpatient;
end;

GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllLabDetails]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    create procedure [dbo].[usp_GetAllLabDetails]
  as begin
  select * from Lab_Information
  end;

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllOutpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure  [dbo].[Usp_GetAllOutpatient]
as begin
select [Pid],[Name],[Doctor_Name],[Disease],[Treatment_Date] from Doctor d,Patient P, Outpatient O where D.Doctor_Id=O.Doctor_Id and O.Pid=P.Patient_Id
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllPatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_GetAllPatient]
as begin 
select * from Patient;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllRooms]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Usp_GetAllRooms] 
as 
begin
select * from Room_Data;
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllUnallocatedRooms]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetAllUnallocatedRooms]
as begin
select Room_No from Room_Info where Room_Status = '0'
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAvailablePatients]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetAvailablePatients]
as begin
select * from Patient where Patient_Id in (select PId from Inpatient union select PId from Outpatient)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetLabTestDetails]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[usp_GetLabTestDetails]
  as begin
  select lp.Lab_Id ,p.Patient_Id,d.Doctor_Id,li.Lab_Id,li.Price,lp.Test_Date from Patient p,Doctor d,Lab_Patient lp, Lab_Information li where lp.PId = p.Patient_Id and lp.Doctor_Id = d.Doctor_Id and lp.Test_Id = li.Lab_Id
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMaxBillNo]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_GetMaxBillNo]
as begin
select Max( [Bill_No] ) as Bill_No from Bill_Data;
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMaxDepId]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_GetMaxDepId]
as begin
select ISNULL(MAX(DeptId),0)as DID from Department
end;

GO
/****** Object:  StoredProcedure [dbo].[usp_GetMaxDoctorId]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_GetMaxDoctorId]
as begin
select Max( [Doctor_Id] ) as DoctorId from Doctor;
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMaxLabId]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create procedure [dbo].[usp_GetMaxLabId]
  as begin 
  select max(Lab_Id) as Lab_Id from Lab_Information 
  end;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMaxPatientId]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_GetMaxPatientId]
as begin
select Max(Patient_Id) as Patient_Id from Patient;
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUnallocatedPatients]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetUnallocatedPatients]
as begin
select * from Patient p
where p.Patient_Id not in
(select Pid  from Inpatient) and p.Patient_Id not in
(select Pid  from Outpatient) 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUnpaidPtientBillNo]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetUnpaidPtientBillNo] @Pid int
as
Declare @Bill_status int
begin 
set @Bill_status = (select MAX(Bill_No) as Bill_No from Bill_Data where Pid = @PId and Billing_Status = '0')
return @Bill_status
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertDep]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_InsertDep] @DId int,@DName varchar(30)
as begin
Insert into Department values(@DId,@DName)
end;

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertLab]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_InsertLab]
  @Lab_Id int, 
  @LabTesstName varchar(10),
  @Price money
  as begin 
  Insert into Lab_Information values (@Lab_Id,@LabTesstName,@Price)
  end;

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertLabTestDetails]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[usp_InsertLabTestDetails] 
   @Lab_Id int ,      
   @PId    int ,       
   @Doctor_Id int,    
   @Test_Date date,    
   @Price money ,        
   @Billing_Status varchar(10),
   @Test_Id int
  as
  declare @Total money
  begin
	set @Billing_Status = (select MAX(Bill_No) as Bill_No from Bill_Data where Pid = @PId and Billing_Status = '0')
	print 'BillNo='+@Billing_Status
	update Bill_Data set  Lab_Fees = (select isnull(Sum(Price),0)+@Price from Lab_Patient where PId = @PId and Billing_Status = @Billing_Status) where Bill_No =@Billing_Status;
	update Bill_Data set Total_Amount = cast(Doctor_Fees as money)+cast(Room_Charge as money)+cast(Operation_Charges as money)+cast(Medicine_Fees as money)+cast(Lab_Fees as money) where Bill_No =@Billing_Status
	insert into [Lab_Patient](Lab_Id,PId,Doctor_Id,Test_Date,Price,Billing_Status,Test_Id)
    values (@Lab_Id,@PId,@Doctor_Id,@Test_Date,@Price,@Billing_Status,@Test_Id)
   end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertMaxBill_No]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create procedure [dbo].[usp_InsertMaxBill_No] @Pid int,@Bill_Date date,@D_Id int,@P money
as begin
insert into Bill_Data ([Bill_No],[Pid],[Bill_Date],[Patient_Type],[Doctor_Id],[Doctor_Fees],[Room_Charge],[Operation_Charges],[Medicine_Fees],[Total_Days],[Lab_Fees],[Total_Amount],[Billing_Status]) 
values((select isnull(MAX(Bill_No)+1,0) from Bill_Data),@Pid,@Bill_Date,'',@D_Id,'0','0','0','0','0',@P,'0','0')
print @P
Print 'doctor'+@D_Id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_MaxLab_PatientTestId]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[usp_MaxLab_PatientTestId]
  as begin 
  select isnull(max(Lab_Id),0) as Lab_Id from Lab_Patient 
  end;
GO
/****** Object:  StoredProcedure [dbo].[usp_MaxLabTestId]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[usp_MaxLabTestId]
  as begin
  select  isnull(max(Lab_Id),0) as Labid  from Lab_Patient
  end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_password]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Usp_password]
@username varchar(50)
as 
begin
select * from Login where Username=@username;
end;
drop procedure Usp_password


GO
/****** Object:  StoredProcedure [dbo].[Usp_RoomData]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Usp_RoomData] @roomno int,
@roomspecification varchar(20),
@price money
as begin
insert into Room_Data values(@roomno,@roomspecification,@price);
insert into Room_Info values (@roomno,'0')
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchBilldate]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Usp_SearchBilldate]
@billdate varchar(10)
AS begin
select [Bill_No],[Name],[Total_Amount] from Bill_Data b,Patient P where b.Pid=p.Patient_Id and [Bill_Date]=@billdate;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchBillno]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[Usp_SearchBillno]
@billno int
AS begin
select [Bill_No],[Name],[Total_Amount] from Bill_Data b,Patient P where b.Pid=p.Patient_Id and [Bill_No]=@billno;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchDoctor]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usp_SearchDoctor] @doctorid int
as 
begin
select * from Doctor where Doctor_Id=@doctorid;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchInpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usp_SearchInpatient] @pid int,
@admission_date date
as 
begin
select * from Inpatient where Pid=@pid and Admission_Date=@admission_date;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchOutpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_SearchOutpatient] @pid int,
@treatment_date date
as 
begin
select * from Outpatient where Pid=@pid and Treatment_Date=@treatment_date;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchPatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Usp_SearchPatient] @patientid int
as 
begin
select * from Patient where Patient_Id=@patientid;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_SearchRoom]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[Usp_SearchRoom] @roomno int
as begin
select * from Room_Data where Room_No=@roomno;
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBill]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[usp_UpdateBill]
@Bill_No int,
@Pid int,
@Bill_Date date,
@Patient_Type varchar(30),
@Doctor_Id varchar(10),
@Doctor_Fees money,
@Room_Charge money,
@Operation_Charges money,
@Medicine_Fees money,
@Total_Days smallint,
@Lab_Fees money,
@Total_Amount money,
@Billing_Status varchar(10)
as begin
UPDATE Bill_Data SET 
Pid=@Pid,
Bill_Date=@Bill_Date,
Patient_Type=@Patient_Type,
Doctor_Id=@Doctor_Id,
Doctor_Fees=@Doctor_Fees,
Room_Charge=@Room_Charge,
Operation_Charges=@Operation_Charges,
Medicine_Fees=@Medicine_Fees,
Total_Days=@Total_Days,
Lab_Fees=@Lab_Fees,
Total_Amount = cast(@Doctor_Fees as money)+cast(@Room_Charge as money)+cast(@Operation_Charges as money)+cast(@Medicine_Fees as money)+cast(@Lab_Fees as money) ,
Billing_Status =@Billing_Status
WHERE Bill_No=@Bill_No
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBillStatus]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateBillStatus] @Bill_No int
as begin
update Bill_Data set Billing_Status = '1' where Bill_No = @Bill_No
DELETE FROM Lab_Patient WHERE Billing_Status = @Bill_No
end


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateDep]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_UpdateDep] @DId int,@DName varchar(30)
as begin
update Department set DepartmentName = @DName where DeptId = @DId
end;

GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateDoctor]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Usp_UpdateDoctor] @doctorid int,
@doctorname varchar(30),
@deptid int
as
begin
UPDATE [dbo].[Doctor]
   SET [Doctor_Name] = @doctorname
      ,[DeptId] = @deptid
 WHERE [Doctor_Id] = @doctorid
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateInpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Usp_UpdateInpatient] @pid int,
@roomno int,
@doctor_id int,
@admission_date date,
@discharge_date date,
@amountperday money
as
begin
update Inpatient set 
Pid=@pid,
Room_No=@roomno,
Doctor_Id=@doctor_id,
Discharge_Date=@discharge_date,
Amount_Per_Day=@amountperday
where Pid=@pid and Admission_Date=@admission_date;

if(@discharge_date>= @admission_date)
begin
update Room_Info set Room_Status = '0' where Room_no = @roomno;
end
else
begin
update Room_Info set Room_Status = '1' where Room_no = @roomno;
end
end;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateLabTestDetails]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateLabTestDetails] 
   @Lab_Id			int,      
   @PId				int,       
   @Doctor_Id		int,    
   @Test_Date		date,    
   @Price			money ,        
   @Billing_Status varchar(10),
   @Test_Id			int
   as begin
   update [Lab_Patient] set 
   PId = @PId,				
   Doctor_Id= @Doctor_Id,		
   Test_Date= @Test_Date,		
   Price= @Price,		
   Billing_Status= @Billing_Status,
   Test_Id= @Test_Id
   where Lab_Id = @Lab_Id
   end
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateOutpatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Usp_UpdateOutpatient] @pid int,
@treatment_date date,
@doctor_id int
as
begin
update Outpatient set 
Pid=@pid,
Treatment_Date=@treatment_date,
Doctor_Id=@doctor_id
where Pid=@pid and Treatment_Date=@treatment_date;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdatePatient]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[Usp_UpdatePatient] @patientid int,
@name varchar(30),
@age smallint,@weight smallint,@gender varchar(10),@address varchar(30),@phonenumber bigint,@disease varchar(30)
as
begin
update Patient set 
Name=@name,
Age=@age,
Weight=@weight,
Gender=@gender,
Address=@address,
Phone_No=@phonenumber,
Disease=@disease where Patient_Id=@patientid;
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateRoomData]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[Usp_UpdateRoomData] @roomno int,
@roomspecification varchar(20),
@price money
as begin
update Room_data set 
Room_No=@roomno,
Room_Specification=@roomspecification,
Price=@price
where Room_No=@roomno
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_Username]    Script Date: 17-05-2021 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Usp_Username]
@username varchar(50),
@password varchar(50)
as begin
insert into Login values(@username,@password);
end;

GO
