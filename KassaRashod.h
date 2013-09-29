//---------------------------------------------------------------------------

#ifndef KassaRashodH
#define KassaRashodH
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
#include "cxButtonEdit.hpp"
#include "cxCalc.hpp"
#include "UFrameList.h"
#include "cxRadioGroup.hpp"
#include "cxMemo.hpp"
//---------------------------------------------------------------------------
class TKassa;
class TKassaRashodForm : public TDocumentForm
{
__published:	// IDE-managed Components
   TcxCalcEdit *EditSuma;
   TcxLabel *cxLabel4;
   TcxButtonEdit *EditPartner;
   TcxMemo *Memo1;
   TcxLabel *cxLabel3;
   void __fastcall EditPartnerPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall EditDatePropertiesCloseUp(TObject *Sender);
private:	// User declarations
   TKassa * Kassa;
public:		// User declarations
   __fastcall TKassaRashodForm(TComponent* Owner, TKassa * k);
   void __fastcall Refresh();
   void __fastcall DocToForm();
};
//---------------------------------------------------------------------------
extern PACKAGE TKassaRashodForm *KassaRashodForm;
//---------------------------------------------------------------------------
#endif
