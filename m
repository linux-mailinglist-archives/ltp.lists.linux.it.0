Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5B3B1DA3
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:30:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73AC63C9B11
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:30:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 90A5B3C202C
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:30:10 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DE56E600F29
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:30:09 +0200 (CEST)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw4pN-0003qr-3e
 for ltp@lists.linux.it; Wed, 23 Jun 2021 15:30:09 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 j2-20020a05600c1c02b02901cecbe55d49so234088wms.3
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1f2P/rWsiPK1/0YS1mWIQAFtLc/9cfWxZMQb/75dfTA=;
 b=D9khVhlLwn4QpeTEdxYyACLAsiWLO/NkcOZ0cIeLNf7N7hHzLlkpnEyQ8Tdldc84gt
 UvkhvqTYMxDgA3WtkMqFCcPiixTAPF9ym81+kUSbsAOkJmZNGUyr/ai0jPO8Yr9wyD0h
 O5BLCZpPHOdrDAq5jRhoN93sdDE4l5ogljbX9NULKrQQnqjkmxxsR7upWZK7rA4uKd4I
 IuabIkNbuv/FPWzLzrcRKeUte8pAqmmLvnx3cA0Gl13d8PisD/rqAh6OOGOxtdbAVrsY
 rhCQVcZXoFfbYAgYxiZzpVIGPwhbJ6CbNeQHr8mpg6qsDF/zgFQpYAyc+SEQF+cAjtB6
 5PLA==
X-Gm-Message-State: AOAM531Cp5cstixKYybDgsoBWN55cL4nUlkTwwGNDnCtVgc0WBvdUQOP
 BdT1F6Ye2uwEVLkYU3Jt8KN6cjknNStnhK7tSMtEr0Q/IrOR3+5yoB8yAfFuk812aHk3joU+5Ar
 jm4Fj+xxvqM79Xa/N/D70WoOexBJN
X-Received: by 2002:a1c:d1:: with SMTP id 200mr289241wma.85.1624462208214;
 Wed, 23 Jun 2021 08:30:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXZSXACkUT2zVIq3c2gXwScL1w1GnJDLAxGcOCLGaCvMoDzh03FEcUlYupOmW/Q5XgpvynbA==
X-Received: by 2002:a1c:d1:: with SMTP id 200mr289211wma.85.1624462208006;
 Wed, 23 Jun 2021 08:30:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id i16sm285927wmm.9.2021.06.23.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:30:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 17:30:02 +0200
Message-Id: <20210623153003.94404-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: Add tst_virt_hyperv
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

Move the Microsoft Hyper-V detection to lib/ so it can be reused in
further tests.  Add it also to the newlib.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch.
---
 .../include/cpuhotplug_testsuite.sh            | 15 ---------------
 testcases/lib/test.sh                          | 16 ++++++++++++++++
 testcases/lib/tst_test.sh                      | 18 ++++++++++++++++++
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh b/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
index 291dc5ab2b7e..7dd0ebaae069 100644
--- a/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
@@ -50,21 +50,6 @@ assert ()                 #  If condition false,
   fi
 }
 
-# Detect whether running under hypervisor: Microsoft Hyper-V
-# Return 0: running under Hyper-V
-# Return 1: not running under Hyper-V (bare metal, other hypervisor or
-#           failure of detection)
-tst_virt_hyperv()
-{
-	local v="$(systemd-detect-virt)"
-	# TODO: once converted to newlib, use tst_cmd_available
-
-	[ $? -eq 0 ] || return 1
-	[ "$v" = "microsoft" ] || return 1
-
-	return 0
-}
-
 ############################################################
 ## Process management                                     ##
 ############################################################
diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh
index a15fb0540d3e..3facb7fd1f9d 100644
--- a/testcases/lib/test.sh
+++ b/testcases/lib/test.sh
@@ -321,6 +321,22 @@ tst_mkfs()
 	ROD_SILENT mkfs.$fs_type $fs_opts $device
 }
 
+# Detect whether running under hypervisor: Microsoft Hyper-V
+# Return 0: running under Hyper-V
+# Return 1: not running under Hyper-V (bare metal, other hypervisor or
+#           failure of detection)
+tst_virt_hyperv()
+{
+	local v
+	
+	v="$(systemd-detect-virt)"
+
+	[ $? -eq 0 ] || return 1
+	[ "$v" = "microsoft" ] || return 1
+
+	return 0
+}
+
 tst_umount()
 {
 	local device="$1"
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 8b4e9cb6007b..f0b47e2d6e2c 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -326,6 +326,24 @@ tst_mkfs()
 	ROD_SILENT mkfs.$fs_type $fs_opts $device
 }
 
+# Detect whether running under hypervisor: Microsoft Hyper-V
+# Return 0: running under Hyper-V
+# Return 1: not running under Hyper-V (bare metal, other hypervisor or
+#           failure of detection)
+tst_virt_hyperv()
+{
+	local v
+	
+	tst_cmd_available systemd-detect-virt || return 1
+
+	v="$(systemd-detect-virt)"
+
+	[ $? -eq 0 ] || return 1
+	[ "$v" = "microsoft" ] || return 1
+
+	return 0
+}
+
 tst_cmd_available()
 {
 	if type command > /dev/null 2>&1; then
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
