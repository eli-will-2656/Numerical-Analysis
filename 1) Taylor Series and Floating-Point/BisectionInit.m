function varargout = BisectionInit(varargin)
% BISECTIONINIT Application M-file for BisectionInit.fig
%    FIG = BISECTIONINIT launch BisectionInit GUI.
%    BISECTIONINIT('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 20-Jun-2002 13:24:04

if isstruct(varargin{1})   % LAUNCH GUI - Check to make sure that first variable is a structure

	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);
   
    set(handles.CloseBisectionInit,'UserData','open')
    % Use WAITFOR to have the GUI 'pause' until the userdata property is changed to 'close'
    waitfor(handles.CloseBisectionInit,'UserData','close')
	if nargout > 0
        % Use the UserData property of particular UICONTROLs to store information 
        % and save the info to the handles structure.
        % Save the new structure to the application data of the figure
          dataIn_a = get(handles.LeftHandEdit, 'UserData');
          dataIn_b = get(handles.RightHandEdit, 'UserData');
          handles.dataIn_a = dataIn_a;
          handles.dataIn_b = dataIn_b;
          guidata(fig, handles);
          varargout{1} = handles;
          delete(fig);
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
	catch
		disp(lasterr);
	end

end


% --------------------------------------------------------------------
function varargout = LeftHandEdit_Callback(h, eventdata, handles, varargin)

data_a = get(handles.LeftHandEdit, 'string');
set(h, 'UserData', data_a);

% --------------------------------------------------------------------
function varargout = RightHandEdit_Callback(h, eventdata, handles, varargin)

data_b = get(handles.RightHandEdit, 'string');
set(h, 'UserData', data_b);

% --------------------------------------------------------------------
function varargout = CloseBisectionInit_Callback(h, eventdata, handles, varargin)

set(h,'UserData','close')
