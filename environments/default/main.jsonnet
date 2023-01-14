local tanka = import "github.com/grafana/jsonnet-libs/tanka-util/main.libsonnet";
local helm = tanka.helm.new(std.thisFile);

{
  grafana: helm.template("echo-server", "./charts/echo-server-0.5.0", {
    namespace: "echo-server",
    values: {
      ingress: {
        enabled: true,
        ingressClassName: "",
        annotations: {
          "kubernetes.io/ingress.class": "nginx"
        },
        hosts: [
          {
            host: "echo-server.badliveware.com",
            paths: [
                "/"
              ],
            tls: ["echo-server-tls"]
          }
        ]
      }
    }
  })
}
