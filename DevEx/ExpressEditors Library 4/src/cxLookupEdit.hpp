// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxLookupEdit.pas' rev: 6.00

#ifndef cxLookupEditHPP
#define cxLookupEditHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxMaskEdit.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxDataUtils.hpp>	// Pascal unit
#include <cxDropDownEdit.hpp>	// Pascal unit
#include <cxTextEdit.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxLookAndFeels.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxlookupedit
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TcxLookupGridCloseUpEvent)(System::TObject* Sender, bool AAccept);

class DELPHICLASS TcxCustomLookupEditLookupData;
class DELPHICLASS TcxCustomLookupEdit;
class DELPHICLASS TcxCustomLookupEditProperties;
class PASCALIMPLEMENTATION TcxCustomLookupEditLookupData : public Cxclasses::TcxInterfacedPersistent 
{
	typedef Cxclasses::TcxInterfacedPersistent inherited;
	
private:
	Classes::TPersistent* FOwner;
	bool FVisible;
	Classes::TNotifyEvent FOnCurrentKeyChanged;
	Classes::TNotifyEvent FOnSelectItem;
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	TcxCustomLookupEdit* __fastcall GetEdit(void);
	int __fastcall GetFocusedRecordIndex(void);
	int __fastcall GetListIndex(void);
	TcxCustomLookupEditProperties* __fastcall GetProperties(void);
	
protected:
	Variant FCurrentKey;
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual bool __fastcall CanResizeVisualArea(tagSIZE &NewSize);
	virtual void __fastcall CloseUp(void);
	virtual void __fastcall Deinitialize(void);
	virtual void __fastcall DropDown(void);
	virtual void __fastcall DroppedDown(const AnsiString AFindStr);
	virtual bool __fastcall Find(const AnsiString AText);
	Controls::TControl* __fastcall GetActiveControl(void);
	virtual Variant __fastcall GetCurrentKey();
	virtual AnsiString __fastcall GetDisplayText(const Variant &AKey);
	Classes::TNotifyEvent __fastcall GetOnCurrentKeyChanged();
	Classes::TNotifyEvent __fastcall GetOnSelectItem();
	tagSIZE __fastcall GetVisualAreaPreferredSize(int AMaxHeight, int AWidth = 0x0);
	virtual void __fastcall Go(Cxtextedit::TcxEditLookupDataGoDirection ADirection, bool ACircular);
	void __fastcall Initialize(Controls::TWinControl* AVisualControlsParent);
	virtual bool __fastcall IsEmpty(void);
	bool __fastcall IsMouseOverList(const Types::TPoint &P);
	virtual bool __fastcall Locate(AnsiString &AText, AnsiString &ATail, bool ANext);
	void __fastcall PositionVisualArea(const Types::TRect &AClientRect);
	virtual void __fastcall PropertiesChanged(void);
	virtual void __fastcall SelectItem(void);
	virtual void __fastcall SetCurrentKey(const Variant &AKey);
	void __fastcall SetOnCurrentKeyChanged(Classes::TNotifyEvent Value);
	void __fastcall SetOnSelectItem(Classes::TNotifyEvent Value);
	virtual void __fastcall TextChanged(void);
	virtual void __fastcall DoCurrentKeyChanged(void);
	virtual void __fastcall DoSelectItem(void);
	virtual void __fastcall DoSetCurrentKey(int ARecordIndex);
	void __fastcall DoSetKeySelection(bool AKeySelected);
	virtual void __fastcall DoSyncGrid(void);
	virtual void __fastcall GridClick(System::TObject* Sender);
	virtual void __fastcall GridCloseUp(System::TObject* Sender, bool AAccept);
	virtual void __fastcall GridFocusedRowChanged(System::TObject* Sender);
	virtual bool __fastcall IsKeySelected(void);
	virtual bool __fastcall LocateText(const AnsiString AText);
	virtual void __fastcall ResetIncrementalFilter(void);
	virtual void __fastcall SyncGrid(void);
	virtual void __fastcall SyncSelected(void);
	virtual void __fastcall UpdateDropDownCount(void);
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property TcxCustomLookupEdit* Edit = {read=GetEdit};
	__property int FocusedRecordIndex = {read=GetFocusedRecordIndex, nodefault};
	__property TcxCustomLookupEditProperties* Properties = {read=GetProperties};
	
public:
	__fastcall virtual TcxCustomLookupEditLookupData(Classes::TPersistent* AOwner);
	void __fastcall DisableChanging(void);
	void __fastcall EnableChanging(void);
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxCustomLookupEditLookupData(void) { }
	#pragma option pop
	
private:
	void *__IcxTextEditLookupData;	/* Cxtextedit::IcxTextEditLookupData */
	
public:
	operator IcxTextEditLookupData*(void) { return (IcxTextEditLookupData*)&__IcxTextEditLookupData; }
	
};


class PASCALIMPLEMENTATION TcxCustomLookupEditProperties : public Cxdropdownedit::TcxCustomComboBoxProperties 
{
	typedef Cxdropdownedit::TcxCustomComboBoxProperties inherited;
	
private:
	int FDisplayColumnIndex;
	int FLockCount;
	bool FImmediateUpdateText;
	bool FInGridDataChanged;
	bool FIncrementalFiltering;
	Cxcustomdata::TcxCustomDataController* __fastcall GetDataController(void);
	bool __fastcall GetDropDownAutoSize(void);
	int __fastcall GetDropDownHeight(void);
	HIDESBASE bool __fastcall GetDropDownSizeable(void);
	HIDESBASE int __fastcall GetDropDownWidth(void);
	void __fastcall SetDropDownAutoSize(bool Value);
	void __fastcall SetDropDownHeight(int Value);
	HIDESBASE void __fastcall SetDropDownSizeable(bool Value);
	HIDESBASE void __fastcall SetDropDownWidth(int Value);
	
protected:
	virtual Controls::TWinControl* __fastcall GetLookupGridActiveControl(void);
	virtual bool __fastcall GetLookupGridCanResize(void);
	virtual int __fastcall GetLookupGridColumnCount(void);
	virtual Controls::TWinControl* __fastcall GetLookupGridControl(void);
	virtual Cxcustomdata::TcxCustomDataController* __fastcall GetLookupGridDataController(void);
	virtual int __fastcall GetLookupGridVisualAreaPreferredWidth(void);
	virtual int __fastcall GetLookupGridNearestPopupHeight(int AHeight);
	virtual int __fastcall GetLookupGridPopupHeight(int ADropDownRowCount);
	virtual bool __fastcall IsLookupGridMouseOverList(const Types::TPoint &P);
	virtual void __fastcall LookupGridDeinitialize(void);
	virtual void __fastcall LookupGridDropedDown(const AnsiString AFindStr);
	virtual void __fastcall LookupGridInitEvents(Classes::TNotifyEvent AOnClick, Classes::TNotifyEvent AOnFocusedRowChanged, TcxLookupGridCloseUpEvent AOnCloseUp);
	virtual void __fastcall LookupGridInitialize(void);
	virtual void __fastcall LookupGridInitLookAndFeel(Cxlookandfeels::TcxLookAndFeel* ALookAndFeel, Graphics::TColor AColor, Graphics::TFont* AFont);
	virtual void __fastcall LookupGridLockMouseMove(void);
	virtual void __fastcall LookupGridMakeFocusedRowVisible(void);
	virtual void __fastcall LookupGridUnlockMouseMove(void);
	void __fastcall CheckDisplayColumnIndex(void);
	virtual void __fastcall DeinitializeDataController(void);
	virtual int __fastcall FindByText(int AItemIndex, const AnsiString AText, bool APartialCompare);
	virtual bool __fastcall FindLookupText(const AnsiString AText);
	virtual int __fastcall GetDisplayColumnIndex(void);
	virtual Cxedit::TcxEditDisplayFormatOptions __fastcall GetDisplayFormatOptions(void);
	virtual AnsiString __fastcall GetDisplayLookupText(const Variant &AKey);
	virtual bool __fastcall GetIncrementalFiltering(void);
	virtual int __fastcall GetListIndex(void);
	virtual Variant __fastcall GetNullKey();
	virtual void __fastcall GridDataChanged(System::TObject* Sender);
	virtual void __fastcall InitializeDataController(void);
	virtual bool __fastcall IsChangeLocked(void);
	virtual bool __fastcall IsDataChangedPostponed(void);
	virtual bool __fastcall IsDefinedByLookup(void);
	virtual bool __fastcall IsPickMode(void);
	virtual bool __fastcall IsPopupKey(Word Key, Classes::TShiftState Shift);
	virtual void __fastcall LockDataChanged(void);
	virtual void __fastcall SetDisplayColumnIndex(int Value);
	virtual void __fastcall UnlockDataChanged(void);
	virtual void __fastcall UnlinkLookupGridControlParent(void);
	__property Cxcustomdata::TcxCustomDataController* DataController = {read=GetDataController};
	__property int DisplayColumnIndex = {read=GetDisplayColumnIndex, write=SetDisplayColumnIndex, default=0};
	__property bool ImmediateUpdateText = {read=FImmediateUpdateText, write=FImmediateUpdateText, default=0};
	
public:
	__fastcall virtual TcxCustomLookupEditProperties(Classes::TPersistent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	/* virtual class method */ virtual TMetaClass* __fastcall GetContainerClass(TMetaClass* vmt);
	virtual Cxdatautils::TcxDataEditValueSource __fastcall GetEditValueSource(bool AEditFocused);
	/* virtual class method */ virtual TMetaClass* __fastcall GetLookupDataClass(TMetaClass* vmt);
	virtual Cxedit::TcxEditSupportedOperations __fastcall GetSupportedOperations(void);
	virtual bool __fastcall IsEditValueValid(Variant &EditValue, bool AEditFocused);
	virtual bool __fastcall IsLookupField(void);
	virtual void __fastcall PrepareDisplayValue(const Variant &AEditValue, Variant &DisplayValue, bool AEditFocused);
	__property bool DropDownAutoSize = {read=GetDropDownAutoSize, write=SetDropDownAutoSize, default=0};
	__property int DropDownHeight = {read=GetDropDownHeight, write=SetDropDownHeight, default=0};
	__property DropDownListStyle  = {default=0};
	__property bool DropDownSizeable = {read=GetDropDownSizeable, write=SetDropDownSizeable, default=0};
	__property int DropDownWidth = {read=GetDropDownWidth, write=SetDropDownWidth, default=0};
	__property bool IncrementalFiltering = {read=FIncrementalFiltering, write=FIncrementalFiltering, default=1};
public:
	#pragma option push -w-inl
	/* TcxCustomMaskEditProperties.Destroy */ inline __fastcall virtual ~TcxCustomLookupEditProperties(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomLookupEdit : public Cxdropdownedit::TcxCustomComboBox 
{
	typedef Cxdropdownedit::TcxCustomComboBox inherited;
	
private:
	HIDESBASE Cxtextedit::_di_IcxTextEditLookupData __fastcall GetILookupData();
	HIDESBASE TcxCustomLookupEditLookupData* __fastcall GetLookupData(void);
	HIDESBASE TcxCustomLookupEditProperties* __fastcall GetProperties(void);
	void __fastcall SetLookupData(TcxCustomLookupEditLookupData* Value);
	HIDESBASE void __fastcall SetProperties(TcxCustomLookupEditProperties* Value);
	
protected:
	virtual void __fastcall AfterPosting(void);
	virtual void __fastcall BeforePosting(void);
	virtual void __fastcall DropDown(void);
	virtual void __fastcall PropertiesChanged(System::TObject* Sender);
	virtual void __fastcall RepositoryItemAssigning(void);
	virtual void __fastcall SynchronizeDisplayValue(void);
	__property Cxtextedit::_di_IcxTextEditLookupData ILookupData = {read=GetILookupData};
	__property TcxCustomLookupEditLookupData* LookupData = {read=GetLookupData, write=SetLookupData};
	__property TcxCustomLookupEditProperties* Properties = {read=GetProperties, write=SetProperties};
	
public:
	__fastcall virtual TcxCustomLookupEdit(Classes::TComponent* AOwner)/* overload */;
	/* virtual class method */ virtual TMetaClass* __fastcall GetPropertiesClass(TMetaClass* vmt);
	virtual bool __fastcall InternalFocused(void);
	virtual void __fastcall PrepareEditValue(const Variant &ADisplayValue, /* out */ Variant &EditValue, bool AEditFocused);
public:
	#pragma option push -w-inl
	/* TcxCustomDropDownEdit.Destroy */ inline __fastcall virtual ~TcxCustomLookupEdit(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomLookupEdit(HWND ParentWindow) : Cxdropdownedit::TcxCustomComboBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Cxlookupedit */
using namespace Cxlookupedit;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxLookupEdit
