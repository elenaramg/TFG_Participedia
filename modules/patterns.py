dei_patterns = {
    "cat_gender": r"\b(?:gender|women|woman|female|females|feminis[a-z]*|girl[s]?|maternal"
                  r"|gender.?equalit[a-z]*|gender.?gap|gender.?balance"
                  r"|single.?mother[s]?|lone.?parent[s]?|widow[s]?)\b",

    "cat_sexuality": r"\b(?:sexuality|sexual orientation|lgbt[a-z\+]*|lesbian|gay|bisexual"
                     r"|queer|transgender|non[- ]?binary|homosexual|intersex"
                     r"|same.?sex|gender.?identity|gender.?diverse)\b",

    "cat_race": r"\b(?:race|racial|ethnic[a-z]*|ethnicity|indigenous|native|ethnic minority|racial minority|minorities of color"
            r"|people of colou?r|poc|black|afro.?[a-z]*|latino[a-z]*|latinx|hispanic"
            r"|aboriginal|caste|roma|travell?er[s]?|tribal|racialethnic)\b",

    "cat_class": r"\b(?:poverty|social exclu[a-z]*|low[- ]income|homeless[a-z]*"
                 r"|unemploy[a-z]*|social class|socioeconomic|vulnerable|marginali[a-z]*"
                 r"|working class|underprivileged|slum[s]?|depriv[a-z]*|precari[a-z]*"
                 r"|benefit[s]? recipient[s]?|welfare recipient[s]?|food insecur[a-z]*)\b",

    "cat_disability": r"\b(?:disabili[a-z]*|disabled|impairment[s]?|special need[s]?|blind"
                      r"|deaf|hard of hearing|low vision|hearing loss|wheelchair"
                      r"|handicap[ped]*|chronic illness|chronic condition|mental health"
                      r"|psychosocial disabilit[a-z]*)\b",

    "cat_neurodiversity": r"\b(?:autis[a-z]*|adhd|neurodiver[a-z]*|neurodiverse"
                          r"|attention deficit|dyslexi[a-z]*|dyspraxi[a-z]*|dcd"
                          r"|dyscalculi[a-z]*|dysgraphi[a-z]*|asperger"
                          r"|learning disabilit[a-z]*|intellectual disabilit[a-z]*|learning difficulties)\b",

    "cat_group_age": r"\b(?:elderly|senior citizen[s]?|older adult[s]?|older people"
                     r"|youth|child|children|teen[a-z]*|adolescen[a-z]*"
                     r"|young person|young people|old people|student[s]?|pensioner[s]?"
                     r"|intergenerational|age.?friendly|ageism|age discrimination)\b",

    "cat_migration": r"\b(?:migrant[s]?|migration|immigrant[s]?|refugee[s]?|asylum seeker[s]?"
                     r"|undocumented|foreigner[s]?|expatriate[s]?|diaspora"
                     r"|displaced person[s]?|stateless|irregular migrant[s]?"
                     r"|temporary resident[s]?|non.?citizen[s]?)\b",

    "cat_territory": r"\b(?:rural|remote area[s]?|rural communit[a-z]*|rural population[s]?"
                     r"|peri.?urban|informal settlement[s]?|shantytown[s]?"
                     r"|geographic[a-z]* isolat[a-z]*|underserved area[s]?"
                     r"|peripheral region[s]?|geograph[a-z]* barrier[s]?)\b",
    
    "cat_religion": r"\b(?:religio*|religious|faith*|spirituality|church|mosque|synagogue"
                    r"|temple|clergy|priest|imam|rabbi|pastor|monk|nun|sect)\b",

    "cat_literacy": r"\b(?:literacy|illiteracy|literate|illiterate|reading skill[s]?|writing skill[s]?)\b"
    
}
