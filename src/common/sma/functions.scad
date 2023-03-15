include <./constants.scad>;

function enough_space(width) = width > SMA_DIAMETER_REQUIRED ? 1 : 0;

function wedge_height(z, angle) = z * tan(angle);

function wedge_max_height(y, z) = atan(z / y);

function triangle_b(a, beta) = a * tan(beta);

function triangle_c(a, b) = sqrt(pow(a, 2) + pow(b, 2));

function triangle_b_alpha(c, alpha) = c * cos(alpha);

function triangle_a_alpha(b, alpha) = b * tan(alpha);