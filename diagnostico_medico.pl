% diagnostico_medico.pl
% Sistema Especialista para Diagnóstico Médico
% Desenvolvido por: [Seu Nome Aqui]

% Base de Conhecimento
sintoma(febre).
sintoma(tosse).
sintoma(cansaco).
sintoma(dor_de_garganta).
sintoma(dor_muscular).
sintoma(dor_de_cabeca).

% Regras de diagnóstico
doenca(gripe) :- 
    sintoma(febre), sintoma(tosse), sintoma(cansaco).

doenca(infeccao_viral) :- 
    sintoma(febre), sintoma(dor_de_garganta), sintoma(dor_muscular).

doenca(enxaqueca) :- 
    sintoma(dor_de_cabeca), \+ sintoma(febre), \+ sintoma(tosse).

% Função principal para diagnóstico
diagnostico :-
    write('Bem-vindo ao Sistema de Diagnóstico Médico!'), nl,
    perguntar(febre),
    perguntar(tosse),
    perguntar(cansaco),
    perguntar(dor_de_garganta),
    perguntar(dor_muscular),
    perguntar(dor_de_cabeca),
    (   
        doenca(Doenca), !,
        format('Diagnóstico sugerido: ~w~n', [Doenca])
    ;   
        write('Não foi possível identificar a condição. Consulte um médico.'), nl
    ),
    nl, write('Desenvolvido por: [Seu Nome Aqui]').

% Pergunta ao usuário sobre cada sintoma
perguntar(Sintoma) :-
    format('Você tem ~w? (sim/nao): ', [Sintoma]),
    read(Resposta),
    (Resposta == sim -> assertz(sintoma(Sintoma)) ; true).

