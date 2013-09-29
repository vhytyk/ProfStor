
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

unit cxDBCheckListBox;

interface

{$I cxExtEdVer.inc}

uses
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
  SysUtils, Classes, Controls, Graphics, StdCtrls, Forms,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxDB, cxDataUtils, cxEdit, cxDBEdit, cxVariants, cxCheckListBox;

type
  { TcxDBCheckListBox }
  TcxDBCheckListBox = class(TcxCustomCheckListBox)
  private
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    function GetDataBinding: TcxCustomDataBinding; override;
    procedure SetDataBinding(Value: TcxCustomDataBinding); override;
    class function GetDataBindingClass: TcxCustomDataBindingClass; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property DataBinding: TcxCustomDataBinding read GetDataBinding write SetDataBinding;
    property ReadOnly;
    property OnClickCheck;
    property AllowGrayed;
    property OnCustomMapStateToEditValue;
    property OnCustomMapEditValueToState;

    {cxListBox properties}
    property Align;
    property Anchors;
    property BiDiMode;
    property Columns;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Glyph;
    property GlyphCount;
    property Enabled;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property Items;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollWidth;
    property ShowHint;
    property Sorted;
    property Style;
    property TabOrder;
    property TabStop;
    property TabWidth;
    property Visible;
{$IFDEF DELPHI6}
    property AutoComplete;
{$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
  end;

implementation

type
  TcxCustomDBDataBindingAccess = class(TcxCustomDBDataBinding);

{ TcxDBCheckListBox }
constructor TcxDBCheckListBox.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
end;

function TcxDBCheckListBox.GetDataBinding: TcxCustomDataBinding;
begin
  Result := TcxDBDataBinding(inherited GetDataBinding);
end;

procedure TcxDBCheckListBox.SetDataBinding(Value: TcxCustomDataBinding);
begin
  inherited SetDataBinding(TcxDBDataBinding(Value));
end;

{$IFDEF VCL}
procedure TcxDBCheckListBox.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxCustomDBDataBindingAccess(DataBinding).DataLink);
end;
{$ENDIF}

class function TcxDBCheckListBox.GetDataBindingClass: TcxCustomDataBindingClass;
begin
  Result := TcxDBDataBinding;
end;
{ TcxDBCheckListBox }

end.
