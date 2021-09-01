Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A613FDE07
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:51:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00F173C2CE9
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:51:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E6D853C2A05
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:51:37 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 523E6140114F
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:51:37 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71A0840180
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630507896;
 bh=GcLOCrgYlTqzMNkuyCHV1x+1/z8qbyEsJ7+0L2kDsQw=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=C/4grfwHbCfFCPFfEPOWmzS0UXytcSGhMU9SBfx+HJEuOuKR8W3pM0URvkOAaP9TR
 QApUNkAEJ3UsivEDlop5jvTWuhImEhHASeCpIHdOBla8UbVBbSyUwpViYS9IDDjMbK
 iPqeSj9+Ue+FHzTthby/USZMjBmqUuDYKA8GGVJRurnDxgjpF5nCKBMuJzXwHyQuoN
 LoBPa64URfwFbYyjUgrjtQxlqr7u17HIGJfM84KiOtm92xYwdiDY0ebm3WuAseTIxS
 TrU7Cas5W4TQ54WlY3Phz9nz69TZKiMDeDXUBlHSPZUSmAraRx/7mBiRbM2M83mxRg
 CtSdWgBhyRtWQ==
Received: by mail-ed1-f70.google.com with SMTP id
 y21-20020a056402359500b003cd0257fc7fso1416286edc.10
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 07:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GcLOCrgYlTqzMNkuyCHV1x+1/z8qbyEsJ7+0L2kDsQw=;
 b=DB3ZLQNaCRt0tTOb39fwBmQy+PbygwJigFjrUpY3mieZjWwj7vDKa4Z/M9DM9jRfP6
 vfN6Oj9/4bvN/d1SHYUZrA1X1ZUvzS7MibFihAcbi+uF6tMpvS6De7uUCTANFV4QRBAP
 /3LeX9RtFncDM5Eq+CzW1hbGw/VHFCOjR8fZ2pKw8qmm8m74idTI577jR0QLOl6jOKD4
 JjQ99HzRHg5lpXbjUhkk2BeZ1+8mVRdMoeqooX16i/Gvf6UZfr2AjMEkGPnwjYplyYnJ
 pwCuKVhSowtd/1pb15TWyP1GKsQwmD7pkcrm/b78PD5AWLGGXGWYYLCwMFCJsCk+mP47
 Mh6g==
X-Gm-Message-State: AOAM531cD0yJJF6hxbm8Rdkdvo/BAP88OHlkkEez8gj3tpamlNGnNKoc
 kA221YZdg4u+5B3dK8wn09AnRPdk/bhZcdNJvr1EuzwT4xQ3H865aSnGSsycRFoUSP60SEMk+OM
 86FpfxIL+ysPgMSoKvtSg41l26ZHC
X-Received: by 2002:a17:906:3854:: with SMTP id
 w20mr36393535ejc.537.1630507891724; 
 Wed, 01 Sep 2021 07:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlMKGX+CDgLcdmMO1Zmz30Q/hWmxq9M4yTJYBQXT9+C5jciDaSSCMkL0kKnutVtFtbjLAQRQ==
X-Received: by 2002:a17:906:3854:: with SMTP id
 w20mr36393519ejc.537.1630507891558; 
 Wed, 01 Sep 2021 07:51:31 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.112.53])
 by smtp.gmail.com with ESMTPSA id v12sm57651ede.16.2021.09.01.07.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:51:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  1 Sep 2021 16:51:25 +0200
Message-Id: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] lib: add tst_get_free_pids helper program
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

Add a tst_get_free_pids helper program so shell code can get limit of
tasks/PIDs in the system without duplicating that code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/lib/.gitignore          |  1 +
 testcases/lib/Makefile            |  2 +-
 testcases/lib/tst_get_free_pids.c | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 testcases/lib/tst_get_free_pids.c

diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
index a2e9f1ef0c08..5a0e8cba2ee7 100644
--- a/testcases/lib/.gitignore
+++ b/testcases/lib/.gitignore
@@ -2,6 +2,7 @@
 /tst_checkpoint
 /tst_device
 /tst_getconf
+/tst_get_free_pids
 /tst_get_median
 /tst_get_unused_port
 /tst_kvcmp
diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
index 38813e640ab1..179b474795d3 100644
--- a/testcases/lib/Makefile
+++ b/testcases/lib/Makefile
@@ -11,6 +11,6 @@ INSTALL_TARGETS		:= *.sh
 MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
 			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
 			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
-			   tst_get_median tst_hexdump
+			   tst_get_median tst_hexdump tst_get_free_pids
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/lib/tst_get_free_pids.c b/testcases/lib/tst_get_free_pids.c
new file mode 100644
index 000000000000..276ce994b67a
--- /dev/null
+++ b/testcases/lib/tst_get_free_pids.c
@@ -0,0 +1,19 @@
+
+#define TST_NO_DEFAULT_MAIN
+#include <stdio.h>
+#include <tst_test.h>
+
+extern struct tst_test *tst_test;
+
+static struct tst_test test = {
+};
+
+int main(void)
+{
+	/* force messages to be printed from new library */
+	tst_test = &test;
+
+	printf("%i\n", tst_get_free_pids());
+
+	return 0;
+}
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
