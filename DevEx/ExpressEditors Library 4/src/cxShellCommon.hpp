// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'cxShellCommon.pas' rev: 6.00

#ifndef cxShellCommonHPP
#define cxShellCommonHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SyncObjs.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <ComObj.hpp>	// Pascal unit
#include <ShellAPI.hpp>	// Pascal unit
#include <ShlObj.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <ActiveX.hpp>	// Pascal unit
#include <Ole2.hpp>	// Pascal unit
#include <MaskUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Cxshellcommon
{
//-- type declarations -------------------------------------------------------
typedef _ITEMIDLIST *ITEMIDLISTARRAY[536870911];

typedef Shlobj::PItemIDList *PITEMIDLISTARRAY;

#pragma option push -b-
enum TcxBrowseFolder { bfCustomPath, bfAltStartup, bfBitBucket, bfCommonDesktopDirectory, bfCommonDocuments, bfCommonFavorites, bfCommonPrograms, bfCommonStartMenu, bfCommonStartup, bfCommonTemplates, bfControls, bfDesktop, bfDesktopDirectory, bfDrives, bfPrinters, bfFavorites, bfFonts, bfHistory, bfMyMusic, bfMyPictures, bfNetHood, bfProfile, bfProgramFiles, bfPrograms, bfRecent, bfStartMenu, bfStartUp, bfTemplates };
#pragma option pop

#pragma option push -b-
enum TcxDropEffect { deCopy, deMove, deLink };
#pragma option pop

typedef Set<TcxDropEffect, deCopy, deLink>  TcxDropEffectSet;

__interface IcxDropSource;
typedef System::DelphiInterface<IcxDropSource> _di_IcxDropSource;
__interface INTERFACE_UUID("{FCCB8EC5-ABB4-4256-B34C-25E3805EA046}") IcxDropSource  : public IDropSource 
{
	
};

class DELPHICLASS TcxDropSource;
class PASCALIMPLEMENTATION TcxDropSource : public System::TInterfacedObject 
{
	typedef System::TInterfacedObject inherited;
	
private:
	Controls::TWinControl* FOwner;
	
protected:
	HRESULT __stdcall QueryContinueDrag(BOOL fEscapePressed, int grfKeyState);
	HRESULT __stdcall GiveFeedback(int dwEffect);
	
public:
	__fastcall virtual TcxDropSource(Controls::TWinControl* AOwner);
	__property Controls::TWinControl* Owner = {read=FOwner};
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TcxDropSource(void) { }
	#pragma option pop
	
private:
	void *__IcxDropSource;	/* Cxshellcommon::IcxDropSource */
	
public:
	operator IcxDropSource*(void) { return (IcxDropSource*)&__IcxDropSource; }
	
};


class DELPHICLASS TcxShellOptions;
class PASCALIMPLEMENTATION TcxShellOptions : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FContextMenus;
	bool FShowFolders;
	bool FShowToolTip;
	bool FShowNonFolders;
	bool FShowHidden;
	bool FTrackShellChanges;
	bool FAutoBrowseFolder;
	Controls::TWinControl* FOwner;
	void __fastcall SetShowFolders(const bool Value);
	void __fastcall SetShowHidden(const bool Value);
	void __fastcall SetShowNonFolders(const bool Value);
	void __fastcall NotifyUpdateContents(void);
	
public:
	__fastcall virtual TcxShellOptions(Controls::TWinControl* AOwner);
	unsigned __fastcall GetEnumFlags(void);
	__property Controls::TWinControl* Owner = {read=FOwner};
	
__published:
	__property bool ShowFolders = {read=FShowFolders, write=SetShowFolders, default=1};
	__property bool ShowNonFolders = {read=FShowNonFolders, write=SetShowNonFolders, default=1};
	__property bool ShowHidden = {read=FShowHidden, write=SetShowHidden, default=0};
	__property bool ContextMenus = {read=FContextMenus, write=FContextMenus, default=1};
	__property bool TrackShellChanges = {read=FTrackShellChanges, write=FTrackShellChanges, default=1};
	__property bool ShowToolTip = {read=FShowToolTip, write=FShowToolTip, default=0};
	__property bool AutoBrowseFolder = {read=FAutoBrowseFolder, write=FAutoBrowseFolder, default=1};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxShellOptions(void) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TcxDetailItem
{
	AnsiString Text;
	int Width;
	Classes::TAlignment Alignment;
	int ID;
} ;
#pragma pack(pop)

class DELPHICLASS TcxCustomItemProducer;
class DELPHICLASS TcxShellDetails;
typedef TcxDetailItem *PcxDetailItem;

class PASCALIMPLEMENTATION TcxShellDetails : public System::TObject 
{
	typedef System::TObject inherited;
	
public:
	PcxDetailItem operator[](int Index) { return Item[Index]; }
	
private:
	Classes::TList* FItems;
	PcxDetailItem __fastcall GetItems(int Index);
	int __fastcall GetCount(void);
	
protected:
	__property Classes::TList* Items = {read=FItems};
	
public:
	__fastcall TcxShellDetails(void);
	__fastcall virtual ~TcxShellDetails(void);
	void __fastcall ProcessDetails(int CharWidth, _di_IShellFolder ShellFolder, bool FileSystem);
	void __fastcall Clear(void);
	PcxDetailItem __fastcall Add(void);
	void __fastcall Remove(PcxDetailItem Item);
	__property PcxDetailItem Item[int Index] = {read=GetItems/*, default*/};
	__property int Count = {read=GetCount, nodefault};
};


class DELPHICLASS TcxShellItemInfo;
typedef TcxShellItemInfo* *PcxShellItemInfo;

class PASCALIMPLEMENTATION TcxCustomItemProducer : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FItems;
	Sysutils::TMultiReadExclusiveWriteSynchronizer* FItemsLock;
	_di_IShellFolder FShellFolder;
	Controls::TWinControl* FOwner;
	_ITEMIDLIST *FFolderPidl;
	unsigned FThreadHandle;
	unsigned FStopThreadEvent;
	unsigned FThreadStopped;
	TcxShellDetails* FDetails;
	bool FIsClearQueue;
	
protected:
	void __fastcall ThreadMethod(void);
	void __fastcall FetchItems(int cPreloadItems);
	virtual unsigned __fastcall GetEnumFlags(void) = 0 ;
	virtual bool __fastcall AllowBackgroundProcessing(void) = 0 ;
	virtual bool __fastcall GetShowToolTip(void) = 0 ;
	virtual void __fastcall InitializeItem(TcxShellItemInfo* Item);
	virtual void __fastcall CheckForSubitems(TcxShellItemInfo* Item);
	void __fastcall ClearFetchQueue(void);
	__property unsigned ThreadHandle = {read=FThreadHandle, write=FThreadHandle, nodefault};
	__property unsigned StopThreadEvent = {read=FStopThreadEvent, write=FStopThreadEvent, nodefault};
	__property unsigned ThreadStopped = {read=FThreadStopped, write=FThreadStopped, nodefault};
	__property Sysutils::TMultiReadExclusiveWriteSynchronizer* ItemsLock = {read=FItemsLock};
	__property _di_IShellFolder ShellFolder = {read=FShellFolder};
	__property Shlobj::PItemIDList FolderPidl = {read=FFolderPidl};
	__property Controls::TWinControl* Owner = {read=FOwner};
	__property bool IsClearQueue = {read=FIsClearQueue, write=FIsClearQueue, nodefault};
	
public:
	__fastcall virtual TcxCustomItemProducer(Controls::TWinControl* AOwner);
	__fastcall virtual ~TcxCustomItemProducer(void);
	virtual void __fastcall ProcessItems(_di_IShellFolder Folder, Shlobj::PItemIDList apidl, int cPreloadItems);
	virtual void __fastcall ProcessDetails(_di_IShellFolder ShellFolder, int CharWidth);
	void __fastcall FetchRequest(int Index, bool Priority = false);
	void __fastcall ClearItems(void);
	void __fastcall LockRead(void);
	void __fastcall LockWrite(void);
	void __fastcall UnlockRead(void);
	void __fastcall UnlockWrite(void);
	void __fastcall CreateProcessingThread(void);
	void __fastcall DestroyProcessingThread(void);
	virtual void __fastcall SetItemsCount(int Count);
	virtual void __fastcall NotifyUpdateItem(int Index);
	virtual void __fastcall NotifyRemoveItem(int Index);
	virtual void __fastcall NotifyAddItem(int Index);
	void __fastcall DoGetInfoTip(HWND Handle, int ItemIndex, char * InfoTip, int cch);
	PcxShellItemInfo __fastcall GetItemByPidl(Shlobj::PItemIDList apidl);
	int __fastcall GetItemIndexByPidl(Shlobj::PItemIDList apidl);
	__property Classes::TList* Items = {read=FItems};
	__property TcxShellDetails* Details = {read=FDetails};
};


#pragma pack(push, 4)
struct TcxRequestItem
{
	int ItemIndex;
	TcxCustomItemProducer* ItemProducer;
	bool Locked;
} ;
#pragma pack(pop)

typedef TcxRequestItem *PcxRequestItem;

class DELPHICLASS TcxCustomShellRoot;
class PASCALIMPLEMENTATION TcxCustomShellRoot : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TcxBrowseFolder FBrowseFolder;
	WideString FCustomPath;
	Classes::TPersistent* FOwner;
	HWND FParentWindow;
	bool FValid;
	_di_IShellFolder FShellFolder;
	_ITEMIDLIST *FPidl;
	unsigned FAttributes;
	void __fastcall SetBrowseFolder(const TcxBrowseFolder Value);
	void __fastcall SetCustomPath(const WideString Value);
	void __fastcall SetPidl(const Shlobj::PItemIDList Value);
	WideString __fastcall GetCurrentPath();
	
protected:
	virtual void __fastcall CheckRoot(void);
	virtual void __fastcall RootUpdated(void) = 0 ;
	__property Classes::TPersistent* Owner = {read=FOwner};
	__property HWND ParentWindow = {read=FParentWindow, nodefault};
	
public:
	__fastcall virtual TcxCustomShellRoot(Classes::TPersistent* AOwner, HWND AParentWindow);
	__fastcall virtual ~TcxCustomShellRoot(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property bool IsValid = {read=FValid, nodefault};
	__property _di_IShellFolder ShellFolder = {read=FShellFolder};
	__property Shlobj::PItemIDList Pidl = {read=FPidl, write=SetPidl};
	__property WideString CurrentPath = {read=GetCurrentPath};
	__property unsigned Attributes = {read=FAttributes, nodefault};
	
__published:
	__property TcxBrowseFolder BrowseFolder = {read=FBrowseFolder, write=SetBrowseFolder, nodefault};
	__property WideString CustomPath = {read=FCustomPath, write=SetCustomPath};
};


typedef void __fastcall (__closure *TcxRootChangedEvent)(System::TObject* Sender, TcxCustomShellRoot* Root);

class PASCALIMPLEMENTATION TcxShellItemInfo : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FUpdated;
	_ITEMIDLIST *Fpidl;
	WideString FInfoTip;
	WideString FName;
	int FIconIndex;
	bool FIsFolder;
	bool FIsFilesystem;
	bool FHasSubfolder;
	bool FIsDropTarget;
	bool FCanRename;
	int FOpenIconIndex;
	Classes::TStrings* FDetails;
	bool FIsGhosted;
	bool FIsShare;
	bool FIsLink;
	bool FInitialized;
	bool FUpdating;
	bool FIsRemovable;
	
protected:
	__property bool Updating = {read=FUpdating, write=FUpdating, nodefault};
	
public:
	__fastcall virtual TcxShellItemInfo(_di_IShellFolder OwnerFolder, Shlobj::PItemIDList apidl, bool Fast);
	__fastcall virtual ~TcxShellItemInfo(void);
	void __fastcall CheckUpdate(_di_IShellFolder ShellFolder, Shlobj::PItemIDList FolderPidl, bool Fast);
	void __fastcall CheckInitialize(_di_IShellFolder ShellFolder, Shlobj::PItemIDList apidl);
	void __fastcall FetchDetails(HWND wnd, _di_IShellFolder ShellFolder, TcxShellDetails* DetailsMap);
	void __fastcall DisplayContextMenu(HWND wnd, _di_IShellFolder ShellFolder, const Types::TPoint &Pos);
	void __fastcall CheckSubitems(_di_IShellFolder ShellFolder, unsigned EnumSettings);
	void __fastcall SetNewPidl(_di_IShellFolder pFolder, Shlobj::PItemIDList FolderPidl, Shlobj::PItemIDList apidl);
	__property WideString Name = {read=FName};
	__property Shlobj::PItemIDList pidl = {read=Fpidl};
	__property int IconIndex = {read=FIconIndex, nodefault};
	__property int OpenIconIndex = {read=FOpenIconIndex, nodefault};
	__property WideString InfoTip = {read=FInfoTip};
	__property bool IsFolder = {read=FIsFolder, nodefault};
	__property bool IsFilesystem = {read=FIsFilesystem, nodefault};
	__property bool IsGhosted = {read=FIsGhosted, nodefault};
	__property bool IsLink = {read=FIsLink, nodefault};
	__property bool IsRemovable = {read=FIsRemovable, nodefault};
	__property bool IsShare = {read=FIsShare, nodefault};
	__property bool HasSubfolder = {read=FHasSubfolder, nodefault};
	__property bool IsDropTarget = {read=FIsDropTarget, nodefault};
	__property bool CanRename = {read=FCanRename, nodefault};
	__property Classes::TStrings* Details = {read=FDetails};
	__property bool Updated = {read=FUpdated, write=FUpdated, nodefault};
	__property bool Initialized = {read=FInitialized, nodefault};
};


class DELPHICLASS TFetchThreadContext;
class PASCALIMPLEMENTATION TFetchThreadContext : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	int FThreadID;
	unsigned FEvents[2];
	bool FIsWorking;
	Syncobjs::TCriticalSection* FcsThreadContext;
	unsigned FFetchThreadTerminated;
	TcxRequestItem *FItem;
	unsigned FhThread;
	void __fastcall SetIsWorking(const bool Value);
	bool __fastcall GetIsWorking(void);
	PcxRequestItem __fastcall GetItem(void);
	void __fastcall SetItem(const PcxRequestItem Value);
	
public:
	__fastcall virtual TFetchThreadContext(int AThreadID);
	__fastcall virtual ~TFetchThreadContext(void);
	bool __fastcall AskForProcessing(PcxRequestItem RequestItem);
	__property int ThreadID = {read=FThreadID, write=FThreadID, nodefault};
	__property unsigned hThread = {read=FhThread, write=FhThread, nodefault};
	__property unsigned NotifyThreadEvent = {read=FEvents[2], write=FEvents[2], nodefault};
	__property unsigned StopThreadEvent = {read=FEvents[3], write=FEvents[3], nodefault};
	__property unsigned FetchThreadTerminated = {read=FFetchThreadTerminated, write=FFetchThreadTerminated, nodefault};
	__property bool IsWorking = {read=GetIsWorking, write=SetIsWorking, nodefault};
	__property PcxRequestItem Item = {read=GetItem, write=SetItem};
};


typedef TFetchThreadContext* *PFetchThreadContext;

class DELPHICLASS TcxDragDropSettings;
class PASCALIMPLEMENTATION TcxDragDropSettings : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FAllowDragObjects;
	TcxDropEffect FDefaultDropEffect;
	TcxDropEffectSet FDropEffect;
	bool FScroll;
	unsigned __fastcall GetDropEffectApi(void);
	int __fastcall GetDefaultDropEffectAPI(void);
	
public:
	__property unsigned DropEffectAPI = {read=GetDropEffectApi, nodefault};
	__property int DefaultDropEffectAPI = {read=GetDefaultDropEffectAPI, nodefault};
	__fastcall TcxDragDropSettings(void);
	
__published:
	__property bool AllowDragObjects = {read=FAllowDragObjects, write=FAllowDragObjects, nodefault};
	__property TcxDropEffectSet DropEffect = {read=FDropEffect, write=FDropEffect, nodefault};
	__property bool Scroll = {read=FScroll, write=FScroll, nodefault};
	__property TcxDropEffect DefaultDropEffect = {read=FDefaultDropEffect, write=FDefaultDropEffect, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TcxDragDropSettings(void) { }
	#pragma option pop
	
};


#pragma pack(push, 1)
struct TShChangeNotifyEntry
{
	_ITEMIDLIST *pidlPath;
	BOOL bWatchSubtree;
} ;
#pragma pack(pop)

#pragma pack(push, 4)
struct DWORDITEMID
{
	short cb;
	unsigned dwItem1;
	unsigned dwItem2;
} ;
#pragma pack(pop)

typedef DWORDITEMID *PDWORDITEMID;

typedef TShChangeNotifyEntry *PShChangeNotifyEntry;

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::ResourceString _SShellDefaultNameStr;
#define Cxshellcommon_SShellDefaultNameStr System::LoadResourceString(&Cxshellcommon::_SShellDefaultNameStr)
extern PACKAGE System::ResourceString _SShellDefaultSizeStr;
#define Cxshellcommon_SShellDefaultSizeStr System::LoadResourceString(&Cxshellcommon::_SShellDefaultSizeStr)
extern PACKAGE System::ResourceString _SShellDefaultTypeStr;
#define Cxshellcommon_SShellDefaultTypeStr System::LoadResourceString(&Cxshellcommon::_SShellDefaultTypeStr)
extern PACKAGE System::ResourceString _SShellDefaultModifiedStr;
#define Cxshellcommon_SShellDefaultModifiedStr System::LoadResourceString(&Cxshellcommon::_SShellDefaultModifiedStr)
static const Word DSM_SETCOUNT = 0xb13b;
static const Word DSM_NOTIFYUPDATE = 0xb13c;
static const Word DSM_NOTIFYREMOVEITEM = 0xb13e;
static const Word DSM_NOTIFYADDITEM = 0xb13f;
static const Word DSM_NOTIFYUPDATECONTENTS = 0xb140;
static const Word DSM_SHELLCHANGENOTIFY = 0xb141;
static const Word DSM_DONAVIGATE = 0xb142;
static const Shortint PRELOAD_ITEMS_COUNT = 0xa;
static const Shortint SHCNF_ACCEPT_INTERRUPTS = 0x1;
static const Shortint SHCNF_ACCEPT_NON_INTERRUPTS = 0x2;
static const Word SHCNF_NO_PROXY = 0x8000;
extern PACKAGE _di_IMalloc cxMalloc;
extern PACKAGE unsigned hShell32;
extern PACKAGE unsigned __stdcall (*SHChangeNotifyRegister)(HWND hwnd, unsigned dwFlags, unsigned wEventMask, unsigned uMsg, unsigned cItems, PShChangeNotifyEntry lpItems);
extern PACKAGE bool __stdcall (*SHChangeNotifyUnregister)(unsigned hNotify);
extern PACKAGE unsigned FetchManagerHandle;
extern PACKAGE Classes::TThreadList* FetchThreads;
extern PACKAGE Classes::TThreadList* FetchQueue;
extern PACKAGE unsigned FetchEvents[2];
extern PACKAGE int MaxFetchThreadsCount;
extern PACKAGE WideString __fastcall GetTextFromStrRet(_STRRET &Str, Shlobj::PItemIDList PIDL);
extern PACKAGE HRESULT __fastcall GetShellDetails(_di_IShellFolder pFolder, Shlobj::PItemIDList pidl, /* out */ Shlobj::_di_IShellDetails &sd);
extern PACKAGE System::TDateTime __fastcall cxFileTimeToDateTime(const _FILETIME &fTime);
extern PACKAGE WideString __fastcall UpperCaseW(WideString Source);
extern PACKAGE WideString __fastcall LowerCaseW(WideString Source);
extern PACKAGE unsigned __fastcall StrLenW(wchar_t * Source);
extern PACKAGE WideString __fastcall StrPasW(wchar_t * Source);
extern PACKAGE void __fastcall StrPLCopyW(wchar_t * Dest, WideString Source, unsigned MaxLen);
extern PACKAGE Shlobj::PItemIDList __fastcall GetPidlParent(Shlobj::PItemIDList pidl);
extern PACKAGE Shlobj::PItemIDList __fastcall CreateEmptyPidl(void);
extern PACKAGE Shlobj::PItemIDList __fastcall CreatePidlListFromList(Classes::TList* List);
extern PACKAGE Shlobj::PItemIDList __fastcall ExtractParticularPidl(Shlobj::PItemIDList pidl);
extern PACKAGE Shlobj::PItemIDList __fastcall ConcatenatePidls(Shlobj::PItemIDList pidl1, Shlobj::PItemIDList pidl2);
extern PACKAGE WideString __fastcall GetPidlName(Shlobj::PItemIDList pidl);
extern PACKAGE Shlobj::PItemIDList __fastcall GetLastPidlItem(Shlobj::PItemIDList pidl);
extern PACKAGE void __fastcall DisposePidl(Shlobj::PItemIDList pidl);
extern PACKAGE Shlobj::PItemIDList __fastcall GetPidlCopy(Shlobj::PItemIDList pidl);
extern PACKAGE int __fastcall GetPidlItemsCount(Shlobj::PItemIDList pidl);
extern PACKAGE int __fastcall GetPidlSize(Shlobj::PItemIDList pidl);
extern PACKAGE Shlobj::PItemIDList __fastcall GetNextItemID(Shlobj::PItemIDList pidl);
extern PACKAGE PcxRequestItem __fastcall GetQueueItem(TcxCustomItemProducer* Producer, Classes::TList* List, int &Index);
extern PACKAGE PFetchThreadContext __fastcall TryAddFetchThread(void);

}	/* namespace Cxshellcommon */
using namespace Cxshellcommon;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// cxShellCommon
