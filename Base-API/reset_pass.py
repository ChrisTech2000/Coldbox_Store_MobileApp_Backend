from django.contrib.auth import get_user_model
U = get_user_model()
u = U.objects.get(phone='+2348111111111')
u.set_password('Lucy1234!')
u.save()
print('Password reset OK for', u.first_name, u.last_name)
