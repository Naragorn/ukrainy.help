resource "aws_pinpoint_app" "example" {
  name = "test-app"

  limits {
    maximum_duration    = 600
    messages_per_second = 100
  }

  quiet_time {
    start = "00:00"
    end   = "06:00"
  }
}
