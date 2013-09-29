//---------------------------------------------------------------------------

#ifndef ModifyPartnerFormH
#define ModifyPartnerFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtonEdit.hpp"
#include "cxButtons.hpp"
#include "cxCalc.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDropDownEdit.hpp"
#include "cxEdit.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
#include "cxMemo.hpp"
#include "cxRadioGroup.hpp"
//---------------------------------------------------------------------------
class TPartner;
class TModifyPartner : public TForm
{
__published:	// IDE-managed Components
   TcxButton *ButtonSave;
   TcxButton *ButtonCancel;
   TPanel *Panel1;
   TLabel *Label1;
   TLabel *Label2;
   TcxButtonEdit *EditNazva;
   TLabel *Label6;
   TcxMemo *MemoInfo;
   TLabel *Label3;
   TcxRadioGroup *cxRadioGroup1;
   TcxRadioButton *RadioButtonPostach;
   TcxRadioButton *RadioButtonPokupec;
   TcxRadioButton *RadioButtonRashod;
   void __fastcall ButtonSaveClick(TObject &Sender);
   void __fastcall ButtonCancelClick(TObject &Sender);
private:	// User declarations
   TPartner * Partner;
public:		// User declarations
   __fastcall TModifyPartner(TComponent* Owner, TPartner * Partner);
   void __fastcall DataToForm();
};
//---------------------------------------------------------------------------
extern PACKAGE TModifyPartner *ModifyPartner;
//---------------------------------------------------------------------------
#endif
