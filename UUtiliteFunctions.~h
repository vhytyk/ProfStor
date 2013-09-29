//---------------------------------------------------------------------------

#ifndef UUtiliteFunctionsH
#define UUtiliteFunctionsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
#include <map>
#include <utilcls.h>
#include <vcl.h>
#include <IBDatabase.hpp>
#include <IBSQL.hpp>
#include <IBUpdateSQL.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <cxGridDBDataDefinitions.hpp>
#include <IniFiles.hpp>
#include "FR_Class.hpp"
#include "FR_Desgn.hpp"
#include "FR_DBSet.hpp"
#include "FR_DSet.hpp"
//---------------------------------------------------------------------------
typedef std::map<AnsiString,TVariant> TMyColumns;
enum TRights {Admin=1, User=2};
static TIBDatabase *IBDatabase;
static TIniFile * Settings;
static AnsiString BlankDirectory;
static TRights Rights;

void Init();
void Finilize();
void Disconnect();
void Connect();
bool IsConnected();
TRights GetRights();
void SetRights(TRights r);

TIniFile * GetSettings();


TIBQuery * CreateQuery(TComponent * Owner,AnsiString, bool);
void SetDisplayLabels(TIBQuery *, TcxGridDBDataController *, AnsiString);
int InsertIntoTable(AnsiString tname, TMyColumns args);
bool UpdateTable(AnsiString tname, int identity, TMyColumns args, AnsiString id_name = NULL);
bool DeleteFromTable(AnsiString tname, int identity,bool message, AnsiString id_name = NULL);
AnsiString GetDatabaseName();
void SetDatabaseName(AnsiString value);
double Round (double Argument, int Precision);


#endif
