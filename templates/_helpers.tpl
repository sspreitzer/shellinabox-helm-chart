{{- define "shellinabox.fullname" }}
{{- printf "%s-%s" .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "shellinabox.labels" }}
app: "{{ include "shellinabox.fullname" . }}"
app.kubernetes.io/name: "{{ .Release.Name }}"
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
{{- end }}
