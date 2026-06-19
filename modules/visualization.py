import matplotlib.pyplot as plt
import matplotlib
import seaborn as sns
import pandas as pd

matplotlib.rcParams['font.family'] = 'sans-serif'

def grafico_frecuencia_dei(df, cols_cat, output_path='distribucion_dei.png'):
    """Gráfico de frecuencia por categoría DEI y profundidad DEI"""
    
    df_cluster = df.copy()
    df_cluster['n_categorias'] = df_cluster[cols_cat].sum(axis=1)
    
    fig, axes = plt.subplots(1, 2, figsize=(12, 5))
    
    conteo = df_cluster['n_categorias'].value_counts().sort_index()
    total = len(df_cluster)
    axes[0].bar(conteo.index, conteo.values, color='steelblue')
    for i, v in zip(conteo.index, conteo.values):
        axes[0].text(i, v + 5, f'{v}\n({v/total:.1%})', ha='center', fontsize=9)
    axes[0].set_xlabel('Nº de categorías DEI mencionadas')
    axes[0].set_ylabel('Nº de casos')
    axes[0].set_title('Distribución de casos por profundidad DEI')

    frecuencias = {cat.replace('cat_', ''): df_cluster[cat].sum() for cat in cols_cat}
    df_freq = pd.DataFrame(list(frecuencias.items()), columns=['categoria', 'n'])
    df_freq = df_freq.sort_values('n', ascending=True)
    axes[1].barh(df_freq['categoria'], df_freq['n'], color='steelblue')
    for i, (_, row) in enumerate(df_freq.iterrows()):
        axes[1].text(row['n'] + 5, i, f"{row['n']} ({row['n']/total:.1%})", va='center', fontsize=9)
    axes[1].set_xlabel('Nº de casos que mencionan la categoría')
    axes[1].set_title('Frecuencia por categoría DEI')

    plt.tight_layout()
    plt.savefig(output_path, dpi=150)
    plt.show()


def grafico_dei_por_metodo(df_methods, output_path='dei_por_metodo.png'):
    """Heatmap de categorías DEI por tipo de método participativo"""
    
    cats = ['gender', 'race', 'class', 'group_age', 'disability',
            'migration', 'territory', 'religion', 'sexuality', 'literacy']

    df_heat = df_methods.set_index('metodo')[[f'pct_{c}' for c in cats]]
    df_heat.columns = cats

    fig, ax = plt.subplots(figsize=(12, 8))
    sns.heatmap(df_heat, annot=True, fmt='.0f', cmap='Blues', linewidths=0.5, ax=ax)
    ax.set_title('Porcentaje de casos que mencionan categorías DEI por tipo de método participativo')
    ax.set_xlabel('')
    ax.set_ylabel('')
    plt.xticks(rotation=45, ha='right')
    plt.yticks(rotation=0)
    plt.tight_layout()
    plt.savefig(output_path, dpi=150)
    plt.show()


def grafico_dei_por_continente(df_continent, output_path='dei_por_continente.png'):
    """Gráfico de barras de DEI por continente"""
    
    cols_pct = [col for col in df_continent.columns if col.startswith('pct_')]
    df = df_continent.set_index('continent')
    df[cols_pct].plot(kind='bar', figsize=(14, 6))
    plt.xlabel('Continente')
    plt.ylabel('Porcentaje de casos')
    plt.xticks(rotation=45, ha='right')
    plt.tight_layout()
    plt.savefig(output_path, dpi=150)
    plt.show()

def grafico_evolucion_temporal(df_temporal, output_path='evolucion_temporal.png'):
    """Gráfico de líneas de evolución temporal de categorías DEI"""
    
    cols_pct = [col for col in df_temporal.columns if col.startswith('pct_')]
    
    marcadores = ['o', 's', '^', 'D', 'v', 'P', 'X']
    estilos = ['-', '--', '-.', ':']
    
    fig, ax = plt.subplots(figsize=(14, 6))
    
    for i, col in enumerate(cols_pct):
        label = col.replace('pct_', '')
        marker = marcadores[i % len(marcadores)]
        linestyle = estilos[i % len(estilos)]
        ax.plot(df_temporal['año'], df_temporal[col], 
                marker=marker, markersize=5, linestyle=linestyle, 
                linewidth=1.5, label=label)
    
    ax.set_xlabel('Año')
    ax.set_ylabel('Porcentaje de casos')
    ax.legend(loc='upper left', fontsize=9)
    ax.grid(True, alpha=0.3)
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.savefig(output_path, dpi=150, bbox_inches='tight')
    plt.show()

