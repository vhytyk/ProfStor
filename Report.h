//---------------------------------------------------------------------------

#ifndef ReportH
#define ReportH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "UFrameList.h"
#include <ExtCtrls.hpp>
#include "cxCalendar.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDropDownEdit.hpp"
#include "cxEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include "cxButtons.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "FR_Class.hpp"
#include "FR_DBSet.hpp"
#include "FR_DSet.hpp"
#include <DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
#include <IBQuery.hpp>
#include "cxButtonEdit.hpp"
#include "cxLabel.hpp"
//---------------------------------------------------------------------------
typedef std::map<AnsiString,TVariant> TMyFields;
class TFReport;
class TFormReport : public TForm
{
__published:	// IDE-managed Components
   TPanel *Panel1;
   TPanel *Panel2;
   TcxDateEdit *DateStart;
   TcxDateEdit *DateEnd;
   TcxButton *cxButton1;
   TcxButton *cxButton2;
   TcxButton *cxButton3;
   TfrReport *frReport1;
   TfrDBDataSet *frDBDataSet1;
   TFrameList *FrameList1;
   TcxLabel *cxLabel3;
   TcxButtonEdit *EditPartner;
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall cxButton2MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
   void __fastcall DateChange(TObject *Sender);
   void __fastcall frReport1GetValue(const AnsiString ParName,
          Variant &ParValue);
   void __fastcall cxButton2Click(TObject &Sender);
   void __fastcall IBQuery1FilterRecord(TDataSet *DataSet, bool &Accept);
   void __fastcall FrameList1GridView1DataControllerFilterChanged(
          TObject *Sender);
   void __fastcall FormKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall EditPartnerPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
private:	// User declarations
   TFReport * Report;
   TMyFields Fields;
   AnsiString QueryStr;
   AnsiString ReportFileName;
   bool a;
   int id_partner;
public:		// User declarations
   __fastcall TFormReport(TComponent* Owner, TMyFields fields,
         AnsiString QueryString, AnsiString filename);
   void __fastcall Refresh();
   AnsiString __fastcall DateReplace(AnsiString str);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormReport *FormReport;
//---------------------------------------------------------------------------
#endif
