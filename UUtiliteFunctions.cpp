//---------------------------------------------------------------------------
#pragma hdrstop
#include "UUtiliteFunctions.h"
#include "math.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


//---------------------------------------------------------------------------
void Init()
{
   IBDatabase = new TIBDatabase(Application);
   Settings = new TIniFile(ChangeFileExt( Application->ExeName, ".ini" ));


   IBDatabase->Params->Add("user_name=sysdba");
   IBDatabase->Params->Add("password=masterkey");
   IBDatabase->Params->Add("lc_ctype=WIN1251");
   IBDatabase->LoginPrompt = false;
   Connect();

   BlankDirectory = Settings->ReadString("Report","Derictory","blanks");
}
//---------------------------------------------------------------------------
void SetDisplayLabels(TIBQuery * query, TcxGridDBDataController * DataController, AnsiString str)
{
   if(!IsConnected())
      return;
   int last_index = 1;
   int count = 0;
   AnsiString item;
   int length = str.Length();
   for(int i = 1;i<=length; i++)
   {
      if(str[i] == ',' || i == length )
      {
         int len = i-last_index;
         if(i == length)
            len = i-last_index+1;
         item = str.SubString(last_index, len);
         last_index = i+1;

         if(count <= query->FieldList->Count-1)
            query->FieldList->Fields[count]->DisplayLabel = item;
         item = item.Trim();
         if(item == "false")
            query->FieldList->Fields[count]->Visible = false;

         count ++;
      }
   }
   if(query->Active && DataController->ItemCount == 0)
      DataController->CreateAllItems();
}
//---------------------------------------------------------------------------
TIBQuery * CreateQuery(TComponent * Owner, AnsiString str, bool open)
{
   TIBQuery *q = new TIBQuery(Owner);
   q->Database = IBDatabase;
   q->Transaction = new TIBTransaction(Application);
   q->Transaction->DefaultDatabase = IBDatabase;
   if(!str.IsEmpty() )
   {
      q->SQL->Clear();
      q->SQL->Add(str);
      if(open && IsConnected())
         q->Open();
      return q;
   }else{
      return new TIBQuery(Application);
   }
}
//---------------------------------------------------------------------------
// Вставляє стоку в таблицю.
//---------------------------------------------------------------------------
int InsertIntoTable(AnsiString tname, TMyColumns args)
{
   int rezult = true;
   TMyColumns::iterator iter;
   AnsiString str = "insert into "+tname+" (";
   AnsiString str_p = " values (";
   unsigned int i=0;
   for(iter = args.begin(); iter != args.end(); ++iter)
   {
      str += iter->first + (i == args.size()-1?" ) ":", ");
      str_p += ":p_"+iter->first + (i == args.size()-1?" ) ":", ");
      i++;
   }
   str += str_p;
   TIBQuery *q = CreateQuery(0, str, false);
   for(iter = args.begin(); iter != args.end(); ++iter)
   {
      q->ParamByName("p_"+iter->first)->Value = iter->second;
      i++;
   }
   try{
      q->ExecSQL();
      q->Transaction->Commit();
//      q->SQL->Clear();
 //     q->SQL->Add( "select @@identity as 'id'" );
//      q->Open();
 //     rezult = q->FieldByName("id")->AsInteger;
   rezult = 0;
   }catch(...){
      rezult = false;
   }
   delete q;

   return rezult;
}
//---------------------------------------------------------------------------
// Змінює дані строки в таблиці.
//---------------------------------------------------------------------------
bool UpdateTable(AnsiString tname, int identity, TMyColumns args, AnsiString id_name)
{
   bool rezult = true;
   TMyColumns::iterator iter;
   AnsiString str = "update "+tname+" set ";
   unsigned int i=0;
   for(iter = args.begin(); iter != args.end(); ++iter)
   {
      str += iter->first + "=:p_"+iter->first + (i == args.size()-1?" ":", ");
      i++;
   }
   str += " where "+((id_name == NULL)? ("ID_" + tname) : id_name)+" = :p_ID_"+tname;
   TIBQuery *q = CreateQuery(0, str, false);
   i=0;
   for(iter = args.begin(); iter != args.end(); ++iter)
   {
      q->ParamByName("p_"+iter->first)->Value = iter->second;
      i++;
   }
   try{
      if(identity > 0)
      {
         q->ParamByName("p_ID_"+tname)->Value = identity;
         q->ExecSQL();
         q->Transaction->Commit();
      }else{
         rezult = false;
      }
   }catch(...){
      rezult = false;
   }
   delete q;
   return rezult;
}
//---------------------------------------------------------------------------
// Удаляє строку з таблиці.
//---------------------------------------------------------------------------
bool DeleteFromTable(AnsiString tname, int identity,bool message, AnsiString id_name )
{
   bool rezult = true;
   bool del = false;
   if(message)
   {
      if(MessageDlg("Ви дійсно хочете знищити запис?",
         mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)
      {
         del = true;
      }
   }else{
      del = true;
   }
   TIBQuery *q = CreateQuery(0,
       "delete from "+tname+" where "+((id_name == NULL)? ("ID_" + tname) : id_name)+" = "+IntToStr(identity)
   , false);
   try
   {
      if(del){
         q->ExecSQL();
         q->Transaction->Commit();
      }else{
         rezult = false;
      }
   }catch(...){
      rezult = false;
   }
   delete q;
   return rezult;
}
//------------------------------------------------------------------------------
// Округление
//------------------------------------------------------------------------------
double Round (double Argument, int Precision)
{
double div = 1.0;
if (Precision >= 0)
   while (Precision--)
          div *= 10.0;
else
   while (Precision++)
          div /= 10.0;
return floor(Argument * div + 0.5) / div;
}
//------------------------------------------------------------------------------
AnsiString GetDatabaseName()
{
   return IBDatabase->DatabaseName;
}
//------------------------------------------------------------------------------
void SetDatabaseName(AnsiString value)
{
   IBDatabase->DatabaseName = value;
}
//------------------------------------------------------------------------------
void Finilize()
{
   Settings->WriteString("Database Options","DatabaseName",IBDatabase->DatabaseName);
   Disconnect();
   delete Settings;
   delete IBDatabase;
}
//------------------------------------------------------------------------------
void Disconnect()
{
   IBDatabase->Close();
}
//------------------------------------------------------------------------------
void Connect()
{
   IBDatabase->DatabaseName = Settings->ReadString("Database Options","DatabaseName","sklad.gdb");
   IBDatabase->Open();
}
//------------------------------------------------------------------------------
TIniFile * GetSettings()
{
   return Settings;
}
//------------------------------------------------------------------------------
TRights GetRights()
{
   return Rights;
}
//------------------------------------------------------------------------------
void SetRights(TRights r)
{
   Rights = r;
}
//------------------------------------------------------------------------------
bool IsConnected()
{
   return IBDatabase->Connected;
}
//------------------------------------------------------------------------------

