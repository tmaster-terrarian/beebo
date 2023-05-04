hp -= 1
x += lengthdir_x(2, other.direction)
with(obj_player)
    if(irandom_range(1, 10) <= round(_calcitem("eviction_notice", self) * 10))
        _inflict(other, new statmanager._bleed())
instance_destroy(other)
