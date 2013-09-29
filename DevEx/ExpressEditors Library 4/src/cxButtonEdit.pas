
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

unit cxButtonEdit;

interface

uses
  Classes, cxContainer, cxEdit, cxMaskEdit;

type
  { TcxCustomButtonEditProperties }

  TcxCustomButtonEditProperties = class(TcxCustomMaskEditProperties)
  public
    constructor Create(AOwner: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
  end;

  { TcxButtonEditProperties }

  TcxButtonEditProperties = class(TcxCustomButtonEditProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property Buttons;
    property CaseInsensitive;
    property CharCase;
    property ClickKey;
    property EchoMode;
    property HideCursor;
    property HideSelection;
    property IgnoreMaskBlank;
    property LookupItems;
    property LookupItemsSorted;
    property MaskKind;
    property EditMask;
    property MaxLength;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property OnButtonClick;
    property OnChange;
    property OnEditValueChanged;
    property OnNewLookupDisplayText;
    property OnValidate;
  end;

  { TcxCustomButtonEdit }

  TcxCustomButtonEdit = class(TcxCustomMaskEdit)
  private
    function GetProperties: TcxButtonEditProperties;
    procedure SetProperties(Value: TcxButtonEditProperties);
  protected
    property Properties: TcxButtonEditProperties read GetProperties write SetProperties;
  public
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
  end;

  { TcxButtonEdit }

  TcxButtonEdit = class(TcxCustomButtonEdit)
  published
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DragMode;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
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

implementation

uses
  cxEditConsts;

{ TcxCustomButtonEditProperties }

constructor TcxCustomButtonEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  Buttons.Add;
  Buttons[0].Kind := bkEllipsis;
end;

class function TcxCustomButtonEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxButtonEdit;
end;

{ TcxCustomButtonEdit }

class function TcxCustomButtonEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxButtonEditProperties;
end;

class function TcxCustomButtonEdit.GetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := [svPopupBorderStyle];
end;

function TcxCustomButtonEdit.GetProperties: TcxButtonEditProperties;
begin
  Result := TcxButtonEditProperties(InternalGetProperties);
end;

procedure TcxCustomButtonEdit.SetProperties(Value: TcxButtonEditProperties);
begin
  FProperties.Assign(Value);
end;

initialization
  GetRegisteredEditProperties.Register(TcxButtonEditProperties, scxSEditRepositoryButtonItem);

end.
