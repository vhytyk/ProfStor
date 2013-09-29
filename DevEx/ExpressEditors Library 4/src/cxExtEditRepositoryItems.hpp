// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxExtEditRepositoryItems.pas' rev: 6.00

#ifndef cxExtEditRepositoryItemsHPP
#define cxExtEditRepositoryItemsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxCheckComboBox.hpp>	// Pascal unit
#include <cxSpinButton.hpp>	// Pascal unit
#include <cxGroupBox.hpp>	// Pascal unit
#include <cxTrackBar.hpp>	// Pascal unit
#include <cxProgressBar.hpp>	// Pascal unit
#include <cxColorComboBox.hpp>	// Pascal unit
#include <cxFontNameComboBox.hpp>	// Pascal unit
#include <cxLabel.hpp>	// Pascal unit
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

namespace Cxexteditrepositoryitems
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxEditRepositoryLabel;
class PASCALIMPLEMENTATION TcxEditRepositoryLabel : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxlabel::TcxLabelProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxlabel::TcxLabelProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxlabel::TcxLabelProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryLabel(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryLabel(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryProgressBar;
class PASCALIMPLEMENTATION TcxEditRepositoryProgressBar : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxprogressbar::TcxProgressBarProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxprogressbar::TcxProgressBarProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxprogressbar::TcxProgressBarProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryProgressBar(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryProgressBar(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryFontNameComboBox;
class PASCALIMPLEMENTATION TcxEditRepositoryFontNameComboBox : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxfontnamecombobox::TcxFontNameComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxfontnamecombobox::TcxFontNameComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxfontnamecombobox::TcxFontNameComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryFontNameComboBox(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryFontNameComboBox(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryColorComboBox;
class PASCALIMPLEMENTATION TcxEditRepositoryColorComboBox : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxcolorcombobox::TcxColorComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxcolorcombobox::TcxColorComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxcolorcombobox::TcxColorComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryColorComboBox(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryColorComboBox(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryTrackBar;
class PASCALIMPLEMENTATION TcxEditRepositoryTrackBar : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxtrackbar::TcxTrackBarProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxtrackbar::TcxTrackBarProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxtrackbar::TcxTrackBarProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryTrackBar(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryTrackBar(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositorySpinButton;
class PASCALIMPLEMENTATION TcxEditRepositorySpinButton : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxspinbutton::TcxSpinButtonProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxspinbutton::TcxSpinButtonProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxspinbutton::TcxSpinButtonProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositorySpinButton(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositorySpinButton(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryCheckComboBox;
class PASCALIMPLEMENTATION TcxEditRepositoryCheckComboBox : public Cxedit::TcxEditRepositoryItem 
{
	typedef Cxedit::TcxEditRepositoryItem inherited;
	
private:
	Cxcheckcombobox::TcxCheckComboBoxProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(Cxcheckcombobox::TcxCheckComboBoxProperties* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetEditPropertiesClass(TMetaClass* vmt);
	
__published:
	__property Cxcheckcombobox::TcxCheckComboBoxProperties* Properties = {read=GetProperties, write=SetProperties};
public:
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Create */ inline __fastcall virtual TcxEditRepositoryCheckComboBox(Classes::TComponent* AOwner) : Cxedit::TcxEditRepositoryItem(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxEditRepositoryItem.Destroy */ inline __fastcall virtual ~TcxEditRepositoryCheckComboBox(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxexteditrepositoryitems */
using namespace Cxexteditrepositoryitems;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxExtEditRepositoryItems
