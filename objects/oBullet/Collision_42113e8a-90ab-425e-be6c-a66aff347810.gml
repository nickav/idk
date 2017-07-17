if (other == parent) return;
other.dead = true;
instance_destroy(other);
instance_destroy(self);