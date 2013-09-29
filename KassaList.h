//---------------------------------------------------------------------------

#ifndef KassaListH
#define KassaListH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "UFrameList.h"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDBEdit.hpp"
#include "cxEdit.hpp"
#include "cxMemo.hpp"
#include "cxTextEdit.hpp"
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TKassaFormList : public TForm
{
__published:	// IDE-managed Components
   TFrameList *FrameList1;
   TPanel *Panel1;
   TcxDBMemo *cxDBMemo1;
   void __fastcall ButtonDeleteClick(TObject &Sender);
private:	// User declarations
public:		// User declarations
   __fastcall TKassaFormList(TComponent* Owner);
   void __fastcall Refresh();
};
//---------------------------------------------------------------------------
extern PACKAGE TKassaFormList *KassaFormList;
//---------------------------------------------------------------------------
#endif
