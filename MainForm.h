//---------------------------------------------------------------------------

#ifndef MainFormH
#define MainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <IBDatabase.hpp>
#include <IBSQL.hpp>
#include <IBCustomDataSet.hpp>
#include <IBQuery.hpp>
#include "UFrameList.h"
#include "cxLookAndFeels.hpp"
#include "dxBar.hpp"
#include "cxButtons.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxHint.hpp"
#include <ExtCtrls.hpp>
#include "FR_Desgn.hpp"
#include "cxButtonEdit.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include "cxDropDownEdit.hpp"
#include <ImgList.hpp>
#include "cxGridCustomTableView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridTableView.hpp"
#include "PriceList.h"
#include "FR_Class.hpp"
//---------------------------------------------------------------------------
class TTMainForm : public TForm
{
__published:	// IDE-managed Components
   TFrameList *FrameList1;
   TdxBarManager *dxBarManager1;
   TdxBarButton *BarButtonDocs;
   TdxBarButton *BarButtonDovid;
   TdxBarButton *BarButtonZvits;
   TdxBarButton *dxBarButton1;
   TdxBarSubItem *dxBarSubItem1;
   TdxBarSubItem *dxBarSubItem2;
   TdxBarSubItem *dxBarSubItem3;
   TdxBarButton *dxBarButton2;
   TdxBarSubItem *dxBarSubItem4;
   TdxBarSubItem *dxBarSubItem5;
   TdxBarButton *dxBarButton3;
   TdxBarSubItem *dxBarSubItem6;
   TdxBarSubItem *dxBarSubItem7;
   TdxBarSubItem *dxBarSubItem8;
   TdxBarSubItem *dxBarSubItem9;
   TdxBarButton *BarButtonNakladna;
   TdxBarButton *dxBarButton5;
   TdxBarButton *BarButtonPrihod;
   TdxBarButton *BarButtonTovar;
   TdxBarButton *BarButtonPartner;
   TdxBarButton *dxBarButton9;
   TdxBarButton *dxBarButton10;
   TdxBarButton *dxBarButton11;
   TdxBarSubItem *dxBarSubItem10;
   TdxBarButton *dxBarButton12;
   TdxBarSubItem *dxBarSubItem11;
   TdxBarSubItem *dxBarSubItem12;
   TdxBarButton *dxBarButton4;
   TdxBarSubItem *dxBarSubItem13;
   TdxBarButton *dxBarButton6;
   TdxBarButton *dxBarButton7;
   TdxBarSubItem *dxBarSubItem14;
   TdxBarButton *BarButtonNakladnaList;
   TdxBarButton *BarButtonAktPrihod;
   TdxBarButton *BarButtonKassaPrihod;
   TdxBarButton *BarButtonKassaRashod;
   TTimer *Timer1;
   TdxBarButton *dxBarButton8;
   TdxBarSubItem *dxBarSubItem15;
   TdxBarButton *dxBarButton13;
   TdxBarButton *dxBarButton14;
   TdxBarButton *dxBarButton15;
   TdxBarSubItem *dxBarSubItem16;
   TdxBarButton *dxBarButton16;
   TdxBarButton *dxBarButton17;
   TdxBarButton *dxBarButton18;
   TdxBarSubItem *dxBarSubItem17;
   TdxBarButton *dxBarButton19;
   TdxBarButton *dxBarButton20;
   TImageList *ImageList1;
   TdxBarButton *dxBarButton21;
   TdxBarSubItem *dxBarSubItem18;
   TdxBarSubItem *dxBarSubItem19;
   TdxBarButton *dxBarButton22;
   TdxBarButton *dxBarButton23;
   TPanel *Panel1;
   TcxComboBox *EditPokupci;
   TcxComboBox *EditPokupciID;
   TdxBarButton *dxBarButton24;
   TPanel *Panel2;
   TLabel *Label1;
   TTimer *Timer2;
   TdxBarButton *dxBarButton25;
        TdxBarSubItem *dxBarSubItem20;
        TdxBarButton *buttonGroups;
   TdxBarSubItem *itemPriceList;
   TdxBarButton *dxBarButton26;
   TfrReport *frReport1;
   void __fastcall ButtonInsertClick(TObject &Sender);
   void __fastcall ButtonModifyClick(TObject &Sender);
   void __fastcall ButtonDeleteClick(TObject &Sender);
   void __fastcall BarButtonNakladnaClick(TObject *Sender);
   void __fastcall BarButtonPrihodClick(TObject *Sender);
   void __fastcall BarButtonTovarClick(TObject *Sender);
   void __fastcall BarButtonPartnerClick(TObject *Sender);
   void __fastcall BarButtonNakladnaListClick(TObject *Sender);
   void __fastcall BarButtonAktPrihodClick(TObject *Sender);
   void __fastcall BarButtonKassaPrihodClick(TObject *Sender);
   void __fastcall BarButtonKassaRashodClick(TObject *Sender);
   void __fastcall Timer1Timer(TObject *Sender);
   void __fastcall dxBarButton4Click(TObject *Sender);
   void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
   void __fastcall dxBarButton13Click(TObject *Sender);
   void __fastcall dxBarButton14Click(TObject *Sender);
   void __fastcall dxBarButton10Click(TObject *Sender);
   void __fastcall dxBarButton16Click(TObject *Sender);
   void __fastcall EditPokupciPropertiesCloseUp(TObject *Sender);
   void __fastcall dxBarButton17Click(TObject *Sender);
   void __fastcall dxBarButton18Click(TObject *Sender);
   void __fastcall dxBarButton20Click(TObject *Sender);
   void __fastcall dxBarButton24Click(TObject *Sender);
   void __fastcall Timer2Timer(TObject *Sender);
   void __fastcall dxBarButton25Click(TObject *Sender);
   void __fastcall buttonGroupsClick(TObject *Sender);
   void __fastcall itemPriceListClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTMainForm(TComponent* Owner);
   void __fastcall Refresh();
};
//---------------------------------------------------------------------------
extern PACKAGE TTMainForm *TMainForm;
//---------------------------------------------------------------------------
#endif
