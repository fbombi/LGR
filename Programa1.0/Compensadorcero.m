function [Compensadorcero]=Compensadorcero(Pd,angulo,T,planta,AnguloAsumido)
    Valora=real(Pd)+imag(Pd)/(tand((180-AnguloAsumido)));
    Valorb=real(Pd)-imag(Pd)/(tand((AnguloAsumido-angulo)));
    Gz=c2d(planta,T,'zoh');
    k=1/abs(((Pd-Valora)/(Pd-Valorb))*evalfr(Gz,Pd));
    Compensadorcero=zpk(Valora,Valorb,k,T);
end