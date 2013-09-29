//---------------------------------------------------------------------------

#ifndef DocumentH
#define DocumentH
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
#include "UFrameList.h"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TDocumentForm : public TForm
{
__published:	// IDE-managed Components
   TPanel *Panel1;
   TcxDateEdit *EditDate;
   TcxLabel *cxLabel1;
   TcxLabel *cxLabel2;
   TcxLabel *LabelNomer;
   TPanel *Panel2;
   TcxButton *cxButton1;
   TcxButton *cxButton3;
   TPanel *Panel3;
private:	// User declarations
public:		// User declarations
   __fastcall TDocumentForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDocumentForm *DocumentForm;
//---------------------------------------------------------------------------
#endif
