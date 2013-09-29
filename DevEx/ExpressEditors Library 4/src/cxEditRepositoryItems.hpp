// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditRepositoryItems.pas' rev: 6.00

#ifndef cxEditRepositoryItemsHPP
#define cxEditRepositoryItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxRadioGroup.hpp>	// Pascal unit
#include <cxMRUEdit.hpp>	// Pascal unit
#include <cxHyperLinkEdit.hpp>	// Pascal unit
#include <cxTimeEdit.hpp>	// Pascal unit
#include <cxCheckBox.hpp>	// Pascal unit
#include <cxCalc.hpp>	// Pascal unit
#include <cxBlobEdit.hpp>	// Pascal unit
#include <cxImageComboBox.hpp>	// Pascal unit
#include <cxMemo.hpp>	// Pascal unit
#include <cxSpinEdit.hpp>	// Pascal unit
#include <cxCurrencyEdit.hpp>	// Pascal unit
#include <cxCalendar.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxImage.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxButtonEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditrepositoryitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditRepositoryTextItem;
class PASCALIMPLEMENTATION TcxEditRepositoryTextItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxtextedit::TcxTextEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxtextedit::TcxTextEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxtextedit::TcxTextEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryTextItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryTextItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryButtonItem;
class PASCALIMPLEMENTATION TcxEditRepositoryButtonItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxbuttonedit::TcxButtonEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxbuttonedit::TcxButtonEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxbuttonedit::TcxButtonEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryButtonItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryButtonItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryImageItem;
class PASCALIMPLEMENTATION TcxEditRepositoryImageItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cximage::TcxImageProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cximage::TcxImageProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cximage::TcxImageProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryImageItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryImageItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryComboBoxItem;
class PASCALIMPLEMENTATION TcxEditRepositoryComboBoxItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxdropdownedit::TcxComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxdropdownedit::TcxComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxdropdownedit::TcxComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryComboBoxItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryComboBoxItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryMaskItem;
class PASCALIMPLEMENTATION TcxEditRepositoryMaskItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxmaskedit::TcxMaskEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxmaskedit::TcxMaskEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxmaskedit::TcxMaskEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryMaskItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryMaskItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryPopupItem;
class PASCALIMPLEMENTATION TcxEditRepositoryPopupItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxdropdownedit::TcxPopupEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxdropdownedit::TcxPopupEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxdropdownedit::TcxPopupEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryPopupItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryPopupItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryCalcItem;
class PASCALIMPLEMENTATION TcxEditRepositoryCalcItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxcalc::TcxCalcEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxcalc::TcxCalcEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxcalc::TcxCalcEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryCalcItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryCalcItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryDateItem;
class PASCALIMPLEMENTATION TcxEditRepositoryDateItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxcalendar::TcxDateEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxcalendar::TcxDateEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxcalendar::TcxDateEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryDateItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryDateItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryCurrencyItem;
class PASCALIMPLEMENTATION TcxEditRepositoryCurrencyItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxcurrencyedit::TcxCurrencyEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxcurrencyedit::TcxCurrencyEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxcurrencyedit::TcxCurrencyEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryCurrencyItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryCurrencyItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositorySpinItem;
class PASCALIMPLEMENTATION TcxEditRepositorySpinItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxspinedit::TcxSpinEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxspinedit::TcxSpinEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxspinedit::TcxSpinEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositorySpinItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositorySpinItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryMemoItem;
class PASCALIMPLEMENTATION TcxEditRepositoryMemoItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxmemo::TcxMemoProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxmemo::TcxMemoProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxmemo::TcxMemoProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryMemoItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryMemoItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryImageComboBoxItem;
class PASCALIMPLEMENTATION TcxEditRepositoryImageComboBoxItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cximagecombobox::TcxImageComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cximagecombobox::TcxImageComboBoxProperties* Value);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cximagecombobox::TcxImageComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryImageComboBoxItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryImageComboBoxItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryBlobItem;
class PASCALIMPLEMENTATION TcxEditRepositoryBlobItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxblobedit::TcxBlobEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxblobedit::TcxBlobEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxblobedit::TcxBlobEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryBlobItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryBlobItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryCheckBoxItem;
class PASCALIMPLEMENTATION TcxEditRepositoryCheckBoxItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxcheckbox::TcxCheckBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxcheckbox::TcxCheckBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxcheckbox::TcxCheckBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryCheckBoxItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryCheckBoxItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryTimeItem;
class PASCALIMPLEMENTATION TcxEditRepositoryTimeItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxtimeedit::TcxTimeEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxtimeedit::TcxTimeEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxtimeedit::TcxTimeEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryTimeItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryTimeItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryMRUItem;
class PASCALIMPLEMENTATION TcxEditRepositoryMRUItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxmruedit::TcxMRUEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxmruedit::TcxMRUEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxmruedit::TcxMRUEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryMRUItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryMRUItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryHyperLinkItem;
class PASCALIMPLEMENTATION TcxEditRepositoryHyperLinkItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxhyperlinkedit::TcxHyperLinkEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxhyperlinkedit::TcxHyperLinkEditProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxhyperlinkedit::TcxHyperLinkEditProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryHyperLinkItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryHyperLinkItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryRadioGroupItem;
class PASCALIMPLEMENTATION TcxEditRepositoryRadioGroupItem : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxradiogroup::TcxRadioGroupProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxradiogroup::TcxRadioGroupProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxradiogroup::TcxRadioGroupProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryRadioGroupItem(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryRadioGroupItem(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxeditrepositoryitems */
using namespace Cxeditrepositoryitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditRepositoryItems
