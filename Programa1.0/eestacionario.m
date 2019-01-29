function [a,controlador2]=eestacionario(opcion,e,controlador,Gd,T,Pd,ang)
%s=tf('s');
Gc=controlador*Gd;
disp(e);
 z=tf('z',T);
 R=(z-1)/(z*T);
if opcion==1 %Error posicion constante
    num=evalfr(minreal((z*e*Gc-((z-0.9999)*(1-e)))),1);
    dem=evalfr(minreal((e*Gc)),1);
    a=num/dem;
%     Kp=(1-e)/e;

%     a=1-(Kp*0.001/(evalfr(minreal(controlador*Gd),1)));
     [controlador2]=Compensador(a,T);

end
if opcion==2 %Error de posicion es a 0, probando PI
 %controlador2=PI(0.0001+0.0001*1i,0.001,T,Gc,2);
 controlador2=PI(0.9999,0.00001,T,Gc,2);
 a=0;
end
if opcion==3%Error de velocidad constante
    num=evalfr(minreal((e*Gc*(z^2-z)-((z-0.9999)*(z*T)))),1);
    dem=evalfr(minreal((e*Gc*(z-1))),1);
    %valor=(evalfr(((z-1)*controlador*Gd),1)/(T*Kv));
  %  valor=((Kv)/(evalfr(minreal(Gc*R),1)))*(1-0.999)
   %a=1-((T*Kv)/(evalfr((controlador*Gd),1)));
    a=num/dem;
    %a=(valor);
    [controlador2]=Compensador(a,T);

end
if opcion==4 %Velocidad=0;
 controlador2=PI(0.9999,0.00001,T,Gc,2);
 controlador2=controlador2*controlador2;
 a=0;
end
if opcion==5
    num=evalfr(minreal(((e*Gc*(z-1)*(z-1)*z)-((z-0.9999)*(z*z*T*T)))),1);
    dem=evalfr(minreal((e*Gc*(z-1)*(z-1))),1);
    a=num/dem;
    disp(a);
    [controlador2]=Compensador(a,T);
    disp(controlador2);
end
if opcion==6
 controlador2=PI(0.9999,0.00001,T,Gc,2);
 controlador2=controlador2*controlador2*controlador2;
 a=0;
end

end