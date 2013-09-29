// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxEditPropEditors.pas' rev: 6.00

#ifndef cxEditPropEditorsHPP
#define cxEditPropEditorsHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxPropEditors.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxEditRepositoryItems.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <DB.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <DBReg.hpp>	// Pascal unit
#include <VCLEditors.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxeditpropeditors
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TDBStringProperty;
class PASCALIMPLEMENTATION TDBStringProperty : public Designeditors::TStringProperty 
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValueList(Classes::TStrings* AList);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TDBStringProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TDBStringProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TFieldNameProperty;
class PASCALIMPLEMENTATION TFieldNameProperty : public TDBStringProperty 
{
	typedef TDBStringProperty inherited;
	
public:
	virtual Db::TDataSource* __fastcall GetDataSource(void);
	virtual AnsiString __fastcall GetDataSourcePropName();
	virtual void __fastcall GetValueList(Classes::TStrings* AList);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TFieldNameProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : TDBStringProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TFieldNameProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditComponentEditor;
class PASCALIMPLEMENTATION TcxEditComponentEditor : public Designeditors::TComponentEditor 
{
	typedef Designeditors::TComponentEditor inherited;
	
private:
	Cxedit::TcxCustomEdit* __fastcall GetEdit(void);
	
public:
	virtual void __fastcall Edit(void);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual AnsiString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxEditComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxEditComponentEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditStyleControllerEditor;
class PASCALIMPLEMENTATION TcxEditStyleControllerEditor : public Designeditors::TComponentEditor 
{
	typedef Designeditors::TComponentEditor inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual AnsiString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxEditStyleControllerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxEditStyleControllerEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryItemProperty;
class PASCALIMPLEMENTATION TcxEditRepositoryItemProperty : public Designeditors::TComponentProperty 
{
	typedef Designeditors::TComponentProperty inherited;
	
private:
	Classes::TGetStrProc FStrProc;
	void __fastcall StrProc(const AnsiString S);
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxEditRepositoryItemProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TComponentProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxEditRepositoryItemProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxLookupEditListSourceProperty;
class PASCALIMPLEMENTATION TcxLookupEditListSourceProperty : public Dbreg::TDataFieldProperty 
{
	typedef Dbreg::TDataFieldProperty inherited;
	
public:
	virtual AnsiString __fastcall GetDataSourcePropName();
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxLookupEditListSourceProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Dbreg::TDataFieldProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxLookupEditListSourceProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditPropertiesEventEditor;
class PASCALIMPLEMENTATION TcxEditPropertiesEventEditor : public Cxpropeditors::TcxNestedEventProperty 
{
	typedef Cxpropeditors::TcxNestedEventProperty inherited;
	
public:
	virtual Classes::TPersistent* __fastcall GetInstance(void);
	virtual AnsiString __fastcall GetName();
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxEditPropertiesEventEditor(const Designintf::_di_IDesigner ADesigner, int APropCount) : Cxpropeditors::TcxNestedEventProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxEditPropertiesEventEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryItemPropertiesEventEditor;
class PASCALIMPLEMENTATION TcxEditRepositoryItemPropertiesEventEditor : public Cxpropeditors::TcxNestedEventProperty 
{
	typedef Cxpropeditors::TcxNestedEventProperty inherited;
	
public:
	virtual Classes::TPersistent* __fastcall GetInstance(void);
	virtual AnsiString __fastcall GetName();
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxEditRepositoryItemPropertiesEventEditor(const Designintf::_di_IDesigner ADesigner, int APropCount) : Cxpropeditors::TcxNestedEventProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxEditRepositoryItemPropertiesEventEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxNavigatorButtonsEventEditor;
class PASCALIMPLEMENTATION TcxNavigatorButtonsEventEditor : public Cxpropeditors::TcxNestedEventProperty 
{
	typedef Cxpropeditors::TcxNestedEventProperty inherited;
	
public:
	virtual Classes::TPersistent* __fastcall GetInstance(void);
	virtual AnsiString __fastcall GetName();
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxNavigatorButtonsEventEditor(const Designintf::_di_IDesigner ADesigner, int APropCount) : Cxpropeditors::TcxNestedEventProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxNavigatorButtonsEventEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TImageIndexProperty;
class PASCALIMPLEMENTATION TImageIndexProperty : public Designeditors::TIntegerProperty 
{
	typedef Designeditors::TIntegerProperty inherited;
	
public:
	virtual Controls::TImageList* __fastcall GetImages(void) = 0 ;
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual AnsiString __fastcall GetValue();
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
	virtual void __fastcall SetValue(const AnsiString Value);
	virtual void __fastcall ListMeasureHeight(const AnsiString Value, Graphics::TCanvas* ACanvas, int &AHeight);
	virtual void __fastcall ListMeasureWidth(const AnsiString Value, Graphics::TCanvas* ACanvas, int &AWidth);
	virtual void __fastcall ListDrawValue(const AnsiString Value, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TImageIndexProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TIntegerProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TImageIndexProperty(void) { }
	#pragma option pop
	
private:
	void *__ICustomPropertyListDrawing;	/* Vcleditors::ICustomPropertyListDrawing */
	
public:
	operator ICustomPropertyListDrawing*(void) { return (ICustomPropertyListDrawing*)&__ICustomPropertyListDrawing; }
	
};


class DELPHICLASS TcxGEPropertiesImageIndexProperty;
class PASCALIMPLEMENTATION TcxGEPropertiesImageIndexProperty : public TImageIndexProperty 
{
	typedef TImageIndexProperty inherited;
	
public:
	virtual Controls::TImageList* __fastcall GetImages(void);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxGEPropertiesImageIndexProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : TImageIndexProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxGEPropertiesImageIndexProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGEItemImageIndexProperty;
class PASCALIMPLEMENTATION TcxGEItemImageIndexProperty : public TImageIndexProperty 
{
	typedef TImageIndexProperty inherited;
	
public:
	virtual Controls::TImageList* __fastcall GetImages(void);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxGEItemImageIndexProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : TImageIndexProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxGEItemImageIndexProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditRepositoryComponentEditor;
class PASCALIMPLEMENTATION TcxEditRepositoryComponentEditor : public Designeditors::TComponentEditor 
{
	typedef Designeditors::TComponentEditor inherited;
	
private:
	Cxedit::TcxEditRepository* __fastcall GetEditRepository(void);
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual AnsiString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxEditRepositoryComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxEditRepositoryComponentEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxEditMaskProperty;
class PASCALIMPLEMENTATION TcxEditMaskProperty : public Designeditors::TStringProperty 
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall Edit(void);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxEditMaskProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxEditMaskProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxTextProperty;
class PASCALIMPLEMENTATION TcxTextProperty : public Designeditors::TStringProperty 
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall Edit(void);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxTextProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxTextProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TGraphicClassNameProperty;
class PASCALIMPLEMENTATION TGraphicClassNameProperty : public Designeditors::TStringProperty 
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TGraphicClassNameProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TGraphicClassNameProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxButtonSelectionEditor;
class PASCALIMPLEMENTATION TcxButtonSelectionEditor : public Designeditors::TSelectionEditor 
{
	typedef Designeditors::TSelectionEditor inherited;
	
public:
	virtual void __fastcall RequiresUnits(Classes::TGetStrProc Proc);
public:
	#pragma option push -w-inl
	/* TSelectionEditor.Create */ inline __fastcall virtual TcxButtonSelectionEditor(const Designintf::_di_IDesigner ADesigner) : Designeditors::TSelectionEditor(ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxButtonSelectionEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxFilterControlComponentEditor;
class PASCALIMPLEMENTATION TcxFilterControlComponentEditor : public Designeditors::TDefaultEditor 
{
	typedef Designeditors::TDefaultEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual AnsiString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxFilterControlComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TDefaultEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxFilterControlComponentEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxNavigatorControlProperty;
class PASCALIMPLEMENTATION TcxNavigatorControlProperty : public Designeditors::TComponentProperty 
{
	typedef Designeditors::TComponentProperty inherited;
	
private:
	Classes::TGetStrProc FStrProc;
	void __fastcall StrProc(const AnsiString S);
	
public:
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TcxNavigatorControlProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TComponentProperty(ADesigner, APropCount) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TcxNavigatorControlProperty(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomEditControlComponentEditor;
class PASCALIMPLEMENTATION TcxCustomEditControlComponentEditor : public Designeditors::TComponentEditor 
{
	typedef Designeditors::TComponentEditor inherited;
	
protected:
	virtual Cxlookandfeels::TcxLookAndFeel* __fastcall GetLookAndFeel(void);
	virtual Cxcontainer::TcxContainerStyle* __fastcall GetStyle(void) = 0 ;
	virtual bool __fastcall HasStyle(void);
	
public:
	virtual void __fastcall Edit(void);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual AnsiString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxCustomEditControlComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomEditControlComponentEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxButtonComponentEditor;
class PASCALIMPLEMENTATION TcxButtonComponentEditor : public TcxCustomEditControlComponentEditor 
{
	typedef TcxCustomEditControlComponentEditor inherited;
	
protected:
	virtual Cxlookandfeels::TcxLookAndFeel* __fastcall GetLookAndFeel(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxButtonComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TcxCustomEditControlComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxButtonComponentEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxRadioButtonComponentEditor;
class PASCALIMPLEMENTATION TcxRadioButtonComponentEditor : public TcxCustomEditControlComponentEditor 
{
	typedef TcxCustomEditControlComponentEditor inherited;
	
protected:
	virtual Cxlookandfeels::TcxLookAndFeel* __fastcall GetLookAndFeel(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxRadioButtonComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TcxCustomEditControlComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxRadioButtonComponentEditor(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxContainerComponentEditor;
class PASCALIMPLEMENTATION TcxContainerComponentEditor : public TcxCustomEditControlComponentEditor 
{
	typedef TcxCustomEditControlComponentEditor inherited;
	
protected:
	virtual Cxcontainer::TcxContainerStyle* __fastcall GetStyle(void);
	virtual bool __fastcall HasStyle(void);
public:
	#pragma option push -w-inl
	/* TComponentEditor.Create */ inline __fastcall virtual TcxContainerComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TcxCustomEditControlComponentEditor(AComponent, ADesigner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxContainerComponentEditor(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
#define cxEditorsCaption1 "ExpressEditors Library v4.5"
#define cxEditorsCaption2 "www.devexpress.com"

}	/* namespace Cxeditpropeditors */
using namespace Cxeditpropeditors;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxEditPropEditors
