Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A744B7713F
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 20:25:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E79F3C1D19
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 20:25:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 805093C1CFA
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 20:25:44 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E9AB21401B54
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 20:25:35 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id s1so18844767pgr.2
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7lt3e9ymEPMzU7/ZOCE+yjkZp0KTJKWEjIqLPlumwo=;
 b=lmaOCJ3u72MBrCXDKxYZAEMj91PvZ/CMq3Fnjs8P9pOeH9wzpdplb/oM/jOfiWnqkG
 ZAbV88sAqbw2RX6yaH8dvNpCJ7HHN2l6+Vy+3+wMjLB5OYL89jflay3GCzKqGUW7qV67
 74KmyAnLGEz/ytSYKmqhQuBrWEMsBv/Zeappo/8RiS0t+3MJs9x4pUaytGb6RLwRWXGO
 l8v8v+kmgX8KjLz9F/g670YKxmHpqpYB049qXJDV2km3tvKOZYq+0AQnIjWsT8M3icNu
 OKLiWUzOD2Qyas6LowkKSPGe5Bcj3xShNMpCJu7GmNgUID1FLlOcNJOUWiXsOAYH3IdX
 jRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7lt3e9ymEPMzU7/ZOCE+yjkZp0KTJKWEjIqLPlumwo=;
 b=fVAGYNYi9SEsQnpiRiqQkZ9GE1J474CRWEtTbtu1Kf+RPV/m/bIyyv/KvY/OI2ZutG
 fzdu4LXHUbReZiI7/c9KN3nuYEFlAakudb/wfbN7it83zVeMGIbpZuangCVEjRAbFLZB
 KwJIgpn3vHu2KJQ402iMdaysE5gmaSKDFizFGFVkTc9kR436l3xe0qvcDXzO0DgaQTG3
 UDgcOkyGV/KBQJSXhO1rGeal/3m0pvPfJsTN0jP6SmgcE50SW6XO3n+zsdaM40GMapG5
 AmFh7yHrNv3NTwO4xsc2VWP9YcBXj2n5VU3L7hYPaMlrAXmDhAEDmzISTywfoNP+19+S
 YddQ==
X-Gm-Message-State: APjAAAUHO2wJLs2hBgxSh5VYfE2wHmkGGxP5bKJu6G1WZmM3XZhDT7km
 CBlDCxLvu/Kld/X6ulm4hlFY11AzOVs=
X-Google-Smtp-Source: APXvYqypDpz2KakRUzU+FOP/mVh8QZJoO6kC50Xxr951SG7oSmemp9gwa/3i3ErucK+R6YpdejZkFQ==
X-Received: by 2002:a17:90a:d998:: with SMTP id
 d24mr72031007pjv.89.1564165534105; 
 Fri, 26 Jul 2019 11:25:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
 [73.71.176.3])
 by smtp.gmail.com with ESMTPSA id j20sm51230978pfr.113.2019.07.26.11.25.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 11:25:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Fri, 26 Jul 2019 11:25:24 -0700
Message-Id: <20190726182524.43149-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726182524.43149-1-raj.khem@gmail.com>
References: <20190726182524.43149-1-raj.khem@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] check for RES_USE_INET6 during configure
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
since 2.26 release, this check ensures that we detect it before using it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 configure.ac                                        | 13 +++++++++++++
 testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/configure.ac b/configure.ac
index 2255b5c181..ed7acccb01 100644
--- a/configure.ac
+++ b/configure.ac
@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \
     vmsplice \
 ])
 
+#check defines
+AC_MSG_CHECKING([for RES_USE_INET6])
+AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include <resolv.h>]],
+  [[char dummy[RES_USE_INET6];]])],
+  [
+    AC_MSG_RESULT([yes])
+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to 1 if you have the RES_USE_INET6 macro.])
+  ],
+  [
+    AC_MSG_RESULT([no])
+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to 1 if you have the RES_USE_INET6 macro.])
+  ]
+)
 # Tools knobs
 
 # Expect
diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
index 9cc15d086b..d1cae5441a 100644
--- a/testcases/network/multicast/mc_gethost/mc_gethost.c
+++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
@@ -17,6 +17,8 @@
 #include <string.h>
 #include <stdlib.h>
 
+#include "config.h"
+
 #ifndef LOG_PERROR
 #define LOG_PERROR 0
 #endif
@@ -50,8 +52,12 @@ usage:
 		argv++, argc--;
 	}
 	if (argc >= 1 && !strcmp(*argv, "-6")) {
+#if HAVE_RES_USE_INET6
 		af = AF_INET6, size = IN6ADDRSZ;
 		_res.options |= RES_USE_INET6;
+#else
+		af = AF_INET, size = INADDRSZ;
+#endif
 		argv++, argc--;
 	}
 	if (argc >= 1 && !strcmp(*argv, "-f")) {
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
