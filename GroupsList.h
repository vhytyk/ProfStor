//---------------------------------------------------------------------------

#ifndef GroupsListH
#define GroupsListH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "UFrameList.h"
#include "Groups.h"
//---------------------------------------------------------------------------
class TGroupsFormList : public TForm
{
__published:	// IDE-managed Components
   TFrameList *FrameList1;
   void __fastcall ButtonModifyClick(TObject &Sender);
   void __fastcall FrameList1GridView1DblClick(TObject *Sender);
   void __fastcall ButtonInsertClick(TObject &Sender);
   void __fastcall ButtonDeleteClick(TObject &Sender);
private:	// User declarations
   void __fastcall Refresh();
   TGroup * FSelectedItem;
   TGroup * __fastcall GetSelectedItem();	// User declarations
   bool selection;
public:		// User declarations
   __fastcall TGroupsFormList(TComponent* Owner, bool _selection = false);
   __property TGroup * SelectedItem = { read = GetSelectedItem };

};
//---------------------------------------------------------------------------
extern PACKAGE TGroupsFormList *GroupsFormList;
//---------------------------------------------------------------------------
#endif
