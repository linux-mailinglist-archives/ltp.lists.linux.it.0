Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF0B17140
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Jul 2025 14:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1753965022; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=p1WHj/SDOe+h9Fothvv6IcEqGjI3rIt06epEr/C2rYQ=;
 b=DxbrMSno99k+HLODruo00eNMV7qjrTLcku+gyDREUpU1hU835fMd+eDx0LPP3kJ3LCSbx
 DqXcLGy5jWj0zzjH8InopEVD1tTVNEYv+JDlF9w84WdwdeJ4PU7j5q4EWO/uksy7uXuF1/E
 lnw2vP1IfiLVRnLw7Vm5j/6AChAqi24=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47F5B3CBFDA
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Jul 2025 14:30:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC6573C621B
 for <ltp@lists.linux.it>; Thu, 31 Jul 2025 14:30:20 +0200 (CEST)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 34989200240
 for <ltp@lists.linux.it>; Thu, 31 Jul 2025 14:30:20 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so314526f8f.1
 for <ltp@lists.linux.it>; Thu, 31 Jul 2025 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1753965019; x=1754569819; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mJDmioCeGPs84RzHATuJ/C0Es0Xqy9upRIGg9ErmK0=;
 b=LRy5s9ysYluRVO7VGkhYYG1UNCaUFTDL9dlf6WlaAVf1d3f6Cu55V5cs0XppNyhMk4
 ec5E2O2GE+Xy9/IdbpdmYfRWgWdRTvG7b3XmMemU+tzU5QTRpTO4/qWLg4UKJDXfemzz
 qCgIFrLuL4Cylo6Ov+u88ABP7kHfdq9TjZVGgCyJJRWfT6DA4soBV4DEYDqQ9A9avPCM
 ajh4N0PldMutnw9hBOCIAqRaHBgjrfF9/dbrby9hUQSFX0TY6Zq9dl2OIjBcWg59gv1/
 H4H9FKu8NuoYy9i0hi41p6sy7jJOdo+wuFGGZ8e4qngoWlNXLSssj59uYXNwqSYzZ7qp
 rD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753965019; x=1754569819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7mJDmioCeGPs84RzHATuJ/C0Es0Xqy9upRIGg9ErmK0=;
 b=G6CHyPY9kDp2pTt2t5XnZo81G5n0z9HG+zrPl8w1ZRRyEtx765S2cPrbWpvSzoP2ex
 csT7zDScwsw6hYzvMhC91LSUSAiHk5gN2DJo7FQ67R/q6tqbgHF5WqSVYuEWPciB6JLm
 tDN+JtN2p6N1l+eFzbOx8zdbLAKoMxJtu8vRM9ZvVTQfWBvvUwrOgtaXtiDZRhc0AKeE
 ZHApSxuTaq4lD66MJUo166j81Gaj//BIuzLLQ0jlv1lJ1v+bS5fsxYsaJhPUklY40bVT
 0dGPxZNIluCw7B6RDg3ryt/baSXGTHdK5FncZlpiJEZ3EYXJjPVFJ73KFM7Lv2Rm/FHT
 rkZQ==
X-Gm-Message-State: AOJu0YwWVjg4epmhWw6eoHPRk8sZT41thegsWd3fYQBczhYaCeNwf3wh
 KhfsdnrqvMe8CvnfxV/0tuBDl26iNDQnqTrege2Brh4xZXcKfjV3xdlcf9X+40Oe1RkT1XqtIEB
 QW5k=
X-Gm-Gg: ASbGncvC6qwd/jiAnfFQ6TwZZzgHdoc9LC1FPHj7siCfLjkIresjQjvi2mSYmm2kJbN
 IVpnV8EMXTJgKer3fPG9qnuti8/34bj9IMpDQcOP2i8W85wPvmN7RCl6iuaDgiMdDOJY0XqrXg7
 672wbucv5AohVyXs0EmRs1YU9Z8NoLwroSWtSNVxnpsw1T8a8fHY4w0/VGJ4lzt4l19Q6QYzY7n
 595eT2P12ozegkgXwXfpEx/7qvUZzTRTz4uTeeMbGS7SycttGZJY4i+JDqXNlny57qwmYaLb3VH
 Yk+gurdfOKXA+eDozv85gdLqgGqR4o7RNUy/i1HQCfR4Gxu0Cw2ZiJW1kLWBixu6DBgFd7eCFha
 UEyejubt/aa0=
X-Google-Smtp-Source: AGHT+IG2oP+AF58RfEcRdSkN7apNqOilEmRTdzDsI/crY6qsoojgJsUSVs/DTNT6hRWNm97OyRlBCw==
X-Received: by 2002:a05:6000:2003:b0:3b7:886b:fb8d with SMTP id
 ffacd0b85a97d-3b795026234mr5211143f8f.31.1753965019272; 
 Thu, 31 Jul 2025 05:30:19 -0700 (PDT)
Received: from localhost ([202.127.77.110])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3207eca6d8dsm1900036a91.24.2025.07.31.05.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 05:30:18 -0700 (PDT)
To: ltp@lists.linux.it
Date: Thu, 31 Jul 2025 20:28:57 -0400
Message-ID: <20250801002918.1751299-1-wegao@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731143358.1035685-1-wegao@suse.com>
References: <20250731143358.1035685-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] mount08.c: Check EACCES error when test under
 selinux enabled in enforce mode
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test case expected ENOENT but get EACCES when selinux enabled in enforce mode.
This patch add check errno under selinux.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/mount/mount08.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/mount/mount08.c b/testcases/kernel/syscalls/mount/mount08.c
index e2824ac55..fb2b28736 100644
--- a/testcases/kernel/syscalls/mount/mount08.c
+++ b/testcases/kernel/syscalls/mount/mount08.c
@@ -6,6 +6,8 @@
 /*\
  * Verify that mount will raise ENOENT if we try to mount on magic links
  * under /proc/<pid>/fd/<nr>.
+ * If SELinux is enabled, the expected error also can be EACCES since
+ * SElinux plicy could be configured to block the operation.
  */
 
 #include "tst_test.h"
@@ -16,6 +18,12 @@
 #define FOO MNTPOINT "/foo"
 #define BAR MNTPOINT "/bar"
 
+static int exp_errnos_num;
+static int exp_errnos[] = {
+	ENOENT,
+	EACCES,
+};
+
 static void run(void)
 {
 	char path[PATH_MAX];
@@ -29,9 +37,9 @@ static void run(void)
 
 	sprintf(path, "/proc/%d/fd/%d", getpid(), proc_fd);
 
-	TST_EXP_FAIL(
+	TST_EXP_FAIL_ARR(
 		mount(BAR, path, "", MS_BIND, 0),
-		ENOENT,
+		exp_errnos, exp_errnos_num,
 		"mount(%s)", path
 	);
 
@@ -41,6 +49,11 @@ static void run(void)
 
 static void setup(void)
 {
+	exp_errnos_num = ARRAY_SIZE(exp_errnos) - 1;
+
+	if (tst_selinux_enforcing())
+		exp_errnos_num++;
+
 	SAFE_TOUCH(FOO, 0777, NULL);
 	SAFE_TOUCH(BAR, 0777, NULL);
 }
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
