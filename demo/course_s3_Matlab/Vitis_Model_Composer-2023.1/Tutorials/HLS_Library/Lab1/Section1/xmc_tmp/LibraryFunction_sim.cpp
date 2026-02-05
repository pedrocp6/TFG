#include "sobelfilter_Wrap.h"
#include <stdint.h>

#ifdef _MSC_VER
# define EXPORT __declspec(dllexport)
#else
# define EXPORT
#endif
extern "C" {
EXPORT void simWrapper(void** argv)
{
   uint8_t (*arg_0)[640] = (uint8_t (*)[640]) argv[0];
   uint16_t (*arg_1)[640] = (uint16_t (*)[640]) argv[1];
   uint16_t (*arg_2)[640] = (uint16_t (*)[640]) argv[2];
   SobelFilter_XMC< 360, 640, 0 >(arg_0, arg_1, arg_2);
}
} // extern "C"
