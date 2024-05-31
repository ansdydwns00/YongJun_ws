// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from vision_msgs:msg/VisionClass.idl
// generated code does not contain a copyright notice
#include "vision_msgs/msg/detail/vision_class__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "rcutils/allocator.h"


// Include directives for member types
// Member `class_name`
#include "rosidl_runtime_c/string_functions.h"

bool
vision_msgs__msg__VisionClass__init(vision_msgs__msg__VisionClass * msg)
{
  if (!msg) {
    return false;
  }
  // class_id
  // class_name
  if (!rosidl_runtime_c__String__init(&msg->class_name)) {
    vision_msgs__msg__VisionClass__fini(msg);
    return false;
  }
  return true;
}

void
vision_msgs__msg__VisionClass__fini(vision_msgs__msg__VisionClass * msg)
{
  if (!msg) {
    return;
  }
  // class_id
  // class_name
  rosidl_runtime_c__String__fini(&msg->class_name);
}

bool
vision_msgs__msg__VisionClass__are_equal(const vision_msgs__msg__VisionClass * lhs, const vision_msgs__msg__VisionClass * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // class_id
  if (lhs->class_id != rhs->class_id) {
    return false;
  }
  // class_name
  if (!rosidl_runtime_c__String__are_equal(
      &(lhs->class_name), &(rhs->class_name)))
  {
    return false;
  }
  return true;
}

bool
vision_msgs__msg__VisionClass__copy(
  const vision_msgs__msg__VisionClass * input,
  vision_msgs__msg__VisionClass * output)
{
  if (!input || !output) {
    return false;
  }
  // class_id
  output->class_id = input->class_id;
  // class_name
  if (!rosidl_runtime_c__String__copy(
      &(input->class_name), &(output->class_name)))
  {
    return false;
  }
  return true;
}

vision_msgs__msg__VisionClass *
vision_msgs__msg__VisionClass__create()
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  vision_msgs__msg__VisionClass * msg = (vision_msgs__msg__VisionClass *)allocator.allocate(sizeof(vision_msgs__msg__VisionClass), allocator.state);
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(vision_msgs__msg__VisionClass));
  bool success = vision_msgs__msg__VisionClass__init(msg);
  if (!success) {
    allocator.deallocate(msg, allocator.state);
    return NULL;
  }
  return msg;
}

void
vision_msgs__msg__VisionClass__destroy(vision_msgs__msg__VisionClass * msg)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (msg) {
    vision_msgs__msg__VisionClass__fini(msg);
  }
  allocator.deallocate(msg, allocator.state);
}


bool
vision_msgs__msg__VisionClass__Sequence__init(vision_msgs__msg__VisionClass__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  vision_msgs__msg__VisionClass * data = NULL;

  if (size) {
    data = (vision_msgs__msg__VisionClass *)allocator.zero_allocate(size, sizeof(vision_msgs__msg__VisionClass), allocator.state);
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = vision_msgs__msg__VisionClass__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        vision_msgs__msg__VisionClass__fini(&data[i - 1]);
      }
      allocator.deallocate(data, allocator.state);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
vision_msgs__msg__VisionClass__Sequence__fini(vision_msgs__msg__VisionClass__Sequence * array)
{
  if (!array) {
    return;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();

  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      vision_msgs__msg__VisionClass__fini(&array->data[i]);
    }
    allocator.deallocate(array->data, allocator.state);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

vision_msgs__msg__VisionClass__Sequence *
vision_msgs__msg__VisionClass__Sequence__create(size_t size)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  vision_msgs__msg__VisionClass__Sequence * array = (vision_msgs__msg__VisionClass__Sequence *)allocator.allocate(sizeof(vision_msgs__msg__VisionClass__Sequence), allocator.state);
  if (!array) {
    return NULL;
  }
  bool success = vision_msgs__msg__VisionClass__Sequence__init(array, size);
  if (!success) {
    allocator.deallocate(array, allocator.state);
    return NULL;
  }
  return array;
}

void
vision_msgs__msg__VisionClass__Sequence__destroy(vision_msgs__msg__VisionClass__Sequence * array)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (array) {
    vision_msgs__msg__VisionClass__Sequence__fini(array);
  }
  allocator.deallocate(array, allocator.state);
}

bool
vision_msgs__msg__VisionClass__Sequence__are_equal(const vision_msgs__msg__VisionClass__Sequence * lhs, const vision_msgs__msg__VisionClass__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!vision_msgs__msg__VisionClass__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
vision_msgs__msg__VisionClass__Sequence__copy(
  const vision_msgs__msg__VisionClass__Sequence * input,
  vision_msgs__msg__VisionClass__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(vision_msgs__msg__VisionClass);
    rcutils_allocator_t allocator = rcutils_get_default_allocator();
    vision_msgs__msg__VisionClass * data =
      (vision_msgs__msg__VisionClass *)allocator.reallocate(
      output->data, allocation_size, allocator.state);
    if (!data) {
      return false;
    }
    // If reallocation succeeded, memory may or may not have been moved
    // to fulfill the allocation request, invalidating output->data.
    output->data = data;
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!vision_msgs__msg__VisionClass__init(&output->data[i])) {
        // If initialization of any new item fails, roll back
        // all previously initialized items. Existing items
        // in output are to be left unmodified.
        for (; i-- > output->capacity; ) {
          vision_msgs__msg__VisionClass__fini(&output->data[i]);
        }
        return false;
      }
    }
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!vision_msgs__msg__VisionClass__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}
