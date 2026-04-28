import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme.dart';

void main() {
  runApp(const ProviderScope(child: ScamApp()));
}

class ScamApp extends StatelessWidget {
  const ScamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCAM Mesh',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppTheme.background,
        ),
        child: Stack(
          children: [
            // Ambient Gradients
            Positioned(
              top: -100,
              right: -100,
              child: _AmbientGlow(color: AppTheme.secondaryNeon.withOpacity(0.2)),
            ),
            Positioned(
              bottom: -150,
              left: -100,
              child: _AmbientGlow(color: AppTheme.primaryNeon.withOpacity(0.15)),
            ),

            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  // Premium Logo Container
                  Center(
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryNeon.withOpacity(0.2),
                            blurRadius: 40,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'SCAM',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'NEXT-GEN MESH PROTOCOL',
                    style: GoogleFonts.orbitron(
                      color: AppTheme.primaryNeon,
                      fontSize: 12,
                      letterSpacing: 6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  
                  // Action Buttons with Glass Effect
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        _GlassButton(
                          onPressed: () {},
                          label: 'CREATE NEW IDENTITY',
                          isPrimary: true,
                        ),
                        const SizedBox(height: 16),
                        _GlassButton(
                          onPressed: () {},
                          label: 'IMPORT EXISTING',
                          isPrimary: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Encrypted by Noise Protocol',
                    style: GoogleFonts.inter(
                      color: Colors.white24,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AmbientGlow extends StatelessWidget {
  final Color color;
  const _AmbientGlow({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isPrimary;

  const _GlassButton({
    required this.onPressed,
    required this.label,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: isPrimary
            ? const LinearGradient(
                colors: [AppTheme.secondaryNeon, AppTheme.accentPink],
              )
            : null,
        border: isPrimary ? null : Border.all(color: AppTheme.glassBorder),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

