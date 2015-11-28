{
  Copyright (C) 2013-2015 Tim Sinaeve tim.sinaeve@gmail.com

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
}

{ Spring-compatible ILogAppender implementation for the TLogTree component. }

unit DDuce.Logging.Appenders.LogTree;

interface

uses
  Spring.Logging.Appenders.Base, Spring.Logging,

  DDuce.Components.LogTree;

type
  TLogTreeAppender = class(TLogAppenderBase, ILogAppender)
  private
    FLogTree : TLogTree;

  protected
    procedure DoSend(const entry: TLogEntry); override;

  public
    constructor Create(ALogTree: TLogTree);
    procedure BeforeDestruction; override;

  end;

implementation

uses
  Spring;

{ TLogTreeAppender }

{$REGION 'construction and destruction'}
constructor TLogTreeAppender.Create(ALogTree: TLogTree);
begin
  Guard.CheckNotNull(ALogTree, 'ALogTree');
  FLogTree := ALogTree;
  inherited Create;
end;

procedure TLogTreeAppender.BeforeDestruction;
begin
  FLogTree := nil;
  inherited BeforeDestruction;
end;
{$ENDREGION}

{$REGION 'protected methods'}
procedure TLogTreeAppender.DoSend(const entry: TLogEntry);
var
  LL : TLogLevel;
begin
  LL := llNone;
  case entry.EntryType of
    TLogEntryType.Text:
    begin
      case entry.Level of
        Spring.Logging.TLogLevel.Unknown: LL := llNone;
        Spring.Logging.TLogLevel.Trace: LL := llNone;
        Spring.Logging.TLogLevel.Debug: LL := llDebug;
        Spring.Logging.TLogLevel.Text: LL := llNone;
        Spring.Logging.TLogLevel.Info: LL := llInfo;
        Spring.Logging.TLogLevel.Warn: LL := llWarning;
        Spring.Logging.TLogLevel.Error: LL := llError;
        Spring.Logging.TLogLevel.Fatal: LL := llError;
      end;
    end;
    TLogEntryType.Value: LL := llInfo;
    TLogEntryType.CallStack: LL := llInfo;
    TLogEntryType.SerializedData: LL := llInfo;
    TLogEntryType.Entering: LL := llInfo;
    TLogEntryType.Leaving: LL := llInfo;
  end;
  FLogTree.Log(entry.Msg, LL, entry.TimeStamp);
end;
{$ENDREGION}

end.
