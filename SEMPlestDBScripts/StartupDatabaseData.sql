--roles 
insert into dbo.roles (rolename) values ('Customer (child)')
insert into dbo.roles (rolename) values ('Customer (parent)')
insert into dbo.roles (rolename) values ('Account Representative (Rep)')
insert into dbo.roles (rolename) values ('Salesperson')
insert into dbo.roles (rolename) values ('Finance User')
insert into dbo.roles (rolename) values ('Super User (Admin)')
insert into dbo.roles (rolename) values ('System')

--scheduler 
insert into Frequency(Frequency) values ('Now')
insert into Frequency(Frequency) values ('Daily')
insert into Frequency(Frequency) values ('Weekly')
insert into Frequency(Frequency) values ('Monthly')
--Ad Engines
Insert into AdvertisingEngine(AdvertisingEngine) VALUES ('MSN')
Insert into AdvertisingEngine(AdvertisingEngine) VALUES ('Google')
--Keyword Match Type
insert into BidType(BidType) values ('Broad')
insert into BidType(BidType) values ('Exact')
insert into BidType(BidType) values ('Phrase')
--Budget cycle
insert into BudgetCycle(BudgetCycle) values ('Daily')
insert into BudgetCycle(BudgetCycle) values ('Weekly')
insert into BudgetCycle(BudgetCycle) values ('Monthly')
insert into BudgetCycle(BudgetCycle) values ('Yearly')