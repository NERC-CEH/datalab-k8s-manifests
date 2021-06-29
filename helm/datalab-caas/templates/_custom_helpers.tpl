{{/*
Create the internal URL of the auth service using the namespace datalabs is deployed into.
Needs to be fully resolved URL so ingress can use the service if it is deployed in a different namespace.
*/}}
{{- define "datalab.auth-service-internal-url" -}}
http://datalab-auth-service.{{.Values.namespace}}.svc.cluster.local
{{- end }}
