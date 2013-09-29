//---------------------------------------------------------------------------

#ifndef AktPrihodH
#define AktPrihodH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtonEdit.hpp"
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
#include "UFrameList.h"
#include <ExtCtrls.hpp>
#include "Nakladna.h"
#include "cxCalc.hpp"
#include "FR_Class.hpp"
#include "FR_DBSet.hpp"
#include "FR_DSet.hpp"
//---------------------------------------------------------------------------
class TDocPrihod;
class TFReport;
class TPrihodForm : public TDocumentForm
{
__published:	// IDE-managed Components
   TcxLabel *cxLabel3;
   TcxButtonEdit *EditPartner;
   TFrameList *FrameList1;
   TcxButton *cxButton4;
   TcxCalcEdit *EditSuma;
   TcxLabel *cxLabel4;
   TLabel *Label2;
   TLabel *Label1;
   TfrReport *frReport1;
   TfrDBDataSet *frDBDataSet1;
   void __fastcall EditPartnerPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
   void __fastcall ButtonInsertClick(TObject &Sender);
   void __fastcall ButtonModifyClick(TObject &Sender);
   void __fastcall ButtonDeleteClick(TObject &Sender);
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall cxButton4Click(TObject &Sender);
   void __fastcall FormKeyPress(TObject *Sender, char &Key);
   void __fastcall EditDatePropertiesChange(TObject *Sender);
   void __fastcall EditDateKeyPress(TObject *Sender, char &Key);
   void __fastcall cxButton3MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
   void __fastcall cxButton3Click(TObject &Sender);
   void __fastcall frReport1GetValue(const AnsiString ParName,
          Variant &ParValue);
   void __fastcall FormKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
private:	// User declarations
   TDocPrihod * Document;
   TFReport * Report;
public:		// User declarations
   __fastcall TPrihodForm(TComponent* Owner, TDocPrihod * doc);
   void __fastcall Refresh();
   void __fastcall DocToForm();
};
//---------------------------------------------------------------------------
extern PACKAGE TPrihodForm *PrihodForm;
//---------------------------------------------------------------------------
#endif
