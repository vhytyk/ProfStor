//---------------------------------------------------------------------------

#ifndef NakladnaH
#define NakladnaH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtons.hpp"
#include "cxCalendar.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDropDownEdit.hpp"
#include "cxEdit.hpp"
#include "cxLabel.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include "Document.h"
#include <ExtCtrls.hpp>
#include "UFrameList.h"
#include "cxButtonEdit.hpp"
#include "cxCalc.hpp"
#include "cxCheckBox.hpp"
#include "FR_Class.hpp"
#include "FR_DBSet.hpp"
#include "FR_DSet.hpp"
#include "FR_Desgn.hpp"
#include "cxSpinEdit.hpp"

//---------------------------------------------------------------------------
class TDocRashod;
class TFReport;
class TNakladnaForm : public TDocumentForm
{
__published:	// IDE-managed Components
   TFrameList *FrameList1;
   TcxButtonEdit *EditPartner;
   TcxLabel *cxLabel3;
   TcxCalcEdit *EditSuma;
   TcxLabel *cxLabel4;
   TLabel *Label1;
   TLabel *Label2;
   TcxButton *cxButton4;
   TfrReport *frReport1;
   TfrDBDataSet *frDBDataSet1;
   TcxButton *ButtonKlient;
   TcxSpinEdit *cxSpinEditProcent;
   TLabel *Label3;
   TLabel *Label4;
   TcxButton *cxButton2;
   TcxButton *cxButton5;
        TcxButton *cxButton6;
   void __fastcall ButtonEditPostachPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
   void __fastcall ButtonInsertClick(TObject &Sender);
   void __fastcall ButtonModifyClick(TObject &Sender);
   void __fastcall ButtonDeleteClick(TObject &Sender);
   void __fastcall cxButton4Click(TObject &Sender);
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall FormKeyPress(TObject *Sender, char &Key);
   void __fastcall EditDatePropertiesChange(TObject *Sender);
   void __fastcall cxButton3MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
   void __fastcall cxButton3Click(TObject &Sender);
   void __fastcall frReport1GetValue(const AnsiString ParName,
          Variant &ParValue);
   void __fastcall FormKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall ButtonKlientClick(TObject &Sender);
   void __fastcall FormDestroy(TObject *Sender);
   void __fastcall cxButton2Click(TObject &Sender);
   void __fastcall cxButton2MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
   void __fastcall cxButton5Click(TObject &Sender);
   void __fastcall cxButton5MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
        void __fastcall cxButton6Click(TObject &Sender);
        void __fastcall cxButton6MouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
private:	// User declarations
   TDocRashod * Document;
   TFReport * Report;
public:		// User declarations
   __fastcall TNakladnaForm(TComponent* Owner, TDocRashod * doc);
   void __fastcall DocToForm(void);
   void __fastcall Refresh();
 
};
//---------------------------------------------------------------------------
extern PACKAGE TNakladnaForm *NakladnaForm;
//---------------------------------------------------------------------------
#endif
