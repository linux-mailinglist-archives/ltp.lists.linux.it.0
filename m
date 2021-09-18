Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1974104C5
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 09:27:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 408F03C881C
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 09:27:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 795903C9087
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 09:26:40 +0200 (CEST)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 10B40600719
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 09:26:40 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so5283453pjb.4
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 00:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVnY1eLSSWQx8dEph8Tflb/HHXFXgdneQTgH0vAAwuo=;
 b=p8G+wn/a2ggcpPsAdXV25wTDv6jW6Aq+Zgzx5tEqYktUkxhulrpqzEtN5JDUxzf8Wa
 qrF8sbI3Tx5Jk+Koi11miGj9Vl7XhQ/YPrEiLnUGQ6JO5IdP9NJjLfgx/+PPCEqYzsjk
 1sKzVKniaVDElBkxwYvQkeT2WIu7XarzOusOGZzcnZhqzHLbva15CRFTZ7ekQB5g0+0L
 eK5/ReWfT/XJ4WXOV/K7svJOf7nJNt7wmqqHZB1Ymr9FiiXx/AV6wLcBZ8qGWs3d7lb2
 F+cGIXN6IeIk3tzXouroi0bdNyqbR8THXmMgRFC4VRjFfdnnicyzSazRyx2uj/iWuq5Z
 w7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVnY1eLSSWQx8dEph8Tflb/HHXFXgdneQTgH0vAAwuo=;
 b=GdvwX8LDEisCFoHupY3rFxFkyyPgH25N3tPBLSdPhUmC0lTJ9gOjm8drMwtgKHT4l9
 CjI46JZhhycU0x4Eh96GMEHel1JNQYcfHyL5Db4Rkr7xipDcjE28///fes56T1MQHwuY
 y6yneXCsWmkNppJ7v1eGzfsJKSa/TIdaFcSaASACCnkzEOXeYKJbB5oAZTrMz0cuqPVd
 jtRD6RUFSoMCEj33oR0VUaenUm/eMkO5FGFSi/+ojnQaHUD3ixIpcSosnvw2Edqziv11
 Pjgcf6S/Z7W4iTQYyYStEMjH3lnk8DfXS4MBb8bDVJlWWGyIzy6lCZVIzD3AAWZmb2h3
 N4Mg==
X-Gm-Message-State: AOAM5323zOjClvpTskNZq4NuTd8nuAiMjZys9qOMJXYX3aykCs5OADdE
 gJuP5wXdgLfBs9H9cy7FXzlYR8vDrYbznc/x
X-Google-Smtp-Source: ABdhPJwD3HU9q72JY6socVJ08+JUTMOfAVyRmAIctMZrEA13C0Hu4eHEIANCBVxvaHMOwQsJJrz09A==
X-Received: by 2002:a17:90b:4f45:: with SMTP id
 pj5mr16182091pjb.19.1631949998562; 
 Sat, 18 Sep 2021 00:26:38 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id 4sm7334159pjb.21.2021.09.18.00.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 00:26:38 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 18 Sep 2021 16:26:09 +0900
Message-Id: <20210918072609.8576-6-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210918072609.8576-1-qi.fuli@fujitsu.com>
References: <20210918072609.8576-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/5] syscalls/dup2: rename dup205 to dup204
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 runtest/syscalls                                      | 1 -
 testcases/kernel/syscalls/dup2/.gitignore             | 1 -
 testcases/kernel/syscalls/dup2/Makefile               | 2 +-
 testcases/kernel/syscalls/dup2/{dup205.c => dup204.c} | 0
 4 files changed, 1 insertion(+), 3 deletions(-)
 rename testcases/kernel/syscalls/dup2/{dup205.c => dup204.c} (100%)

diff --git a/runtest/syscalls b/runtest/syscalls
index 29d7752c7..75304f2f1 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -152,7 +152,6 @@ dup201 dup201
 dup202 dup202
 dup203 dup203
 dup204 dup204
-dup205 dup205
 
 dup3_01 dup3_01
 dup3_02 dup3_02
diff --git a/testcases/kernel/syscalls/dup2/.gitignore b/testcases/kernel/syscalls/dup2/.gitignore
index 6c4685b80..0c9a8cd75 100644
--- a/testcases/kernel/syscalls/dup2/.gitignore
+++ b/testcases/kernel/syscalls/dup2/.gitignore
@@ -2,4 +2,3 @@
 /dup202
 /dup203
 /dup204
-/dup205
diff --git a/testcases/kernel/syscalls/dup2/Makefile b/testcases/kernel/syscalls/dup2/Makefile
index 28fc158e4..fcdd146b7 100644
--- a/testcases/kernel/syscalls/dup2/Makefile
+++ b/testcases/kernel/syscalls/dup2/Makefile
@@ -6,7 +6,7 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 ifeq ($(ANDROID),1)
-FILTER_OUT_MAKE_TARGETS	+= dup201 dup205
+FILTER_OUT_MAKE_TARGETS	+= dup201 dup204
 endif
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/dup2/dup205.c b/testcases/kernel/syscalls/dup2/dup204.c
similarity index 100%
rename from testcases/kernel/syscalls/dup2/dup205.c
rename to testcases/kernel/syscalls/dup2/dup204.c
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
