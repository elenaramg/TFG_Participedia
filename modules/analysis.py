import re
import pycountry_convert as pc
import pandas as pd
from modules.patterns import dei_patterns

corrections = {
    'Italia': 'Italy',
    'Belgique': 'Belgium',
    'Brasil': 'Brazil',
    'Deutschland': 'Germany',
    'Germania': 'Germany',
    'Suisse': 'Switzerland',
    'Argentinien': 'Argentina',
    'Mexiko': 'Mexico',
    '中国': 'China',
    'Tchéquia': 'Czech Republic',
    'Regno Unito': 'United Kingdom',
    'Palestinian Territory': 'Palestine',
    'Polska': 'Poland',
    'Bolivien': 'Bolivia',
    'Myanmar (Burma)': 'Myanmar',
    'España': 'Spain',
    'Nederland': 'Netherlands',
}

def extraer_palabras_exactas(row, columnas_candidatas):
    if not isinstance(row, pd.Series):
        return {}
    
    resultados = {}
    for cat, patron in dei_patterns.items():
        palabras_por_fuente = {}
        for col in columnas_candidatas:
            texto = row.get(col, '')
            if not isinstance(texto, str) or texto.strip() == '':
                continue
            encontradas = re.findall(patron, texto.lower())
            unicas = list(set([p for p in encontradas if isinstance(p, str) and p.strip()]))
            if unicas:
                frases = []
                for palabra in unicas:
                    for frase in texto.split('.'):
                        if palabra.lower() in frase.lower():
                            frase_limpia = frase.strip()[:200]
                            if frase_limpia and frase_limpia not in frases:
                                frases.append(frase_limpia)
                palabras_por_fuente[col] = {
                    'palabras': unicas,
                    'frases': frases[:3]
                }
        
        if palabras_por_fuente:
            resultados[f"source_{cat}"] = str(palabras_por_fuente)
        else:
            resultados[f"source_{cat}"] = None
    
    return resultados

def extraer_interseccionalidad(row, dei_patterns):
    cats_presentes = [cat for cat in dei_patterns if row[cat] == 1]
    if len(cats_presentes) >= 2:
        return " + ".join(sorted(cats_presentes))
    return None

def get_continent(country_name):
    if not isinstance(country_name, str) or country_name.strip() == '':
        return None
    country_name = corrections.get(country_name, country_name)
    country_alpha2 = pc.country_name_to_country_alpha2(country_name)
    country_continent_code = pc.country_alpha2_to_continent_code(country_alpha2)
    country_continent_name = pc.convert_continent_code_to_continent_name(country_continent_code)
    return country_continent_name

