//---------------------------------------------------------------------------

#ifndef TovarListH
#define TovarListH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "UFrameList.h"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxLabel.hpp"
#include "cxTextEdit.hpp"
//---------------------------------------------------------------------------
class TTovar;
class TTovarListForm : public TForm
{
__published:	// IDE-managed Components
   TFrameList *FrameList1;
   TcxTextEdit *cxTextEdit1;
   TcxLabel *cxLabel1;
   TcxTextEdit *cxTextEdit2;
   TcxLabel *cxLabel2;
   void __fastcall ButtonInsertClick(TObject &Sender);
   void __fastcall ButtonModifyClick(TObject &Sender);
   void __fastcall ButtonDeleteClick(TObject &Sender);
   void __fastcall FrameList1GridView1DblClick(TObject *Sender);
   void __fastcall FormKeyPress(TObject *Sender, char &Key);
   void __fastcall FormShow(TObject *Sender);
   void __fastcall cxTextEdit1PropertiesChange(TObject *Sender);
   void __fastcall cxTextEdit2PropertiesChange(TObject *Sender);
private:
   TTovar * FSelectedItem;
   TTovar * __fastcall GetSelectedItem();	// User declarations
public:		// User declarations
   __fastcall TTovarListForm(TComponent* Owner);
   void __fastcall Refresh();
   __property TTovar * SelectedItem = { read = GetSelectedItem};
};
//---------------------------------------------------------------------------
extern PACKAGE TTovarListForm *TovarListForm;
//---------------------------------------------------------------------------
#endif
