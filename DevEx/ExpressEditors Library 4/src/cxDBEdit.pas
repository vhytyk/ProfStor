
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressEditors                                               }
{                                                                    }
{       Copyright (c) 1998-2003 Developer Express Inc.               }
{       ALL RIGHTS RESERVED                                          }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSEDITORS AND ALL                }
{   ACCOMPANYING VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY. }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

unit cxDBEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
  Classes, Controls, DB, DBCtrls, SysUtils, cxBlobEdit, cxButtonEdit, cxCalc,
  cxCalendar, cxCheckBox, cxClasses, cxContainer, cxCurrencyEdit, cxCustomData,
  cxDataUtils, cxDB, cxDropDownEdit, cxEdit, cxHyperLinkEdit, cxImage,
  cxImageComboBox, cxListBox, cxMaskEdit, cxMemo, cxMRUEdit, cxRadioGroup,
  cxSpinEdit, cxTextEdit, cxTimeEdit;

type
  TcxDBTextEdit = class;

  { TcxCustomDBEditDefaultValuesProvider }

  TcxCustomDBEditDefaultValuesProvider = class(TcxCustomEditDefaultValuesProvider)
  private
    FField: TField;
    FFreeNotifier: TcxFreeNotificator;
    procedure FieldFreeNotification(Sender: TComponent);
    procedure SetField(Value: TField);
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
    function DefaultAlignment: TAlignment; override;
    function DefaultBlobKind: TcxBlobKind; override;
    function DefaultCanModify: Boolean; override;
    function DefaultDisplayFormat: string; override;
    function DefaultEditMask: string; override;
    function DefaultIsFloatValue: Boolean; override;
    function DefaultMaxLength: Integer; override;
    function DefaultMaxValue: Double; override;
    function DefaultMinValue: Double; override;
    function DefaultReadOnly: Boolean; override;
    function DefaultRequired: Boolean; override;
    function HasDisplayValueFormatting: Boolean; override;
    function IsBlob: Boolean; override;
    function IsDBConnectionLive: Boolean; virtual;
    function IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean; override;
    function IsValidChar(AChar: Char): Boolean; override;
    property Field: TField read FField write SetField;
  end;

  { TcxDBFieldDataLink }

  TcxDBFieldDataLink = class(TcxCustomFieldDataLink)
  protected
    procedure FocusControl(Field: TFieldRef); override;
    procedure VisualControlChanged; override;
{$IFDEF VCL}
    procedure UpdateRightToLeft; override;
{$ENDIF}
  end;

  { TcxDBDataBinding }

  TcxDBDataBinding = class(TcxCustomDBDataBinding)
  protected
    function GetDataLinkClass: TcxCustomFieldDataLinkClass; override;
  published
    property DataSource;
    property DataField;
  end;

  { TcxEditFieldDataLink }

  TcxDBEditDataBinding = class;

  TcxEditFieldDataLink = class(TDataLink)
  private
    FDataBinding: TcxDBEditDataBinding;
    FField: TField;
    FFieldName: string;
    FControl: TComponent;
    FEditing: Boolean;
    FModified: Boolean;
    function GetCanModify: Boolean;
    procedure SetEditing(Value: Boolean);
    procedure SetField(Value: TField);
    procedure SetFieldName(const Value: string);
    procedure UpdateField;
{$IFDEF VCL}
    procedure UpdateRightToLeft;
{$ENDIF}
  protected
    procedure ActiveChanged; override;
    procedure DataEvent(Event: TDataEvent; Info: Longint); override;
    procedure EditingChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    constructor Create(ADataBinding: TcxDBEditDataBinding);
    function Edit: Boolean;
    procedure Modified;
    procedure Reset;
    property CanModify: Boolean read GetCanModify;
    property Control: TComponent read FControl write FControl;
    property Editing: Boolean read FEditing;
    property Field: TField read FField;
    property FieldName: string read FFieldName write SetFieldName;
  end;

  { TcxDBEditDataBinding }

  TcxDBEditDataBinding = class(TcxEditDataBinding)
  private
    FDataLink: TcxEditFieldDataLink;
    FRefreshCount: Integer;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetDefaultValuesProvider: TcxCustomDBEditDefaultValuesProvider;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
  protected
    function CanCheckEditorValue: Boolean; override;
    function CanSetEditMode: Boolean; override;
    procedure DefaultValuesChanged; override;
    procedure DisableRefresh;
    procedure EnableRefresh;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function GetStoredValue: TcxEditValue; override;
    function GetModified: Boolean; override;
    function IsDBConnectionLive: Boolean;
    function IsRefreshDisabled: Boolean;
    function IsTextEdit: Boolean; virtual;
    function IsTextEditInDesignMode: Boolean;
    procedure Reset; override;
    procedure SetDisplayValue(const Value: TcxEditValue); override;
    function SetEditMode: Boolean; override;
    procedure SetStoredValue(const Value: TcxEditValue); override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    procedure UpdateDisplayValue; override;
    procedure DataChanged; virtual;
    procedure DataSetChange; virtual;
    procedure UpdateData; virtual;
    property DefaultValuesProvider: TcxCustomDBEditDefaultValuesProvider read GetDefaultValuesProvider;
  public
    constructor Create(AEdit: TcxCustomEdit); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    class function GetDefaultValuesProviderClass: TcxCustomEditDefaultValuesProviderClass; override;
    procedure UpdateEdit; override;
    property DataLink: TcxEditFieldDataLink read FDataLink;
    property Field: TField read GetField;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

  { TcxDBTextEditDataBinding }

  TcxDBTextEditDataBinding = class(TcxDBEditDataBinding)
  protected
    function IsTextEdit: Boolean; override;
    procedure SetDisplayValue(const Value: TcxEditValue); override;
  public
    procedure UpdateEdit; override;
  end;

  { TcxDBTextEdit }

  TcxDBTextEdit = class(TcxCustomTextEdit)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBMemo }

  TcxDBMemo = class(TcxCustomMemo)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Align;
    property Anchors;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBMaskEdit }

  TcxDBMaskEdit = class(TcxCustomMaskEdit)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBButtonEdit }

  TcxDBButtonEdit = class(TcxCustomButtonEdit)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBCheckBox }

  TcxDBCheckBox = class(TcxCustomCheckBox)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property Checked;
    property State;
  published
    property Anchors;
    property AutoSize;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBComboBox }

  TcxDBComboBox = class(TcxCustomComboBox)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property ItemIndex;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBPopupEdit }

  TcxDBPopupEdit = class(TcxCustomPopupEdit)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBSpinEdit }

  TcxDBSpinEdit = class(TcxCustomSpinEdit)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property Value;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBTimeEdit }

  TcxDBTimeEdit = class(TcxCustomTimeEdit)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property Time;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBBlobEdit }

  TcxDBBlobEdit = class(TcxCustomBlobEdit)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBCalcEdit }

  TcxDBCalcEdit = class(TcxCustomCalcEdit)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property Value;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBDateEdit }

  TcxDBDateEdit = class(TcxCustomDateEdit)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property Date;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBCurrencyEdit }

  TcxDBCurrencyEdit = class(TcxCustomCurrencyEdit)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property Value;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBHyperLinkEdit }

  TcxDBHyperLinkEdit = class(TcxCustomHyperLinkEdit)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBImage }

  TcxDBImage = class(TcxCustomImage)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public  
    property Picture;
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property Properties;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBImageComboBox }

  TcxDBImageComboBox = class(TcxCustomImageComboBox)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property ItemIndex;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  { TcxDBMRUEdit }

  TcxDBMRUEdit = class(TcxCustomMRUEdit)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBTextEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding
      read GetDataBinding write SetDataBinding;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
{$ENDIF}
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ImeMode;
    property ImeName;
{$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF VCL}
    property BiDiMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBRadioGroup }

  TcxDBRadioGroup = class(TcxCustomRadioGroup)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Align;
    property Anchors;
    property Caption;
    property Constraints;
    property DataBinding: TcxDBEditDataBinding read GetDataBinding
      write SetDataBinding;
    property DragMode;
    property Enabled;
{$IFDEF VCL}
    property ParentBiDiMode;
{$ENDIF}
    property ParentColor;
{$IFDEF VCL}
    property ParentCtl3D;
{$ENDIF}
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFDEF VCL}
    property BiDiMode;
    property Ctl3D;
    property DragCursor;
    property DragKind;
{$ENDIF}
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  { TcxDBListBox }

  TcxDBListBox = class(TcxListBox)
  private
    function GetDataBinding: TcxDBDataBinding;
    procedure SetDataBinding(Value: TcxDBDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    function GetDataBindingClass: TcxCustomDataBindingClass; override;
  published
    property DataBinding: TcxDBDataBinding read GetDataBinding write SetDataBinding;
    property ReadOnly;
  end;

implementation

uses
  cxVariants;

type
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditPropertiesAccess = class(TcxCustomEditProperties);
  TcxCustomDBDataBindingAccess = class(TcxCustomDBDataBinding);

{ TcxCustomDBEditDefaultValuesProvider }

constructor TcxCustomDBEditDefaultValuesProvider.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FFreeNotifier := TcxFreeNotificator.Create(nil);
  FFreeNotifier.OnFreeNotification := FieldFreeNotification;
end;

destructor TcxCustomDBEditDefaultValuesProvider.Destroy;
begin
  FreeAndNil(FFreeNotifier);
  inherited Destroy;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultAlignment: TAlignment;
begin
  if IsDBConnectionLive then
    Result := Field.Alignment
  else
    Result := taLeftJustify;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultBlobKind: TcxBlobKind;
begin
  if IsDBConnectionLive then
    case Field.DataType of
      ftMemo, ftFmtMemo:
        Result := bkMemo;
      ftGraphic:
        Result := bkGraphic;
      ftParadoxOle, ftDBaseOle:
        Result := bkOle;
      else
        Result := bkNone;
    end
  else
    Result := bkNone;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultCanModify: Boolean;
begin
  Result := not DefaultReadOnly;
  Result := Result and (Field.CanModify or (Field.Lookup and CanModifyLookupField(Field)));
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultDisplayFormat: string;
begin
  if IsDBConnectionLive and (Field is TNumericField) then
    Result := TNumericField(Field).DisplayFormat
  else
    Result := '';
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultEditMask: string;
begin
  if IsDBConnectionLive then
    Result := Field.EditMask
  else
    Result := '';
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultIsFloatValue: Boolean;
begin
  if IsDBConnectionLive then
    Result := Field.DataType in [ftFloat, ftCurrency, ftBCD]
  else
    Result := False;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultMaxLength: Integer;
begin
  Result := 0;
  if IsDBConnectionLive and (Field.DataType in [ftString{$IFDEF DELPHI4}, ftWideString{$ENDIF}]) then
    Result := Field.Size;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultMaxValue: Double;
begin
  Result := 0;
  if IsDBConnectionLive then
  begin
    if Field is TIntegerField then
      Result := TIntegerField(Field).MaxValue
    else
      if Field is TFloatField then
      begin
        Result := StrToFloat(FloatToStrF(TFloatField(Field).MaxValue, ffGeneral,
          TFloatField(Field).Precision, TFloatField(Field).Precision));
      end
    else
      if Field is TBCDField then
        Result := TBCDField(Field).MaxValue;
  end;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultMinValue: Double;
begin
  Result := 0;
  if IsDBConnectionLive then
  begin
    if Field is TIntegerField then
      Result := TIntegerField(Field).MinValue
    else
      if Field is TFloatField then
      begin
        Result := StrToFloat(FloatToStrF(TFloatField(Field).MinValue, ffGeneral,
          TFloatField(Field).Precision, TFloatField(Field).Precision));
      end
    else
      if Field is TBCDField then
        Result := TBCDField(Field).MinValue;
  end;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultReadOnly: Boolean;
begin
  if IsDBConnectionLive then
    Result := Field.ReadOnly
  else
    Result := True;
end;

function TcxCustomDBEditDefaultValuesProvider.DefaultRequired: Boolean;
begin
  if IsDBConnectionLive then
    Result := Field.Required
  else
    Result := False;
end;

function TcxCustomDBEditDefaultValuesProvider.HasDisplayValueFormatting: Boolean;
begin
  Result := True;
end;

function TcxCustomDBEditDefaultValuesProvider.IsBlob: Boolean;
begin
  Result := IsDBConnectionLive and Field.IsBlob;
end;

function TcxCustomDBEditDefaultValuesProvider.IsDBConnectionLive: Boolean;
begin
  Result := (FField <> nil) and (FField.DataSet <> nil) and (FField.DataSet.State <> dsInactive);
end;

function TcxCustomDBEditDefaultValuesProvider.IsDisplayFormatDefined(AIsCurrencyValueAccepted: Boolean): Boolean;
begin
  Result := IsDBConnectionLive;
  if Result and not Assigned(Field.OnGetText) then
  begin
    Result := False;
    if Field is TFloatField then
      Result := Result or TFloatField(Field).Currency and AIsCurrencyValueAccepted;
    if Field is TBCDField then
      Result := Result or TBCDField(Field).Currency and AIsCurrencyValueAccepted;
    if Field is TDateTimeField then
      Result := Result or (TDateTimeField(Field).DisplayFormat <> '');
{$IFDEF DELPHI5}
    if Field is TAggregateField then
      with TAggregateField(Field) do
        Result := Result or (DisplayFormat <> '') or Currency and AIsCurrencyValueAccepted;
{$ENDIF}
{$IFDEF DELPHI6}
    if Field is TFMTBCDField then
      Result := Result or TFMTBCDField(Field).Currency and AIsCurrencyValueAccepted;
    if Field is TSQLTimeStampField then
      Result := Result or (TSQLTimeStampField(Field).DisplayFormat <> '');
{$ENDIF}
    if Field is TNumericField then
      Result := Result or (TNumericField(Field).DisplayFormat <> '');
  end;
end;

function TcxCustomDBEditDefaultValuesProvider.IsValidChar(AChar: Char): Boolean;
begin
  if IsDBConnectionLive then
    Result := Assigned(Field.OnGetText) or Field.IsValidChar(AChar)
  else
    Result := False;
end;

procedure TcxCustomDBEditDefaultValuesProvider.FieldFreeNotification(Sender: TComponent);
begin
  Field := nil;
end;

procedure TcxCustomDBEditDefaultValuesProvider.SetField(Value: TField);
begin
  if Value <> FField then
  begin
    if FField <> nil then
      FFreeNotifier.RemoveSender(FField);
    FField := Value;
    if FField <> nil then
      FFreeNotifier.AddSender(FField);
  end;
end;

{ TcxDBFieldDataLink }

procedure TcxDBFieldDataLink.FocusControl(Field: TFieldRef);
var
  AVisualControl: TComponent;
begin
  AVisualControl := DataBinding.VisualControl;
  if (Field^ <> nil) and (Field^ = Self.Field) and (AVisualControl is TWinControl) then
    if TWinControl(AVisualControl).CanFocus then
    begin
      Field^ := nil;
      TWinControl(AVisualControl).SetFocus;
    end;
end;

procedure TcxDBFieldDataLink.VisualControlChanged;
begin
  VisualControl := DataBinding.VisualControl is TWinControl;
end;

{$IFDEF VCL}
procedure TcxDBFieldDataLink.UpdateRightToLeft;
var
  AIsRightAligned: Boolean;
  AUseRightToLeftAlignment: Boolean;
  AVisualControl: TComponent;
begin
  AVisualControl := DataBinding.VisualControl;
  if AVisualControl is TWinControl then
    with AVisualControl as TWinControl do
      if IsRightToLeft then
      begin
        AIsRightAligned := (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_RIGHT) =
          WS_EX_RIGHT;
        AUseRightToLeftAlignment := DBUseRightToLeftAlignment(TControl(AVisualControl), Field);
        if AIsRightAligned and not AUseRightToLeftAlignment or
            not AIsRightAligned and AUseRightToLeftAlignment then
          Perform(CM_RECREATEWND, 0, 0);
      end;
end;
{$ENDIF}

{ TcxDBDataBinding }

function TcxDBDataBinding.GetDataLinkClass: TcxCustomFieldDataLinkClass;
begin
  Result := TcxDBFieldDataLink;
end;

{ TcxEditFieldDataLink }

constructor TcxEditFieldDataLink.Create;
begin
  inherited Create;
  VisualControl := True;
  FDataBinding := ADataBinding;
end;

function TcxEditFieldDataLink.Edit: Boolean;
begin
  if CanModify then
    inherited Edit;
  Result := FEditing;
end;

procedure TcxEditFieldDataLink.Modified;
begin
  FModified := True;
end;

procedure TcxEditFieldDataLink.Reset;
begin
  RecordChanged(nil);
end;

procedure TcxEditFieldDataLink.ActiveChanged;
begin
  UpdateField;
  FDataBinding.DataSetChange;
end;

procedure TcxEditFieldDataLink.DataEvent(Event: TDataEvent; Info: Longint);
begin
  if Event = deDataSetChange then
    UpdateField;
  inherited DataEvent(Event, Info);
  if Event = deDataSetChange then
    FDataBinding.DataSetChange;
end;

procedure TcxEditFieldDataLink.EditingChanged;
begin
  SetEditing(inherited Editing and CanModify);
end;

procedure TcxEditFieldDataLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FField) and (FControl is TWinControl) then
    if TWinControl(FControl).CanFocus then
    begin
      Field^ := nil;
      TWinControl(FControl).SetFocus;
    end;
end;

procedure TcxEditFieldDataLink.LayoutChanged;
begin
  UpdateField;
end;

procedure TcxEditFieldDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FField) then
  begin
    FDataBinding.DataChanged;
    if not FDataBinding.IsRefreshDisabled then
      FModified := False;
  end;
end;

procedure TcxEditFieldDataLink.UpdateData;
begin
  if FModified then
  begin
    if Field <> nil then
      FDataBinding.UpdateData;
    if not FDataBinding.IsRefreshDisabled then
      FModified := False;
  end;
end;

function TcxEditFieldDataLink.GetCanModify: Boolean;
begin
  Result := not ReadOnly and (Field <> nil) and (Field.CanModify or
    (Field.Lookup and CanModifyLookupField(Field)));
end;

procedure TcxEditFieldDataLink.SetEditing(Value: Boolean);
begin
  if FEditing <> Value then
  begin
    FEditing := Value;
    if not FDataBinding.IsRefreshDisabled then
      FModified := False;
  end;
end;

procedure TcxEditFieldDataLink.SetField(Value: TField);
begin
  if FField <> Value then
  begin
    FField := Value;
    FDataBinding.DefaultValuesChanged;
    EditingChanged;
    RecordChanged(nil);
{$IFDEF VCL}
    UpdateRightToLeft;
{$ENDIF}
  end;
end;

procedure TcxEditFieldDataLink.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName :=  Value;
    UpdateField;
  end;
end;

procedure TcxEditFieldDataLink.UpdateField;
begin
  if Active and (FFieldName <> '') then
  begin
    FField := nil;
    if Assigned(FControl) then
      SetField(GetFieldProperty(DataSource.DataSet, FControl, FFieldName))
    else
      SetField(DataSource.DataSet.FieldByName(FFieldName));
  end
  else
    SetField(nil);
end;

{$IFDEF VCL}
procedure TcxEditFieldDataLink.UpdateRightToLeft;
var
  IsRightAligned: Boolean;
  AUseRightToLeftAlignment: Boolean;
begin
  if Assigned(FControl) and (FControl is TWinControl) then
    with FControl as TWinControl do
      if IsRightToLeft then
      begin
        IsRightAligned :=
          (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_RIGHT) = WS_EX_RIGHT;
        AUseRightToLeftAlignment :=
          DBUseRightToLeftAlignment(TControl(FControl), Field);
        if (IsRightAligned and (not AUseRightToLeftAlignment)) or
           ((not IsRightAligned) and AUseRightToLeftAlignment) then
          Perform(CM_RECREATEWND, 0, 0);
      end;
end;
{$ENDIF}

{ TcxDBEditDataBinding }

constructor TcxDBEditDataBinding.Create(AEdit: TcxCustomEdit);

  procedure SetControlReplicatable(AControl: TControl);
  begin
    with AControl do
      ControlStyle := ControlStyle + [csReplicatable];
  end;

  procedure SetReplicatable(AControl: TControl);
  var
    I: Integer;
  begin
    SetControlReplicatable(AControl);
    if AControl is TWinControl then
      with AControl as TWinControl do
        for I := 0 to ControlCount - 1 do
          SetReplicatable(Controls[I]);
  end;

  procedure SetEditReplicatable;
  begin
    SetReplicatable(AEdit);
    with TcxCustomEditAccess(AEdit) do
      if NeedsScrollBars then
      begin
        SetControlReplicatable(HScrollBar);
        SetControlReplicatable(VScrollBar);
        SetControlReplicatable(SizeGrip);
      end;
  end;

begin
  inherited Create(AEdit);
  FDataLink := TcxEditFieldDataLink.Create(Self);
  with TcxCustomEditAccess(Edit) do
    if HasInnerEdit then
      FDataLink.Control := InnerEdit.Control
    else
      FDataLink.Control := Edit;
  SetEditReplicatable;
end;

destructor TcxDBEditDataBinding.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited Destroy;
end;

procedure TcxDBEditDataBinding.Assign(Source: TPersistent);
begin
  if Source is TcxDBTextEditDataBinding then
    with Source as TcxDBTextEditDataBinding do
    begin
      Self.DataField := DataField;
      Self.DataSource := DataSource;
      Self.DataChanged;
    end;
  inherited Assign(Source);
end;

class function TcxDBEditDataBinding.GetDefaultValuesProviderClass: TcxCustomEditDefaultValuesProviderClass;
begin
  Result := TcxCustomDBEditDefaultValuesProvider;
end;

function TcxDBEditDataBinding.CanCheckEditorValue: Boolean;
begin
  Result := False;
end;

function TcxDBEditDataBinding.CanSetEditMode: Boolean;
begin
  Result := (DataSource <> nil) and (DataSource.AutoEdit or
    (DataSource.State in [dsEdit, dsInsert]));
end;

procedure TcxDBEditDataBinding.DefaultValuesChanged;
begin
  DefaultValuesProvider.Field := Field;
  inherited DefaultValuesChanged;
end;

procedure TcxDBEditDataBinding.DisableRefresh;
begin
  Inc(FRefreshCount);
end;

procedure TcxDBEditDataBinding.EnableRefresh;
begin
  if FRefreshCount > 0 then
    Dec(FRefreshCount);
end;

function TcxDBEditDataBinding.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := FDataLink.ExecuteAction(Action);
end;

function TcxDBEditDataBinding.GetStoredValue: TcxEditValue;
var
  AEditValueSource: TcxDataEditValueSource;
begin
  if not IsDBConnectionLive then
    Result := Null
  else
  begin
    AEditValueSource := TcxCustomEditAccess(Edit).Properties.GetEditValueSource(Edit.InternalFocused);
    if Field.IsNull and (AEditValueSource <> evsText) then
      Result := Null
    else
      case AEditValueSource of
        evsKey:
          if Field.KeyFields <> '' then
            Result := Field.DataSet.FieldValues[Field.KeyFields]
          else
            Result := Field.Value;
        evsText:
          if Edit.Focused and FDataLink.CanModify then
            Result := Field.Text
          else
//          if Field.IsBlob then
//            Result := Field.AsString
//          else
            Result := Field.DisplayText;
        evsValue:
          Result := Field.Value;
      end;
  end;
end;

function TcxDBEditDataBinding.GetModified: Boolean;
begin
  Result := IsDBConnectionLive and FDataLink.Editing and FDataLink.FModified;
end;

function TcxDBEditDataBinding.IsDBConnectionLive: Boolean;
begin
  Result := FDataLink.Active and (FDataLink.Field <> nil);
end;

function TcxDBEditDataBinding.IsRefreshDisabled: Boolean;
begin
  Result := FRefreshCount > 0;
end;

function TcxDBEditDataBinding.IsTextEdit: Boolean;
begin
  Result := False;
end;

function TcxDBEditDataBinding.IsTextEditInDesignMode: Boolean;
begin
  Result := Edit.IsDesigning and (TcxCustomEditAccess(Edit).Properties.GetEditValueSource(False) = evsText);
end;

procedure TcxDBEditDataBinding.Reset;
begin
  if IsDBConnectionLive then
  begin
    FDataLink.Reset;
    Edit.SelectAll;
  end;
end;

procedure TcxDBEditDataBinding.SetDisplayValue(const Value: TcxEditValue);
begin
  if not IsTextEditInDesignMode then
    SetInternalDisplayValue(Value);
end;

function TcxDBEditDataBinding.SetEditMode: Boolean;
begin
  Result := IDefaultValuesProvider.DefaultCanModify;
  if not Result then
    Exit;

  DisableRefresh;
  try
    FDatalink.Edit;
    Result := FDatalink.Editing;
    if Result then
      FDatalink.Modified;
  finally
    EnableRefresh;
  end;
end;

procedure TcxDBEditDataBinding.SetStoredValue(const Value: TcxEditValue);

  procedure SetFieldValue(AField: TField; const AValue: TcxEditValue);
  begin
    if VarIsStr(AValue) and (AValue = '') and
        not(Field.DataType in [ftString{$IFDEF DELPHI4}, ftWideString{$ENDIF}]) then
      AField.Value := Null
    else
      AField.Value := AValue;
  end;

var
  AEditValueSource: TcxDataEditValueSource;
  AFieldList: TList;
  I: Integer;
begin
  if IsDBConnectionLive then
  begin
    DisableRefresh;
    try
      if FDataLink.Edit then
      begin
        AEditValueSource := TcxCustomEditAccess(Edit).Properties.GetEditValueSource(True(*Edit.InternalFocused*));
        if (*(*)AEditValueSource = evsText(*) or Assigned(Field.OnSetText)*) then
          Field.Text := VarToStr(Value)
        else
          if (AEditValueSource = evsKey) and (Field.KeyFields <> '') then
            if Pos(';', Field.KeyFields) = 0 then
              SetFieldValue(Field.DataSet.FieldByName(Field.KeyFields), Value)
            else
            begin
              AFieldList := TList.Create;
              try
                Field.DataSet.GetFieldList(AFieldList, Field.KeyFields);
                for I := 0 to AFieldList.Count - 1 do
                  SetFieldValue(TField(AFieldList[I]), Value[I]);
              finally
                AFieldList.Free;
              end;
              Field.DataSet.FieldValues[Field.KeyFields] := Value;
            end
          else
            SetFieldValue(Field, Value);
      end;
    finally
      EnableRefresh;
    end;
  end;
end;

function TcxDBEditDataBinding.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := FDataLink.UpdateAction(Action);
end;

procedure TcxDBEditDataBinding.UpdateDisplayValue;
begin
  if IsDBConnectionLive then
    FDataLink.Reset
  else
    inherited UpdateDisplayValue;
end;

procedure TcxDBEditDataBinding.UpdateEdit;
begin
  if not IsDBConnectionLive then
    TcxCustomEditAccess(Edit).EditValue := Null;
end;

procedure TcxDBEditDataBinding.DataChanged;
begin
  if IsRefreshDisabled then
    Exit;
  if IsTextEditInDesignMode and not IsDBConnectionLive then
    UpdateEdit
  else
    with TcxCustomEditAccess(Edit) do
    begin
      if TcxCustomEditPropertiesAccess(Properties).IsValueEditorWithValueFormatting then
      begin
        if not IsDBConnectionLive or Field.IsNull then
          FEditValue := Null
        else
          FEditValue := Field.Value;
        SetInternalDisplayValue(StoredValue);
      end
      else
        EditValue := StoredValue;
  end;
end;

procedure TcxDBEditDataBinding.DataSetChange;
begin
  DefaultValuesChanged;
end;

procedure TcxDBEditDataBinding.UpdateData;
begin
  if IsDBConnectionLive then
  begin
    if Edit.ValidateEdit(False) then
      StoredValue := Edit.EditValue;
  end;
end;

function TcxDBEditDataBinding.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TcxDBEditDataBinding.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TcxDBEditDataBinding.GetDefaultValuesProvider: TcxCustomDBEditDefaultValuesProvider;
begin
  Result := TcxCustomDBEditDefaultValuesProvider(IDefaultValuesProvider.GetInstance);
end;

function TcxDBEditDataBinding.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TcxDBEditDataBinding.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TcxDBEditDataBinding.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

{ TcxDBTextEditDataBinding }

procedure TcxDBTextEditDataBinding.UpdateEdit;
begin
  if not IsDBConnectionLive then
    DisplayValue := '';
end;

function TcxDBTextEditDataBinding.IsTextEdit: Boolean;
begin
  Result := True;
end;

procedure TcxDBTextEditDataBinding.SetDisplayValue(const Value: TcxEditValue);
begin
  with Edit do
  if Edit.IsDesigning then
    if IsDBConnectionLive then
      SetInternalDisplayValue(Value)
    else
      SetInternalDisplayValue(Edit.Name)
  else
    SetInternalDisplayValue(Value);
end;

{ TcxDBTextEdit }

class function TcxDBTextEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBTextEdit.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := FDataBinding as TcxDBTextEditDataBinding;
end;

procedure TcxDBTextEdit.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBTextEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBMemo }

class function TcxDBMemo.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBMemo.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := TcxDBTextEditDataBinding(FDataBinding);
end;

procedure TcxDBMemo.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBMemo.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBMaskEdit }

class function TcxDBMaskEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBMaskEdit.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := FDataBinding as TcxDBTextEditDataBinding;
end;

procedure TcxDBMaskEdit.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBMaskEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBButtonEdit }

class function TcxDBButtonEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBButtonEdit.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := FDataBinding as TcxDBTextEditDataBinding;
end;

procedure TcxDBButtonEdit.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBButtonEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBCheckBox }

class function TcxDBCheckBox.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

function TcxDBCheckBox.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBCheckBox.SetDataBinding(Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBCheckBox.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

{ TcxDBComboBox }

class function TcxDBComboBox.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBComboBox.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := TcxDBTextEditDataBinding(FDataBinding);
end;

procedure TcxDBComboBox.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBComboBox.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBPopupEdit }

class function TcxDBPopupEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBPopupEdit.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := TcxDBTextEditDataBinding(FDataBinding);
end;

procedure TcxDBPopupEdit.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBPopupEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBSpinEdit }

class function TcxDBSpinEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

function TcxDBSpinEdit.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBSpinEdit.SetDataBinding(Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBSpinEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

{ TcxDBTimeEdit }

class function TcxDBTimeEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

function TcxDBTimeEdit.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBTimeEdit.SetDataBinding(Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBTimeEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

{ TcxDBBlobEdit }

function TcxDBBlobEdit.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBBlobEdit.SetDataBinding(const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBBlobEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

class function TcxDBBlobEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

{ TcxDBCalcEdit }

function TcxDBCalcEdit.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBCalcEdit.SetDataBinding(
  const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBCalcEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

class function TcxDBCalcEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

{ TcxDBDateEdit }

function TcxDBDateEdit.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBDateEdit.SetDataBinding(
  const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBDateEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

class function TcxDBDateEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

{ TcxDBCurrencyEdit }

function TcxDBCurrencyEdit.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBCurrencyEdit.SetDataBinding(const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBCurrencyEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

class function TcxDBCurrencyEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

{ TcxDBHyperLinkEdit }

function TcxDBHyperLinkEdit.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := TcxDBTextEditDataBinding(FDataBinding);
end;

procedure TcxDBHyperLinkEdit.SetDataBinding(
  const Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBHyperLinkEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

class function TcxDBHyperLinkEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

{ TcxDBImage }

function TcxDBImage.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBImage.SetDataBinding(
  const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBImage.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

class function TcxDBImage.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

{ TcxDBImageComboBox }

function TcxDBImageComboBox.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBImageComboBox.SetDataBinding(
  const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBImageComboBox.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).FDataLink);
end;
{$ENDIF}

class function TcxDBImageComboBox.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

{ TcxDBMRUEdit }

function TcxDBMRUEdit.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := TcxDBTextEditDataBinding(FDataBinding);
end;

procedure TcxDBMRUEdit.SetDataBinding(const Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBMRUEdit.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

class function TcxDBMRUEdit.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

{ TcxDBRadioGroup }

class function TcxDBRadioGroup.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

function TcxDBRadioGroup.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBRadioGroup.SetDataBinding(const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBRadioGroup.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.FDataLink);
end;
{$ENDIF}

{ TcxDBListBox }

function TcxDBListBox.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxDBDataBinding;
end;

function TcxDBListBox.GetDataBinding: TcxDBDataBinding;
begin
  Result := TcxDBDataBinding(FDataBinding);
end;

procedure TcxDBListBox.SetDataBinding(Value: TcxDBDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBListBox.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(TcxCustomDBDataBindingAccess(FDataBinding).DataLink);
end;
{$ENDIF}

end.
