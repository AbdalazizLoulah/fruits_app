import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/basket/view/widgets/custom_total.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';
import 'package:go_router/go_router.dart';

class BasketBody extends StatefulWidget {
  const BasketBody({super.key});
  @override
  State<BasketBody> createState() => _BasketBodyState();
}

class _BasketBodyState extends State<BasketBody> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomAppBar(title: "Basket", centerTitle: true),
          SizedBox(
            height: h * 0.52,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, count) {
                return CustomProductCart(
                  h: h,
                  w: w,
                  add: false,
                  icon: Icons.delete_forever_rounded,
                  title: "",
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              children: [
                Text(
                  "--------------------------------------------",
                  style: TextStyle(fontSize: h * 0.033, color: ColorApp.green),
                ),
                CustomTotal(
                  h: h,
                  title: "Subtotal",
                  price: "36.00 ",
                  colorTitle: ColorApp.gray,
                ),
                SizedBox(height: h * 0.01),
                CustomTotal(
                  h: h,
                  title: "Shipping Charges",
                  price: "1.50 ",
                  colorTitle: ColorApp.gray,
                ),
                SizedBox(height: h * 0.01),
                CustomTotal(
                  h: h,
                  title: "Bag Total",
                  price: "37.50 ",
                  colorTitle: ColorApp.green,
                ),
                SizedBox(height: h * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          fontSize: h * 0.015,
                          color: ColorApp.gray,
                          title: "4 items in cart",
                        ),
                        CustomText(
                          fontSize: h * 0.013,
                          color: ColorApp.green,
                          title: "37.50 KD",
                        ),
                      ],
                    ),
                    CustomBottom(
                      onTap: () {
                        context.go('/chickOut');
                      },
                      width: h * 0.2,
                      title: "Procced To Checkout",
                      heightBottom: h * 0.04,
                      heightText: h * 0.015,
                      colorBottom: ColorApp.green,
                      colorText: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final PageController control = PageController();
  int currentStep = 0;

  void nextStep() {
    if (currentStep < 2) {
      control.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => currentStep++);
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(title: "CheckOut", centerTitle: true),
          StepperHeader(currentStep: currentStep),

          Expanded(
            child: PageView(
              controller: control,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DeliveryTimeStep(),
                AddressStep(),
                PaymentStep(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (currentStep == 2) {
                    context.go('/signUp');
                  }
                  nextStep();
                },
                child: Text(currentStep == 2 ? "Place Order" : "Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepperHeader extends StatelessWidget {
  final int currentStep;

  const StepperHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final titles = ["Delivery Time", "Address", "Payment"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: currentStep >= index
                      ? Colors.green
                      : Colors.grey,
                ),
                Text(" - - - - - - - - - - - -")
              ],
            ),
            const SizedBox(height: 4),
            Text(
              titles[index],
              style: TextStyle(
                fontSize: 12,
                color: currentStep >= index ? Colors.green : Colors.grey,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class DeliveryTimeStep extends StatelessWidget {
  const DeliveryTimeStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Now"),
          trailing: Radio(value: true, groupValue: true, onChanged: (_) {}),
        ),

        ListTile(
          title: const Text("Select Delivery Time"),
          subtitle: const Text("09 - 15 - 2021"),
          trailing: const Icon(Icons.keyboard_arrow_down),
        ),
      ],
    );
  }
}

class AddressStep extends StatelessWidget {
  const AddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text("Address 1"),
          subtitle: Text("John Doe - Dubai"),
          trailing: Icon(Icons.check_circle, color: Colors.green),
        ),
      ],
    );
  }
}

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          title: Text("Credit Card"),
          trailing: Radio(value: 1, groupValue: 2, onChanged: null),
        ),
        ListTile(
          title: Text("Cash on Delivery"),
          trailing: Radio(value: 2, groupValue: 2, onChanged: null),
        ),
      ],
    );
  }
}
