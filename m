Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 927593FDE66
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 17:17:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 613FF3C2BD6
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 17:17:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1AFE3C29D6
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 17:17:12 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 21D8D200CFD
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 17:17:11 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7F2F440179
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630509431;
 bh=6XB07dGAyi0zKgVc8Aj8oitVYW3LbrLxu6qXAJ+VOf8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=f2j3Rkcnh2HfuOmuj01N6ZAAA+TVhbB34Dw7TXhiWZvHWjHHKEEdqGhfw4VqAI7vB
 YwBnFMKaQLB6GWmUHM1f66Fvq/l9SIhHz544HmgIeqJaAFJfB0HGUrqe7Tdn8zDrSR
 cVNROwWMfyJ5vVtDkbeN/31fcFWV8cixhUAmSTKk/1m130cvl7glcJypro0C/iP2FS
 JQQAThCZe+VqkSWO3CYLcuSWKFqFC+tbAgQahgC+vvwI1q20khj0uOe8W9D6p4rKf+
 +AGjY7R1cEoB9iVT+kkwffs6nKpYE6/+bvu3xC37xKSvtmpljLoCsZxjIDFyws8ni/
 aR9gPcExOKQqQ==
Received: by mail-wm1-f71.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso1181965wmr.0
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 08:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XB07dGAyi0zKgVc8Aj8oitVYW3LbrLxu6qXAJ+VOf8=;
 b=av6tCtcbw2MMjJz0w2dqWd8puD6XMCltDOCKnKrlIEDd0fDNCsh70CIwEVq9kLxub1
 Ej0a18eV0682HtLRlIpAxbu8A2/DJOBQCxzGLlhe/srWY6fdtGG7Hg1sYCrUmfitpS5R
 e0E7XCK3Be13aO0aqKkSpxF79yiP5WnsBSU0HtAjIIJSIWQrNHAShf6szoSevxboV7rg
 NiXVKC2feLujz3dXh5Q95tVyZIwC+kUJrsat9mbhNhkbba+s6o1B6g586DcZdNyvsiDb
 AvX6YMztaqqL4NgDakcuX2rveNF5HD8tlrfdJhn/xIYqFuyUcRMTHclqUBy/F4+OCH60
 FsGw==
X-Gm-Message-State: AOAM5319W3SG3BxjTf+oYTwxGcGSuFJ6BePdzp9f0iwiKPK1YZLT0kxr
 sEw/5VYWp+OJdzKRQFay4eONrTq9oQHiXMmezhCLz6ig6hn2HWvhAHjUq7VceyHalqVkdq03hRu
 uGObRYIGE/+j8i2hIg3TYYjGH/wio
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr1233wmc.148.1630509430567;
 Wed, 01 Sep 2021 08:17:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgZg7TP+Ekz5sdThv7f5v11bOd1/2brh/K+j6XpCOCpGNzpiAwjeN3TjhcntBljS8JumKvbg==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr1218wmc.148.1630509430414;
 Wed, 01 Sep 2021 08:17:10 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.112.80])
 by smtp.gmail.com with ESMTPSA id a5sm5536177wmm.44.2021.09.01.08.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:17:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  1 Sep 2021 17:16:53 +0200
Message-Id: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/3] lib: add tst_get_free_pids helper program
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

Changes since v4:
1. Add SPDX

Changes since v3:
1. New patch
---
 testcases/lib/.gitignore          |  1 +
 testcases/lib/Makefile            |  2 +-
 testcases/lib/tst_get_free_pids.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)
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
index 000000000000..d7b68c620614
--- /dev/null
+++ b/testcases/lib/tst_get_free_pids.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
