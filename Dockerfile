FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /fullcycle fullcycle.go


FROM scratch

COPY --from=builder ./fullcycle .

ENTRYPOINT [ "/fullcycle" ]