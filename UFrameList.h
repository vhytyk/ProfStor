//---------------------------------------------------------------------------


#ifndef UFrameListH
#define UFrameListH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ToolWin.hpp>
#include <DBTables.hpp>
#include <DB.hpp>
#include "UUtiliteFunctions.h"
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxExportGrid4Link.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include "cxButtons.hpp"
#include "cxLookAndFeelPainters.hpp"
#include <ExtCtrls.hpp>
#include "cxHint.hpp"
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include <Menus.hpp>
#include <Dialogs.hpp>

//---------------------------------------------------------------------------
class TFrameList : public TFrame
{
__published:	// IDE-managed Components
   TcxGridDBTableView *GridView1;
   TcxGridLevel *cxGrid1Level1;
   TcxGrid *cxGrid1;
   TDataSource *DataSource1;
   TPanel *Panel1;
   TcxButton *ButtonInsert;
   TcxButton *ButtonModify;
   TcxButton *ButtonDelete;
   TcxHintStyleController *cxHintStyleController1;
   TPopupMenu *PopupMenu1;
   TMenuItem *Excel1;
   TSaveDialog *SaveDialog1;
   void __fastcall Excel1Click(TObject *Sender);
private:
   TIBQuery * FQuery;
   TObject * FSelectedObject;
   TIBQuery * __fastcall GetQuery();
   void __fastcall SetQuery(TIBQuery * value);
   TObject * __fastcall GetSelectedObject();
   void __fastcall SetSelectedObject(TObject * value);	// User declarations
public:		// User declarations
   __fastcall TFrameList(TComponent* Owner);
   void __fastcall Refresh(AnsiString id_field);
   __property TIBQuery * Query = { read = GetQuery, write = SetQuery };
   __property TObject * SelectedObject = { read = GetSelectedObject, write = SetSelectedObject };
};
//---------------------------------------------------------------------------
extern PACKAGE TFrameList *FrameList;
//---------------------------------------------------------------------------
#endif
