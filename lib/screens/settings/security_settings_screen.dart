import 'package:flutter/material.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _rememberMe = true;
  bool _biometric = false;
  bool _faceId = false;
  bool _smsAuth = false;
  bool _googleAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181A20)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Security', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildSecuritySwitch('Remember me', _rememberMe, (val) => setState(() => _rememberMe = val)),
                  _buildSecuritySwitch('Biometric ID', _biometric, (val) => setState(() => _biometric = val)),
                  _buildSecuritySwitch('Face ID', _faceId, (val) => setState(() => _faceId = val)),
                  _buildSecuritySwitch('SMS Authenticator', _smsAuth, (val) => setState(() => _smsAuth = val)),
                  _buildSecuritySwitch('Google Authenticator', _googleAuth, (val) => setState(() => _googleAuth = val)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Device Management', style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFEAEA),
                foregroundColor: const Color(0xFFFF4D4D),
                elevation: 0,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              ),
              child: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSecuritySwitch(String title, bool val, ValueChanged<bool> onChange) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: Switch(value: val, onChanged: onChange, activeColor: const Color(0xFFFF4D4D)),
    );
  }
}
