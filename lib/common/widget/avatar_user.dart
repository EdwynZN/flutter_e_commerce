import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widget/tonal_card.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/shared/cache_manager.dart';
import 'package:flutter_e_commerce/utils/cache_constants.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';
import 'package:flutter_e_commerce/utils/fade_slide_configuration.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _userProvider = Provider<User?>(
  (ref) {
    return ref.watch(
      authServiceProvider.select((asyncSession) {
        final Session? data = asyncSession.valueOrNull;
        return switch (data) {
          NoSession() => null,
          OAuthSession(userInfo: final user) => user,
          null => null,
        };
      }),
    );
  },
);

class UserAvatar extends HookConsumerWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(_userProvider.select((value) => value?.photoURL));
    return IconButton(
      onPressed: () {
        final user = ref.read(_userProvider);
        if (user == null) {
          return;
        }
        showModal(
          context: context,
          configuration: const FadeSlideConfiguration(
            barrierColor: Colors.black26,
            barrierDismissible: true,
          ),
          useRootNavigator: false,
          builder: (context) => _ProfileDialog(user: user),
        );
      },
      tooltip: 'Profile',
      icon: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: _Avatar(photoUrl: avatar),
      ),
    );
  }
}

class _Avatar extends HookConsumerWidget {
  final String? photoUrl;
  final double size;

  // ignore: unused_element
  const _Avatar({super.key, required this.photoUrl, this.size = 24.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasError = useState(false);
    final Widget icon;
    if (photoUrl == null || hasError.value) {
      icon = Icon(Icons.person_3, size: size);
    } else {
      icon = CircleAvatar(
        radius: size,
        backgroundImage: CachedNetworkImageProvider(
          photoUrl!,
          errorListener: (p0) => hasError.value = true,
          cacheManager: ref.watch(
            cacheManagerProvider(cacheKey: CacheConstants.profile),
          ),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: icon,
    );
  }
}

class _ProfileDialog extends HookConsumerWidget {
  final User user;
  // ignore: unused_element
  const _ProfileDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: SizedBox(
                width: 400,
                child: TonalCard(
                  elevation: 12.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 60, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        gap12,
                        Text(
                          user.name,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        gap12,
                        Text(
                          user.email,
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        gap24,
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(theme.colorScheme.error),
                            shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            minimumSize:
                                const MaterialStatePropertyAll(Size(300, 48)),
                            textStyle: MaterialStatePropertyAll(
                              theme.primaryTextTheme.bodyMedium?.merge(
                                const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            foregroundColor: MaterialStatePropertyAll(theme.colorScheme.onError),
                          ),
                          onPressed: () {
                            ref.read(authServiceProvider.notifier).logout();
                          },
                          icon: const Icon(Icons.logout_outlined),
                          label: const Text('Logout'),
                        ),
                        gap24,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 190,
            height: 144,
            child: _Avatar(photoUrl: user.photoURL, size: 72),
          ),
        ],
      ),
    );
  }
}
