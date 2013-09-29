//---------------------------------------------------------------------------

#ifndef OptionsH
#define OptionsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include "cxButtons.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxTextEdit.hpp"
#include "cxButtonEdit.hpp"
#include "cxLabel.hpp"
#include "cxMaskEdit.hpp"
#include "cxCheckBox.hpp"
#include "cxColorComboBox.hpp"
#include "cxDropDownEdit.hpp"
//---------------------------------------------------------------------------
class TOptionsForm : public TForm
{
__published:	// IDE-managed Components
   TPageControl *PageControl1;
   TPanel *Panel1;
   TTabSheet *TabSheet1;
   TcxButton *cxButton1;
   TcxButton *cxButton2;
   TcxButton *cxButton3;
   TcxLabel *cxLabel1;
   TcxButtonEdit *EditDBName;
   TTabSheet *TabSheet2;
   TcxCheckBox *CheckWindowState;
   TcxColorComboBox *MainColor;
   TcxCheckBox *CheckGroupPanel;
   TLabel *Label1;
   TLabel *Label2;
   TcxColorComboBox *GridColor;
        TcxCheckBox *CheckBoxRefresh;
        TcxTextEdit *EditTimeRefresh;
        TcxLabel *cxLabel2;
   void __fastcall cxButton2Click(TObject &Sender);
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall CheckBoxRefreshClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
   __fastcall TOptionsForm(TComponent* Owner);
   void __fastcall Load();
   void __fastcall Save();
   void __fastcall Apply();
};
//---------------------------------------------------------------------------
extern PACKAGE TOptionsForm *OptionsForm;
//---------------------------------------------------------------------------
#endif
