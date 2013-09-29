//---------------------------------------------------------------------------

#ifndef TModifyTovarFormH
#define TModifyTovarFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtonEdit.hpp"
#include "cxButtons.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxCurrencyEdit.hpp"
#include "cxEdit.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
#include "cxCalc.hpp"
#include "cxDropDownEdit.hpp"
//---------------------------------------------------------------------------
class TTovar;
class TModifyTovarForm : public TForm
{
__published:	// IDE-managed Components
   TcxButtonEdit *EditPartner;
   TcxButton *ButtonSave;
   TcxButton *ButtonCancel;
   TLabel *Label3;
   TcxCalcEdit *EditCinaZakup;
   TcxCalcEdit *EditCinaProdazh;
   TLabel *Label4;
   TLabel *Label5;
   TcxButtonEdit *EditNazva;
   TLabel *Label6;
   TLabel *Label2;
   TLabel *Label1;
   TcxButtonEdit *EditKod;
   TcxButton *cxButton1;
   TLabel *Label7;
   TcxButtonEdit *EditGroup;
   void __fastcall ButtonSaveClick(TObject &Sender);
   void __fastcall ButtonCancelClick(TObject &Sender);
   void __fastcall EditPartnerPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
   void __fastcall cxButton1Click(TObject &Sender);
   void __fastcall EditKodKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall EditNazvaKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall EditPartnerKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall EditCinaZakupKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall EditCinaProdazhKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
   void __fastcall FormKeyPress(TObject *Sender, char &Key);
   void __fastcall EditGrupaPropertiesButtonClick(TObject *Sender,
          int AButtonIndex);
   void __fastcall EditGroupKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
private:	// User declarations
   TTovar * Tovar;
   int tag;
public:		// User declarations
   __fastcall TModifyTovarForm(TComponent* Owner, TTovar * Tovar);
   void __fastcall DataToForm();
};
//---------------------------------------------------------------------------
extern PACKAGE TModifyTovarForm *ModifyTovarForm;
//---------------------------------------------------------------------------
#endif
