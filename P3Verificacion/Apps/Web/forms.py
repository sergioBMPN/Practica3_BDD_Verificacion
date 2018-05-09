from django import forms

class formulario(forms.Form):
    mensaje = forms.CharField(widget=forms.Textarea, label='Introduce el texto (100 caracteres max.):', max_length = 100)
