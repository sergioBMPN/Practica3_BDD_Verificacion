from django.shortcuts import render, redirect
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader, Context
from .forms import formulario
from .strings_example import StringsExamples


# Create your views here.
def contador(request):
    if request.method == 'POST':
        form = formulario(request.POST)
        if form.is_valid():
            mensaje = form.cleaned_data['mensaje']
            resultado = StringsExamples.count_words(mensaje)
            form = formulario()
            return render(request, 'contador.html', {'mensaje': resultado, 'form': form})
    else:
        form = formulario()
    return render(request, 'contador.html', {'form': form})