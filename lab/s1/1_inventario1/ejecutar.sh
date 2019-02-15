#!/bin/bash

ansible -i miinventario --list-hosts all

ansible -i miinventario --list-hosts vigo


ansible -i miinventario --list-hosts 'vigo:!escritorios'

ansible -i miinventario --list-hosts 'vigo:&escritorios'

