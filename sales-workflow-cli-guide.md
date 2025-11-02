# 💼 Comandos CLI para Flujos de Trabajo en Ventas (2025)

## 📋 Índice
1. [Herramientas Esenciales](#herramientas-esenciales)
2. [CRM desde la Terminal](#crm-desde-la-terminal)
3. [Automatización de Emails](#automatización-de-emails)
4. [Análisis de Datos y Reportes](#análisis-de-datos-y-reportes)
5. [Gestión de Leads](#gestión-de-leads)
6. [Productividad y Organización](#productividad-y-organización)
7. [Integración con APIs](#integración-con-apis)
8. [Scripts Personalizados](#scripts-personalizados)
9. [Dashboards y Visualización](#dashboards-y-visualización)

---

## 🛠️ Herramientas Esenciales

### Instalación de herramientas base

```bash
# Herramientas para manipular datos
brew install jq yq csvkit miller

# Herramientas para APIs
brew install httpie curl

# Base de datos local
brew install sqlite duckdb

# Automatización
brew install jless fx glow

# Calendario y tareas
brew install calcurse task

# Email CLI
brew install mutt neomutt

# Notificaciones
brew install terminal-notifier

# Excel/CSV processing
pip3 install pandas openpyxl xlrd
```

---

## 🗂️ CRM desde la Terminal

### 1. Salesforce CLI (sf)

```bash
# Instalar Salesforce CLI
brew install --cask sf

# Login
sf org login web

# Ver oportunidades recientes
sf data query --query "SELECT Id, Name, Amount, StageName, CloseDate FROM Opportunity WHERE CreatedDate = THIS_MONTH ORDER BY CreatedDate DESC" --json | jq '.result.records[] | {Name, Amount, Stage: .StageName}'

# Crear lead nuevo
sf data create record --sobject Lead --values "FirstName=Juan LastName=Perez Company=TechCorp Email=juan@techcorp.com Status=New"

# Actualizar oportunidad
sf data update record --sobject Opportunity --record-id 006xx000001234 --values "StageName=Closed Won"

# Exportar contactos a CSV
sf data query --query "SELECT Name, Email, Phone, Account.Name FROM Contact WHERE CreatedDate = THIS_MONTH" --result-format csv > contacts_$(date +%Y%m%d).csv

# Dashboard rápido de ventas
sf data query --query "SELECT StageName, COUNT(Id) total, SUM(Amount) revenue FROM Opportunity WHERE CloseDate = THIS_QUARTER GROUP BY StageName" --json | jq -r '.result.records[] | "\(.StageName): \(.total) deals - $\(.revenue)"'
```

### 2. HubSpot CLI

```bash
# Instalar HubSpot CLI
npm install -g @hubspot/cli

# Configurar
hs init

# Listar contactos recientes
hs contacts list --limit 20 --properties email,firstname,lastname,lifecyclestage

# Crear contacto
hs contacts create --properties '{"email":"contact@example.com","firstname":"Maria","lastname":"Garcia","company":"Acme Corp"}'

# Ver deals del mes
hs deals list --properties dealname,amount,dealstage,closedate --filter "createdate=THIS_MONTH"

# Exportar deals a JSON
hs deals list --json > deals_backup.json
```

### 3. Pipedrive CLI (usando API)

```bash
# Configurar API key
export PIPEDRIVE_API_TOKEN="your_token_here"
export PIPEDRIVE_DOMAIN="your-domain"

# Función helper
pd() {
  http GET "https://$PIPEDRIVE_DOMAIN.pipedrive.com/v1/$1" "api_token==$PIPEDRIVE_API_TOKEN" "${@:2}"
}

# Listar deals
pd deals | jq '.data[] | {title, value, stage_id, person_name: .person_id.name}'

# Buscar persona
pd persons/search term=="john@example.com" | jq '.data.items[]'

# Crear actividad
http POST "https://$PIPEDRIVE_DOMAIN.pipedrive.com/v1/activities?api_token=$PIPEDRIVE_API_TOKEN" \
  subject="Follow up call" \
  type="call" \
  deal_id=123

# Dashboard de ventas
echo "📊 VENTAS DEL MES"
pd deals | jq -r '.data[] | select(.add_time | startswith("2025-11")) | "\(.title): $\(.value)"'
```

---

## 📧 Automatización de Emails

### 1. Gmail CLI (usando `gam`)

```bash
# Instalar GAM (Google Apps Manager)
bash <(curl -s -S -L https://git.io/install-gam)

# Enviar email
gam user me sendemail recipient "cliente@empresa.com" \
  subject "Seguimiento de propuesta" \
  message "Hola, adjunto la propuesta solicitada" \
  attach "/path/to/propuesta.pdf"

# Buscar emails de clientes importantes
gam user me show messages query "from:cliente@importante.com after:2025/11/01" showbody

# Crear borrador automático
gam user me draftemail recipient "lead@empresa.com" \
  subject "Presentación de servicios" \
  file template_intro.txt

# Enviar email masivo desde CSV
while IFS=',' read -r email name; do
  gam user me sendemail recipient "$email" \
    subject "Hola $name - Oferta especial" \
    message "Hola $name, tenemos una oferta especial para ti..."
done < leads.csv
```

### 2. Email con `mutt`

```bash
# Instalar y configurar mutt
brew install neomutt

# Enviar email simple
echo "Cuerpo del mensaje" | mutt -s "Asunto" -a archivo.pdf -- cliente@empresa.com

# Template de seguimiento
cat > ~/.mutt/templates/followup.txt << 'EOF'
Hola {{NAME}},

Quería hacer seguimiento a nuestra conversación del {{DATE}}.

¿Tienes alguna pregunta sobre la propuesta?

Saludos,
Tu nombre
EOF

# Enviar usando template
mutt -s "Seguimiento" cliente@empresa.com < ~/.mutt/templates/followup.txt
```

---

## 📊 Análisis de Datos y Reportes

### 1. Procesar CSV de ventas con `csvkit`

```bash
# Ver estadísticas de ventas
csvstat ventas.csv

# Filtrar ventas mayores a $10,000
csvgrep -c Amount -r "^[1-9][0-9]{4,}$" ventas.csv

# Agrupar por vendedor
csvcut -c Vendedor,Monto ventas.csv | \
  csvstat --sum Monto --group Vendedor

# Convertir Excel a CSV
in2csv ventas.xlsx > ventas.csv

# Query SQL en CSV
csvsql --query "SELECT Vendedor, SUM(Monto) as Total FROM ventas GROUP BY Vendedor ORDER BY Total DESC" ventas.csv

# Generar reporte en formato tabla
csvlook ventas.csv | less
```

### 2. Análisis con `miller` (mlr)

```bash
# Top 10 clientes por revenue
mlr --csv --from ventas.csv \
  then sort -nr Revenue \
  then head -n 10 \
  then cut -f Cliente,Revenue

# Calcular conversión por fuente
mlr --csv --from leads.csv \
  then stats1 -a count -g Fuente,Estado \
  then reshape -s Estado,count

# Filtrar y transformar
mlr --csv --from deals.csv \
  then filter '$Stage == "Closed Won"' \
  then put '$Commission = $Amount * 0.10' \
  then cut -f Vendedor,Amount,Commission

# Generar JSON para dashboard
mlr --c2j --from ventas_mes.csv > dashboard_data.json
```

### 3. Análisis con `jq` (JSON)

```bash
# Calcular revenue total
cat deals.json | jq '[.[].amount] | add'

# Contar deals por stage
cat deals.json | jq 'group_by(.stage) | map({stage: .[0].stage, count: length})'

# Top 5 vendedores
cat deals.json | jq 'group_by(.owner) | map({owner: .[0].owner, total: map(.amount) | add}) | sort_by(.total) | reverse | .[0:5]'

# Deals cerrados esta semana
cat deals.json | jq '[.[] | select(.close_date | startswith("2025-11"))]'

# Conversión rate
cat pipeline.json | jq '{total: length, won: [.[] | select(.stage == "Won")] | length} | {conversion_rate: ((.won / .total) * 100)}'
```

### 4. DuckDB para análisis complejo

```bash
# Instalar DuckDB
brew install duckdb

# Query directo en CSV
duckdb -c "SELECT Vendedor, SUM(Monto) as Total, COUNT(*) as Deals 
           FROM 'ventas.csv' 
           WHERE Fecha >= '2025-11-01' 
           GROUP BY Vendedor 
           ORDER BY Total DESC"

# Análisis de múltiples archivos
duckdb -c "SELECT 
             l.Fuente,
             COUNT(DISTINCT l.Id) as Leads,
             COUNT(DISTINCT d.Id) as Conversiones,
             ROUND(COUNT(DISTINCT d.Id)::FLOAT / COUNT(DISTINCT l.Id) * 100, 2) as ConversionRate
           FROM 'leads.csv' l
           LEFT JOIN 'deals.csv' d ON l.Email = d.Email
           GROUP BY l.Fuente"

# Exportar resultados
duckdb -c "COPY (SELECT * FROM 'ventas.csv' WHERE Monto > 10000) TO 'high_value_deals.csv' (HEADER, DELIMITER ',')"
```

---

## 🎯 Gestión de Leads

### Script de calificación de leads

```bash
# Crear script de lead scoring
cat > ~/bin/lead-score << 'EOF'
#!/bin/bash

# Lead scoring automático
EMAIL=$1
COMPANY=$2
INDUSTRY=$3
EMPLOYEES=$4

SCORE=0

# Scoring por industria
case $INDUSTRY in
  "Technology"|"SaaS") SCORE=$((SCORE + 30)) ;;
  "Finance"|"Healthcare") SCORE=$((SCORE + 25)) ;;
  *) SCORE=$((SCORE + 10)) ;;
esac

# Scoring por tamaño de empresa
if [ $EMPLOYEES -gt 500 ]; then
  SCORE=$((SCORE + 40))
elif [ $EMPLOYEES -gt 100 ]; then
  SCORE=$((SCORE + 25))
else
  SCORE=$((SCORE + 10))
fi

# Scoring por dominio de email
if [[ $EMAIL == *"gmail.com"* ]] || [[ $EMAIL == *"hotmail.com"* ]]; then
  SCORE=$((SCORE + 5))
else
  SCORE=$((SCORE + 20))
fi

# Clasificar lead
if [ $SCORE -gt 70 ]; then
  PRIORITY="🔥 HOT"
elif [ $SCORE -gt 50 ]; then
  PRIORITY="⭐ WARM"
else
  PRIORITY="❄️  COLD"
fi

echo "Lead Score: $SCORE - $PRIORITY"
echo "Email: $EMAIL | Company: $COMPANY | Industry: $INDUSTRY"
EOF

chmod +x ~/bin/lead-score

# Uso
lead-score "cto@bigtech.com" "BigTech Inc" "Technology" 1000
```

### Enriquecimiento de leads con Clearbit

```bash
# Enriquecer email con Clearbit API
export CLEARBIT_API_KEY="your_key"

enrich-lead() {
  EMAIL=$1
  http GET "https://person-stream.clearbit.com/v2/combined/find?email=$EMAIL" \
    "Authorization: Bearer $CLEARBIT_API_KEY" | \
  jq '{
    name: .person.name.fullName,
    company: .company.name,
    title: .person.employment.title,
    industry: .company.category.industry,
    employees: .company.metrics.employees,
    revenue: .company.metrics.estimatedAnnualRevenue
  }'
}

# Enriquecer lista de leads
while IFS= read -r email; do
  echo "Processing $email..."
  enrich-lead "$email" >> enriched_leads.json
  sleep 1
done < leads_emails.txt
```

---

## ⚡ Productividad y Organización

### 1. Gestión de tareas con `task`

```bash
# Instalar Taskwarrior
brew install task

# Agregar tarea de seguimiento
task add "Follow up with Acme Corp" project:sales due:tomorrow priority:H tags:follow-up

# Ver tareas de ventas
task project:sales list

# Completar tarea
task 1 done

# Reporte de tareas urgentes
task urgency

# Dashboard diario
task next

# Sincronizar con calendario
task export | jq -r '.[] | select(.project == "sales") | "\(.description) - Due: \(.due)"'
```

### 2. Calendario en terminal con `calcurse`

```bash
# Instalar calcurse
brew install calcurse

# Agregar llamada
calcurse -a "Call with client @10:00 [60min]"

# Ver agenda del día
calcurse -d 1

# Exportar a iCal
calcurse --export > calendar.ics

# Recordatorios automáticos
calcurse -n | terminal-notifier -title "Upcoming" -message
```

### 3. Notas rápidas de reuniones

```bash
# Crear template de notas
cat > ~/bin/meeting-notes << 'EOF'
#!/bin/bash

CLIENT=$1
DATE=$(date +%Y-%m-%d)
FILE="$HOME/Documents/meetings/${CLIENT}_${DATE}.md"

mkdir -p "$HOME/Documents/meetings"

cat > "$FILE" << TEMPLATE
# Meeting Notes - $CLIENT
**Date:** $DATE
**Time:** $(date +%H:%M)

## Attendees
- 

## Topics Discussed
- 

## Action Items
- [ ] 

## Next Steps
- 

## Notes
TEMPLATE

# Abrir en editor
${EDITOR:-nvim} "$FILE"
EOF

chmod +x ~/bin/meeting-notes

# Uso
meeting-notes "Acme Corp"
```

---

## 🔗 Integración con APIs

### Script universal de API

```bash
# Crear función para APIs comunes
cat >> ~/.zshrc << 'EOF'

# Salesforce quick query
sf-query() {
  sf data query --query "$1" --json | jq '.result.records'
}

# HubSpot API wrapper
hs-api() {
  ENDPOINT=$1
  http GET "https://api.hubapi.com/$ENDPOINT" \
    "Authorization: Bearer $HUBSPOT_TOKEN"
}

# Slack notification
slack-notify() {
  MESSAGE=$1
  http POST "$SLACK_WEBHOOK_URL" message="$MESSAGE"
}

# WhatsApp message (using Twilio)
whatsapp-send() {
  TO=$1
  MESSAGE=$2
  http POST "https://api.twilio.com/2010-04-01/Accounts/$TWILIO_SID/Messages.json" \
    --auth "$TWILIO_SID:$TWILIO_TOKEN" \
    From="whatsapp:+14155238886" \
    To="whatsapp:$TO" \
    Body="$MESSAGE"
}

# Pipeline summary
pipeline-status() {
  echo "📊 PIPELINE STATUS - $(date +%Y-%m-%d)"
  echo "================================"
  sf-query "SELECT StageName, COUNT(Id) total, SUM(Amount) amount FROM Opportunity WHERE IsClosed = false GROUP BY StageName" | \
  jq -r '.[] | "\(.StageName): \(.total) deals - $\(.amount)"'
}

EOF

source ~/.zshrc
```

### Automatización de reportes diarios

```bash
cat > ~/bin/daily-sales-report << 'EOF'
#!/bin/bash

DATE=$(date +%Y-%m-%d)
REPORT_FILE="$HOME/reports/sales_report_${DATE}.txt"

mkdir -p "$HOME/reports"

{
  echo "========================================="
  echo "  SALES DAILY REPORT - $DATE"
  echo "========================================="
  echo ""
  
  echo "📈 NEW LEADS TODAY"
  sf data query --query "SELECT Name, Company, Email FROM Lead WHERE CreatedDate = TODAY" --json | \
    jq -r '.result.records[] | "- \(.Name) (\(.Company)) - \(.Email)"'
  
  echo ""
  echo "💰 CLOSED DEALS TODAY"
  sf data query --query "SELECT Name, Amount, Account.Name FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate = TODAY" --json | \
    jq -r '.result.records[] | "- \(.Name): $\(.Amount) (\(.Account.Name))"'
  
  echo ""
  echo "🎯 PIPELINE VALUE"
  sf data query --query "SELECT SUM(Amount) total FROM Opportunity WHERE IsClosed = false" --json | \
    jq -r '.result.records[0] | "Total: $\(.total)"'
  
} > "$REPORT_FILE"

# Enviar por email
cat "$REPORT_FILE" | mutt -s "Sales Report - $DATE" ventas@empresa.com

# Notificar
terminal-notifier -title "Daily Report" -message "Report generated: $REPORT_FILE"

echo "✅ Report generated: $REPORT_FILE"
EOF

chmod +x ~/bin/daily-sales-report

# Automatizar con cron
(crontab -l 2>/dev/null; echo "0 18 * * 1-5 $HOME/bin/daily-sales-report") | crontab -
```

---

## 📈 Dashboards y Visualización

### Dashboard en terminal con `gum`

```bash
# Instalar gum
brew install gum

# Dashboard interactivo
cat > ~/bin/sales-dashboard << 'EOF'
#!/bin/bash

gum style \
  --foreground 212 --border-foreground 212 --border double \
  --align center --width 50 --margin "1 2" --padding "2 4" \
  'SALES DASHBOARD' "$(date +'%Y-%m-%d %H:%M')"

# Menú principal
OPTION=$(gum choose "Pipeline Status" "New Leads" "Closed Deals" "Activity Log" "Reports" "Exit")

case $OPTION in
  "Pipeline Status")
    gum spin --spinner dot --title "Loading pipeline..." -- sleep 2
    pipeline-status
    ;;
  "New Leads")
    gum spin --spinner dot --title "Fetching leads..." -- sleep 1
    sf-query "SELECT Name, Company, Email FROM Lead WHERE CreatedDate = THIS_WEEK"
    ;;
  "Closed Deals")
    sf-query "SELECT Name, Amount, CloseDate FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate = THIS_MONTH"
    ;;
  "Activity Log")
    task project:sales list
    ;;
  "Reports")
    gum file ~/reports/
    ;;
  "Exit")
    exit 0
    ;;
esac
EOF

chmod +x ~/bin/sales-dashboard
```

### Gráficos en terminal con `termgraph`

```bash
# Instalar termgraph
pip3 install termgraph

# Generar datos para gráfico
cat > sales_by_month.dat << EOF
Jan 45000
Feb 52000
Mar 48000
Apr 61000
May 58000
Jun 67000
EOF

# Mostrar gráfico
termgraph sales_by_month.dat --title "Monthly Revenue" --color blue --width 50

# Pipeline por etapa
sf data query --query "SELECT StageName stage, COUNT(Id) count FROM Opportunity WHERE IsClosed = false GROUP BY StageName" --json | \
jq -r '.result.records[] | "\(.stage) \(.count)"' | \
termgraph --title "Pipeline by Stage" --color green
```

---

## 🚀 Scripts Personalizados Útiles

### 1. Prospección automatizada

```bash
cat > ~/bin/prospect-automation << 'EOF'
#!/bin/bash

# Buscar empresas en LinkedIn (requiere rvest o scraping API)
# Validar emails
# Enriquecer con Clearbit
# Añadir a CRM
# Enviar secuencia de emails

INDUSTRY=$1
LOCATION=$2

echo "🔍 Prospecting $INDUSTRY companies in $LOCATION..."

# Aquí iría la lógica de scraping/API
# Este es un ejemplo simplificado

# Simular búsqueda
echo "Found 25 companies..."

# Validar emails
echo "Validating emails..."

# Añadir a CRM
echo "Adding to CRM..."

# Notificar
terminal-notifier -title "Prospecting" -message "Added 25 new leads to pipeline"
EOF

chmod +x ~/bin/prospect-automation
```

### 2. Follow-up automático

```bash
cat > ~/bin/auto-followup << 'EOF'
#!/bin/bash

# Buscar oportunidades sin actividad reciente
sf data query --query "
  SELECT Id, Name, Owner.Email, LastActivityDate 
  FROM Opportunity 
  WHERE IsClosed = false 
  AND LastActivityDate < LAST_N_DAYS:7
" --json | jq -r '.result.records[]' | while read -r opp; do
  
  OPP_NAME=$(echo "$opp" | jq -r '.Name')
  OWNER_EMAIL=$(echo "$opp" | jq -r '.Owner.Email')
  
  echo "⚠️  No activity on: $OPP_NAME"
  
  # Enviar recordatorio
  echo "Reminder: Follow up with $OPP_NAME" | \
  mutt -s "Follow-up Reminder" "$OWNER_EMAIL"
  
done

echo "✅ Follow-up reminders sent"
EOF

chmod +x ~/bin/auto-followup

# Automatizar diariamente
(crontab -l; echo "0 9 * * * ~/bin/auto-followup") | crontab -
```

### 3. Lead scoring en batch

```bash
cat > ~/bin/batch-lead-scoring << 'EOF'
#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE="${INPUT_FILE%.csv}_scored.csv"

echo "Email,Company,Industry,Employees,Score,Priority" > "$OUTPUT_FILE"

tail -n +2 "$INPUT_FILE" | while IFS=',' read -r email company industry employees; do
  # Calcular score (lógica simplificada)
  SCORE=$((RANDOM % 100))
  
  if [ $SCORE -gt 70 ]; then
    PRIORITY="HOT"
  elif [ $SCORE -gt 50 ]; then
    PRIORITY="WARM"
  else
    PRIORITY="COLD"
  fi
  
  echo "$email,$company,$industry,$employees,$SCORE,$PRIORITY" >> "$OUTPUT_FILE"
done

echo "✅ Scored leads saved to: $OUTPUT_FILE"
EOF

chmod +x ~/bin/batch-lead-scoring

# Uso
batch-lead-scoring leads.csv
```

---

## 🔔 Notificaciones y Alertas

```bash
# Alert cuando deal grande se cierra
cat > ~/bin/big-deal-alert << 'EOF'
#!/bin/bash

THRESHOLD=50000

sf data query --query "
  SELECT Name, Amount, Account.Name 
  FROM Opportunity 
  WHERE StageName = 'Closed Won' 
  AND CloseDate = TODAY 
  AND Amount > $THRESHOLD
" --json | jq -r '.result.records[]' | while read -r deal; do
  
  DEAL_NAME=$(echo "$deal" | jq -r '.Name')
  AMOUNT=$(echo "$deal" | jq -r '.Amount')
  
  # Notificación local
  terminal-notifier \
    -title "🎉 BIG DEAL CLOSED!" \
    -message "$DEAL_NAME - \$$AMOUNT" \
    -sound default
  
  # Slack
  slack-notify "🎉 Big deal closed: $DEAL_NAME - \$$AMOUNT"
  
done
EOF

chmod +x ~/bin/big-deal-alert
```

---

## 📚 Recursos y Mejores Prácticas

### Mejores prácticas

1. **Automatiza tareas repetitivas**: Usa cron para reportes diarios
2. **Guarda tus scripts**: Mantén un repositorio Git de tus scripts
3. **Documenta todo**: Agrega comentarios y README
4. **Usa variables de entorno**: Nunca hardcodees credenciales
5. **Testing**: Prueba scripts con datos de prueba primero

### Template de .env

```bash
# ~/.sales-env
export SALESFORCE_USERNAME="user@company.com"
export HUBSPOT_TOKEN="your_token"
export SLACK_WEBHOOK_URL="https://hooks.slack.com/..."
export TWILIO_SID="your_sid"
export TWILIO_TOKEN="your_token"
export CLEARBIT_API_KEY="your_key"

# Cargar en .zshrc
source ~/.sales-env
```

---

## ✅ Checklist de Productividad en Ventas

- [ ] Configurar CLI de CRM principal (Salesforce/HubSpot)
- [ ] Automatizar reporte diario
- [ ] Crear scripts de follow-up
- [ ] Configurar notificaciones de deals importantes
- [ ] Implementar lead scoring
- [ ] Automatizar email sequences
- [ ] Dashboard en terminal
- [ ] Backup automático de datos
- [ ] Integración con calendario
- [ ] Scripts de prospección

---

**¡Ahora eres un vendedor power-user de la terminal! 💪🚀**
