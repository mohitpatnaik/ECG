classdef Model < handle
    %MODEL Application data model.
    
    properties ( SetAccess = private )
        % Application data.
        Data(:, 1) double = double.empty(0, 1)
    end % properties ( SetAccess = private )

    properties ( SetAccess = public )
        Values = struct()
    end
    
    events ( NotifyAccess = private )
        % Event broadcast when the data is changed.
        DataChanged
    end % events ( NotifyAccess = private )
    
    methods

        function random( obj )
            %RANDOM Generate new application data.
            
            % Generate column vector of random data.
            obj.Data = randn( 20, 1 );
            notify( obj, "DataChanged" )
            
        end % random

        function generateCustomECG(obj)

            ecgData = generateECG(obj.Values.heartRate, obj.Values.aPwave, ...
                obj.Values.dPwave, obj.Values.aQwave, obj.Values.dQwave, ...
                obj.Values.aQRS, obj.Values.dQRS, obj.Values.aSwave, obj.Values.dSwave, ...
                obj.Values.aTwave, obj.Values.dTwave, obj.Values.aUwave, obj.Values.dUwave);
            obj.Data = ecgData;
            notify( obj, "DataChanged" )
        end
        
        function reset( obj )
            %RESET Restore the application data to its default value.
            
            % Reset the data to an empty column vector.
            obj.Data = double.empty( 0, 1 );
            notify( obj, "DataChanged" )
            
        end % reset
        
    end % methods
    
end % classdef