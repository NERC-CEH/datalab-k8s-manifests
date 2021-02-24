{{- define "datalab.auth-service-internal-url" -}}
http://datalab-auth-service.{{.Values.namespace}}.svc.cluster.local
{{- end }}
