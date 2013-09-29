// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxGridTableView.pas' rev: 6.00

#ifndef cxGridTableViewHPP
#define cxGridTableViewHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <cxDataStorage.hpp>	// Pascal unit
#include <cxData.hpp>	// Pascal unit
#include <cxFilter.hpp>	// Pascal unit
#include <cxCustomData.hpp>	// Pascal unit
#include <cxGridViewData.hpp>	// Pascal unit
#include <cxGridCustomTableView.hpp>	// Pascal unit
#include <cxGridCustomView.hpp>	// Pascal unit
#include <cxGridLevel.hpp>	// Pascal unit
#include <cxGridCommon.hpp>	// Pascal unit
#include <cxGrid.hpp>	// Pascal unit
#include <cxEdit.hpp>	// Pascal unit
#include <cxContainer.hpp>	// Pascal unit
#include <cxStorage.hpp>	// Pascal unit
#include <cxListBox.hpp>	// Pascal unit
#include <cxStyles.hpp>	// Pascal unit
#include <cxLookAndFeelPainters.hpp>	// Pascal unit
#include <cxGraphics.hpp>	// Pascal unit
#include <cxControls.hpp>	// Pascal unit
#include <cxClasses.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxgridtableview
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass*TcxGridColumnHeaderAreaPainterClass;

typedef TMetaClass*TcxGridColumnHeaderAreaViewInfoClass;

typedef TMetaClass*TcxGridColumnHeaderViewInfoClass;

typedef int TcxGridColumnContainerKind;

typedef TMetaClass*TcxCustomGridColumnHitTestClass;

class DELPHICLASS TcxCustomGridColumnHitTest;
class DELPHICLASS TcxGridColumn;
class DELPHICLASS TcxGridTableView;
class DELPHICLASS TcxGridColumnHeaderViewInfo;
typedef void __fastcall (__closure *TcxGridColumnCustomDrawHeaderEvent)(TcxGridTableView* Sender, Cxgraphics::TcxCanvas* ACanvas, TcxGridColumnHeaderViewInfo* AViewInfo, bool &ADone);

typedef void __fastcall (__closure *TcxGridColumnUserFilteringEvent)(TcxGridColumn* Sender, const Variant &AValue, const AnsiString ADisplayText);

class DELPHICLASS TcxGridColumnOptions;
class DELPHICLASS TcxGridColumnStyles;
class PASCALIMPLEMENTATION TcxGridColumn : public Cxgridcustomtableview::TcxCustomGridTableItem 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItem inherited;
	
private:
	Classes::TAlignment FFooterAlignmentHorz;
	Graphics::TBitmap* FHeaderGlyph;
	Classes::TAlignment FHeaderGlyphAlignmentHorz;
	Cxclasses::TcxAlignmentVert FHeaderGlyphAlignmentVert;
	bool FHidden;
	bool FIsFooterAlignmentHorzAssigned;
	TcxGridColumnCustomDrawHeaderEvent FOnCustomDrawFooterCell;
	TcxGridColumnCustomDrawHeaderEvent FOnCustomDrawHeader;
	Classes::TNotifyEvent FOnHeaderClick;
	TcxGridColumnUserFilteringEvent FOnUserFiltering;
	Classes::TAlignment __fastcall GetFooterAlignmentHorz(void);
	TcxGridTableView* __fastcall GetGridView(void);
	bool __fastcall GetHidden(void);
	bool __fastcall GetIsPreview(void);
	TcxGridColumnOptions* __fastcall GetOptions(void);
	TcxGridColumnStyles* __fastcall GetStyles(void);
	void __fastcall SetFooterAlignmentHorz(Classes::TAlignment Value);
	void __fastcall SetHeaderGlyph(Graphics::TBitmap* Value);
	void __fastcall SetHeaderGlyphAlignmentHorz(Classes::TAlignment Value);
	void __fastcall SetHeaderGlyphAlignmentVert(Cxclasses::TcxAlignmentVert Value);
	void __fastcall SetHidden(bool Value);
	void __fastcall SetIsPreview(bool Value);
	HIDESBASE void __fastcall SetOptions(TcxGridColumnOptions* Value);
	HIDESBASE void __fastcall SetStyles(TcxGridColumnStyles* Value);
	bool __fastcall IsFooterAlignmentHorzStored(void);
	bool __fastcall IsHiddenStored(void);
	void __fastcall HeaderGlyphChanged(System::TObject* Sender);
	
protected:
	virtual bool __fastcall GetStoredProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual void __fastcall CreateSubClasses(void);
	virtual void __fastcall DestroySubClasses(void);
	virtual void __fastcall AssignColumnWidths(void);
	virtual bool __fastcall CanFilter(bool ACheckGridViewOptions);
	virtual bool __fastcall CanHorzSize(void);
	virtual void __fastcall CaptionChanged(void);
	virtual void __fastcall ForceWidth(int Value);
	virtual int __fastcall GetBestFitWidth(void);
	virtual bool __fastcall GetFilterable(void);
	virtual bool __fastcall GetFixed(void);
	virtual bool __fastcall GetIsBottom(void);
	virtual bool __fastcall GetIsLeft(void);
	virtual bool __fastcall GetIsMostBottom(void);
	virtual bool __fastcall GetIsMostLeft(void);
	virtual bool __fastcall GetIsMostRight(void);
	virtual bool __fastcall GetIsRight(void);
	virtual bool __fastcall GetVisible(void);
	bool __fastcall HasCustomDrawFooterCell(void);
	bool __fastcall HasCustomDrawHeader(void);
	virtual void __fastcall HiddenChanged(void);
	virtual bool __fastcall HideOnGrouping(void);
	virtual bool __fastcall IsVisibleStored(void);
	TMetaClass* __fastcall GetHeaderViewInfoClass(void);
	virtual TMetaClass* __fastcall GetOptionsClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	TMetaClass* __fastcall GetViewInfoClass(void);
	virtual void __fastcall DoCustomDrawFooterCell(Cxgraphics::TcxCanvas* ACanvas, TcxGridColumnHeaderViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoCustomDrawHeader(Cxgraphics::TcxCanvas* ACanvas, TcxGridColumnHeaderViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoHeaderClick(void);
	virtual void __fastcall DoUserFiltering(const Variant &AValue, const AnsiString ADisplayText);
	
public:
	__fastcall virtual TcxGridColumn(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxGridColumn(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property Filtered ;
	__property bool IsBottom = {read=GetIsBottom, nodefault};
	__property bool IsLeft = {read=GetIsLeft, nodefault};
	__property bool IsMostBottom = {read=GetIsMostBottom, nodefault};
	__property bool IsMostLeft = {read=GetIsMostLeft, nodefault};
	__property bool IsMostRight = {read=GetIsMostRight, nodefault};
	__property bool IsPreview = {read=GetIsPreview, write=SetIsPreview, nodefault};
	__property bool IsRight = {read=GetIsRight, nodefault};
	
__published:
	__property Classes::TAlignment FooterAlignmentHorz = {read=GetFooterAlignmentHorz, write=SetFooterAlignmentHorz, stored=IsFooterAlignmentHorzStored, nodefault};
	__property GroupIndex  = {default=-1};
	__property HeaderAlignmentHorz ;
	__property HeaderAlignmentVert ;
	__property Graphics::TBitmap* HeaderGlyph = {read=FHeaderGlyph, write=SetHeaderGlyph};
	__property Classes::TAlignment HeaderGlyphAlignmentHorz = {read=FHeaderGlyphAlignmentHorz, write=SetHeaderGlyphAlignmentHorz, default=0};
	__property Cxclasses::TcxAlignmentVert HeaderGlyphAlignmentVert = {read=FHeaderGlyphAlignmentVert, write=SetHeaderGlyphAlignmentVert, default=2};
	__property bool Hidden = {read=GetHidden, write=SetHidden, stored=IsHiddenStored, nodefault};
	__property MinWidth  = {default=20};
	__property TcxGridColumnOptions* Options = {read=GetOptions, write=SetOptions};
	__property SortOrder  = {default=0};
	__property TcxGridColumnStyles* Styles = {read=GetStyles, write=SetStyles};
	__property Width ;
	__property TcxGridColumnCustomDrawHeaderEvent OnCustomDrawFooterCell = {read=FOnCustomDrawFooterCell, write=FOnCustomDrawFooterCell};
	__property TcxGridColumnCustomDrawHeaderEvent OnCustomDrawHeader = {read=FOnCustomDrawHeader, write=FOnCustomDrawHeader};
	__property Classes::TNotifyEvent OnHeaderClick = {read=FOnHeaderClick, write=FOnHeaderClick};
	__property OnGetFilterDisplayText ;
	__property OnGetFilterValues ;
	__property TcxGridColumnUserFilteringEvent OnUserFiltering = {read=FOnUserFiltering, write=FOnUserFiltering};
};


class PASCALIMPLEMENTATION TcxCustomGridColumnHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
public:
	TcxGridColumn* Column;
	int ColumnContainerKind;
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxCustomGridColumnHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridColumnHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupByBoxHitTest;
class PASCALIMPLEMENTATION TcxGridGroupByBoxHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridGroupByBoxHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupByBoxHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderHitTest;
class PASCALIMPLEMENTATION TcxGridColumnHeaderHitTest : public TcxCustomGridColumnHitTest 
{
	typedef TcxCustomGridColumnHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridColumnHeaderHitTest(void) : TcxCustomGridColumnHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderHorzSizingEdgeHitTest;
class PASCALIMPLEMENTATION TcxGridColumnHeaderHorzSizingEdgeHitTest : public TcxCustomGridColumnHitTest 
{
	typedef TcxCustomGridColumnHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual Controls::TCursor __fastcall Cursor(TMetaClass* vmt);
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridColumnHeaderHorzSizingEdgeHitTest(void) : TcxCustomGridColumnHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderHorzSizingEdgeHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderFilterButtonHitTest;
class PASCALIMPLEMENTATION TcxGridColumnHeaderFilterButtonHitTest : public TcxCustomGridColumnHitTest 
{
	typedef TcxCustomGridColumnHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridColumnHeaderFilterButtonHitTest(void) : TcxCustomGridColumnHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderFilterButtonHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridHeaderHitTest;
class PASCALIMPLEMENTATION TcxGridHeaderHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridHeaderHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridHeaderHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFooterHitTest;
class PASCALIMPLEMENTATION TcxGridFooterHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridFooterHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFooterHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFooterCellHitTest;
class PASCALIMPLEMENTATION TcxGridFooterCellHitTest : public TcxCustomGridColumnHitTest 
{
	typedef TcxCustomGridColumnHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridFooterCellHitTest(void) : TcxCustomGridColumnHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFooterCellHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupFooterHitTest;
class PASCALIMPLEMENTATION TcxGridGroupFooterHitTest : public TcxGridFooterHitTest 
{
	typedef TcxGridFooterHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridGroupFooterHitTest(void) : TcxGridFooterHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupFooterHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridGroupFooterCellHitTest;
class PASCALIMPLEMENTATION TcxGridGroupFooterCellHitTest : public TcxGridFooterCellHitTest 
{
	typedef TcxGridFooterCellHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridGroupFooterCellHitTest(void) : TcxGridFooterCellHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupFooterCellHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterHitTest;
class PASCALIMPLEMENTATION TcxGridFilterHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridFilterHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterCloseButtonHitTest;
class PASCALIMPLEMENTATION TcxGridFilterCloseButtonHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridFilterCloseButtonHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterCloseButtonHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterActivateButtonHitTest;
class PASCALIMPLEMENTATION TcxGridFilterActivateButtonHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridFilterActivateButtonHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterActivateButtonHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterCustomizeButtonHitTest;
class PASCALIMPLEMENTATION TcxGridFilterCustomizeButtonHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridFilterCustomizeButtonHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterCustomizeButtonHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRowIndicatorHitTest;
class PASCALIMPLEMENTATION TcxGridRowIndicatorHitTest : public Cxgridcustomtableview::TcxGridRecordHitTest 
{
	typedef Cxgridcustomtableview::TcxGridRecordHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridRowIndicatorHitTest(void) : Cxgridcustomtableview::TcxGridRecordHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRowIndicatorHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRowSizingEdgeHitTest;
class PASCALIMPLEMENTATION TcxGridRowSizingEdgeHitTest : public Cxgridcustomtableview::TcxGridRecordHitTest 
{
	typedef Cxgridcustomtableview::TcxGridRecordHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual Controls::TCursor __fastcall Cursor(TMetaClass* vmt);
	virtual TMetaClass* __fastcall DragAndDropObjectClass(void);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridRowSizingEdgeHitTest(void) : Cxgridcustomtableview::TcxGridRecordHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRowSizingEdgeHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridIndicatorHitTest;
class PASCALIMPLEMENTATION TcxGridIndicatorHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridIndicatorHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridIndicatorHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRowLevelIndentHitTest;
class PASCALIMPLEMENTATION TcxGridRowLevelIndentHitTest : public Cxgridcustomtableview::TcxGridRecordHitTest 
{
	typedef Cxgridcustomtableview::TcxGridRecordHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
	
public:
	/* virtual class method */ virtual bool __fastcall CanClick(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridRowLevelIndentHitTest(void) : Cxgridcustomtableview::TcxGridRecordHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRowLevelIndentHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridCustomozationFormHitTest;
class PASCALIMPLEMENTATION TcxGridCustomozationFormHitTest : public Cxgridcustomview::TcxCustomGridViewHitTest 
{
	typedef Cxgridcustomview::TcxCustomGridViewHitTest inherited;
	
protected:
	/* virtual class method */ virtual int __fastcall GetHitTestCode(TMetaClass* vmt);
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TcxGridCustomozationFormHitTest(void) : Cxgridcustomview::TcxCustomGridViewHitTest() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridCustomozationFormHitTest(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDragAndDropObject;
class DELPHICLASS TcxGridTableController;
class DELPHICLASS TcxGridTableViewInfo;
class PASCALIMPLEMENTATION TcxGridDragAndDropObject : public Cxgridcustomtableview::TcxCustomGridTableDragAndDropObject 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableDragAndDropObject inherited;
	
private:
	HIDESBASE TcxGridTableController* __fastcall GetController(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	HIDESBASE TcxGridTableViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall AfterScrolling(void);
	virtual void __fastcall BeforeScrolling(void);
	__property TcxGridTableController* Controller = {read=GetController};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxGridDragAndDropObject(Cxcontrols::TcxControl* AControl) : Cxgridcustomtableview::TcxCustomGridTableDragAndDropObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDragAndDropObject(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridArrowNumber { anFirst, anLast };
#pragma option pop

#pragma option push -b-
enum TcxGridArrowPlace { apLeft, apTop, apRight, apBottom };
#pragma option pop

class DELPHICLASS TcxCustomGridMovingObject;
class DELPHICLASS TcxGridTableCustomizationForm;
class DELPHICLASS TcxCustomGridTableItemsListBox;
class PASCALIMPLEMENTATION TcxCustomGridMovingObject : public TcxGridDragAndDropObject 
{
	typedef TcxGridDragAndDropObject inherited;
	
private:
	bool FArrowsVisible;
	Graphics::TBitmap* FDragImage;
	Cxgraphics::TcxCanvas* FDragImageCanvas;
	#pragma pack(push, 1)
	Types::TPoint FDragImageOffset;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TPoint FDragImagePos;
	#pragma pack(pop)
	
	Graphics::TBitmap* FDragImageSavingBitmap;
	#pragma pack(push, 1)
	Types::TPoint FDragImageSavingPos;
	#pragma pack(pop)
	
	bool FDragImageVisible;
	Graphics::TBitmap* FSavingBitmap;
	TcxGridArrowPlace __fastcall GetArrowPlace(TcxGridArrowNumber AArrowNumber);
	TcxGridTableCustomizationForm* __fastcall GetCustomizationForm(void);
	Graphics::TCanvas* __fastcall GetDragImageSavingCanvas(void);
	Graphics::TBitmap* __fastcall GetSavingBitmap(void);
	Graphics::TCanvas* __fastcall GetSavingCanvas(void);
	void __fastcall CreateDragImage(void);
	void __fastcall DestroyDragImage(void);
	
protected:
	virtual void __fastcall AfterScrolling(void);
	virtual void __fastcall BeforeScrolling(void);
	virtual void __fastcall DirtyChanged(void);
	virtual Controls::TCursor __fastcall GetDragAndDropCursor(bool Accepted);
	void __fastcall ChangeArrowsVisibility(bool AVisible);
	void __fastcall ChangeDragImagePosition(bool AVisible = true);
	virtual bool __fastcall AreArrowsVertical(void);
	virtual Types::TPoint __fastcall CalculateDragImageOffset();
	virtual bool __fastcall CanRemove(void) = 0 ;
	virtual Types::TRect __fastcall GetArrowAreaBounds(TcxGridArrowPlace APlace) = 0 ;
	virtual Types::TRect __fastcall GetArrowBounds(TcxGridArrowPlace APlace);
	virtual Types::TRect __fastcall GetArrowsClientRect();
	virtual TcxCustomGridTableItemsListBox* __fastcall GetCustomizationFormListBox(void) = 0 ;
	virtual Types::TRect __fastcall GetDragImageBounds(const Types::TPoint &AMousePos);
	virtual System::TObject* __fastcall GetSourceItem(void) = 0 ;
	virtual Types::TRect __fastcall GetSourceItemBounds();
	virtual Cxgridcustomview::TcxCustomGridCellViewInfo* __fastcall GetSourceItemViewInfo(void);
	virtual void __fastcall InitDragImage(void);
	virtual bool __fastcall IsSourceCustomizationForm(void) = 0 ;
	virtual bool __fastcall IsValidDestination(void) = 0 ;
	__property Types::TRect ArrowBounds[TcxGridArrowPlace APlace] = {read=GetArrowBounds};
	__property TcxGridArrowPlace ArrowPlaces[TcxGridArrowNumber AArrowNumber] = {read=GetArrowPlace};
	__property Types::TRect ArrowsClientRect = {read=GetArrowsClientRect};
	__property TcxGridTableCustomizationForm* CustomizationForm = {read=GetCustomizationForm};
	__property TcxCustomGridTableItemsListBox* CustomizationFormListBox = {read=GetCustomizationFormListBox};
	__property Graphics::TBitmap* DragImage = {read=FDragImage};
	__property Cxgraphics::TcxCanvas* DragImageCanvas = {read=FDragImageCanvas};
	__property Types::TPoint DragImageOffset = {read=FDragImageOffset};
	__property Types::TPoint DragImagePos = {read=FDragImagePos, write=FDragImagePos};
	__property Graphics::TBitmap* DragImageSavingBitmap = {read=FDragImageSavingBitmap};
	__property Graphics::TCanvas* DragImageSavingCanvas = {read=GetDragImageSavingCanvas};
	__property Types::TPoint DragImageSavingPos = {read=FDragImageSavingPos, write=FDragImageSavingPos};
	__property bool DragImageVisible = {read=FDragImageVisible, write=FDragImageVisible, nodefault};
	__property Graphics::TBitmap* SavingBitmap = {read=GetSavingBitmap};
	__property Graphics::TCanvas* SavingCanvas = {read=GetSavingCanvas};
	__property System::TObject* SourceItem = {read=GetSourceItem};
	__property Types::TRect SourceItemBounds = {read=GetSourceItemBounds};
	__property Cxgridcustomview::TcxCustomGridCellViewInfo* SourceItemViewInfo = {read=GetSourceItemViewInfo};
	
public:
	__fastcall virtual TcxCustomGridMovingObject(Cxcontrols::TcxControl* AControl);
	__fastcall virtual ~TcxCustomGridMovingObject(void);
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
};


typedef TMetaClass*TcxGridColumnHeaderMovingObjectClass;

class DELPHICLASS TcxGridColumnHeaderMovingObject;
class DELPHICLASS TcxGridColumnContainerZone;
class PASCALIMPLEMENTATION TcxGridColumnContainerZone : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	int ColumnIndex;
	__fastcall TcxGridColumnContainerZone(int AColumnIndex);
	virtual bool __fastcall IsEqual(TcxGridColumnContainerZone* Value);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnContainerZone(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridColumnHeaderMovingObject : public TcxCustomGridMovingObject 
{
	typedef TcxCustomGridMovingObject inherited;
	
private:
	int FDestColumnContainerKind;
	TcxGridColumnContainerZone* FDestZone;
	TcxGridColumn* FSourceColumn;
	int FSourceColumnContainerKind;
	void __fastcall SetDestColumnContainerKind(int Value);
	void __fastcall SetDestZone(TcxGridColumnContainerZone* Value);
	
protected:
	virtual bool __fastcall CanRemove(void);
	virtual void __fastcall DoColumnMoving(void);
	virtual Types::TRect __fastcall GetArrowAreaBounds(TcxGridArrowPlace APlace);
	virtual Types::TRect __fastcall GetArrowAreaBoundsForHeader(TcxGridArrowPlace APlace);
	virtual TcxCustomGridTableItemsListBox* __fastcall GetCustomizationFormListBox(void);
	virtual System::TObject* __fastcall GetSourceItem(void);
	virtual Cxgridcustomview::TcxCustomGridCellViewInfo* __fastcall GetSourceItemViewInfo(void);
	virtual bool __fastcall IsSourceCustomizationForm(void);
	virtual bool __fastcall IsValidDestination(void);
	virtual bool __fastcall IsValidDestinationForVisibleSource(void);
	__property int DestColumnContainerKind = {read=FDestColumnContainerKind, write=SetDestColumnContainerKind, nodefault};
	__property TcxGridColumnContainerZone* DestZone = {read=FDestZone, write=SetDestZone};
	__property TcxGridColumn* SourceColumn = {read=FSourceColumn, write=FSourceColumn};
	__property int SourceColumnContainerKind = {read=FSourceColumnContainerKind, write=FSourceColumnContainerKind, nodefault};
	
public:
	__fastcall virtual TcxGridColumnHeaderMovingObject(Cxcontrols::TcxControl* AControl);
	__fastcall virtual ~TcxGridColumnHeaderMovingObject(void);
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
};


class DELPHICLASS TcxCustomGridSizingObject;
class PASCALIMPLEMENTATION TcxCustomGridSizingObject : public TcxGridDragAndDropObject 
{
	typedef TcxGridDragAndDropObject inherited;
	
private:
	int FDestPointX;
	int FDestPointY;
	int FOriginalSize;
	void __fastcall SetDestPointX(int Value);
	void __fastcall SetDestPointY(int Value);
	
protected:
	virtual void __fastcall DirtyChanged(void);
	virtual int __fastcall GetCurrentSize(void);
	virtual int __fastcall GetDeltaSize(void);
	virtual Controls::TCursor __fastcall GetDragAndDropCursor(bool Accepted);
	virtual Types::TRect __fastcall GetHorzSizingMarkBounds();
	virtual bool __fastcall GetImmediateStart(void);
	virtual bool __fastcall GetIsHorizontalSizing(void);
	virtual Types::TRect __fastcall GetSizingItemBounds(void) = 0 ;
	virtual Types::TRect __fastcall GetSizingMarkBounds();
	virtual int __fastcall GetSizingMarkWidth(void) = 0 ;
	virtual Types::TRect __fastcall GetVertSizingMarkBounds();
	__property int CurrentSize = {read=GetCurrentSize, nodefault};
	__property int DeltaSize = {read=GetDeltaSize, nodefault};
	__property int DestPointX = {read=FDestPointX, write=SetDestPointX, nodefault};
	__property int DestPointY = {read=FDestPointY, write=SetDestPointY, nodefault};
	__property bool IsHorizontalSizing = {read=GetIsHorizontalSizing, nodefault};
	__property int OriginalSize = {read=FOriginalSize, write=FOriginalSize, nodefault};
	__property Types::TRect SizingItemBounds = {read=GetSizingItemBounds};
	__property Types::TRect SizingMarkBounds = {read=GetSizingMarkBounds};
	__property int SizingMarkWidth = {read=GetSizingMarkWidth, nodefault};
	
public:
	virtual void __fastcall DragAndDrop(const Types::TPoint &P, bool &Accepted);
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxCustomGridSizingObject(Cxcontrols::TcxControl* AControl) : TcxGridDragAndDropObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridSizingObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridColumnSizingObject;
class PASCALIMPLEMENTATION TcxCustomGridColumnSizingObject : public TcxCustomGridSizingObject 
{
	typedef TcxCustomGridSizingObject inherited;
	
private:
	TcxGridColumn* FColumn;
	TcxGridColumnHeaderViewInfo* __fastcall GetColumnHeaderViewInfo(void);
	
protected:
	virtual Types::TRect __fastcall GetSizingItemBounds();
	virtual int __fastcall GetSizingMarkWidth(void);
	__property TcxGridColumn* Column = {read=FColumn, write=FColumn};
	__property TcxGridColumnHeaderViewInfo* ColumnHeaderViewInfo = {read=GetColumnHeaderViewInfo};
	
public:
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxCustomGridColumnSizingObject(Cxcontrols::TcxControl* AControl) : TcxCustomGridSizingObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridColumnSizingObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHorzSizingObject;
class PASCALIMPLEMENTATION TcxGridColumnHorzSizingObject : public TcxCustomGridColumnSizingObject 
{
	typedef TcxCustomGridColumnSizingObject inherited;
	
protected:
	virtual int __fastcall GetCurrentSize(void);
	
public:
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxGridColumnHorzSizingObject(Cxcontrols::TcxControl* AControl) : TcxCustomGridColumnSizingObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHorzSizingObject(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridRowSizingObject;
class DELPHICLASS TcxCustomGridRowViewInfo;
class PASCALIMPLEMENTATION TcxGridRowSizingObject : public TcxCustomGridSizingObject 
{
	typedef TcxCustomGridSizingObject inherited;
	
private:
	Cxgridviewdata::TcxCustomGridRow* FRow;
	TcxCustomGridRowViewInfo* __fastcall GetRowViewInfo(void);
	
protected:
	virtual int __fastcall GetCurrentSize(void);
	virtual bool __fastcall GetIsHorizontalSizing(void);
	virtual Types::TRect __fastcall GetSizingItemBounds();
	virtual int __fastcall GetSizingMarkWidth(void);
	__property Cxgridviewdata::TcxCustomGridRow* Row = {read=FRow};
	__property TcxCustomGridRowViewInfo* RowViewInfo = {read=GetRowViewInfo};
	
public:
	virtual void __fastcall BeginDragAndDrop(void);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual void __fastcall Init(const Types::TPoint &P, Cxgridcustomview::TcxCustomGridHitTest* AParams);
public:
	#pragma option push -w-inl
	/* TcxDragAndDropObject.Create */ inline __fastcall virtual TcxGridRowSizingObject(Cxcontrols::TcxControl* AControl) : TcxCustomGridSizingObject(AControl) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRowSizingObject(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridFilterPopupClass;

class DELPHICLASS TcxGridFilterPopup;
class DELPHICLASS TcxGridColumnHeaderFilterButtonViewInfo;
class DELPHICLASS TcxGridColumnHeaderAreaViewInfo;
class PASCALIMPLEMENTATION TcxGridColumnHeaderAreaViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	TcxGridColumnHeaderViewInfo* FColumnHeaderViewInfo;
	TcxGridColumn* __fastcall GetColumn(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	
protected:
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual int __fastcall GetHeight(void);
	virtual bool __fastcall GetIsOccupyingSpace(void);
	HIDESBASE virtual bool __fastcall GetTransparent(void) = 0 ;
	virtual int __fastcall GetWidth(void);
	virtual bool __fastcall HasMouse(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property TcxGridColumn* Column = {read=GetColumn};
	__property TcxGridColumnHeaderViewInfo* ColumnHeaderViewInfo = {read=FColumnHeaderViewInfo};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property bool IsOccupyingSpace = {read=GetIsOccupyingSpace, nodefault};
	
public:
	__fastcall virtual TcxGridColumnHeaderAreaViewInfo(TcxGridColumnHeaderViewInfo* AColumnHeaderViewInfo);
	HIDESBASE virtual void __fastcall Calculate(const Types::TRect &ABounds, Types::TRect &ATextAreaBounds);
	__property Classes::TAlignment AlignmentHorz = {read=GetAlignmentHorz, nodefault};
	__property Cxclasses::TcxAlignmentVert AlignmentVert = {read=GetAlignmentVert, nodefault};
	__property int Height = {read=GetHeight, nodefault};
	__property bool Transparent = {read=GetTransparent, nodefault};
	__property int Width = {read=GetWidth, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderAreaViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridColumnHeaderFilterButtonViewInfo : public TcxGridColumnHeaderAreaViewInfo 
{
	typedef TcxGridColumnHeaderAreaViewInfo inherited;
	
private:
	bool __fastcall GetActive(void);
	TcxGridFilterPopup* __fastcall GetDropDownWindow(void);
	
protected:
	virtual void __fastcall BeforeStateChange(void);
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall EmulateMouseMoveAfterCalculate(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual bool __fastcall GetIsCheck(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetTransparent(void);
	virtual void __fastcall StateChanged(void);
	virtual void __fastcall CloseUp(void);
	virtual void __fastcall DropDown(void);
	
public:
	__fastcall virtual ~TcxGridColumnHeaderFilterButtonViewInfo(void);
	__property bool Active = {read=GetActive, nodefault};
	__property TcxGridFilterPopup* DropDownWindow = {read=GetDropDownWindow};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderAreaViewInfo.Create */ inline __fastcall virtual TcxGridColumnHeaderFilterButtonViewInfo(TcxGridColumnHeaderViewInfo* AColumnHeaderViewInfo) : TcxGridColumnHeaderAreaViewInfo(AColumnHeaderViewInfo) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridFilterPopup : public Cxcontainer::TcxCustomPopupWindow 
{
	typedef Cxcontainer::TcxCustomPopupWindow inherited;
	
private:
	TcxGridTableView* FGridView;
	Cxlistbox::TcxListBox* FListBox;
	Classes::TStringList* FListBoxItems;
	TcxGridColumnHeaderFilterButtonViewInfo* FOwnerViewInfo;
	Cxcustomdata::TcxDataFilterValueList* FValueList;
	TcxGridColumn* __fastcall GetColumn(void);
	Cxcustomdata::TcxDataFilterCriteria* __fastcall GetFilter(void);
	void __fastcall ListBoxDrawItem(Cxlistbox::TcxListBox* AControl, Cxgraphics::TcxCanvas* ACanvas, int AIndex, const Types::TRect &ARect, Windows::TOwnerDrawState AState);
	void __fastcall ListBoxKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall ListBoxMouseMove(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	void __fastcall ListBoxMouseUp(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
protected:
	virtual void __fastcall AddListBoxItems(void);
	virtual void __fastcall AdjustListBoxSize(void);
	virtual void __fastcall ApplyFilter(int AItemIndex);
	virtual Types::TRect __fastcall CalculateOwnerBounds();
	virtual void __fastcall CreateListBox(void);
	virtual void __fastcall InitPopup(void);
	DYNAMIC void __fastcall Paint(void);
	DYNAMIC void __fastcall VisibleChanged(void);
	__property TcxGridColumn* Column = {read=GetColumn};
	__property Cxcustomdata::TcxDataFilterCriteria* Filter = {read=GetFilter};
	__property TcxGridTableView* GridView = {read=FGridView};
	__property Classes::TStringList* ListBoxItems = {read=FListBoxItems};
	__property TcxGridColumnHeaderFilterButtonViewInfo* OwnerViewInfo = {read=FOwnerViewInfo, write=FOwnerViewInfo};
	__property Cxcustomdata::TcxDataFilterValueList* ValueList = {read=FValueList};
	
public:
	__fastcall virtual TcxGridFilterPopup(TcxGridTableView* AGridView);
	__fastcall virtual ~TcxGridFilterPopup(void);
	virtual void __fastcall CloseUp(bool AModalResult = false)/* overload */;
	void __fastcall CloseUpAndFocusGridView(void);
	HIDESBASE virtual void __fastcall Popup(TcxGridColumnHeaderFilterButtonViewInfo* AOwnerViewInfo);
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxGridFilterPopup(Classes::TComponent* AOwner, int Dummy) : Cxcontainer::TcxCustomPopupWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridFilterPopup(HWND ParentWindow) : Cxcontainer::TcxCustomPopupWindow(ParentWindow) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxCustomGridTableItemsListBox : public Stdctrls::TListBox 
{
	typedef Stdctrls::TListBox inherited;
	
private:
	Cxgraphics::TcxCanvas* FcxCanvas;
	int FDragAndDropItemIndex;
	#pragma pack(push, 1)
	Types::TPoint FMouseDownPos;
	#pragma pack(pop)
	
	System::TObject* __fastcall GetDragAndDropItem(void);
	TcxGridTableView* __fastcall GetGridView(void);
	TMetaClass* __fastcall GetLookAndFeelPainter(void);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall CalculateBorderStyle(void);
	void __fastcall CalculateItemHeight(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetDragAndDropParams(void) = 0 ;
	__property System::TObject* DragAndDropItem = {read=GetDragAndDropItem};
	__property int DragAndDropItemIndex = {read=FDragAndDropItemIndex, nodefault};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TMetaClass* LookAndFeelPainter = {read=GetLookAndFeelPainter};
	
public:
	__fastcall TcxCustomGridTableItemsListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TcxCustomGridTableItemsListBox(void);
	int __fastcall IndexOfItem(System::TObject* AItem);
	void __fastcall PaintItem(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &R, int AIndex, bool AFocused);
	virtual void __fastcall RefreshItems(void);
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxCustomGridTableItemsListBox(HWND ParentWindow) : Stdctrls::TListBox(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridTableColumnsListBoxClass;

class DELPHICLASS TcxGridTableColumnsListBox;
class PASCALIMPLEMENTATION TcxGridTableColumnsListBox : public TcxCustomGridTableItemsListBox 
{
	typedef TcxCustomGridTableItemsListBox inherited;
	
protected:
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetDragAndDropParams(void);
	
public:
	virtual void __fastcall RefreshItems(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableItemsListBox.Create */ inline __fastcall TcxGridTableColumnsListBox(Classes::TComponent* AOwner) : TcxCustomGridTableItemsListBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridTableItemsListBox.Destroy */ inline __fastcall virtual ~TcxGridTableColumnsListBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridTableColumnsListBox(HWND ParentWindow) : TcxCustomGridTableItemsListBox(ParentWindow) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridTableCustomizationFormClass;

class PASCALIMPLEMENTATION TcxGridTableCustomizationForm : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
private:
	TcxGridTableColumnsListBox* FColumnsListBox;
	Comctrls::TTabSheet* FColumnsPage;
	TcxGridTableController* FController;
	int FOffset;
	Comctrls::TPageControl* FPageControl;
	int FStep;
	TcxGridTableView* __fastcall GetGridView(void);
	TcxGridTableViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	DYNAMIC void __fastcall DoClose(Forms::TCloseAction &Action);
	virtual void __fastcall CalculateConsts(void);
	virtual void __fastcall CreateControls(void);
	Comctrls::TTabSheet* __fastcall CreatePage(const AnsiString ACaption, bool AVisible);
	virtual Types::TRect __fastcall GetColumnsListBoxBounds();
	virtual TMetaClass* __fastcall GetColumnsListBoxClass(void);
	virtual Types::TRect __fastcall GetContentBounds();
	virtual Types::TRect __fastcall GetPageControlBounds();
	virtual void __fastcall InitPageControl(void);
	__property TcxGridTableColumnsListBox* ColumnsListBox = {read=FColumnsListBox};
	__property Types::TRect ContentBounds = {read=GetContentBounds};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property int Offset = {read=FOffset, write=FOffset, nodefault};
	__property Comctrls::TPageControl* PageControl = {read=FPageControl};
	__property int Step = {read=FStep, write=FStep, nodefault};
	__property TcxGridTableViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual TcxGridTableCustomizationForm(TcxGridTableController* AController);
	__fastcall virtual ~TcxGridTableCustomizationForm(void);
	__property TcxGridTableController* Controller = {read=FController};
	void __fastcall ActivatePage(Comctrls::TTabSheet* APage);
	virtual void __fastcall RefreshData(void);
	__property Comctrls::TTabSheet* ColumnsPage = {read=FColumnsPage};
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TcxGridTableCustomizationForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TcxGridTableCustomizationForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridDragOpenInfoMasterDataRowTab;
class PASCALIMPLEMENTATION TcxGridDragOpenInfoMasterDataRowTab : public Cxgrid::TcxGridDragOpenInfoTab 
{
	typedef Cxgrid::TcxGridDragOpenInfoTab inherited;
	
public:
	Cxgridviewdata::TcxGridMasterDataRow* GridRow;
	__fastcall virtual TcxGridDragOpenInfoMasterDataRowTab(Cxgridlevel::TcxGridLevel* ALevel, Cxgridviewdata::TcxGridMasterDataRow* AGridRow);
	virtual bool __fastcall Equals(Cxgridcommon::TcxCustomGridDragOpenInfo* AInfo);
	virtual void __fastcall Run(void);
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridDragOpenInfoMasterDataRowTab(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridTableController : public Cxgridcustomtableview::TcxCustomGridTableController 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableController inherited;
	
private:
	bool FCustomization;
	TcxGridTableCustomizationForm* FCustomizationForm;
	#pragma pack(push, 1)
	Types::TRect FCustomizationFormBounds;
	#pragma pack(pop)
	
	TcxGridFilterPopup* FFilterPopup;
	TcxGridColumn* FHorzSizingColumn;
	int FLeftPos;
	TcxGridColumn* FMovingColumn;
	TcxGridColumn* FPressedColumn;
	Cxclasses::TcxDirection FScrollDirection;
	Extctrls::TTimer* FScrollTimer;
	HIDESBASE TcxGridDragAndDropObject* __fastcall GetDragAndDropObject(void);
	TcxGridFilterPopup* __fastcall GetFilterPopup(void);
	TcxGridColumn* __fastcall GetFocusedColumn(void);
	int __fastcall GetFocusedColumnIndex(void);
	Cxgridviewdata::TcxCustomGridRow* __fastcall GetFocusedRow(void);
	int __fastcall GetFocusedRowIndex(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	bool __fastcall GetIsColumnHorzSizing(void);
	bool __fastcall GetIsColumnMoving(void);
	Cxgridviewdata::TcxCustomGridRow* __fastcall GetSelectedRow(int Index);
	int __fastcall GetSelectedRowCount(void);
	int __fastcall GetTopRowIndex(void);
	HIDESBASE Cxgridviewdata::TcxGridViewData* __fastcall GetViewData(void);
	HIDESBASE TcxGridTableViewInfo* __fastcall GetViewInfo(void);
	void __fastcall SetCustomization(bool Value);
	void __fastcall SetFocusedColumn(TcxGridColumn* Value);
	void __fastcall SetFocusedColumnIndex(int Value);
	void __fastcall SetFocusedRow(Cxgridviewdata::TcxCustomGridRow* Value);
	void __fastcall SetFocusedRowIndex(int Value);
	void __fastcall SetLeftPos(int Value);
	void __fastcall SetPressedColumn(TcxGridColumn* Value);
	void __fastcall SetScrollDirection(Cxclasses::TcxDirection Value);
	void __fastcall SetTopRowIndex(int Value);
	void __fastcall CreateScrollTimer(void);
	void __fastcall DestroyScrollTimer(void);
	void __fastcall ScrollTimerHandler(System::TObject* Sender);
	
protected:
	virtual bool __fastcall CanAppend(void);
	virtual bool __fastcall CanDelete(bool ACheckOptions);
	bool __fastcall CanScroll(Cxclasses::TcxDirection ADirection);
	void __fastcall CheckLeftPos(int &Value);
	virtual bool __fastcall GetDesignHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual Cxclasses::TcxDirection __fastcall GetDragScrollDirection(int X, int Y);
	virtual TMetaClass* __fastcall GetFilterPopupClass(void);
	virtual Cxgridcustomtableview::TcxCustomGridRecord* __fastcall GetFocusedRecord(void);
	virtual bool __fastcall GetIsRecordsScrollHorizontal(void);
	virtual int __fastcall GetMaxTopRecordIndexValue(void);
	virtual Cxcontrols::TcxMouseWheelScrollingKind __fastcall GetMouseWheelScrollingKind(void);
	virtual int __fastcall GetScrollBarRecordCount(void);
	virtual bool __fastcall IsColumnFixedDuringHorzSizing(TcxGridColumn* AColumn);
	virtual bool __fastcall IsKeyForMultiSelect(Word AKey, Classes::TShiftState AShift, bool AFocusedRecordChanged);
	virtual bool __fastcall IsPixelScrollBar(Forms::TScrollBarKind AKind);
	virtual void __fastcall LeftPosChanged(void);
	virtual bool __fastcall NeedsAdditionalRowsScrolling(bool AIsCallFromMaster = false);
	virtual void __fastcall RemoveFocus(void);
	void __fastcall ScrollData(Cxclasses::TcxDirection ADirection);
	virtual void __fastcall SetFocusedRecord(Cxgridcustomtableview::TcxCustomGridRecord* Value);
	virtual void __fastcall ShowNextPage(void);
	virtual void __fastcall ShowPrevPage(void);
	virtual TMetaClass* __fastcall GetColumnHeaderDragAndDropObjectClass(void);
	virtual TMetaClass* __fastcall GetCustomizationFormClass(void);
	Types::TRect __fastcall GetRealCustomizationFormBounds();
	void __fastcall HideCustomizationForm(void);
	void __fastcall ShowCustomizationForm(void);
	virtual Cxgridcommon::TcxCustomGridDragOpenInfo* __fastcall GetDragOpenInfo(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property TcxGridDragAndDropObject* DragAndDropObject = {read=GetDragAndDropObject};
	__property Cxclasses::TcxDirection ScrollDirection = {read=FScrollDirection, write=SetScrollDirection, nodefault};
	__property Cxgridviewdata::TcxGridViewData* ViewData = {read=GetViewData};
	__property TcxGridTableViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	__fastcall virtual ~TcxGridTableController(void);
	virtual void __fastcall CheckCoordinates(void);
	void __fastcall CheckScrolling(const Types::TPoint &P);
	virtual void __fastcall DoCancelMode(void);
	bool __fastcall HasFilterPopup(void);
	virtual void __fastcall MakeItemVisible(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual void __fastcall MakeRecordVisible(Cxgridcustomtableview::TcxCustomGridRecord* ARecord);
	void __fastcall RefreshCustomizationForm(void);
	virtual void __fastcall InitScrollBarsParameters(void);
	virtual bool __fastcall IsDataFullyVisible(bool AIsCallFromMaster = false);
	virtual void __fastcall Scroll(Forms::TScrollBarKind AScrollBarKind, Stdctrls::TScrollCode AScrollCode, int &AScrollPos);
	virtual void __fastcall EndDragAndDrop(bool Accepted);
	virtual void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	__property bool Customization = {read=FCustomization, write=SetCustomization, nodefault};
	__property TcxGridTableCustomizationForm* CustomizationForm = {read=FCustomizationForm};
	__property Types::TRect CustomizationFormBounds = {read=FCustomizationFormBounds, write=FCustomizationFormBounds};
	__property TcxGridFilterPopup* FilterPopup = {read=GetFilterPopup};
	__property TcxGridColumn* FocusedColumn = {read=GetFocusedColumn, write=SetFocusedColumn};
	__property int FocusedColumnIndex = {read=GetFocusedColumnIndex, write=SetFocusedColumnIndex, nodefault};
	__property Cxgridviewdata::TcxCustomGridRow* FocusedRow = {read=GetFocusedRow, write=SetFocusedRow};
	__property int FocusedRowIndex = {read=GetFocusedRowIndex, write=SetFocusedRowIndex, nodefault};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridColumn* HorzSizingColumn = {read=FHorzSizingColumn};
	__property bool IsColumnHorzSizing = {read=GetIsColumnHorzSizing, nodefault};
	__property bool IsColumnMoving = {read=GetIsColumnMoving, nodefault};
	__property int LeftPos = {read=FLeftPos, write=SetLeftPos, nodefault};
	__property TcxGridColumn* MovingColumn = {read=FMovingColumn};
	__property TcxGridColumn* PressedColumn = {read=FPressedColumn, write=SetPressedColumn};
	__property int SelectedRowCount = {read=GetSelectedRowCount, nodefault};
	__property Cxgridviewdata::TcxCustomGridRow* SelectedRows[int Index] = {read=GetSelectedRow};
	__property int TopRowIndex = {read=GetTopRowIndex, write=SetTopRowIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableController.Create */ inline __fastcall virtual TcxGridTableController(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableController(AGridView) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridPartPainter;
class PASCALIMPLEMENTATION TcxCustomGridPartPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxCustomGridPartPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridPartPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridColumnContainerPainterClass;

class DELPHICLASS TcxGridColumnContainerPainter;
class DELPHICLASS TcxGridColumnContainerViewInfo;
class PASCALIMPLEMENTATION TcxGridColumnContainerPainter : public TcxCustomGridPartPainter 
{
	typedef TcxCustomGridPartPainter inherited;
	
private:
	TcxGridColumnContainerViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawItems(void);
	virtual bool __fastcall DrawItemsFirst(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	__property TcxGridColumnContainerViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridColumnContainerPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridPartPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnContainerPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderAreaPainter;
class PASCALIMPLEMENTATION TcxGridColumnHeaderAreaPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridColumnHeaderAreaViewInfo* __fastcall GetViewInfo(void);
	
protected:
	__property TcxGridColumnHeaderAreaViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridColumnHeaderAreaPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderAreaPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderSortingMarkPainter;
class PASCALIMPLEMENTATION TcxGridColumnHeaderSortingMarkPainter : public TcxGridColumnHeaderAreaPainter 
{
	typedef TcxGridColumnHeaderAreaPainter inherited;
	
protected:
	virtual void __fastcall Paint(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridColumnHeaderSortingMarkPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnHeaderAreaPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderSortingMarkPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderFilterButtonPainter;
class PASCALIMPLEMENTATION TcxGridColumnHeaderFilterButtonPainter : public TcxGridColumnHeaderAreaPainter 
{
	typedef TcxGridColumnHeaderAreaPainter inherited;
	
private:
	HIDESBASE TcxGridColumnHeaderFilterButtonViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall Paint(void);
	__property TcxGridColumnHeaderFilterButtonViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridColumnHeaderFilterButtonPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnHeaderAreaPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderFilterButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderGlyphPainter;
class DELPHICLASS TcxGridColumnHeaderGlyphViewInfo;
class PASCALIMPLEMENTATION TcxGridColumnHeaderGlyphPainter : public TcxGridColumnHeaderAreaPainter 
{
	typedef TcxGridColumnHeaderAreaPainter inherited;
	
private:
	HIDESBASE TcxGridColumnHeaderGlyphViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall Paint(void);
	__property TcxGridColumnHeaderGlyphViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridColumnHeaderGlyphPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnHeaderAreaPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderGlyphPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderPainter;
class PASCALIMPLEMENTATION TcxGridColumnHeaderPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridColumnHeaderViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorders(void);
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawPressed(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	virtual void __fastcall Paint(void);
	__property TcxGridColumnHeaderViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridColumnHeaderPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridHeaderPainter;
class PASCALIMPLEMENTATION TcxGridHeaderPainter : public TcxGridColumnContainerPainter 
{
	typedef TcxGridColumnContainerPainter inherited;
	
protected:
	virtual bool __fastcall DrawItemsFirst(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridHeaderPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnContainerPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridHeaderPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridGroupByBoxPainterClass;

class DELPHICLASS TcxGridGroupByBoxPainter;
class PASCALIMPLEMENTATION TcxGridGroupByBoxPainter : public TcxGridColumnContainerPainter 
{
	typedef TcxGridColumnContainerPainter inherited;
	
protected:
	virtual void __fastcall DrawContent(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridGroupByBoxPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnContainerPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridGroupByBoxPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFooterCellPainter;
class PASCALIMPLEMENTATION TcxGridFooterCellPainter : public TcxGridColumnHeaderPainter 
{
	typedef TcxGridColumnHeaderPainter inherited;
	
protected:
	virtual void __fastcall DrawBorders(void);
	virtual void __fastcall DrawContent(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridFooterCellPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnHeaderPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFooterCellPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridFooterPainterClass;

class DELPHICLASS TcxGridFooterPainter;
class DELPHICLASS TcxGridFooterViewInfo;
class PASCALIMPLEMENTATION TcxGridFooterPainter : public TcxGridColumnContainerPainter 
{
	typedef TcxGridColumnContainerPainter inherited;
	
private:
	HIDESBASE TcxGridFooterViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorders(void);
	virtual bool __fastcall DrawItemsFirst(void);
	virtual void __fastcall DrawSeparator(void);
	__property TcxGridFooterViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridFooterPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxGridColumnContainerPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFooterPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridFilterButtonPainter;
class DELPHICLASS TcxCustomGridFilterButtonViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridFilterButtonPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxCustomGridFilterButtonViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual bool __fastcall ExcludeFromClipRect(void);
	__property TcxCustomGridFilterButtonViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxCustomGridFilterButtonPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridFilterButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterCloseButtonPainter;
class PASCALIMPLEMENTATION TcxGridFilterCloseButtonPainter : public TcxCustomGridFilterButtonPainter 
{
	typedef TcxCustomGridFilterButtonPainter inherited;
	
protected:
	virtual void __fastcall DrawContent(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridFilterCloseButtonPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridFilterButtonPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterCloseButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterActivateButtonPainter;
class DELPHICLASS TcxGridFilterActivateButtonViewInfo;
class PASCALIMPLEMENTATION TcxGridFilterActivateButtonPainter : public TcxCustomGridFilterButtonPainter 
{
	typedef TcxCustomGridFilterButtonPainter inherited;
	
private:
	HIDESBASE TcxGridFilterActivateButtonViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawContent(void);
	__property TcxGridFilterActivateButtonViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridFilterActivateButtonPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridFilterButtonPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterActivateButtonPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterCustomizeButtonPainter;
class PASCALIMPLEMENTATION TcxGridFilterCustomizeButtonPainter : public TcxCustomGridFilterButtonPainter 
{
	typedef TcxCustomGridFilterButtonPainter inherited;
	
protected:
	virtual void __fastcall Paint(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridFilterCustomizeButtonPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridFilterButtonPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterCustomizeButtonPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridFilterPainterClass;

class DELPHICLASS TcxGridFilterPainter;
class DELPHICLASS TcxGridFilterViewInfo;
class PASCALIMPLEMENTATION TcxGridFilterPainter : public TcxCustomGridPartPainter 
{
	typedef TcxCustomGridPartPainter inherited;
	
private:
	TcxGridFilterViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawButtons(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	virtual void __fastcall Paint(void);
	__property TcxGridFilterViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridFilterPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridPartPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridFilterPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridIndicatorItemPainter;
class DELPHICLASS TcxCustomGridIndicatorItemViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridIndicatorItemPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxCustomGridIndicatorItemViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual bool __fastcall ExcludeFromClipRect(void);
	__property TcxCustomGridIndicatorItemViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxCustomGridIndicatorItemPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridIndicatorItemPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridIndicatorHeaderItemPainter;
class PASCALIMPLEMENTATION TcxGridIndicatorHeaderItemPainter : public TcxCustomGridIndicatorItemPainter 
{
	typedef TcxCustomGridIndicatorItemPainter inherited;
	
protected:
	virtual void __fastcall DrawContent(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridIndicatorHeaderItemPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridIndicatorItemPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridIndicatorHeaderItemPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridIndicatorRowItemPainter;
class DELPHICLASS TcxGridIndicatorRowItemViewInfo;
class PASCALIMPLEMENTATION TcxGridIndicatorRowItemPainter : public TcxCustomGridIndicatorItemPainter 
{
	typedef TcxCustomGridIndicatorItemPainter inherited;
	
private:
	HIDESBASE TcxGridIndicatorRowItemViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawContent(void);
	__property TcxGridIndicatorRowItemViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridIndicatorRowItemPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridIndicatorItemPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridIndicatorRowItemPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridIndicatorFooterItemPainter;
class DELPHICLASS TcxGridIndicatorFooterItemViewInfo;
class PASCALIMPLEMENTATION TcxGridIndicatorFooterItemPainter : public TcxCustomGridIndicatorItemPainter 
{
	typedef TcxCustomGridIndicatorItemPainter inherited;
	
private:
	HIDESBASE TcxGridIndicatorFooterItemViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawBorders(void);
	__property TcxGridIndicatorFooterItemViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridIndicatorFooterItemPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : TcxCustomGridIndicatorItemPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridIndicatorFooterItemPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridIndicatorPainter;
class DELPHICLASS TcxGridIndicatorViewInfo;
class PASCALIMPLEMENTATION TcxGridIndicatorPainter : public Cxgridcustomview::TcxCustomGridCellPainter 
{
	typedef Cxgridcustomview::TcxCustomGridCellPainter inherited;
	
private:
	TcxGridIndicatorViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawContent(void);
	virtual void __fastcall DrawItems(void);
	virtual bool __fastcall DrawItemsFirst(void);
	virtual bool __fastcall ExcludeFromClipRect(void);
	__property TcxGridIndicatorViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxGridIndicatorPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomview::TcxCustomGridCellPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridIndicatorPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridRowPainter;
class PASCALIMPLEMENTATION TcxCustomGridRowPainter : public Cxgridcustomtableview::TcxCustomGridRecordPainter 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordPainter inherited;
	
private:
	HIDESBASE TcxCustomGridRowViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual void __fastcall DrawFooters(void);
	virtual void __fastcall DrawIndent(void);
	virtual void __fastcall DrawIndentPart(int ALevel, const Types::TRect &ABounds);
	virtual void __fastcall DrawLastHorzGridLine(void);
	virtual void __fastcall DrawSeparator(void);
	virtual void __fastcall Paint(void);
	__property TcxCustomGridRowViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridCellPainter.Create */ inline __fastcall virtual TcxCustomGridRowPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo) : Cxgridcustomtableview::TcxCustomGridRecordPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxCustomGridRowPainter(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridRowsPainterClass;

class DELPHICLASS TcxGridRowsPainter;
class DELPHICLASS TcxGridRowsViewInfo;
class PASCALIMPLEMENTATION TcxGridRowsPainter : public Cxgridcustomtableview::TcxCustomGridRecordsPainter 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordsPainter inherited;
	
private:
	TcxGridRowsViewInfo* __fastcall GetViewInfo(void);
	
protected:
	__property TcxGridRowsViewInfo* ViewInfo = {read=GetViewInfo};
	
public:
	/* virtual class method */ virtual void __fastcall DrawDataRowCells(TMetaClass* vmt, TcxCustomGridRowViewInfo* ARowViewInfo);
	virtual void __fastcall Paint(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecordsPainter.Create */ inline __fastcall virtual TcxGridRowsPainter(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* AViewInfo) : Cxgridcustomtableview::TcxCustomGridRecordsPainter(ACanvas, AViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridRowsPainter(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTablePainter;
class PASCALIMPLEMENTATION TcxGridTablePainter : public Cxgridcustomtableview::TcxCustomGridTablePainter 
{
	typedef Cxgridcustomtableview::TcxCustomGridTablePainter inherited;
	
private:
	Classes::TList* FGridLines;
	HIDESBASE TcxGridTableController* __fastcall GetController(void);
	TcxGridTableView* __fastcall GetGridView(void);
	HIDESBASE TcxGridTableViewInfo* __fastcall GetViewInfo(void);
	
protected:
	virtual bool __fastcall CanOffset(int AItemsOffset, int DX, int DY);
	virtual void __fastcall DrawFilterBar(void);
	virtual void __fastcall DrawFooter(void);
	virtual void __fastcall DrawGroupByBox(void);
	virtual void __fastcall DrawHeader(void);
	virtual void __fastcall DrawIndicator(void);
	virtual void __fastcall DrawRecords(void);
	virtual void __fastcall Offset(int AItemsOffset)/* overload */;
	virtual void __fastcall Offset(int DX, int DY)/* overload */;
	virtual void __fastcall PaintContent(void);
	
public:
	void __fastcall AddGridLine(const Types::TRect &R);
	__property TcxGridTableController* Controller = {read=GetController};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* ViewInfo = {read=GetViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridViewHandler.Create */ inline __fastcall virtual TcxGridTablePainter(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTablePainter(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridTablePainter(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridPartAlignment { gpaTop, gpaBottom };
#pragma option pop

class DELPHICLASS TcxCustomGridPartViewInfo;
class PASCALIMPLEMENTATION TcxCustomGridPartViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	int FHeight;
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	int __fastcall GetIndex(void);
	
protected:
	virtual Types::TRect __fastcall CalculateBounds();
	virtual void __fastcall CalculateInvisible(void);
	virtual void __fastcall CalculateVisible(void);
	virtual bool __fastcall CustomDrawBackground(Cxgraphics::TcxCanvas* ACanvas);
	virtual TcxGridPartAlignment __fastcall GetAlignment(void) = 0 ;
	virtual int __fastcall GetHeight(void);
	virtual bool __fastcall GetIsAutoWidth(void) = 0 ;
	virtual bool __fastcall GetIsPart(void);
	virtual bool __fastcall GetIsScrollable(void) = 0 ;
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall HasCustomDrawBackground(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property TcxGridPartAlignment Alignment = {read=GetAlignment, nodefault};
	__property int Index = {read=GetIndex, nodefault};
	__property bool IsAutoWidth = {read=GetIsAutoWidth, nodefault};
	__property bool IsPart = {read=GetIsPart, nodefault};
	__property bool IsScrollable = {read=GetIsScrollable, nodefault};
	
public:
	__fastcall virtual TcxCustomGridPartViewInfo(TcxGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxCustomGridPartViewInfo(void);
	void __fastcall MainCalculate(void);
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
};


class PASCALIMPLEMENTATION TcxGridColumnContainerViewInfo : public TcxCustomGridPartViewInfo 
{
	typedef TcxCustomGridPartViewInfo inherited;
	
public:
	TcxGridColumnHeaderViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	int FItemHeight;
	Classes::TList* FItems;
	HIDESBASE TcxGridTableController* __fastcall GetController(void);
	int __fastcall GetCount(void);
	TcxGridColumnHeaderViewInfo* __fastcall GetInternalItem(int Index);
	TcxGridColumnHeaderViewInfo* __fastcall GetItem(int Index);
	int __fastcall GetItemHeight(void);
	TcxGridColumnHeaderViewInfo* __fastcall CreateItem(int AIndex);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual int __fastcall CalculateItemHeight(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual TcxGridColumn* __fastcall GetColumn(int Index) = 0 ;
	int __fastcall GetColumnAdditionalWidth(TcxGridColumn* AColumn);
	virtual int __fastcall GetColumnCount(void) = 0 ;
	virtual int __fastcall GetColumnMinWidth(TcxGridColumn* AColumn);
	virtual Cxlookandfeelpainters::TcxNeighbors __fastcall GetColumnNeighbors(TcxGridColumn* AColumn);
	virtual int __fastcall GetColumnWidth(TcxGridColumn* AColumn);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual bool __fastcall GetItemMultiLinePainting(void);
	virtual Types::TRect __fastcall GetItemsAreaBounds();
	virtual int __fastcall GetKind(void) = 0 ;
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Types::TRect __fastcall GetZonesAreaBounds();
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall Offset(int DX, int DY);
	__property bool AutoHeight = {read=GetAutoHeight, nodefault};
	__property int ColumnCount = {read=GetColumnCount, nodefault};
	__property TcxGridColumn* Columns[int Index] = {read=GetColumn};
	__property TcxGridTableController* Controller = {read=GetController};
	__property Types::TRect ZonesAreaBounds = {read=GetZonesAreaBounds};
	
public:
	__fastcall virtual TcxGridColumnContainerViewInfo(TcxGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridColumnContainerViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual TcxGridColumnContainerZone* __fastcall GetZone(const Types::TPoint &P);
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridColumnHeaderViewInfo* InternalItems[int Index] = {read=GetInternalItem};
	__property int ItemHeight = {read=GetItemHeight, nodefault};
	__property bool ItemMultiLinePainting = {read=GetItemMultiLinePainting, nodefault};
	__property TcxGridColumnHeaderViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property Types::TRect ItemsAreaBounds = {read=GetItemsAreaBounds};
	__property int Kind = {read=GetKind, nodefault};
};


class DELPHICLASS TcxGridColumnHeaderSortingMarkViewInfo;
class PASCALIMPLEMENTATION TcxGridColumnHeaderSortingMarkViewInfo : public TcxGridColumnHeaderAreaViewInfo 
{
	typedef TcxGridColumnHeaderAreaViewInfo inherited;
	
private:
	Cxcustomdata::TcxDataSortOrder __fastcall GetSortOrder(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetTransparent(void);
	__property Cxcustomdata::TcxDataSortOrder SortOrder = {read=GetSortOrder, nodefault};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderAreaViewInfo.Create */ inline __fastcall virtual TcxGridColumnHeaderSortingMarkViewInfo(TcxGridColumnHeaderViewInfo* AColumnHeaderViewInfo) : TcxGridColumnHeaderAreaViewInfo(AColumnHeaderViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderSortingMarkViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridColumnHeaderHorzSizingEdgeViewInfo;
class PASCALIMPLEMENTATION TcxGridColumnHeaderHorzSizingEdgeViewInfo : public TcxGridColumnHeaderAreaViewInfo 
{
	typedef TcxGridColumnHeaderAreaViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsOccupyingSpace(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetTransparent(void);
	
public:
	virtual void __fastcall Calculate(const Types::TRect &ABounds, Types::TRect &ATextAreaBounds);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderAreaViewInfo.Create */ inline __fastcall virtual TcxGridColumnHeaderHorzSizingEdgeViewInfo(TcxGridColumnHeaderViewInfo* AColumnHeaderViewInfo) : TcxGridColumnHeaderAreaViewInfo(AColumnHeaderViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderHorzSizingEdgeViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridColumnHeaderGlyphViewInfo : public TcxGridColumnHeaderAreaViewInfo 
{
	typedef TcxGridColumnHeaderAreaViewInfo inherited;
	
private:
	Graphics::TBitmap* __fastcall GetGlyph(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetTransparent(void);
	
public:
	__property Graphics::TBitmap* Glyph = {read=GetGlyph};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderAreaViewInfo.Create */ inline __fastcall virtual TcxGridColumnHeaderGlyphViewInfo(TcxGridColumnHeaderViewInfo* AColumnHeaderViewInfo) : TcxGridColumnHeaderAreaViewInfo(AColumnHeaderViewInfo) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridColumnHeaderGlyphViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridColumnHeaderViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	Classes::TList* FAreaViewInfos;
	TcxGridColumn* FColumn;
	TcxGridColumnContainerViewInfo* FContainer;
	bool FHasTextOffsetLeft;
	bool FHasTextOffsetRight;
	Cxlookandfeelpainters::TcxNeighbors FNeighbors;
	int FRealWidth;
	#pragma pack(push, 1)
	Types::TRect FTextAreaBounds;
	#pragma pack(pop)
	
	int FWidth;
	int __fastcall GetAreaViewInfoCount(void);
	TcxGridColumnHeaderAreaViewInfo* __fastcall GetAreaViewInfo(int Index);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	int __fastcall GetIndex(void);
	bool __fastcall GetIsFixed(void);
	int __fastcall GetRealWidth(void);
	void __fastcall EnumAreaViewInfoClasses(TMetaClass* AClass);
	void __fastcall CreateAreaViewInfos(void);
	void __fastcall DestroyAreaViewInfos(void);
	
protected:
	virtual bool __fastcall CalculateHasTextOffsetLeft(void);
	virtual bool __fastcall CalculateHasTextOffsetRight(void);
	virtual int __fastcall CalculateHeight(void);
	int __fastcall CalculateRealWidth(int Value);
	virtual void __fastcall CalculateTextAreaBounds(void);
	virtual void __fastcall CalculateVisible(int ALeftBound, int AWidth);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CanFilter(void);
	virtual bool __fastcall CanHorzSize(void);
	virtual bool __fastcall CanPress(void);
	virtual bool __fastcall CanSort(void);
	virtual void __fastcall CheckWidth(int &Value);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual void __fastcall DoCalculateParams(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual void __fastcall GetAreaViewInfoClasses(Cxgridcommon::TcxGridClassEnumeratorProc AProc);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	/* virtual class method */ virtual int __fastcall GetCellBorderWidth(TMetaClass* vmt, TMetaClass* ALookAndFeelPainter);
	/* virtual class method */ virtual int __fastcall GetCellHeight(TMetaClass* vmt, int ATextHeight, TMetaClass* ALookAndFeelPainter);
	virtual int __fastcall GetDataOffset(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual bool __fastcall GetIsPressed(void);
	virtual int __fastcall GetMaxWidth(void);
	virtual int __fastcall GetMinWidth(void);
	virtual bool __fastcall GetMultiLine(void);
	virtual bool __fastcall GetMultiLinePainting(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual bool __fastcall GetShowEndEllipsis(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall HasCustomDraw(void);
	virtual bool __fastcall HasGlyph(void);
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall SetWidth(int Value);
	virtual void __fastcall StateChanged(void);
	__property int AreaViewInfoCount = {read=GetAreaViewInfoCount, nodefault};
	__property TcxGridColumnHeaderAreaViewInfo* AreaViewInfos[int Index] = {read=GetAreaViewInfo};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property bool HasTextOffsetLeft = {read=FHasTextOffsetLeft, nodefault};
	__property bool HasTextOffsetRight = {read=FHasTextOffsetRight, nodefault};
	
public:
	__fastcall virtual TcxGridColumnHeaderViewInfo(TcxGridColumnContainerViewInfo* AContainer, TcxGridColumn* AColumn);
	__fastcall virtual ~TcxGridColumnHeaderViewInfo(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual int __fastcall GetBestFitWidth(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	void __fastcall InitAutoWidthItem(Cxclasses::TcxAutoWidthItem* AAutoWidthItem);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property TcxGridColumn* Column = {read=FColumn};
	__property TcxGridColumnContainerViewInfo* Container = {read=FContainer};
	__property int DataOffset = {read=GetDataOffset, nodefault};
	__property int Index = {read=GetIndex, nodefault};
	__property bool IsFixed = {read=GetIsFixed, nodefault};
	__property bool IsPressed = {read=GetIsPressed, nodefault};
	__property int MaxWidth = {read=GetMaxWidth, nodefault};
	__property int MinWidth = {read=GetMinWidth, nodefault};
	__property Cxlookandfeelpainters::TcxNeighbors Neighbors = {read=FNeighbors, write=FNeighbors, nodefault};
	__property int RealWidth = {read=GetRealWidth, nodefault};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


typedef TMetaClass*TcxGridHeaderViewInfoSpecificClass;

class DELPHICLASS TcxGridHeaderViewInfoSpecific;
class DELPHICLASS TcxGridHeaderViewInfo;
class PASCALIMPLEMENTATION TcxGridHeaderViewInfo : public TcxGridColumnContainerViewInfo 
{
	typedef TcxGridColumnContainerViewInfo inherited;
	
private:
	TcxGridHeaderViewInfoSpecific* FSpecific;
	
protected:
	virtual void __fastcall CalculateColumnAutoWidths(void);
	virtual void __fastcall CalculateColumnWidths(void);
	virtual int __fastcall CalculateHeight(void);
	virtual void __fastcall CalculateInvisible(void);
	virtual int __fastcall CalculateItemHeight(void);
	virtual void __fastcall CalculateItems(void);
	virtual void __fastcall CalculateVisible(void);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CanCalculateAutoWidths(void);
	virtual bool __fastcall DrawColumnBackgroundHandler(Cxgraphics::TcxCanvas* ACanvas, const Types::TRect &ABounds);
	virtual TcxGridPartAlignment __fastcall GetAlignment(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual TcxGridColumn* __fastcall GetColumn(int Index);
	virtual Graphics::TBitmap* __fastcall GetColumnBackgroundBitmap(void);
	virtual int __fastcall GetColumnCount(void);
	virtual Cxlookandfeelpainters::TcxNeighbors __fastcall GetColumnNeighbors(TcxGridColumn* AColumn);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsAutoWidth(void);
	virtual bool __fastcall GetIsScrollable(void);
	virtual bool __fastcall GetItemMultiLinePainting(void);
	virtual int __fastcall GetKind(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	virtual Types::TRect __fastcall GetZonesAreaBounds();
	virtual bool __fastcall IsAlwaysVisibleForCalculation(void);
	virtual bool __fastcall IsHeightAssigned(void);
	virtual void __fastcall Offset(int DX, int DY);
	void __fastcall RecalculateItemVisibles(void);
	__property bool AutoHeight = {read=GetAutoHeight, nodefault};
	__property Graphics::TBitmap* ColumnBackgroundBitmap = {read=GetColumnBackgroundBitmap};
	
public:
	__fastcall virtual TcxGridHeaderViewInfo(TcxGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridHeaderViewInfo(void);
	void __fastcall AssignColumnWidths(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	__property TcxGridHeaderViewInfoSpecific* Specific = {read=FSpecific};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class PASCALIMPLEMENTATION TcxGridHeaderViewInfoSpecific : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxGridHeaderViewInfo* FContainerViewInfo;
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	int __fastcall GetItemHeight(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall GetHeight(void);
	
public:
	__fastcall virtual TcxGridHeaderViewInfoSpecific(TcxGridHeaderViewInfo* AContainerViewInfo);
	__property TcxGridHeaderViewInfo* ContainerViewInfo = {read=FContainerViewInfo};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property int Height = {read=GetHeight, nodefault};
	__property int ItemHeight = {read=GetItemHeight, nodefault};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridHeaderViewInfoSpecific(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridHeaderViewInfoClass;

class DELPHICLASS TcxGridGroupByBoxColumnHeaderViewInfo;
class PASCALIMPLEMENTATION TcxGridGroupByBoxColumnHeaderViewInfo : public TcxGridColumnHeaderViewInfo 
{
	typedef TcxGridColumnHeaderViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	int __fastcall InheritedCalculateHeight(void);
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Create */ inline __fastcall virtual TcxGridGroupByBoxColumnHeaderViewInfo(TcxGridColumnContainerViewInfo* AContainer, TcxGridColumn* AColumn) : TcxGridColumnHeaderViewInfo(AContainer, AColumn) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Destroy */ inline __fastcall virtual ~TcxGridGroupByBoxColumnHeaderViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridGroupByBoxViewInfoClass;

class DELPHICLASS TcxGridGroupByBoxViewInfo;
class PASCALIMPLEMENTATION TcxGridGroupByBoxViewInfo : public TcxGridColumnContainerViewInfo 
{
	typedef TcxGridColumnContainerViewInfo inherited;
	
private:
	int __fastcall GetGroupByBoxVerOffset(void);
	Types::TRect __fastcall GetLinkLineBounds(int Index, bool Horizontal);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateItemHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual TcxGridPartAlignment __fastcall GetAlignment(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual TcxGridColumn* __fastcall GetColumn(int Index);
	virtual int __fastcall GetColumnCount(void);
	virtual int __fastcall GetColumnWidth(TcxGridColumn* AColumn);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsAutoWidth(void);
	virtual bool __fastcall GetIsScrollable(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual int __fastcall GetKind(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	__property int GroupByBoxVerOffset = {read=GetGroupByBoxVerOffset, nodefault};
	
public:
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	__property Types::TRect LinkLineBounds[int Index][bool Horizontal] = {read=GetLinkLineBounds};
public:
	#pragma option push -w-inl
	/* TcxGridColumnContainerViewInfo.Create */ inline __fastcall virtual TcxGridGroupByBoxViewInfo(TcxGridTableViewInfo* AGridViewInfo) : TcxGridColumnContainerViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumnContainerViewInfo.Destroy */ inline __fastcall virtual ~TcxGridGroupByBoxViewInfo(void) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class DELPHICLASS TcxGridFooterCellViewInfo;
class PASCALIMPLEMENTATION TcxGridFooterCellViewInfo : public TcxGridColumnHeaderViewInfo 
{
	typedef TcxGridColumnHeaderViewInfo inherited;
	
private:
	Cxcustomdata::TcxDataSummary* __fastcall GetSummary(void);
	
protected:
	virtual void __fastcall AfterCalculateBounds(Types::TRect &ABounds);
	virtual bool __fastcall CanPress(void);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual void __fastcall GetAreaViewInfoClasses(Cxgridcommon::TcxGridClassEnumeratorProc AProc);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	/* virtual class method */ virtual int __fastcall GetCellBorderWidth(TMetaClass* vmt, TMetaClass* ALookAndFeelPainter);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsPressed(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual int __fastcall GetSummaryItemIndex(void);
	virtual AnsiString __fastcall GetText();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual bool __fastcall HasCustomDraw(void);
	__property Cxcustomdata::TcxDataSummary* Summary = {read=GetSummary};
	
public:
	virtual int __fastcall GetBestFitWidth(void);
	__property int SummaryItemIndex = {read=GetSummaryItemIndex, nodefault};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Create */ inline __fastcall virtual TcxGridFooterCellViewInfo(TcxGridColumnContainerViewInfo* AContainer, TcxGridColumn* AColumn) : TcxGridColumnHeaderViewInfo(AContainer, AColumn) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Destroy */ inline __fastcall virtual ~TcxGridFooterCellViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridFooterViewInfoClass;

class PASCALIMPLEMENTATION TcxGridFooterViewInfo : public TcxGridHeaderViewInfo 
{
	typedef TcxGridHeaderViewInfo inherited;
	
protected:
	virtual Types::TRect __fastcall CalculateBounds();
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateItemHeight(void);
	virtual void __fastcall CalculateItem(int AIndex);
	virtual void __fastcall CalculateItems(void);
	virtual bool __fastcall CanCalculateAutoWidths(void);
	virtual TcxGridPartAlignment __fastcall GetAlignment(void);
	virtual bool __fastcall GetAutoHeight(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Types::TRect __fastcall GetBordersBounds();
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual int __fastcall GetColumnWidth(TcxGridColumn* AColumn);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsAutoWidth(void);
	virtual bool __fastcall GetIsScrollable(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	HIDESBASE virtual int __fastcall GetItemHeight(int AIndex);
	virtual int __fastcall GetItemLeftBound(int AIndex);
	virtual Types::TRect __fastcall GetItemsAreaBounds();
	virtual int __fastcall GetItemTopBound(int AIndex);
	virtual int __fastcall GetKind(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Types::TRect __fastcall GetSeparatorBounds();
	virtual Graphics::TColor __fastcall GetSeparatorColor(void);
	virtual int __fastcall GetSeparatorWidth(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual bool __fastcall HasSeparator(void);
	virtual bool __fastcall IsAlwaysVisibleForCalculation(void);
	virtual bool __fastcall IsHeightAssigned(void);
	virtual bool __fastcall IsItemVisible(int AIndex);
	virtual void __fastcall Offset(int DX, int DY);
	
public:
	__property Types::TRect BordersBounds = {read=GetBordersBounds};
	__property Types::TRect SeparatorBounds = {read=GetSeparatorBounds};
	__property Graphics::TColor SeparatorColor = {read=GetSeparatorColor, nodefault};
	__property int SeparatorWidth = {read=GetSeparatorWidth, nodefault};
public:
	#pragma option push -w-inl
	/* TcxGridHeaderViewInfo.Create */ inline __fastcall virtual TcxGridFooterViewInfo(TcxGridTableViewInfo* AGridViewInfo) : TcxGridHeaderViewInfo(AGridViewInfo) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridHeaderViewInfo.Destroy */ inline __fastcall virtual ~TcxGridFooterViewInfo(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridFilterButtonAlignment { fbaLeft, fbaRight };
#pragma option pop

typedef TMetaClass*TcxCustomGridFilterButtonViewInfoClass;

class DELPHICLASS TcxGridFilterButtonsViewInfo;
class PASCALIMPLEMENTATION TcxGridFilterButtonsViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxCustomGridFilterButtonViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	TcxGridFilterViewInfo* FFilterViewInfo;
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	TcxGridTableView* __fastcall GetGridView(void);
	int __fastcall GetHeight(void);
	TcxCustomGridFilterButtonViewInfo* __fastcall GetItem(int Index);
	int __fastcall GetWidth(TcxGridFilterButtonAlignment AAlignment);
	int __fastcall GetWidthLeftPart(void);
	int __fastcall GetWidthRightPart(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual void __fastcall AddItems(void);
	__property TcxGridFilterViewInfo* FilterViewInfo = {read=FFilterViewInfo};
	__property TcxGridTableView* GridView = {read=GetGridView};
	
public:
	__fastcall virtual TcxGridFilterButtonsViewInfo(TcxGridFilterViewInfo* AFilterViewInfo);
	__fastcall virtual ~TcxGridFilterButtonsViewInfo(void);
	void __fastcall AddItem(TMetaClass* AItemClass);
	virtual void __fastcall Calculate(const Types::TRect &ABounds);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property int Count = {read=GetCount, nodefault};
	__property int Height = {read=GetHeight, nodefault};
	__property TcxCustomGridFilterButtonViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property int WidthLeftPart = {read=GetWidthLeftPart, nodefault};
	__property int WidthRightPart = {read=GetWidthRightPart, nodefault};
};


class PASCALIMPLEMENTATION TcxCustomGridFilterButtonViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	TcxGridFilterButtonsViewInfo* FContainer;
	Cxcustomdata::TcxDataFilterCriteria* __fastcall GetFilter(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	
protected:
	virtual TcxGridFilterButtonAlignment __fastcall GetAlignment(void);
	virtual Cxgraphics::TcxCanvas* __fastcall GetCanvas(void);
	virtual bool __fastcall GetHotTrack(void);
	virtual bool __fastcall GetVisible(void);
	virtual void __fastcall StateChanged(void);
	__property TcxGridFilterButtonsViewInfo* Container = {read=FContainer};
	__property Cxcustomdata::TcxDataFilterCriteria* Filter = {read=GetFilter};
	
public:
	__fastcall virtual TcxCustomGridFilterButtonViewInfo(TcxGridFilterButtonsViewInfo* AContainer);
	__property TcxGridFilterButtonAlignment Alignment = {read=GetAlignment, nodefault};
	__property TcxGridTableView* GridView = {read=GetGridView};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxCustomGridFilterButtonViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterCloseButtonViewInfo;
class PASCALIMPLEMENTATION TcxGridFilterCloseButtonViewInfo : public TcxCustomGridFilterButtonViewInfo 
{
	typedef TcxCustomGridFilterButtonViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual void __fastcall Click(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridFilterButtonViewInfo.Create */ inline __fastcall virtual TcxGridFilterCloseButtonViewInfo(TcxGridFilterButtonsViewInfo* AContainer) : TcxCustomGridFilterButtonViewInfo(AContainer) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridFilterCloseButtonViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridFilterActivateButtonViewInfo : public TcxCustomGridFilterButtonViewInfo 
{
	typedef TcxCustomGridFilterButtonViewInfo inherited;
	
private:
	bool __fastcall GetChecked(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual void __fastcall Click(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	
public:
	__property bool Checked = {read=GetChecked, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridFilterButtonViewInfo.Create */ inline __fastcall virtual TcxGridFilterActivateButtonViewInfo(TcxGridFilterButtonsViewInfo* AContainer) : TcxCustomGridFilterButtonViewInfo(AContainer) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridFilterActivateButtonViewInfo(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridFilterCustomizeButtonViewInfo;
class PASCALIMPLEMENTATION TcxGridFilterCustomizeButtonViewInfo : public TcxCustomGridFilterButtonViewInfo 
{
	typedef TcxCustomGridFilterButtonViewInfo inherited;
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual void __fastcall Click(void);
	virtual TcxGridFilterButtonAlignment __fastcall GetAlignment(void);
	virtual Classes::TAlignment __fastcall GetAlignmentHorz(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridFilterButtonViewInfo.Create */ inline __fastcall virtual TcxGridFilterCustomizeButtonViewInfo(TcxGridFilterButtonsViewInfo* AContainer) : TcxCustomGridFilterButtonViewInfo(AContainer) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewCellViewInfo.Destroy */ inline __fastcall virtual ~TcxGridFilterCustomizeButtonViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridFilterButtonsViewInfoClass;

typedef TMetaClass*TcxGridFilterViewInfoClass;

class DELPHICLASS TcxGridTableFiltering;
class PASCALIMPLEMENTATION TcxGridFilterViewInfo : public TcxCustomGridPartViewInfo 
{
	typedef TcxCustomGridPartViewInfo inherited;
	
private:
	TcxGridFilterButtonsViewInfo* FButtonsViewInfo;
	Cxcustomdata::TcxDataFilterCriteria* __fastcall GetFilter(void);
	TcxGridTableFiltering* __fastcall GetFiltering(void);
	void __fastcall CreateButtonsViewInfo(void);
	void __fastcall DestroyButtonsViewInfo(void);
	
protected:
	virtual Types::TRect __fastcall CalculateButtonsViewInfoBounds();
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual TcxGridPartAlignment __fastcall GetAlignment(void);
	virtual Cxclasses::TcxAlignmentVert __fastcall GetAlignmentVert(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsAutoWidth(void);
	virtual bool __fastcall GetIsScrollable(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual AnsiString __fastcall GetText();
	virtual Types::TRect __fastcall GetTextAreaBounds();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual TMetaClass* __fastcall GetButtonsViewInfoClass(void);
	__property Cxcustomdata::TcxDataFilterCriteria* Filter = {read=GetFilter};
	__property TcxGridTableFiltering* Filtering = {read=GetFiltering};
	
public:
	__fastcall virtual TcxGridFilterViewInfo(TcxGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridFilterViewInfo(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property TcxGridFilterButtonsViewInfo* ButtonsViewInfo = {read=FButtonsViewInfo};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


typedef TMetaClass*TcxCustomGridIndicatorItemViewInfoClass;

class PASCALIMPLEMENTATION TcxCustomGridIndicatorItemViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	TcxGridIndicatorViewInfo* FContainer;
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	
protected:
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CustomDraw(Cxgraphics::TcxCanvas* ACanvas);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall HasCustomDraw(void);
	
public:
	__fastcall virtual TcxCustomGridIndicatorItemViewInfo(TcxGridIndicatorViewInfo* AContainer);
	__fastcall virtual ~TcxCustomGridIndicatorItemViewInfo(void);
	__property TcxGridIndicatorViewInfo* Container = {read=FContainer};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
};


class DELPHICLASS TcxGridIndicatorHeaderItemViewInfo;
class PASCALIMPLEMENTATION TcxGridIndicatorHeaderItemViewInfo : public TcxCustomGridIndicatorItemViewInfo 
{
	typedef TcxCustomGridIndicatorItemViewInfo inherited;
	
protected:
	virtual TMetaClass* __fastcall GetPainterClass(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridIndicatorItemViewInfo.Create */ inline __fastcall virtual TcxGridIndicatorHeaderItemViewInfo(TcxGridIndicatorViewInfo* AContainer) : TcxCustomGridIndicatorItemViewInfo(AContainer) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridIndicatorItemViewInfo.Destroy */ inline __fastcall virtual ~TcxGridIndicatorHeaderItemViewInfo(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridIndicatorRowItemViewInfo : public TcxCustomGridIndicatorItemViewInfo 
{
	typedef TcxCustomGridIndicatorItemViewInfo inherited;
	
private:
	TcxCustomGridRowViewInfo* FRowViewInfo;
	Cxgridviewdata::TcxCustomGridRow* __fastcall GetGridRecord(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	
protected:
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Cxlookandfeelpainters::TcxIndicatorKind __fastcall GetIndicatorKind(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Types::TRect __fastcall GetRowSizingEdgeBounds();
	virtual void __fastcall InitHitTest(Cxgridcustomview::TcxCustomGridHitTest* AHitTest);
	__property Types::TRect RowSizingEdgeBounds = {read=GetRowSizingEdgeBounds};
	
public:
	__fastcall virtual ~TcxGridIndicatorRowItemViewInfo(void);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual bool __fastcall MouseDown(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	__property Cxgridviewdata::TcxCustomGridRow* GridRecord = {read=GetGridRecord};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property Cxlookandfeelpainters::TcxIndicatorKind IndicatorKind = {read=GetIndicatorKind, nodefault};
	__property TcxCustomGridRowViewInfo* RowViewInfo = {read=FRowViewInfo, write=FRowViewInfo};
public:
	#pragma option push -w-inl
	/* TcxCustomGridIndicatorItemViewInfo.Create */ inline __fastcall virtual TcxGridIndicatorRowItemViewInfo(TcxGridIndicatorViewInfo* AContainer) : TcxCustomGridIndicatorItemViewInfo(AContainer) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridIndicatorFooterItemViewInfo : public TcxCustomGridIndicatorItemViewInfo 
{
	typedef TcxCustomGridIndicatorItemViewInfo inherited;
	
private:
	int __fastcall GetSeparatorWidth(void);
	
protected:
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual Cxgraphics::TcxBorders __fastcall GetBorders(void);
	virtual Types::TRect __fastcall GetBordersBounds();
	virtual int __fastcall GetBorderWidth(Cxgraphics::TcxBorder AIndex);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual Types::TRect __fastcall GetSeparatorBounds();
	bool __fastcall HasSeparator(void);
	
public:
	__property Types::TRect BordersBounds = {read=GetBordersBounds};
	__property Types::TRect SeparatorBounds = {read=GetSeparatorBounds};
	__property int SeparatorWidth = {read=GetSeparatorWidth, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridIndicatorItemViewInfo.Create */ inline __fastcall virtual TcxGridIndicatorFooterItemViewInfo(TcxGridIndicatorViewInfo* AContainer) : TcxCustomGridIndicatorItemViewInfo(AContainer) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridIndicatorItemViewInfo.Destroy */ inline __fastcall virtual ~TcxGridIndicatorFooterItemViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridIndicatorViewInfoClass;

class PASCALIMPLEMENTATION TcxGridIndicatorViewInfo : public Cxgridcustomview::TcxCustomGridViewCellViewInfo 
{
	typedef Cxgridcustomview::TcxCustomGridViewCellViewInfo inherited;
	
private:
	Classes::TList* FItems;
	int __fastcall GetCount(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	TcxCustomGridIndicatorItemViewInfo* __fastcall GetItem(int Index);
	void __fastcall DestroyItems(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	virtual int __fastcall CalculateWidth(void);
	virtual Graphics::TBitmap* __fastcall GetBackgroundBitmap(void);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	TcxCustomGridIndicatorItemViewInfo* __fastcall AddItem(TMetaClass* AItemClass)/* overload */;
	TcxCustomGridIndicatorItemViewInfo* __fastcall AddItem(int ATopBound, int AHeight, TMetaClass* AItemClass)/* overload */;
	
public:
	__fastcall virtual TcxGridIndicatorViewInfo(TcxGridTableViewInfo* AGridViewInfo);
	__fastcall virtual ~TcxGridIndicatorViewInfo(void);
	TcxCustomGridIndicatorItemViewInfo* __fastcall AddRowItem(TcxCustomGridRowViewInfo* ARowViewInfo);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	void __fastcall CalculateRowItem(TcxCustomGridRowViewInfo* ARowViewInfo, TcxCustomGridIndicatorItemViewInfo* AItem);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	Types::TRect __fastcall GetRowItemBounds(Cxgridviewdata::TcxCustomGridRow* AGridRecord);
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxCustomGridIndicatorItemViewInfo* Items[int Index] = {read=GetItem};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


class DELPHICLASS TcxGridRowFooterCellViewInfo;
class DELPHICLASS TcxGridRowFooterViewInfo;
class PASCALIMPLEMENTATION TcxGridRowFooterCellViewInfo : public TcxGridFooterCellViewInfo 
{
	typedef TcxGridFooterCellViewInfo inherited;
	
private:
	TcxGridRowFooterViewInfo* __fastcall GetContainer(void);
	Cxgridviewdata::TcxCustomGridRow* __fastcall GetGridRecord(void);
	TcxCustomGridRowViewInfo* __fastcall GetRowViewInfo(void);
	
protected:
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual int __fastcall GetSummaryItemIndex(void);
	virtual AnsiString __fastcall GetText();
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	
public:
	__property TcxGridRowFooterViewInfo* Container = {read=GetContainer};
	__property Cxgridviewdata::TcxCustomGridRow* GridRecord = {read=GetGridRecord};
	__property TcxCustomGridRowViewInfo* RowViewInfo = {read=GetRowViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Create */ inline __fastcall virtual TcxGridRowFooterCellViewInfo(TcxGridColumnContainerViewInfo* AContainer, TcxGridColumn* AColumn) : TcxGridFooterCellViewInfo(AContainer, AColumn) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxGridColumnHeaderViewInfo.Destroy */ inline __fastcall virtual ~TcxGridRowFooterCellViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridRowFooterViewInfoClass;

class DELPHICLASS TcxGridRowFootersViewInfo;
class PASCALIMPLEMENTATION TcxGridRowFootersViewInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	TcxGridRowFooterViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	int FHeight;
	Classes::TList* FItems;
	TcxCustomGridRowViewInfo* FRowViewInfo;
	int __fastcall GetCount(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	int __fastcall GetHeight(void);
	TcxGridRowFooterViewInfo* __fastcall GetItem(int Index);
	TcxGridRowFooterViewInfo* __fastcall GetVisibleItem(int Index);
	void __fastcall CreateItems(void);
	void __fastcall DestroyItems(void);
	
protected:
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound);
	virtual int __fastcall CalculateHeight(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	
public:
	__fastcall virtual TcxGridRowFootersViewInfo(TcxCustomGridRowViewInfo* ARowViewInfo);
	__fastcall virtual ~TcxGridRowFootersViewInfo(void);
	int __fastcall GetCellBestFitWidth(int ACellIndex);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual void __fastcall Offset(int DX, int DY);
	void __fastcall Paint(void);
	__property int Count = {read=GetCount, nodefault};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property TcxGridRowFooterViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property int Height = {read=GetHeight, nodefault};
	__property TcxCustomGridRowViewInfo* RowViewInfo = {read=FRowViewInfo};
	__property TcxGridRowFooterViewInfo* VisibleItems[int Index] = {read=GetVisibleItem};
};


class PASCALIMPLEMENTATION TcxGridRowFooterViewInfo : public TcxGridFooterViewInfo 
{
	typedef TcxGridFooterViewInfo inherited;
	
private:
	TcxGridRowFootersViewInfo* FContainer;
	int FLevel;
	int __fastcall GetIndent(void);
	Cxgridviewdata::TcxCustomGridRow* __fastcall GetGridRecord(void);
	int __fastcall GetGroupLevel(void);
	TcxCustomGridRowViewInfo* __fastcall GetRowViewInfo(void);
	
protected:
	virtual Types::TRect __fastcall CalculateBounds();
	virtual int __fastcall CalculateWidth(void);
	virtual int __fastcall GetColumnWidth(TcxGridColumn* AColumn);
	virtual TMetaClass* __fastcall GetHitTestClass(void);
	virtual bool __fastcall GetIsPart(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual void __fastcall GetViewParams(Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall GetVisible(void);
	virtual bool __fastcall HasSeparator(void);
	__property int Indent = {read=GetIndent, nodefault};
	
public:
	__fastcall virtual TcxGridRowFooterViewInfo(TcxGridRowFootersViewInfo* AContainer, int ALevel);
	__property TcxGridRowFootersViewInfo* Container = {read=FContainer};
	__property Cxgridviewdata::TcxCustomGridRow* GridRecord = {read=GetGridRecord};
	__property int GroupLevel = {read=GetGroupLevel, nodefault};
	__property int Level = {read=FLevel, nodefault};
	__property TcxCustomGridRowViewInfo* RowViewInfo = {read=GetRowViewInfo};
public:
	#pragma option push -w-inl
	/* TcxGridHeaderViewInfo.Destroy */ inline __fastcall virtual ~TcxGridRowFooterViewInfo(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridRowFootersViewInfoClass;

typedef TMetaClass*TcxCustomGridRowViewInfoClass;

class DELPHICLASS TcxGridTableViewInfoCacheItem;
class PASCALIMPLEMENTATION TcxCustomGridRowViewInfo : public Cxgridcustomtableview::TcxCustomGridRecordViewInfo 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordViewInfo inherited;
	
private:
	TcxGridRowFootersViewInfo* FFootersViewInfo;
	TcxCustomGridIndicatorItemViewInfo* FIndicatorItem;
	HIDESBASE TcxGridTableViewInfoCacheItem* __fastcall GetCacheItem(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	Cxgraphics::TcxGridLines __fastcall GetGridLines(void);
	Cxgridviewdata::TcxCustomGridRow* __fastcall GetGridRecord(void);
	HIDESBASE TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	bool __fastcall GetHasSeparator(void);
	int __fastcall GetLevel(void);
	int __fastcall GetLevelIndent(void);
	Types::TRect __fastcall GetLevelIndentBounds(int Index);
	Types::TRect __fastcall GetLevelIndentHorzLineBounds(int Index);
	Types::TRect __fastcall GetLevelIndentSpaceBounds(int Index);
	Types::TRect __fastcall GetLevelIndentVertLineBounds(int Index);
	TcxGridRowsViewInfo* __fastcall GetRecordsViewInfo(void);
	int __fastcall GetSeparatorWidth(void);
	void __fastcall CreateFootersViewInfo(void);
	void __fastcall DestroyFootersViewInfo(void);
	void __fastcall RecreateFootersViewInfo(void);
	
protected:
	virtual int __fastcall CalculateHeight(void);
	Types::TRect __fastcall CalculateLevelIndentHorzLineBounds(int ALevel, const Types::TRect &ABounds);
	Types::TRect __fastcall CalculateLevelIndentSpaceBounds(int ALevel, const Types::TRect &ABounds);
	Types::TRect __fastcall CalculateLevelIndentVertLineBounds(int ALevel, const Types::TRect &ABounds);
	virtual int __fastcall CalculateWidth(void);
	virtual bool __fastcall CanSize(void);
	virtual void __fastcall CheckRowHeight(int &AValue) = 0 ;
	virtual bool __fastcall GetAutoHeight(void);
	virtual int __fastcall GetBaseHeight(void);
	virtual int __fastcall GetBottomPartHeight(void);
	virtual bool __fastcall GetCellTransparent(Cxgridcustomtableview::TcxGridTableCellViewInfo* ACell);
	virtual Types::TRect __fastcall GetContentBounds();
	virtual int __fastcall GetContentIndent(void);
	virtual int __fastcall GetContentWidth(void);
	virtual int __fastcall GetDataHeight(void);
	virtual int __fastcall GetDataIndent(void);
	virtual int __fastcall GetDataWidth(void);
	virtual Types::TRect __fastcall GetFocusRectBounds();
	virtual TMetaClass* __fastcall GetFootersViewInfoClass(void);
	virtual Types::TRect __fastcall GetLastHorzGridLineBounds();
	virtual int __fastcall GetMaxHeight(void);
	virtual int __fastcall GetNonBaseHeight(void);
	virtual int __fastcall GetRowHeight(void);
	virtual Types::TRect __fastcall GetSeparatorBounds();
	virtual Graphics::TColor __fastcall GetSeparatorColor(void);
	virtual bool __fastcall GetShowSeparator(void);
	virtual bool __fastcall GetVisible(void);
	virtual int __fastcall GetWidth(void);
	virtual bool __fastcall HasFooter(int ALevel);
	virtual bool __fastcall HasLastHorzGridLine(void);
	virtual void __fastcall Offset(int DX, int DY);
	virtual void __fastcall SetRowHeight(int Value) = 0 ;
	__property int BaseHeight = {read=GetBaseHeight, nodefault};
	__property int BottomPartHeight = {read=GetBottomPartHeight, nodefault};
	__property TcxGridTableViewInfoCacheItem* CacheItem = {read=GetCacheItem};
	__property TcxCustomGridIndicatorItemViewInfo* IndicatorItem = {read=FIndicatorItem};
	__property Types::TRect LastHorzGridLineBounds = {read=GetLastHorzGridLineBounds};
	__property int Level = {read=GetLevel, nodefault};
	__property int LevelIndent = {read=GetLevelIndent, nodefault};
	__property int NonBaseHeight = {read=GetNonBaseHeight, nodefault};
	__property int RowHeight = {read=GetRowHeight, write=SetRowHeight, nodefault};
	__property bool ShowSeparator = {read=GetShowSeparator, nodefault};
	
public:
	__fastcall virtual TcxCustomGridRowViewInfo(Cxgridcustomtableview::TcxCustomGridRecordsViewInfo* ARecordsViewInfo, Cxgridcustomtableview::TcxCustomGridRecord* ARecord);
	__fastcall virtual ~TcxCustomGridRowViewInfo(void);
	virtual void __fastcall BeforeRecalculation(void);
	virtual void __fastcall Calculate(int ALeftBound, int ATopBound, int AWidth = 0xffffffff, int AHeight = 0xffffffff)/* overload */;
	virtual bool __fastcall Click(Cxgridcustomview::TcxCustomGridHitTest* AHitTest, Controls::TMouseButton AButton, Classes::TShiftState AShift);
	virtual Types::TRect __fastcall GetBoundsForInvalidate(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	__property int ContentIndent = {read=GetContentIndent, nodefault};
	__property int DataHeight = {read=GetDataHeight, nodefault};
	__property int DataIndent = {read=GetDataIndent, nodefault};
	__property int DataWidth = {read=GetDataWidth, nodefault};
	__property TcxGridRowFootersViewInfo* FootersViewInfo = {read=FFootersViewInfo};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property Cxgraphics::TcxGridLines GridLines = {read=GetGridLines, nodefault};
	__property Cxgridviewdata::TcxCustomGridRow* GridRecord = {read=GetGridRecord};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property bool HasSeparator = {read=GetHasSeparator, nodefault};
	__property Types::TRect LevelIndentBounds[int Index] = {read=GetLevelIndentBounds};
	__property Types::TRect LevelIndentHorzLineBounds[int Index] = {read=GetLevelIndentHorzLineBounds};
	__property Types::TRect LevelIndentSpaceBounds[int Index] = {read=GetLevelIndentSpaceBounds};
	__property Types::TRect LevelIndentVertLineBounds[int Index] = {read=GetLevelIndentVertLineBounds};
	__property int MaxHeight = {read=GetMaxHeight, nodefault};
	__property TcxGridRowsViewInfo* RecordsViewInfo = {read=GetRecordsViewInfo};
	__property Types::TRect SeparatorBounds = {read=GetSeparatorBounds};
	__property Graphics::TColor SeparatorColor = {read=GetSeparatorColor, nodefault};
	__property int SeparatorWidth = {read=GetSeparatorWidth, nodefault};
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Calculate(const Types::TRect &ABounds){ TcxCustomGridCellViewInfo::Calculate(ABounds); }
	
};


typedef TMetaClass*TcxGridRowsViewInfoClass;

class PASCALIMPLEMENTATION TcxGridRowsViewInfo : public Cxgridcustomtableview::TcxCustomGridRecordsViewInfo 
{
	typedef Cxgridcustomtableview::TcxCustomGridRecordsViewInfo inherited;
	
public:
	TcxCustomGridRowViewInfo* operator[](int Index) { return Items[Index]; }
	
private:
	#pragma pack(push, 1)
	Types::TRect FContentBounds;
	#pragma pack(pop)
	
	int FDataRowHeight;
	int FGroupRowHeight;
	TcxCustomGridRowViewInfo* FNewItemRowViewInfo;
	int FRestHeight;
	int FRowHeight;
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	Cxgraphics::TcxGridLines __fastcall GetGridLines(void);
	TcxGridTableViewInfo* __fastcall GetGridViewInfo(void);
	bool __fastcall GetHasNewItemRecord(void);
	TcxGridHeaderViewInfo* __fastcall GetHeaderViewInfo(void);
	HIDESBASE TcxCustomGridRowViewInfo* __fastcall GetItem(int Index);
	TMetaClass* __fastcall GetPainterClassValue(void);
	HIDESBASE Cxgridviewdata::TcxGridViewData* __fastcall GetViewData(void);
	
protected:
	int FPartVisibleCount;
	virtual void __fastcall Calculate(void);
	virtual Types::TRect __fastcall CalculateBounds();
	virtual void __fastcall CalculateConsts(void);
	virtual Types::TRect __fastcall CalculateContentBounds();
	virtual int __fastcall CalculateDataRowHeight(void);
	virtual int __fastcall CalculateGroupRowHeight(void);
	virtual int __fastcall CalculateRestHeight(int ATopBound);
	virtual int __fastcall CalculateRowHeight(void);
	virtual void __fastcall CalculateVisibleCount(void);
	virtual bool __fastcall GetAutoDataRecordHeight(void);
	virtual int __fastcall GetCommonDataRowHeight(void);
	virtual Graphics::TBitmap* __fastcall GetGroupBackgroundBitmap(void);
	virtual int __fastcall GetItemLeftBound(int AIndex);
	virtual int __fastcall GetItemsOffset(int AItemCountDelta);
	virtual int __fastcall GetItemTopBound(int AIndex);
	virtual bool __fastcall GetIsScrollable(void);
	virtual TMetaClass* __fastcall GetNewItemRowViewInfoClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual int __fastcall GetRowWidth(void);
	virtual int __fastcall GetSeparatorWidth(void);
	virtual bool __fastcall GetShowNewItemRow(void);
	virtual bool __fastcall HasLastHorzGridLine(TcxCustomGridRowViewInfo* ARowViewInfo);
	virtual void __fastcall OffsetItem(int AIndex, int AOffset);
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridTableViewInfo* GridViewInfo = {read=GetGridViewInfo};
	__property bool HasNewItemRecord = {read=GetHasNewItemRecord, nodefault};
	__property TcxGridHeaderViewInfo* HeaderViewInfo = {read=GetHeaderViewInfo};
	__property bool IsScrollable = {read=GetIsScrollable, nodefault};
	__property bool ShowNewItemRow = {read=GetShowNewItemRow, nodefault};
	__property Cxgridviewdata::TcxGridViewData* ViewData = {read=GetViewData};
	
public:
	__fastcall virtual ~TcxGridRowsViewInfo(void);
	virtual void __fastcall AfterConstruction(void);
	virtual int __fastcall CalculateCustomGroupRowHeight(const Cxgraphics::TcxViewParams &AParams);
	virtual bool __fastcall CanDataRowSize(void);
	virtual int __fastcall GetCellHeight(int ACellContentHeight);
	virtual TMetaClass* __fastcall GetDataRowCellsAreaViewInfoClass(void);
	int __fastcall GetFooterCellBestFitWidth(int ACellIndex);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P);
	virtual Cxgridcustomtableview::TcxCustomGridRecordViewInfo* __fastcall GetRealItem(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, int ARecordIndex);
	virtual int __fastcall GetRestHeight(int ATopBound);
	virtual bool __fastcall IsDataRowHeightAssigned(void);
	virtual void __fastcall Offset(int DX, int DY)/* overload */;
	__property int CommonDataRowHeight = {read=GetCommonDataRowHeight, nodefault};
	__property Types::TRect ContentBounds = {read=FContentBounds};
	__property int DataRowHeight = {read=FDataRowHeight, nodefault};
	__property Cxgraphics::TcxGridLines GridLines = {read=GetGridLines, nodefault};
	__property Graphics::TBitmap* GroupBackgroundBitmap = {read=GetGroupBackgroundBitmap};
	__property int GroupRowHeight = {read=FGroupRowHeight, write=FGroupRowHeight, nodefault};
	__property TcxCustomGridRowViewInfo* Items[int Index] = {read=GetItem/*, default*/};
	__property TcxCustomGridRowViewInfo* NewItemRowViewInfo = {read=FNewItemRowViewInfo};
	__property TMetaClass* PainterClass = {read=GetPainterClassValue};
	__property int PartVisibleCount = {read=FPartVisibleCount, nodefault};
	__property int RowHeight = {read=FRowHeight, write=FRowHeight, nodefault};
	__property int RowWidth = {read=GetRowWidth, nodefault};
	__property int SeparatorWidth = {read=GetSeparatorWidth, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridRecordsViewInfo.Create */ inline __fastcall virtual TcxGridRowsViewInfo(Cxgridcustomtableview::TcxCustomGridTableViewInfo* AGridViewInfo) : Cxgridcustomtableview::TcxCustomGridRecordsViewInfo(AGridViewInfo) { }
	#pragma option pop
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  Offset(int AItemCountDelta){ TcxCustomGridRecordsViewInfo::Offset(AItemCountDelta); }
	
};


class PASCALIMPLEMENTATION TcxGridTableViewInfo : public Cxgridcustomtableview::TcxCustomGridTableViewInfo 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewInfo inherited;
	
private:
	int FDataWidth;
	TcxGridFooterViewInfo* FFooterViewInfo;
	TcxGridFilterViewInfo* FFilterViewInfo;
	TcxGridGroupByBoxViewInfo* FGroupByBoxViewInfo;
	TcxGridHeaderViewInfo* FHeaderViewInfo;
	TcxGridIndicatorViewInfo* FIndicatorViewInfo;
	Classes::TList* FParts;
	int FPrevDataRowHeight;
	HIDESBASE TcxGridTableController* __fastcall GetController(void);
	int __fastcall GetDataWidth(void);
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	Graphics::TColor __fastcall GetGridLineColor(void);
	Cxgraphics::TcxGridLines __fastcall GetGridLines(void);
	int __fastcall GetLeftPos(void);
	Graphics::TBitmap* __fastcall GetLevelIndentBackgroundBitmap(void);
	Graphics::TColor __fastcall GetLevelIndentColor(int Index);
	TcxCustomGridPartViewInfo* __fastcall GetPart(int Index);
	int __fastcall GetPartCount(void);
	int __fastcall GetPartsBottomHeight(void);
	int __fastcall GetPartsCustomHeight(TcxGridPartAlignment AAlignment);
	int __fastcall GetPartsTopHeight(void);
	TcxGridRowsViewInfo* __fastcall GetRecordsViewInfo(void);
	HIDESBASE Cxgridviewdata::TcxGridViewData* __fastcall GetViewData(void);
	void __fastcall AddPart(TcxCustomGridPartViewInfo* AItem);
	void __fastcall RemovePart(TcxCustomGridPartViewInfo* AItem);
	
protected:
	virtual void __fastcall AfterCalculating(void);
	virtual void __fastcall BeforeCalculating(void);
	virtual void __fastcall CreateViewInfos(void);
	virtual void __fastcall DestroyViewInfos(bool AIsRecreating);
	virtual void __fastcall Calculate(void);
	virtual Types::TRect __fastcall CalculateClientBounds();
	virtual void __fastcall CalculateHeight(const Types::TPoint &AMaxSize, int &AHeight, bool &AFullyVisible);
	virtual int __fastcall CalculateVisibleEqualHeightRecordCount(void);
	virtual void __fastcall CalculateWidth(const Types::TPoint &AMaxSize, int &AWidth);
	virtual int __fastcall GetDefaultGridModeBufferCount(void);
	virtual void __fastcall Offset(int DX, int DY)/* overload */;
	virtual void __fastcall RecreateViewInfos(void);
	virtual TMetaClass* __fastcall GetFooterPainterClass(void);
	virtual TMetaClass* __fastcall GetRecordsViewInfoClass(void);
	virtual int __fastcall CalculateDataWidth(void);
	virtual Types::TRect __fastcall CalculatePartBounds(TcxCustomGridPartViewInfo* APart);
	virtual TMetaClass* __fastcall GetFilterViewInfoClass(void);
	virtual int __fastcall GetFirstItemAdditionalWidth(void);
	virtual TMetaClass* __fastcall GetFooterViewInfoClass(void);
	virtual int __fastcall GetGridLineWidth(void);
	virtual TMetaClass* __fastcall GetGroupByBoxViewInfoClass(void);
	virtual TMetaClass* __fastcall GetHeaderViewInfoClass(void);
	virtual TMetaClass* __fastcall GetIndicatorViewInfoClass(void);
	virtual Graphics::TColor __fastcall GetLevelSeparatorColor(void);
	virtual TMetaClass* __fastcall GetHeaderViewInfoSpecificClass(void);
	virtual int __fastcall GetNonRowsAreaHeight(bool ACheckScrollBar);
	virtual Types::TRect __fastcall GetScrollableAreaBoundsHorz();
	virtual Types::TRect __fastcall GetScrollableAreaBoundsVert();
	__property TcxGridTableController* Controller = {read=GetController};
	__property int PartCount = {read=GetPartCount, nodefault};
	__property TcxCustomGridPartViewInfo* Parts[int Index] = {read=GetPart};
	__property Cxgridviewdata::TcxGridViewData* ViewData = {read=GetViewData};
	
public:
	__fastcall virtual TcxGridTableViewInfo(Cxgridcustomview::TcxCustomGridView* AGridView);
	__fastcall virtual ~TcxGridTableViewInfo(void);
	virtual Cxgraphics::TcxBorders __fastcall GetCellBorders(bool AIsRight, bool AIsBottom);
	virtual int __fastcall GetCellHeight(int AIndex, int ACellHeight);
	virtual int __fastcall GetCellTopOffset(int AIndex, int ACellHeight);
	virtual Cxgridcustomview::TcxCustomGridHitTest* __fastcall GetHitTest(const Types::TPoint &P)/* overload */;
	virtual Types::TRect __fastcall GetOffsetBounds(int AItemsOffset, /* out */ Types::TRect &AUpdateBounds)/* overload */;
	virtual Types::TRect __fastcall GetOffsetBounds(int DX, int DY, /* out */ Types::TRect &AUpdateBounds)/* overload */;
	virtual int __fastcall GetNearestPopupHeight(int AHeight, bool AAdditionalRecord = false);
	virtual int __fastcall GetPopupHeight(int ADropDownRowCount);
	__property int DataWidth = {read=GetDataWidth, nodefault};
	__property TcxGridFilterViewInfo* FilterViewInfo = {read=FFilterViewInfo};
	__property int FirstItemAdditionalWidth = {read=GetFirstItemAdditionalWidth, nodefault};
	__property TcxGridFooterViewInfo* FooterViewInfo = {read=FFooterViewInfo};
	__property Graphics::TColor GridLineColor = {read=GetGridLineColor, nodefault};
	__property Cxgraphics::TcxGridLines GridLines = {read=GetGridLines, nodefault};
	__property int GridLineWidth = {read=GetGridLineWidth, nodefault};
	__property TcxGridTableView* GridView = {read=GetGridView};
	__property TcxGridGroupByBoxViewInfo* GroupByBoxViewInfo = {read=FGroupByBoxViewInfo};
	__property TcxGridHeaderViewInfo* HeaderViewInfo = {read=FHeaderViewInfo};
	__property TcxGridIndicatorViewInfo* IndicatorViewInfo = {read=FIndicatorViewInfo};
	__property int LeftPos = {read=GetLeftPos, nodefault};
	__property Graphics::TBitmap* LevelIndentBackgroundBitmap = {read=GetLevelIndentBackgroundBitmap};
	__property Graphics::TColor LevelIndentColors[int Index] = {read=GetLevelIndentColor};
	__property Graphics::TColor LevelSeparatorColor = {read=GetLevelSeparatorColor, nodefault};
	__property int PartsBottomHeight = {read=GetPartsBottomHeight, nodefault};
	__property int PartsTopHeight = {read=GetPartsTopHeight, nodefault};
	__property TcxGridRowsViewInfo* RecordsViewInfo = {read=GetRecordsViewInfo};
	
/* Hoisted overloads: */
	
protected:
	inline void __fastcall  Offset(int ARecordCountDelta){ TcxCustomGridTableViewInfo::Offset(ARecordCountDelta); }
	
public:
	inline Cxgridcustomview::TcxCustomGridHitTest* __fastcall  GetHitTest(int X, int Y){ return TcxCustomGridViewInfo::GetHitTest(X, Y); }
	
};


class PASCALIMPLEMENTATION TcxGridTableViewInfoCacheItem : public Cxgridcustomtableview::TcxCustomGridTableViewInfoCacheItem 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewInfoCacheItem inherited;
	
private:
	bool FIsPreviewHeightAssigned;
	int FPreviewHeight;
	void __fastcall SetPreviewHeight(int Value);
	
public:
	virtual void __fastcall UnassignValues(bool AKeepMaster);
	__property bool IsPreviewHeightAssigned = {read=FIsPreviewHeightAssigned, write=FIsPreviewHeightAssigned, nodefault};
	__property int PreviewHeight = {read=FPreviewHeight, write=SetPreviewHeight, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCacheItem.Create */ inline __fastcall virtual TcxGridTableViewInfoCacheItem(Cxgridcustomview::TcxCustomGridViewInfoCache* AOwner, int AIndex) : Cxgridcustomtableview::TcxCustomGridTableViewInfoCacheItem(AOwner, AIndex) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridTableViewInfoCacheItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridMasterTableViewInfoCacheItem;
class PASCALIMPLEMENTATION TcxGridMasterTableViewInfoCacheItem : public TcxGridTableViewInfoCacheItem 
{
	typedef TcxGridTableViewInfoCacheItem inherited;
	
private:
	bool FIsDetailsSiteHeightAssigned;
	bool FIsDetailsSiteNormalHeightAssigned;
	bool FIsDetailsSiteWidthAssigned;
	int FDetailsSiteHeight;
	int FDetailsSiteNormalHeight;
	int FDetailsSiteWidth;
	bool FUnassigningValues;
	HIDESBASE Cxgridviewdata::TcxGridMasterDataRow* __fastcall GetGridRecord(void);
	void __fastcall SetDetailsSiteHeight(int Value);
	void __fastcall SetDetailsSiteNormalHeight(int Value);
	void __fastcall SetDetailsSiteWidth(int Value);
	
protected:
	__property Cxgridviewdata::TcxGridMasterDataRow* GridRecord = {read=GetGridRecord};
	
public:
	virtual void __fastcall UnassignValues(bool AKeepMaster);
	__property bool IsDetailsSiteHeightAssigned = {read=FIsDetailsSiteHeightAssigned, write=FIsDetailsSiteHeightAssigned, nodefault};
	__property bool IsDetailsSiteNormalHeightAssigned = {read=FIsDetailsSiteNormalHeightAssigned, write=FIsDetailsSiteNormalHeightAssigned, nodefault};
	__property bool IsDetailsSiteWidthAssigned = {read=FIsDetailsSiteWidthAssigned, write=FIsDetailsSiteWidthAssigned, nodefault};
	__property int DetailsSiteHeight = {read=FDetailsSiteHeight, write=SetDetailsSiteHeight, nodefault};
	__property int DetailsSiteNormalHeight = {read=FDetailsSiteNormalHeight, write=SetDetailsSiteNormalHeight, nodefault};
	__property int DetailsSiteWidth = {read=FDetailsSiteWidth, write=SetDetailsSiteWidth, nodefault};
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCacheItem.Create */ inline __fastcall virtual TcxGridMasterTableViewInfoCacheItem(Cxgridcustomview::TcxCustomGridViewInfoCache* AOwner, int AIndex) : TcxGridTableViewInfoCacheItem(AOwner, AIndex) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxGridMasterTableViewInfoCacheItem(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableViewInfoCache;
class PASCALIMPLEMENTATION TcxGridTableViewInfoCache : public Cxgridcustomtableview::TcxCustomGridTableViewInfoCache 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewInfoCache inherited;
	
protected:
	virtual TMetaClass* __fastcall GetItemClass(void);
public:
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCache.Create */ inline __fastcall virtual TcxGridTableViewInfoCache(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableViewInfoCache(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridViewInfoCache.Destroy */ inline __fastcall virtual ~TcxGridTableViewInfoCache(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridColumnOptions : public Cxgridcustomtableview::TcxCustomGridTableItemOptions 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItemOptions inherited;
	
private:
	bool FHorzSizing;
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	void __fastcall SetHorzSizing(bool Value);
	
protected:
	__property TcxGridTableView* GridView = {read=GetGridView};
	
public:
	__fastcall virtual TcxGridColumnOptions(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Grouping  = {default=1};
	__property bool HorzSizing = {read=FHorzSizing, write=SetHorzSizing, default=1};
	__property Moving  = {default=1};
	__property Sorting  = {default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxGridColumnOptions(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridGetHeaderStyleEvent)(TcxGridTableView* Sender, TcxGridColumn* AColumn, Cxstyles::TcxStyle* &AStyle);

class PASCALIMPLEMENTATION TcxGridColumnStyles : public Cxgridcustomtableview::TcxCustomGridTableItemStyles 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableItemStyles inherited;
	
private:
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetFooterStyle;
	TcxGridGetHeaderStyleEvent FOnGetHeaderStyle;
	HIDESBASE TcxGridTableView* __fastcall GetGridViewValue(void);
	HIDESBASE TcxGridColumn* __fastcall GetItem(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetFooterParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetHeaderParams(/* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxGridTableView* GridView = {read=GetGridViewValue};
	__property TcxGridColumn* Item = {read=GetItem};
	
__published:
	__property Cxstyles::TcxStyle* Footer = {read=GetValue, write=SetValue, index=1};
	__property Cxstyles::TcxStyle* Header = {read=GetValue, write=SetValue, index=2};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetFooterStyle = {read=FOnGetFooterStyle, write=FOnGetFooterStyle};
	__property TcxGridGetHeaderStyleEvent OnGetHeaderStyle = {read=FOnGetHeaderStyle, write=FOnGetHeaderStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridColumnStyles(Classes::TPersistent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableItemStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridColumnStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableBackgroundBitmaps;
class PASCALIMPLEMENTATION TcxGridTableBackgroundBitmaps : public Cxgridcustomtableview::TcxCustomGridTableBackgroundBitmaps 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableBackgroundBitmaps inherited;
	
protected:
	virtual int __fastcall GetBitmapStyleIndex(int Index);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property Graphics::TBitmap* FilterBox = {read=GetValue, write=SetValue, index=2};
	__property Graphics::TBitmap* Footer = {read=GetValue, write=SetValue, index=3};
	__property Graphics::TBitmap* Header = {read=GetValue, write=SetValue, index=4};
	__property Graphics::TBitmap* Group = {read=GetValue, write=SetValue, index=5};
	__property Graphics::TBitmap* GroupByBox = {read=GetValue, write=SetValue, index=6};
	__property Graphics::TBitmap* Indicator = {read=GetValue, write=SetValue, index=7};
	__property Graphics::TBitmap* Preview = {read=GetValue, write=SetValue, index=8};
public:
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Create */ inline __fastcall virtual TcxGridTableBackgroundBitmaps(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableBackgroundBitmaps(AGridView) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomGridBackgroundBitmaps.Destroy */ inline __fastcall virtual ~TcxGridTableBackgroundBitmaps(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableOptionsBehavior;
class PASCALIMPLEMENTATION TcxGridTableOptionsBehavior : public Cxgridcustomtableview::TcxCustomGridTableOptionsBehavior 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsBehavior inherited;
	
private:
	bool FExpandMasterRowOnDblClick;
	
public:
	__fastcall virtual TcxGridTableOptionsBehavior(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property BestFitMaxRecordCount  = {default=0};
	__property bool ExpandMasterRowOnDblClick = {read=FExpandMasterRowOnDblClick, write=FExpandMasterRowOnDblClick, default=1};
	__property FocusCellOnCycle  = {default=0};
	__property PullFocusing  = {default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridTableOptionsBehavior(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxCustomGridFilterItem;
class DELPHICLASS TcxGridFilterItemList;
class PASCALIMPLEMENTATION TcxCustomGridFilterItem : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	TcxGridFilterItemList* FParent;
	
protected:
	virtual bool __fastcall GetIsList(void) = 0 ;
	
public:
	__fastcall TcxCustomGridFilterItem(TcxGridFilterItemList* AParent);
	__fastcall virtual ~TcxCustomGridFilterItem(void);
	__property bool IsList = {read=GetIsList, nodefault};
	__property TcxGridFilterItemList* Parent = {read=FParent};
};


class DELPHICLASS TcxGridFilterItem;
class PASCALIMPLEMENTATION TcxGridFilterItemList : public TcxCustomGridFilterItem 
{
	typedef TcxCustomGridFilterItem inherited;
	
public:
	TcxCustomGridFilterItem* operator[](int Index) { return Items[Index]; }
	
private:
	Cxfilter::TcxFilterBoolOperatorKind FBoolOperatorKind;
	Classes::TList* FItems;
	Classes::TNotifyEvent FOnChange;
	int __fastcall GetCount(void);
	TcxCustomGridFilterItem* __fastcall GetItem(int Index);
	void __fastcall SetBoolOperatorKind(Cxfilter::TcxFilterBoolOperatorKind Value);
	void __fastcall InternalAddItem(TcxCustomGridFilterItem* AItem);
	void __fastcall InternalRemoveItem(TcxCustomGridFilterItem* AItem);
	
protected:
	virtual void __fastcall Changed(void);
	virtual bool __fastcall GetIsList(void);
	
public:
	__fastcall TcxGridFilterItemList(TcxGridFilterItemList* AParent, Cxfilter::TcxFilterBoolOperatorKind ABoolOperatorKind);
	__fastcall virtual ~TcxGridFilterItemList(void);
	TcxGridFilterItem* __fastcall AddItem(TcxGridColumn* AColumn, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayText);
	TcxGridFilterItemList* __fastcall AddItemList(Cxfilter::TcxFilterBoolOperatorKind ABoolOperatorKind);
	void __fastcall Assign(Cxfilter::TcxFilterCriteriaItemList* ACriteriaItemList);
	void __fastcall AssignTo(Cxfilter::TcxFilterCriteriaItemList* ACriteriaItemList);
	void __fastcall Clear(void);
	bool __fastcall HasItem(TcxCustomGridFilterItem* AItem);
	__property Cxfilter::TcxFilterBoolOperatorKind BoolOperatorKind = {read=FBoolOperatorKind, write=SetBoolOperatorKind, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property TcxCustomGridFilterItem* Items[int Index] = {read=GetItem/*, default*/};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
};



class PASCALIMPLEMENTATION TcxGridFilterItem : public TcxCustomGridFilterItem 
{
	typedef TcxCustomGridFilterItem inherited;
	
private:
	AnsiString FDisplayText;
	TcxGridColumn* FColumn;
	Cxfilter::TcxFilterOperatorKind FOperatorKind;
	Variant FValue;
	
protected:
	virtual bool __fastcall GetIsList(void);
	
public:
	__fastcall TcxGridFilterItem(TcxGridFilterItemList* AParent, TcxGridColumn* AColumn, Cxfilter::TcxFilterOperatorKind AOperatorKind, const Variant &AValue, const AnsiString ADisplayText);
	__property TcxGridColumn* Column = {read=FColumn};
	__property AnsiString DisplayText = {read=FDisplayText, write=FDisplayText};
	__property Cxfilter::TcxFilterOperatorKind OperatorKind = {read=FOperatorKind, write=FOperatorKind, nodefault};
	__property Variant Value = {read=FValue, write=FValue};
public:
	#pragma option push -w-inl
	/* TcxCustomGridFilterItem.Destroy */ inline __fastcall virtual ~TcxGridFilterItem(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TcxGridTableFiltering : public Cxgridcustomtableview::TcxCustomGridTableFiltering 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableFiltering inherited;
	
__published:
	__property CustomizeDialog  = {default=1};
	__property DropDownWidth  = {default=0};
	__property MaxDropDownCount  = {default=15};
	__property Visible  = {default=1};
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableFiltering.Create */ inline __fastcall virtual TcxGridTableFiltering(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableFiltering(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridTableFiltering(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TcxGridTableOptionsCustomizeClass;

class DELPHICLASS TcxGridTableOptionsCustomize;
class PASCALIMPLEMENTATION TcxGridTableOptionsCustomize : public Cxgridcustomtableview::TcxCustomGridTableOptionsCustomize 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsCustomize inherited;
	
private:
	bool FColumnFiltering;
	bool FColumnHiding;
	bool FColumnHidingOnGrouping;
	bool FColumnHorzSizing;
	bool FDataRowSizing;
	bool FGroupRowSizing;
	bool __fastcall GetColumnGrouping(void);
	bool __fastcall GetColumnMoving(void);
	bool __fastcall GetColumnSorting(void);
	TcxGridTableView* __fastcall GetGridView(void);
	void __fastcall SetColumnFiltering(bool Value);
	void __fastcall SetColumnGrouping(bool Value);
	void __fastcall SetColumnHorzSizing(bool Value);
	void __fastcall SetColumnMoving(bool Value);
	void __fastcall SetColumnSorting(bool Value);
	
public:
	__fastcall virtual TcxGridTableOptionsCustomize(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TcxGridTableView* GridView = {read=GetGridView};
	
__published:
	__property bool ColumnFiltering = {read=FColumnFiltering, write=SetColumnFiltering, default=1};
	__property bool ColumnGrouping = {read=GetColumnGrouping, write=SetColumnGrouping, default=1};
	__property bool ColumnHiding = {read=FColumnHiding, write=FColumnHiding, default=0};
	__property bool ColumnHidingOnGrouping = {read=FColumnHidingOnGrouping, write=FColumnHidingOnGrouping, default=1};
	__property bool ColumnHorzSizing = {read=FColumnHorzSizing, write=SetColumnHorzSizing, default=1};
	__property bool ColumnMoving = {read=GetColumnMoving, write=SetColumnMoving, default=1};
	__property bool ColumnSorting = {read=GetColumnSorting, write=SetColumnSorting, default=1};
	__property bool DataRowSizing = {read=FDataRowSizing, write=FDataRowSizing, default=0};
	__property bool GroupRowSizing = {read=FGroupRowSizing, write=FGroupRowSizing, default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridTableOptionsCustomize(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableOptionsData;
class PASCALIMPLEMENTATION TcxGridTableOptionsData : public Cxgridcustomtableview::TcxCustomGridTableOptionsData 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsData inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableOptionsData.Create */ inline __fastcall virtual TcxGridTableOptionsData(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableOptionsData(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridTableOptionsData(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableOptionsSelection;
class PASCALIMPLEMENTATION TcxGridTableOptionsSelection : public Cxgridcustomtableview::TcxCustomGridTableOptionsSelection 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsSelection inherited;
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridTableOptionsSelection.Create */ inline __fastcall virtual TcxGridTableOptionsSelection(Cxgridcustomview::TcxCustomGridView* AGridView) : Cxgridcustomtableview::TcxCustomGridTableOptionsSelection(AGridView) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridTableOptionsSelection(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridGroupFootersMode { gfInvisible, gfVisibleWhenExpanded, gfAlwaysVisible };
#pragma option pop

class DELPHICLASS TcxGridTableOptionsView;
class PASCALIMPLEMENTATION TcxGridTableOptionsView : public Cxgridcustomtableview::TcxCustomGridTableOptionsView 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableOptionsView inherited;
	
private:
	bool FColumnAutoWidth;
	int FDataRowHeight;
	bool FExpandButtonsForEmptyDetails;
	bool FFooter;
	Graphics::TColor FGridLineColor;
	Cxgraphics::TcxGridLines FGridLines;
	bool FGroupByBox;
	TcxGridGroupFootersMode FGroupFooters;
	int FGroupRowHeight;
	bool FHeader;
	int FHeaderHeight;
	bool FIndicator;
	int FIndicatorWidth;
	bool FNewItemRow;
	AnsiString FNewItemRowInfoText;
	Graphics::TColor FNewItemRowSeparatorColor;
	int FNewItemRowSeparatorWidth;
	Graphics::TColor FRowSeparatorColor;
	int FRowSeparatorWidth;
	HIDESBASE TcxGridTableView* __fastcall GetGridView(void);
	bool __fastcall GetHeaderAutoHeight(void);
	bool __fastcall GetHeaderEndEllipsis(void);
	void __fastcall SetColumnAutoWidth(bool Value);
	void __fastcall SetDataRowHeight(int Value);
	void __fastcall SetExpandButtonsForEmptyDetails(bool Value);
	void __fastcall SetFooter(bool Value);
	void __fastcall SetGridLineColor(Graphics::TColor Value);
	void __fastcall SetGridLines(Cxgraphics::TcxGridLines Value);
	void __fastcall SetGroupByBox(bool Value);
	void __fastcall SetGroupFooters(TcxGridGroupFootersMode Value);
	void __fastcall SetGroupRowHeight(int Value);
	void __fastcall SetHeader(bool Value);
	void __fastcall SetHeaderAutoHeight(bool Value);
	void __fastcall SetHeaderEndEllipsis(bool Value);
	void __fastcall SetHeaderHeight(int Value);
	void __fastcall SetIndicator(bool Value);
	void __fastcall SetIndicatorWidth(int Value);
	void __fastcall SetNewItemRow(bool Value);
	void __fastcall SetNewItemRowInfoText(const AnsiString Value);
	void __fastcall SetNewItemRowSeparatorColor(Graphics::TColor Value);
	void __fastcall SetNewItemRowSeparatorWidth(int Value);
	void __fastcall SetRowSeparatorColor(Graphics::TColor Value);
	void __fastcall SetRowSeparatorWidth(int Value);
	bool __fastcall IsNewItemRowInfoTextStored(void);
	
protected:
	DYNAMIC void __fastcall ItemCaptionAutoHeightChanged(void);
	
public:
	__fastcall virtual TcxGridTableOptionsView(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall CheckDataRowHeight(int &AValue);
	virtual void __fastcall CheckGroupRowHeight(int &AValue);
	Graphics::TColor __fastcall GetGridLineColor(void);
	Graphics::TColor __fastcall GetNewItemRowSeparatorColor(void);
	Graphics::TColor __fastcall GetRowSeparatorColor(void);
	__property TcxGridTableView* GridView = {read=GetGridView};
	
__published:
	__property CellAutoHeight  = {default=0};
	__property CellTextMaxLineCount  = {default=0};
	__property bool ColumnAutoWidth = {read=FColumnAutoWidth, write=SetColumnAutoWidth, default=0};
	__property int DataRowHeight = {read=FDataRowHeight, write=SetDataRowHeight, default=0};
	__property bool ExpandButtonsForEmptyDetails = {read=FExpandButtonsForEmptyDetails, write=SetExpandButtonsForEmptyDetails, default=1};
	__property bool Footer = {read=FFooter, write=SetFooter, default=0};
	__property Graphics::TColor GridLineColor = {read=FGridLineColor, write=SetGridLineColor, default=536870912};
	__property Cxgraphics::TcxGridLines GridLines = {read=FGridLines, write=SetGridLines, default=0};
	__property bool GroupByBox = {read=FGroupByBox, write=SetGroupByBox, default=1};
	__property TcxGridGroupFootersMode GroupFooters = {read=FGroupFooters, write=SetGroupFooters, default=0};
	__property int GroupRowHeight = {read=FGroupRowHeight, write=SetGroupRowHeight, default=0};
	__property bool Header = {read=FHeader, write=SetHeader, default=1};
	__property bool HeaderAutoHeight = {read=GetHeaderAutoHeight, write=SetHeaderAutoHeight, default=0};
	__property bool HeaderEndEllipsis = {read=GetHeaderEndEllipsis, write=SetHeaderEndEllipsis, default=0};
	__property int HeaderHeight = {read=FHeaderHeight, write=SetHeaderHeight, default=0};
	__property bool Indicator = {read=FIndicator, write=SetIndicator, default=0};
	__property int IndicatorWidth = {read=FIndicatorWidth, write=SetIndicatorWidth, default=12};
	__property bool NewItemRow = {read=FNewItemRow, write=SetNewItemRow, default=0};
	__property AnsiString NewItemRowInfoText = {read=FNewItemRowInfoText, write=SetNewItemRowInfoText, stored=IsNewItemRowInfoTextStored};
	__property Graphics::TColor NewItemRowSeparatorColor = {read=FNewItemRowSeparatorColor, write=SetNewItemRowSeparatorColor, default=536870912};
	__property int NewItemRowSeparatorWidth = {read=FNewItemRowSeparatorWidth, write=SetNewItemRowSeparatorWidth, default=6};
	__property Graphics::TColor RowSeparatorColor = {read=FRowSeparatorColor, write=SetRowSeparatorColor, default=536870912};
	__property int RowSeparatorWidth = {read=FRowSeparatorWidth, write=SetRowSeparatorWidth, default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridTableOptionsView(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TcxGridPreviewPlace { ppBottom, ppTop };
#pragma option pop

typedef TMetaClass*TcxGridPreviewClass;

class DELPHICLASS TcxGridPreview;
class PASCALIMPLEMENTATION TcxGridPreview : public Cxgridcustomview::TcxCustomGridOptions 
{
	typedef Cxgridcustomview::TcxCustomGridOptions inherited;
	
private:
	bool FAutoHeight;
	TcxGridColumn* FColumn;
	int FLeftIndent;
	int FMaxLineCount;
	TcxGridPreviewPlace FPlace;
	int FRightIndent;
	bool FVisible;
	bool __fastcall GetActive(void);
	void __fastcall SetAutoHeight(bool Value);
	void __fastcall SetColumn(TcxGridColumn* Value);
	void __fastcall SetLeftIndent(int Value);
	void __fastcall SetMaxLineCount(int Value);
	void __fastcall SetPlace(TcxGridPreviewPlace Value);
	void __fastcall SetRightIndent(int Value);
	void __fastcall SetVisible(bool Value);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation AOperation);
	void __fastcall SizeChanged(void);
	HIDESBASE TcxGridTableView* __fastcall GridView(void);
	
public:
	__fastcall virtual TcxGridPreview(Cxgridcustomview::TcxCustomGridView* AGridView);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property bool Active = {read=GetActive, nodefault};
	
__published:
	__property bool AutoHeight = {read=FAutoHeight, write=SetAutoHeight, default=1};
	__property TcxGridColumn* Column = {read=FColumn, write=SetColumn};
	__property int LeftIndent = {read=FLeftIndent, write=SetLeftIndent, default=20};
	__property int MaxLineCount = {read=FMaxLineCount, write=SetMaxLineCount, default=3};
	__property TcxGridPreviewPlace Place = {read=FPlace, write=SetPlace, default=0};
	__property int RightIndent = {read=FRightIndent, write=SetRightIndent, default=5};
	__property bool Visible = {read=FVisible, write=SetVisible, default=0};
public:
	#pragma option push -w-inl
	/* TcxCustomGridOptions.Destroy */ inline __fastcall virtual ~TcxGridPreview(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TcxGridGetGroupStyleEvent)(TcxGridTableView* Sender, Cxgridcustomtableview::TcxCustomGridRecord* ARecord, int ALevel, Cxstyles::TcxStyle* &AStyle);

class DELPHICLASS TcxGridTableViewStyles;
class PASCALIMPLEMENTATION TcxGridTableViewStyles : public Cxgridcustomtableview::TcxCustomGridTableViewStyles 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableViewStyles inherited;
	
private:
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetFooterStyle;
	TcxGridGetGroupStyleEvent FOnGetGroupStyle;
	TcxGridGetHeaderStyleEvent FOnGetHeaderStyle;
	Cxgridcustomtableview::TcxGridGetCellStyleEvent FOnGetPreviewStyle;
	HIDESBASE TcxGridTableView* __fastcall GetGridViewValue(void);
	
protected:
	virtual void __fastcall GetDefaultViewParams(int Index, void * AData, /* out */ Cxgraphics::TcxViewParams &AParams);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall GetContentParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetFooterParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, TcxGridColumn* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetGroupParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, int ALevel, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetHeaderParams(TcxGridColumn* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetPreviewParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	virtual void __fastcall GetRecordContentParams(Cxgridcustomtableview::TcxCustomGridRecord* ARecord, Cxgridcustomtableview::TcxCustomGridTableItem* AItem, /* out */ Cxgraphics::TcxViewParams &AParams);
	__property TcxGridTableView* GridView = {read=GetGridViewValue};
	
__published:
	__property Cxstyles::TcxStyle* FilterBox = {read=GetValue, write=SetValue, index=7};
	__property Cxstyles::TcxStyle* Footer = {read=GetValue, write=SetValue, index=8};
	__property Cxstyles::TcxStyle* Group = {read=GetValue, write=SetValue, index=9};
	__property Cxstyles::TcxStyle* GroupByBox = {read=GetValue, write=SetValue, index=10};
	__property Cxstyles::TcxStyle* Header = {read=GetValue, write=SetValue, index=11};
	__property Cxstyles::TcxStyle* Indicator = {read=GetValue, write=SetValue, index=13};
	__property Cxstyles::TcxStyle* NewItemRowInfoText = {read=GetValue, write=SetValue, index=12};
	__property Cxstyles::TcxStyle* Preview = {read=GetValue, write=SetValue, index=14};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetFooterStyle = {read=FOnGetFooterStyle, write=FOnGetFooterStyle};
	__property TcxGridGetGroupStyleEvent OnGetGroupStyle = {read=FOnGetGroupStyle, write=FOnGetGroupStyle};
	__property TcxGridGetHeaderStyleEvent OnGetHeaderStyle = {read=FOnGetHeaderStyle, write=FOnGetHeaderStyle};
	__property Cxgridcustomtableview::TcxGridGetCellStyleEvent OnGetPreviewStyle = {read=FOnGetPreviewStyle, write=FOnGetPreviewStyle};
public:
	#pragma option push -w-inl
	/* TcxCustomStyles.Create */ inline __fastcall virtual TcxGridTableViewStyles(Classes::TPersistent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableViewStyles(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyles.Destroy */ inline __fastcall virtual ~TcxGridTableViewStyles(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableViewStyleSheet;
class PASCALIMPLEMENTATION TcxGridTableViewStyleSheet : public Cxstyles::TcxCustomStyleSheet 
{
	typedef Cxstyles::TcxCustomStyleSheet inherited;
	
private:
	TcxGridTableViewStyles* __fastcall GetStylesValue(void);
	void __fastcall SetStylesValue(TcxGridTableViewStyles* Value);
	
public:
	/* virtual class method */ virtual TMetaClass* __fastcall GetStylesClass(TMetaClass* vmt);
	
__published:
	__property TcxGridTableViewStyles* Styles = {read=GetStylesValue, write=SetStylesValue};
public:
	#pragma option push -w-inl
	/* TcxCustomStyleSheet.Create */ inline __fastcall virtual TcxGridTableViewStyleSheet(Classes::TComponent* AOwner) : Cxstyles::TcxCustomStyleSheet(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TcxCustomStyleSheet.Destroy */ inline __fastcall virtual ~TcxGridTableViewStyleSheet(void) { }
	#pragma option pop
	
};


class DELPHICLASS TcxGridTableSummaryGroupItemLink;
class PASCALIMPLEMENTATION TcxGridTableSummaryGroupItemLink : public Cxcustomdata::TcxDataSummaryGroupItemLink 
{
	typedef Cxcustomdata::TcxDataSummaryGroupItemLink inherited;
	
private:
	TcxGridColumn* __fastcall GetColumn(void);
	void __fastcall SetColumn(TcxGridColumn* Value);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	AnsiString __fastcall GetObjectName();
	bool __fastcall GetProperties(Classes::TStrings* AProperties);
	void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	
__published:
	__property TcxGridColumn* Column = {read=GetColumn, write=SetColumn};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxGridTableSummaryGroupItemLink(Classes::TCollection* Collection) : Cxcustomdata::TcxDataSummaryGroupItemLink(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxGridTableSummaryGroupItemLink(void) { }
	#pragma option pop
	
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


class DELPHICLASS TcxGridTableSummaryItem;
class PASCALIMPLEMENTATION TcxGridTableSummaryItem : public Cxcustomdata::TcxDataSummaryItem 
{
	typedef Cxcustomdata::TcxDataSummaryItem inherited;
	
private:
	TcxGridColumn* __fastcall GetColumn(void);
	void __fastcall SetColumn(TcxGridColumn* Value);
	
protected:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	AnsiString __fastcall GetObjectName();
	bool __fastcall GetProperties(Classes::TStrings* AProperties);
	void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	
__published:
	__property TcxGridColumn* Column = {read=GetColumn, write=SetColumn};
public:
	#pragma option push -w-inl
	/* TCollectionItem.Create */ inline __fastcall virtual TcxGridTableSummaryItem(Classes::TCollection* Collection) : Cxcustomdata::TcxDataSummaryItem(Collection) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TcxGridTableSummaryItem(void) { }
	#pragma option pop
	
private:
	void *__IcxStoredObject;	/* Cxstorage::IcxStoredObject */
	
public:
	operator IcxStoredObject*(void) { return (IcxStoredObject*)&__IcxStoredObject; }
	
};


typedef void __fastcall (__closure *TcxGridColumnEvent)(TcxGridTableView* Sender, TcxGridColumn* AColumn);

typedef void __fastcall (__closure *TcxGridIndicatorCellCustomDrawEvent)(TcxGridTableView* Sender, Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridIndicatorItemViewInfo* AViewInfo, bool &ADone);

typedef void __fastcall (__closure *TcxGridPartCustomDrawBackgroundEvent)(TcxGridTableView* Sender, Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo, bool &ADone);

class PASCALIMPLEMENTATION TcxGridTableView : public Cxgridcustomtableview::TcxCustomGridTableView 
{
	typedef Cxgridcustomtableview::TcxCustomGridTableView inherited;
	
private:
	TcxGridPreview* FPreview;
	TcxGridColumnEvent FOnColumnHeaderClick;
	TcxGridColumnEvent FOnColumnPosChanged;
	TcxGridColumnEvent FOnColumnSizeChanged;
	TcxGridColumnCustomDrawHeaderEvent FOnCustomDrawColumnHeader;
	TcxGridColumnCustomDrawHeaderEvent FOnCustomDrawFooterCell;
	Cxgridcustomtableview::TcxGridTableCellCustomDrawEvent FOnCustomDrawGroupCell;
	TcxGridIndicatorCellCustomDrawEvent FOnCustomDrawIndicatorCell;
	TcxGridPartCustomDrawBackgroundEvent FOnCustomDrawPartBackground;
	Classes::TNotifyEvent FOnCustomization;
	Classes::TNotifyEvent FOnLeftPosChanged;
	HIDESBASE TcxGridTableBackgroundBitmaps* __fastcall GetBackgroundBitmaps(void);
	TcxGridColumn* __fastcall GetColumn(int Index);
	int __fastcall GetColumnCount(void);
	HIDESBASE TcxGridTableController* __fastcall GetController(void);
	TcxGridTableFiltering* __fastcall GetFiltering(void);
	TcxGridColumn* __fastcall GetGroupedColumn(int Index);
	int __fastcall GetGroupedColumnCount(void);
	TcxGridTableOptionsBehavior* __fastcall GetOptionsBehavior(void);
	TcxGridTableOptionsCustomize* __fastcall GetOptionsCustomize(void);
	TcxGridTableOptionsData* __fastcall GetOptionsData(void);
	HIDESBASE TcxGridTableOptionsSelection* __fastcall GetOptionsSelection(void);
	HIDESBASE TcxGridTableOptionsView* __fastcall GetOptionsView(void);
	HIDESBASE TcxGridTablePainter* __fastcall GetPainter(void);
	HIDESBASE TcxGridTableViewStyles* __fastcall GetStyles(void);
	HIDESBASE Cxgridviewdata::TcxGridViewData* __fastcall GetViewData(void);
	HIDESBASE TcxGridTableViewInfo* __fastcall GetViewInfo(void);
	TcxGridTableViewInfoCache* __fastcall GetViewInfoCache(void);
	TcxGridColumn* __fastcall GetVisibleColumn(int Index);
	int __fastcall GetVisibleColumnCount(void);
	HIDESBASE void __fastcall SetBackgroundBitmaps(TcxGridTableBackgroundBitmaps* Value);
	void __fastcall SetColumn(int Index, TcxGridColumn* Value);
	HIDESBASE void __fastcall SetFiltering(TcxGridTableFiltering* Value);
	HIDESBASE void __fastcall SetOptionsBehavior(TcxGridTableOptionsBehavior* Value);
	HIDESBASE void __fastcall SetOptionsCustomize(TcxGridTableOptionsCustomize* Value);
	HIDESBASE void __fastcall SetOptionsData(TcxGridTableOptionsData* Value);
	HIDESBASE void __fastcall SetOptionsSelection(TcxGridTableOptionsSelection* Value);
	HIDESBASE void __fastcall SetOptionsView(TcxGridTableOptionsView* Value);
	void __fastcall SetPreview(TcxGridPreview* Value);
	HIDESBASE void __fastcall SetStyles(TcxGridTableViewStyles* Value);
	
protected:
	virtual bool __fastcall GetProperties(Classes::TStrings* AProperties);
	virtual void __fastcall GetPropertyValue(const AnsiString AName, Variant &AValue);
	virtual void __fastcall SetPropertyValue(const AnsiString AName, const Variant &AValue);
	virtual void __fastcall CreateOptions(void);
	virtual void __fastcall DestroyOptions(void);
	virtual bool __fastcall CanOffset(int ARecordCountDelta);
	virtual bool __fastcall CanOffsetHorz(void);
	virtual void __fastcall DoAssign(Cxgridcustomview::TcxCustomGridView* ASource);
	virtual bool __fastcall GetIsControlFocused(void);
	virtual bool __fastcall GetResizeOnBoundsChange(void);
	bool __fastcall HasCustomDrawColumnHeader(void);
	bool __fastcall HasCustomDrawFooterCell(void);
	bool __fastcall HasCustomDrawGroupCell(void);
	bool __fastcall HasCustomDrawIndicatorCell(void);
	bool __fastcall HasCustomDrawPartBackground(void);
	virtual bool __fastcall IsEqualHeightRecords(void);
	virtual void __fastcall LookAndFeelChanged(void);
	virtual TMetaClass* __fastcall GetControllerClass(void);
	virtual TMetaClass* __fastcall GetDataControllerClass(void);
	virtual TMetaClass* __fastcall GetPainterClass(void);
	virtual TMetaClass* __fastcall GetViewDataClass(void);
	virtual TMetaClass* __fastcall GetViewInfoCacheClass(void);
	virtual TMetaClass* __fastcall GetViewInfoClass(void);
	virtual TMetaClass* __fastcall GetBackgroundBitmapsClass(void);
	virtual TMetaClass* __fastcall GetFilteringClass(void);
	virtual TMetaClass* __fastcall GetOptionsBehaviorClass(void);
	virtual TMetaClass* __fastcall GetOptionsCustomizeClass(void);
	virtual TMetaClass* __fastcall GetOptionsSelectionClass(void);
	virtual TMetaClass* __fastcall GetOptionsViewClass(void);
	virtual TMetaClass* __fastcall GetPreviewClass(void);
	virtual TMetaClass* __fastcall GetStylesClass(void);
	virtual TMetaClass* __fastcall GetSummaryGroupItemLinkClass(void);
	virtual TMetaClass* __fastcall GetSummaryItemClass(void);
	virtual TMetaClass* __fastcall GetItemClass(void);
	virtual void __fastcall ItemVisibilityChanged(Cxgridcustomtableview::TcxCustomGridTableItem* AItem, bool Value);
	virtual void __fastcall RemoveItem(Cxgridcustomtableview::TcxCustomGridTableItem* AItem);
	void __fastcall RefreshCustomizationForm(void);
	virtual void __fastcall DoColumnHeaderClick(TcxGridColumn* AColumn);
	virtual void __fastcall DoColumnPosChanged(TcxGridColumn* AColumn);
	virtual void __fastcall DoColumnSizeChanged(TcxGridColumn* AColumn);
	virtual void __fastcall DoCustomDrawColumnHeader(Cxgraphics::TcxCanvas* ACanvas, TcxGridColumnHeaderViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoCustomDrawFooterCell(Cxgraphics::TcxCanvas* ACanvas, TcxGridColumnHeaderViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoCustomDrawGroupCell(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomtableview::TcxGridTableCellViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoCustomDrawIndicatorCell(Cxgraphics::TcxCanvas* ACanvas, TcxCustomGridIndicatorItemViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoCustomDrawPartBackground(Cxgraphics::TcxCanvas* ACanvas, Cxgridcustomview::TcxCustomGridCellViewInfo* AViewInfo, bool &ADone);
	virtual void __fastcall DoCustomization(void);
	virtual void __fastcall DoLeftPosChanged(void);
	
public:
	__fastcall virtual ~TcxGridTableView(void);
	TcxGridColumn* __fastcall CreateColumn(void);
	/* virtual class method */ virtual bool __fastcall CanBeLookupList(TMetaClass* vmt);
	__property int ColumnCount = {read=GetColumnCount, nodefault};
	__property TcxGridColumn* Columns[int Index] = {read=GetColumn, write=SetColumn};
	__property TcxGridTableController* Controller = {read=GetController};
	__property int GroupedColumnCount = {read=GetGroupedColumnCount, nodefault};
	__property TcxGridColumn* GroupedColumns[int Index] = {read=GetGroupedColumn};
	__property TcxGridTablePainter* Painter = {read=GetPainter};
	__property Cxgridviewdata::TcxGridViewData* ViewData = {read=GetViewData};
	__property TcxGridTableViewInfo* ViewInfo = {read=GetViewInfo};
	__property TcxGridTableViewInfoCache* ViewInfoCache = {read=GetViewInfoCache};
	__property int VisibleColumnCount = {read=GetVisibleColumnCount, nodefault};
	__property TcxGridColumn* VisibleColumns[int Index] = {read=GetVisibleColumn};
	
__published:
	__property TcxGridTableBackgroundBitmaps* BackgroundBitmaps = {read=GetBackgroundBitmaps, write=SetBackgroundBitmaps};
	__property TcxGridTableFiltering* Filtering = {read=GetFiltering, write=SetFiltering};
	__property TcxGridTableOptionsBehavior* OptionsBehavior = {read=GetOptionsBehavior, write=SetOptionsBehavior};
	__property TcxGridTableOptionsCustomize* OptionsCustomize = {read=GetOptionsCustomize, write=SetOptionsCustomize};
	__property TcxGridTableOptionsData* OptionsData = {read=GetOptionsData, write=SetOptionsData};
	__property TcxGridTableOptionsSelection* OptionsSelection = {read=GetOptionsSelection, write=SetOptionsSelection};
	__property TcxGridTableOptionsView* OptionsView = {read=GetOptionsView, write=SetOptionsView};
	__property TcxGridPreview* Preview = {read=FPreview, write=SetPreview};
	__property TcxGridTableViewStyles* Styles = {read=GetStyles, write=SetStyles};
	__property TcxGridColumnEvent OnColumnHeaderClick = {read=FOnColumnHeaderClick, write=FOnColumnHeaderClick};
	__property TcxGridColumnEvent OnColumnPosChanged = {read=FOnColumnPosChanged, write=FOnColumnPosChanged};
	__property TcxGridColumnEvent OnColumnSizeChanged = {read=FOnColumnSizeChanged, write=FOnColumnSizeChanged};
	__property TcxGridColumnCustomDrawHeaderEvent OnCustomDrawColumnHeader = {read=FOnCustomDrawColumnHeader, write=FOnCustomDrawColumnHeader};
	__property TcxGridColumnCustomDrawHeaderEvent OnCustomDrawFooterCell = {read=FOnCustomDrawFooterCell, write=FOnCustomDrawFooterCell};
	__property Cxgridcustomtableview::TcxGridTableCellCustomDrawEvent OnCustomDrawGroupCell = {read=FOnCustomDrawGroupCell, write=FOnCustomDrawGroupCell};
	__property TcxGridIndicatorCellCustomDrawEvent OnCustomDrawIndicatorCell = {read=FOnCustomDrawIndicatorCell, write=FOnCustomDrawIndicatorCell};
	__property TcxGridPartCustomDrawBackgroundEvent OnCustomDrawPartBackground = {read=FOnCustomDrawPartBackground, write=FOnCustomDrawPartBackground};
	__property Classes::TNotifyEvent OnCustomization = {read=FOnCustomization, write=FOnCustomization};
	__property OnFilterControlDialogShow ;
	__property Classes::TNotifyEvent OnLeftPosChanged = {read=FOnLeftPosChanged, write=FOnLeftPosChanged};
public:
	#pragma option push -w-inl
	/* TcxCustomGridView.Create */ inline __fastcall virtual TcxGridTableView(Classes::TComponent* AOwner) : Cxgridcustomtableview::TcxCustomGridTableView(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TcxControlChildComponent.CreateEx */ inline __fastcall TcxGridTableView(Cxcontrols::TcxControl* AControl, bool AAssignOwner) : Cxgridcustomtableview::TcxCustomGridTableView(AControl, AAssignOwner) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Byte htGridBase = 0xc8;
static const Byte htGroupByBox = 0xc9;
static const Byte htColumnHeader = 0xca;
static const Byte htColumnHeaderHorzSizingEdge = 0xcb;
static const Byte htColumnHeaderFilterButton = 0xcc;
static const Byte htFooter = 0xcd;
static const Byte htFooterCell = 0xce;
static const Byte htGroupFooter = 0xcf;
static const Byte htGroupFooterCell = 0xd0;
static const Byte htFilter = 0xd1;
static const Byte htFilterActivateButton = 0xd2;
static const Byte htFilterCloseButton = 0xd3;
static const Byte htFilterCustomizeButton = 0xd4;
static const Byte htRowIndicator = 0xd5;
static const Byte htRowSizingEdge = 0xd6;
static const Byte htIndicator = 0xd7;
static const Byte htRowLevelIndent = 0xd8;
static const Byte htCustomizationForm = 0xd9;
static const Byte htHeader = 0xda;
static const Shortint ccNone = 0x0;
static const Shortint ccHeader = 0x1;
static const Shortint ccGroupByBox = 0x2;
static const Shortint ccCustomizationForm = 0x3;
static const Shortint ccFooter = 0x4;
static const Byte cxGridCustomizationFormDefaultWidth = 0xb4;
static const Word cxGridCustomizationFormDefaultHeight = 0x12c;
static const Shortint cxGridDefaultIndicatorWidth = 0xc;
static const Shortint cxGridDefaultNewItemRowSeparatorWidth = 0x6;
static const Shortint cxGridMinNewItemRowSeparatorWidth = 0x2;
static const Shortint cxGridTableFilterDefaultMaxDropDownCount = 0xf;
static const Shortint cxGridPreviewDefaultLeftIndent = 0x14;
static const Shortint cxGridPreviewDefaultMaxLineCount = 0x3;
static const Shortint cxGridPreviewDefaultRightIndent = 0x5;
static const Shortint cxGridHeaderSizingEdgeSize = 0x8;
static const Shortint cxGridRowSizingEdgeSize = 0x8;
static const Shortint isColumnFirst = 0x1;
static const Shortint isFooter = 0x1;
static const Shortint isHeader = 0x2;
static const Shortint isColumnLast = 0x2;
static const Shortint bbTableFirst = 0x2;
static const Shortint bbFilterBox = 0x2;
static const Shortint bbFooter = 0x3;
static const Shortint bbHeader = 0x4;
static const Shortint bbGroup = 0x5;
static const Shortint bbGroupByBox = 0x6;
static const Shortint bbIndicator = 0x7;
static const Shortint bbPreview = 0x8;
static const Shortint bbTableLast = 0x8;
static const Shortint vsTableFirst = 0x7;
static const Shortint vsFilterBox = 0x7;
static const Shortint vsFooter = 0x8;
static const Shortint vsGroup = 0x9;
static const Shortint vsGroupByBox = 0xa;
static const Shortint vsHeader = 0xb;
static const Shortint vsNewItemRowInfoText = 0xc;
static const Shortint vsIndicator = 0xd;
static const Shortint vsPreview = 0xe;
static const Shortint vsTableLast = 0xe;

}	/* namespace Cxgridtableview */
using namespace Cxgridtableview;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxGridTableView
