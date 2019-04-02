add_library(GroundTruth MODULE GroundTruth.cpp)
# 使用c++11
target_compile_features(GroundTruth PRIVATE cxx_range_for cxx_auto_type)
# 不使用C++ RTTI.
set_target_properties(GroundTruth PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)
