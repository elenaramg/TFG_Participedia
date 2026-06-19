import re
import unicodedata
import pandas as pd

BASURA_AUTOMATICA = [
    "Know who organized or funded this initiative? Help us complete this section!",
    "Know what methods or tools were used? Help us complete this section!",
    "Want to contribute an analysis of this initiative? Help us complete this section!",
    "Want to contribute an analysis of this organization? Help us complete this section!",
    "Help us complete this section!",
    "This entry is missing citations."
]

def limpiar_columnas(df, cols_to_drop):
    return df.drop(columns=cols_to_drop, errors='ignore')

def fusionar_grupos(df, grupos):
    for nuevo_nombre, columnas_viejas in grupos.items():
        validas = [c for c in columnas_viejas if c in df.columns]
        if validas:
            df[nuevo_nombre] = df.apply(
                lambda row: fusionar_valores(row, validas, df), axis=1
            )
            df.drop(columns=validas, inplace=True)
    return df

def limpiar_texto_profundo(texto):
    if not texto: return ""
    texto = unicodedata.normalize("NFKD", texto)
    return texto.strip(" :.,;-\n\t")

def fusionar_valores(row, cols, df):
    vals = [str(row[c]) for c in cols if c in df.columns and pd.notna(row[c]) and str(row[c]).strip() != '']
    return ';'.join(vals) if vals else None

def separar_por_titulos(texto_completo, headers_busqueda):
    if pd.isna(texto_completo) or str(texto_completo).strip() == "":
        return pd.Series({k: "" for k in headers_busqueda if not k.startswith('_')})

    texto = str(texto_completo)
    posiciones = []
    for key, patron in headers_busqueda.items():
        match = re.search(patron, texto, re.IGNORECASE)
        if match:
            posiciones.append((match.start(), key, match.end()))
    posiciones.sort()

    resultados = {k: "" for k in headers_busqueda if not k.startswith('_')}

    for i in range(len(posiciones)):
        start_index = posiciones[i][2]
        current_key = posiciones[i][1]
        if current_key.startswith('_'):
            continue
        end_index = posiciones[i+1][0] if i + 1 < len(posiciones) else len(texto)
        fragmento = texto[start_index:end_index]
        titulo_detectado = texto[posiciones[i][0]:posiciones[i][2]]
        fragmento = fragmento.replace(titulo_detectado, "")
        fragmento_limpio = limpiar_texto_profundo(fragmento)

        es_basura = any(b.replace(" ", "") in fragmento_limpio.replace(" ", "") for b in BASURA_AUTOMATICA)
        if es_basura:
            fragmento_limpio = ""

        if current_key in resultados:
            resultados[current_key] = fragmento_limpio

    return pd.Series(resultados)