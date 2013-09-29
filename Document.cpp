//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Document.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxCalendar"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxLabel"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "UFrameList"
#pragma resource "*.dfm"
TDocumentForm *DocumentForm;
//---------------------------------------------------------------------------
__fastcall TDocumentForm::TDocumentForm(TComponent* Owner)
   : TForm(Owner)
{
}
//---------------------------------------------------------------------------

