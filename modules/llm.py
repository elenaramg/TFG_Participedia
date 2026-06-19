import requests

def clasificar_rol_y_grupos_openai(case_id, texto, categorias_detectadas, row_cases=None, source_data=None):
    if not categorias_detectadas:
        return None
    
    if row_cases is not None:
        secciones_relevantes = ' '.join(filter(None, [
            str(row_cases.get('targeted_participants', '') or ''),
            str(row_cases.get('section_recruitment_selection', '') or ''),
            str(row_cases.get('section_outcomes_effects', '') or ''),
            str(row_cases.get('section_analysis_lessons', '') or '')
        ]))
        texto_llm = secciones_relevantes[:3000] if secciones_relevantes.strip() else texto[:2000]
    else:
        texto_llm = texto[:2000]

    if len(texto_llm.strip()) < 200:
        return '{"insufficient_text": true}'

    evidence_str = ""
    if source_data:
        for cat in categorias_detectadas:
            source = source_data.get(f'source_{cat}')
            if source:
                evidence_str += f"\n- {cat}: {str(source)[:300]}"

    cats_str = ', '.join(categorias_detectadas)
    
    prompt = f"""You are analyzing a participatory democracy case study.
The following DEI categories have been detected in this case by a regex dictionary: {cats_str}
Dictionary evidence (words found and where they appeared):{evidence_str if evidence_str else " No evidence available."}
For each detected category, return ONLY the following JSON structure, with NO additional fields:
{{
  "cat_X": {{
    "groups": [
      {{"name": "group name", "role": "role"}}
    ]
  }}
}}
If no specific groups are identifiable, return an empty list:
{{
  "cat_X": {{"groups": []}}
}}
Rules:
1. Each group must have a "name" and a "role". "role" must be ONE of:
   - "participant": the group actively takes part in the process
   - "target": the group is the beneficiary or focus of the process
   - "design_criterion": demographic characteristic used only as a selection criterion to ensure diversity
   - "historical_context": group mentioned ONLY in background narrative, clearly separate from the process
   - "false_positive": the word was detected but NO actual social group is referred to in the context of participation
2. A group can appear twice in the list if both roles apply, e.g.:
   [{{"name": "women", "role": "participant"}}, {{"name": "women", "role": "target"}}]
3. CRITICAL: "name" must ONLY contain groups explicitly named in the text. Do NOT invent or infer groups. If none are named, return [].
4. Do NOT use technical terms like "racialethnic", "gender", "racial", "ethnic", "ethnicity", "disability", "migration", "territory", "religion", "literacy", "sexuality", "class" as group names. These are category names, not group names.
5. Do NOT classify nationalities as migration/race groups unless explicitly described as migrants or ethnic minorities.
6. Do NOT add extra JSON fields. Return an entry for EVERY detected category.
7. Only use "historical_context" when the group is EXPLICITLY in background narrative. Do NOT use it when uncertain.
8. Use the dictionary evidence to help determine false positives.
9. CRITICAL RULE FOR DEMOCRATIC INNOVATIONS: If the text states that a group was recruited, sampled (e.g., stratified sampling, oversampling), or actively debated/voted in an assembly, jury, or council, you MUST classify them as participant (and also design_criterion if quotas were used). Do not classify them exclusively as target just because they are historically marginalized or low-income.
10. STRICT TAXONOMY: Ensure that the groups you extract strictly belong to the demographic category they are placed in. Do not classify institutions, companies, or generic stakeholders (e.g., 'local governments', 'NGOs') inside demographic categories like Race, Gender, or Age.

Before generating the JSON, think step by step:
1. Review the dictionary evidence above — these are the words the regex already found
2. Based on those words AND the case text, identify ALL demographic groups mentioned
3. For each group, determine their role based on the context
4. Generate the JSON output

Do not include this reasoning in your response, only return the final JSON, without markdown formatting, without ```json``` blocks, just the plain JSON.
Case text:
{texto_llm}"""

    OPENAI_API_KEY = "--" # API Key
    
    response = requests.post(
        "https://api.openai.com/v1/chat/completions",
        headers={
            "Authorization": f"Bearer {OPENAI_API_KEY}",
            "Content-Type": "application/json"
        },
        json={
            "model": "gpt-4o-mini",
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0
        },
        timeout=30
    )
    
    if response.status_code == 200:
        return response.json()['choices'][0]['message']['content']
    else:
        print(f"Error OpenAI: {response.status_code} - {response.text}")
        return None


