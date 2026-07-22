import 'dart:async';
import 'package:flutter/material.dart';
import 'create_new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<String> _otpCode = ['4', '6', '7', ''];
  int _secondsLeft = 55;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onKeyPress(String val) {
    setState(() {
      for (int i = 0; i < _otpCode.length; i++) {
        if (_otpCode[i].isEmpty) {
          _otpCode[i] = val;
          break;
        }
      }
    });
  }

  void _onBackspace() {
    setState(() {
      for (int i = _otpCode.length - 1; i >= 0; i--) {
        if (_otpCode[i].isNotEmpty) {
          _otpCode[i] = '';
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'You\'ve Got Mail 📩',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'We have sent the OTP verification code to your email address. Check your email and enter the code below.',
                      style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
                    ),
                    const SizedBox(height: 32),

                    // OTP Boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        final val = _otpCode[index];
                        final isSelected = index == 2; // match image highlight
                        return Container(
                          width: 64,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? const Color(0xFFFF4D4D) : Colors.grey.shade200,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              val,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),

                    // Resend Code Timer
                    Center(
                      child: Column(
                        children: [
                          const Text('Didn\'t receive email?', style: TextStyle(color: Colors.black54, fontSize: 13)),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('You can resend code in ', style: TextStyle(color: Colors.black54, fontSize: 13)),
                              Text(
                                '$_secondsLeft s',
                                style: const TextStyle(color: Color(0xFFFF4D4D), fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D4D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 0,
                        ),
                        child: const Text('Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // On-screen Numpad
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              color: Colors.white,
              child: Column(
                children: [
                  _buildNumpadRow(['1', '2', '3']),
                  const SizedBox(height: 16),
                  _buildNumpadRow(['4', '5', '6']),
                  const SizedBox(height: 16),
                  _buildNumpadRow(['7', '8', '9']),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumpadButton('*', onTap: () {}),
                      _buildNumpadButton('0', onTap: () => _onKeyPress('0')),
                      _buildNumpadButton('', isBackspace: true, onTap: _onBackspace),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumpadRow(List<String> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((val) => _buildNumpadButton(val, onTap: () => _onKeyPress(val))).toList(),
    );
  }

  Widget _buildNumpadButton(String label, {bool isBackspace = false, required VoidCallback onTap}) {
    return SizedBox(
      width: 70,
      height: 48,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: isBackspace
              ? const Icon(Icons.backspace_outlined, color: Colors.black87, size: 22)
              : Text(
            label,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
