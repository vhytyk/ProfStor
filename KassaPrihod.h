//---------------------------------------------------------------------------

#ifndef KassaPrihodH
#define KassaPrihodH
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
#include "cxClasses.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBData.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include "UFrameList.h"
#include <DB.hpp>
#include "cxCalc.hpp"
#include "cxMemo.hpp"
//---------------------------------------------------------------------------
class TKassa;
class TKassaPrihodForm : public TDocumentForm
{
__published:	// IDE-managed Components
   TcxButtonEdit *EditPartner;
   TcxLabel *cxLabel3;
   TcxCalcEdit *EditSuma;
   TcxLabel *cxLabel4;
   TcxMemo *Memo1;
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall EditPartnerPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
   void __fastcall EditDatePropertiesCloseUp(TObject *Sender);
private:	// User declarations
   TKassa* Kassa;
public:		// User declarations
   __fastcall TKassaPrihodForm(TComponent* Owner, TKassa * kassa);
   void __fastcall Refresh();
   void __fastcall DocToForm();
};
//---------------------------------------------------------------------------
extern PACKAGE TKassaPrihodForm *KassaPrihodForm;
//---------------------------------------------------------------------------
#endif
