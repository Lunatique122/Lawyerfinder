# Generated by Django 3.2.3 on 2021-08-23 20:01

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('is_active', models.BooleanField(default=False)),
                ('is_teacher', models.BooleanField(default=False)),
                ('is_learner', models.BooleanField(default=False)),
                ('is_admin', models.BooleanField(default=False)),
                ('first_name', models.CharField(max_length=30)),
                ('last_name', models.CharField(max_length=30)),
                ('occupation', models.CharField(blank=True, max_length=50, null=True)),
                ('biography', models.CharField(blank=True, max_length=150, null=True)),
                ('website', models.CharField(blank=True, max_length=30, null=True)),
                ('linkedin', models.CharField(blank=True, max_length=30, null=True)),
                ('youtube', models.CharField(blank=True, max_length=30, null=True)),
                ('researchgate', models.CharField(blank=True, max_length=30, null=True)),
                ('twitter', models.CharField(blank=True, max_length=30, null=True)),
                ('facebook', models.CharField(blank=True, max_length=30, null=True)),
                ('email', models.CharField(blank=True, max_length=30, null=True)),
                ('username', models.CharField(blank=True, max_length=30, unique=True)),
                ('password', models.CharField(max_length=100)),
                ('country', models.CharField(blank=True, max_length=2, null=True)),
                ('photo', models.CharField(blank=True, max_length=30, null=True)),
                ('creation_date', models.TextField(blank=True, null=True)),
                ('last_login', models.CharField(blank=True, max_length=32, null=True)),
            ],
            options={
                'db_table': 'users',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Lawyers',
            fields=[
                ('lawyer', models.CharField(max_length=200, primary_key=True, serialize=False)),
                ('field', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('city', models.CharField(max_length=200)),
                ('phone', models.IntegerField()),
                ('score', models.IntegerField()),
            ],
            options={
                'db_table': 'lawyers',
                'managed': False,
            },
        ),
    ]