# Output from the 3DM-GX4 attitude estimation filter.
std_msgs/Header header

# Node on status flags:
# Status flags are implemented as bit-fields.
#  0 = invalid
#  1 = valid
#  2 = valid and geo-magnetically referenced
#
# Note that covariance on orientation becomes invalid as pitch angle exceeds 70 # degrees. This will be indicated by the status flag.


# Quaternion, and status
geometry_msgs/Quaternion quaternion
uint16 quaternion_status

# Gyroscope Euler angles roll, pitch, yaw [radians], and status
geometry_msgs/Vector3 euler_rpy
float64 euler_rpy_status
float64[9] euler_angle_covariance
uint16 euler_angle_covariance_status

# Gyro bias, diagonal covariance, and status
geometry_msgs/Vector3 gyro_bias
uint16 gyro_bias_status
float64[9] gyro_bias_covariance
uint16 gyro_bias_covariance_status

# Linear accelerations along x,y,z axis [meter/s^2], and status
geometry_msgs/Vector3 linear_acceleration
float64 linear_acceleration_status

# Angular rates along x,y,z axis [radians/s], and status
geometry_msgs/Vector3 angular_velocity
float64 angular_velocity_status

# Constants
uint16 STATUS_INVALID = 0
uint16 STATUS_VALID = 1
uint16 STATUS_VALID_REFERENCED = 2
