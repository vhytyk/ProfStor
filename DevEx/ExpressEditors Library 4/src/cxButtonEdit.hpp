// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxButtonEdit.pas' rev: 6.00

#ifndef cxButtonEditHPP
#define cxButtonEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxbuttonedit
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TcxCustomButtonEditProperties;
class PASCALIMPLEMENTATION TcxCustomButtonEditProperties : public Cxmaskedit::TcxCustomMaskEditProperties 
{
	typedef Cxmaskedit::TcxCustomMaskEditProperties inherited;
	
public:
	__fastcall virtual TcxCustomButtonEditProperties(Classes::TPersistent* AOwner);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomButtonEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxButtonEditProperties;
class PASCALIMPLEMENTATION TcxButtonEditProperties : public TcxCustomButtonEditProperties 
{
	typedef TcxCustomButtonEditProperties inherited;
	
__published:
	__property Alignment ;
	__property AutoSelect  = {default=1};
	__property BeepOnError  = {default=0};
	__property Buttons ;
	__property CaseInsensitive  = {default=1};
	__property CharCase  = {default=0};
	__property ClickKey  = {default=16397};
	__property EchoMode  = {default=0};
	__property HideCursor  = {default=0};
	__property HideSelection  = {default=1};
	__property IgnoreMaskBlank  = {default=0};
	__property LookupItems ;
	__property LookupItemsSorted  = {default=0};
	__property MaskKind  = {default=0};
	__property EditMask ;
	__property MaxLength ;
	__property ReadOnly ;
	__property UseLeftAlignmentOnEditing ;
	__property OnButtonClick ;
	__property OnChange ;
	__property OnEditValueChanged ;
	__property OnNewLookupDisplayText ;
	__property OnValidate ;
public:
	#pragma option push -w-inl
	/* TcxCustomButtonEditProperties.Create */ inline __fastcall virtual TcxButtonEditProperties(Classes::TPersistent* AOwner) : TcxCustomButtonEditProperties(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxButtonEditProperties(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomButtonEdit;
class PASCALIMPLEMENTATION TcxCustomButtonEdit : public Cxmaskedit::TcxCustomMaskEdit 
{
	typedef Cxmaskedit::TcxCustomMaskEdit inherited;
	
private:
	HIDESBASE TcxButtonEditProperties* __fastcall GetProperties(void);
	HIDESBASE void __fastcall SetProperties(TcxButtonEditProperties* Value);
	
protected:
	__property TcxButtonEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	/* virtual class method */ virtual Cxcontainer::TcxContainerStyleValues __fastcall GetNotPublishedStyleValues(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Create */ inline __fastcall virtual TcxCustomButtonEdit(Classes::TComponent* AOwner)/* overload */ : Cxmaskedit::TcxCustomMaskEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxCustomButtonEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomButtonEdit(HWND ParentWindow) : Cxmaskedit::TcxCustomMaskEdit(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxButtonEdit;
class PASCALIMPLEMENTATION TcxButtonEdit : public TcxCustomButtonEdit 
{
	typedef TcxCustomButtonEdit inherited;
	
__published:
	__property Anchors  = {default=3};
	__property AutoSize  = {default=1};
	__property BeepOnEnter  = {default=1};
	__property Constraints ;
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property Properties ;
	__property ShowHint ;
	__property Style ;
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=1};
	__property Text ;
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEditing ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseEnter ;
	__property OnMouseLeave ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDrag ;
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Create */ inline __fastcall virtual TcxButtonEdit(Classes::TComponent* AOwner)/* overload */ : TcxCustomButtonEdit(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomMaskEdit.Destroy */ inline __fastcall virtual ~TcxButtonEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxButtonEdit(HWND ParentWindow) : TcxCustomButtonEdit(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxbuttonedit */
using namespace Cxbuttonedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxButtonEdit
