
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

unit cxDBLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, cxControls, StdCtrls,
  Forms, Dialogs, 
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxEdit, cxDBEdit, cxLabel;

{$I cxExtEdVer.inc}

type
  { TcxDBLabel }
  TcxDBLabel = class(TcxCustomLabel)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    function GetCaption: TCaption; override;
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
    procedure SynchronizeDisplayValue; override;
  published
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
    property Anchors;
    property AutoSize;
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
    property Visible;
{$IFDEF VCL}
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
{$ENDIF}
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

implementation

{ TcxDBLabel }
function TcxDBLabel.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBLabel.SetDataBinding(const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBLabel.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).DataLink);
end;
{$ENDIF}

class function TcxDBLabel.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;

function TcxDBLabel.GetCaption: TCaption;
begin
  if not Assigned(DataBinding) or not Assigned(DataBinding.DataLink) or
    not DataBinding.DataLink.Active or not Assigned(DataBinding.DataLink.Field)
  then
    Result := Self.Name
  else
    Result := inherited GetCaption;
end;

procedure TcxDBLabel.SynchronizeDisplayValue;
var
  Display: TcxEditValue;
begin
  if not Assigned(DataBinding) or not Assigned(DataBinding.DataLink) or
    not DataBinding.DataLink.Active or not Assigned(DataBinding.DataLink.Field)
  then
    Properties.PrepareDisplayValue(Self.Name, Display, Focused)
  else
    inherited;
end;
{ TcxDBLabel }

end.
