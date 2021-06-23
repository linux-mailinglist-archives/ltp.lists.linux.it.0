Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016F3B1B5C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:42:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22E5D3C6FDC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:42:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE1F93C2B93
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:41:59 +0200 (CEST)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4E56060143D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:41:59 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id j1so2703089wrn.9
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=biYlXzWrOxt6OJPagY5lXWUJRi0LM20l2G/8OGzbZpM=;
 b=PXwfsVudtJcwjqziVtquJBmCHspNIa5Ln2KPHeXCMdkAvSA8uirFS6/oFFEs24Qgua
 s0j/Q+08u4MZu5GbJjXwHfPw9fnvxyFMw74JtR4P2ih+CXaoEsE9Gp/B4goq8+zSSVwW
 Zz+SWt/VjQruP2qwxyg+Wxk14oYTEXbFtFkvzlegydzpkUYJ/LV728ZoUKgc5mBdwJjZ
 h8e0zWyHn/QvyTXKswzBpWOcin0SQvNgGahI2zFkGRqhFZvHFumlbkKtGvhUaVeoKAXQ
 wn3NV1vV4aXjAWf0DB20UXs0PKb8//VCYbPMoZbwI+eMUfBKUhXBpHlbIzlKX7r3B90n
 alpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=biYlXzWrOxt6OJPagY5lXWUJRi0LM20l2G/8OGzbZpM=;
 b=uDLNh1vm7ISL0/D2I6lcWvVH6V3JXi36p9PsZFXrEc+xS741dnGac4AEnW2c6lFpqk
 lAHibMSQSjKwtb9YWB/PsJ1eWk8PJEi+tPJQ+fuN0tzuzg9dYTxpE1Ts3n+fOMWjRBM2
 O6AvUFXEbsHtld1h8orwWHelDvwNK4qOb0s2WVOAfMBZMlJlNHB705ITHKnDv2c1EG/I
 DHwyFbe3tpK9riG98EGBhbiZxK38C/3f3kAHlxzeRTpjjpyvq8h3PdNxAN6Z81UfFi3z
 EoltRh3xqCQXO4YnHf3FnsWWx5kONYW4aFXmggj2zri1lwXs7YIMqvsyXIPonSf28j/p
 yNKw==
X-Gm-Message-State: AOAM532VzMEQsj/O2AkR2YRt/HRwxi0RAKhVWPOQxJoHkKbFejPOpOVU
 rk5Zk57EsRPAgA99qeX1NX2JiEk6V6Xahfmu
X-Google-Smtp-Source: ABdhPJxjR5BYzjJ7egrZFZZkUE+IcHo6lN/Wzcfkd/c5FLW4qZjZpNNFzoKVGiYSyfH/En/6p76Q6Q==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr58497wru.133.1624455718657;
 Wed, 23 Jun 2021 06:41:58 -0700 (PDT)
Received: from balsini.lon.corp.google.com
 ([2a00:79e0:d:210:561f:bdab:3ac5:519b])
 by smtp.gmail.com with ESMTPSA id r1sm5814922wmn.10.2021.06.23.06.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:41:58 -0700 (PDT)
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 14:40:41 +0100
Message-Id: <20210623134041.366838-1-balsini@android.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] getrlimit/getrlimit03: fix unavailable __NR_getrlimit
 for arm
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
From: Alessio Balsini via ltp <ltp@lists.linux.it>
Reply-To: Alessio Balsini <balsini@android.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

__NR_getrlimit has been deprecated from arm EABI, and is only available
if the OABI_COMPAT config option is defined.
This causes failures with the current test as it assumes that
__NR_getrlimit exists if __NR_ugetrlimit is defined, while this
assumption does not hold anymore.

Catch this exception by testing if __NR_getrlimit is defined and the
target is arm.

Signed-off-by: Alessio Balsini <balsini@android.com>
---
 testcases/kernel/syscalls/getrlimit/getrlimit03.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
index 319bc494a..e46a25f7b 100644
--- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
+++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
@@ -45,6 +45,14 @@
 #define __NR_getrlimit_ulong_str	"__NR_getrlimit"
 #endif
 
+/**
+ * __NR_getrlimit has been deprecated from arm EABI and moved to OABI_COMPAT,
+ * so the syscall may or may not be available.
+ */
+#if defined(__arm__) && __NR_getrlimit == __LTP__NR_INVALID_SYSCALL
+#define DEPRECATED_GETRLIMIT
+#endif
+
 #ifndef HAVE_STRUCT_RLIMIT64
 struct rlimit64 {
 	uint64_t rlim_cur;
@@ -167,7 +175,7 @@ static void run(unsigned int resource)
 	tst_res(TPASS, "__NR_prlimit64(%d) and %s(%d) gave consistent results",
 		resource, __NR_getrlimit_ulong_str, resource);
 
-#if SIGNED_GETRLIMIT
+#if SIGNED_GETRLIMIT && !defined(DEPRECATED_GETRLIMIT)
 	errno = 0;
 	ret_l = getrlimit_long(resource, &rlim_l);
 	errno_l = errno;
-- 
2.32.0.288.g62a8d224e6-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
