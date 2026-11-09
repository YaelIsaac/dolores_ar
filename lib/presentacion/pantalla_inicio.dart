import 'package:flutter/material.dart';

import '../datos/fuentes_reales.dart';
import '../datos/fuentes_simuladas.dart';
import '../dominio/catalogo.dart';
import '../dominio/geo.dart';
import '../dominio/pasaporte.dart';
import 'ar_viewmodel.dart';
import 'pantalla_ar.dart';
import 'pantalla_modelo3d.dart';

class PantallaInicio extends StatefulWidget {
  final Pasaporte pasaporte;
  const PantallaInicio({super.key, required this.pasaporte});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  Pasaporte get pasaporte => widget.pasaporte;

  // Al regresar de la pantalla de RA se redibuja para mostrar los sellos nuevos.
  Future<void> _ir(Widget pantalla) async {
    await Navigator.push(context, MaterialPageRoute<void>(builder: (_) => pantalla));
    if (mounted) setState(() {});
  }

  void _irReal() {
    _ir(PantallaAr(
      crearVm: () => ArViewModel(
        posicion: PosicionGps(),
        brujula: BrujulaReal(),
        lugares: catalogoDolores,
        pasaporte: pasaporte,
      ),
    ));
  }

  void _irDemo() {
    // Te "teletransporta" a la Plaza Principal para practicar en el salón.
    final brujula = BrujulaSimulada();
    _ir(PantallaAr(
      crearVm: () => ArViewModel(
        posicion: PosicionSimulada(const Coordenada(21.15600, -100.93175)),
        brujula: brujula,
        lugares: catalogoDolores,
        pasaporte: pasaporte,
      ),
      controlesDemo: _DeslizadorRumbo(brujula: brujula),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dolores AR')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text('Descubre Dolores Hidalgo con realidad aumentada',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Apunta tu teléfono y mira qué lugares históricos te rodean.'),
        const SizedBox(height: 12),
        // Seguridad física y privacidad (Ronda 9 del manual).
        const Card(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '⚠️ Mira a tu alrededor, cuida tu paso y no cruces la calle viendo el teléfono.\n\n'
              '🔒 Tu ubicación se usa solo mientras la app está abierta, se procesa en tu '
              'teléfono y no se envía a ningún servidor.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: _irReal,
          icon: const Icon(Icons.explore),
          label: const Text('Explorar con GPS real'),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: _irDemo,
          icon: const Icon(Icons.school),
          label: const Text('Modo demo (salón de clases)'),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => _ir(const PantallaModelo3D()),
          icon: const Icon(Icons.view_in_ar),
          label: const Text('Modelo 3D en tu espacio'),
        ),
        const SizedBox(height: 24),
        Text('Lugares del recorrido (🏅 ${pasaporte.total}/${catalogoDolores.length})',
            style: Theme.of(context).textTheme.titleMedium),
        for (final l in catalogoDolores)
          ListTile(
            leading: Text(l.emoji, style: const TextStyle(fontSize: 26)),
            title: Text(l.nombre),
            trailing: Icon(pasaporte.visitado(l.id) ? Icons.verified : Icons.circle_outlined),
          ),
      ]),
    );
  }
}

class _DeslizadorRumbo extends StatefulWidget {
  final BrujulaSimulada brujula;
  const _DeslizadorRumbo({required this.brujula});
  @override
  State<_DeslizadorRumbo> createState() => _DeslizadorRumboState();
}

class _DeslizadorRumboState extends State<_DeslizadorRumbo> {
  double _grados = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(children: [
        const Text('Gira:', style: TextStyle(color: Colors.white)),
        Expanded(
          child: Slider(
            min: 0,
            max: 359,
            value: _grados,
            onChanged: (g) {
              setState(() => _grados = g);
              widget.brujula.girar(g);
            },
          ),
        ),
        Text('${_grados.round()}°', style: const TextStyle(color: Colors.white)),
      ]),
    );
  }
}
