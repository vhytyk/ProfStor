//---------------------------------------------------------------------------

#ifndef AktPrihodListH
#define AktPrihodListH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "UFrameList.h"
//---------------------------------------------------------------------------
class TAktPrihodListForm : public TForm
{
__published:	// IDE-managed Components
   TFrameList *FrameList1;
   TGroupBox *GroupBoxSearch;
   TLabel *Label1;
   TEdit *editSearch;
   void __fastcall ButtonModifyClick(TObject &Sender);
   void __fastcall ButtonDeleteClick(TObject &Sender);
   void __fastcall editSearchKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
private:	// User declarations
public:		// User declarations
   __fastcall TAktPrihodListForm(TComponent* Owner);
   void __fastcall Refresh();
};
//---------------------------------------------------------------------------
extern PACKAGE TAktPrihodListForm *AktPrihodListForm;
//---------------------------------------------------------------------------
#endif
