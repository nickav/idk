if (other == parent) return;
instance_destroy(other);
instance_destroy(self);