Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC12DDED3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:07:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F3313C6179
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:07:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0A23D3C2A46
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:39 +0100 (CET)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2D7AD600CFA
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:39 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id 6so1704475ejz.5
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 23:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwaNCMilkmzhmkYonneEMsAUJQamaMIN6TA4YoYrKY0=;
 b=RylsMFlPQNhshinUX5y3n0dupon7cskVSGepY0iqEI8caagCLZTcLlldKkzkU4IjKz
 8fMrpr1xWXEKPZx07k28cexIodPziAH51tjQc6xYeMyXNuo31xleHbfD6eJB4Y/HF/Jm
 Vm/HVlSWIOul3GhxY033arxbzPNITlU3z2aOInUyHq+tJ3QAhWAdFTyRrF+2SSTgE/LO
 V4iooIPE5Xtev6n8Cid1DKEumMdUI8HBuG67wQ3Y5Vzxv+RXD6wtD1d0Ab3PY4qByFsb
 ztO6D5lwwBrPaLy8aZ0yPXV1nmH50QIqIkJ5pwH0TsD8p1OsDk+4WcIY3QDn8+SXy5CJ
 E9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwaNCMilkmzhmkYonneEMsAUJQamaMIN6TA4YoYrKY0=;
 b=D+5Tc5mrSKrFU4odvfYW69brDzXdrIucyqfLOgew5X1+RB8wzpK8sMYubk+6gKf32J
 Ee+HznL+FhhLkRSVfkS9/lhZj6PWBG05gAPcuiM3qVwLivniALzVvPsOP2BRHiG03trk
 bre6nk/0z0JdjVvYMDWoNvwXXWRO86eGpEirgr2l2zyV7AWpiRgFYhqWgQxRuligBpjS
 seifB3UfGemuXyUDzdDtN6u+aFdqtWZLe5BuRLe/mvb++u1tyA/YYJjqYYRyIOdD17Ck
 Az8xDt2iV3vhFTktZso54SyKQ7jpSpwktDjqcoZ9P/GageUomgsTGUykODSs8p2C90dn
 XlxQ==
X-Gm-Message-State: AOAM531BoMzXEZd5Gi/m8lat25A/V6DVquWjuUp4dcwge2TDSmv3qlfC
 GXvXqVP//tJXait6zXVnFIE=
X-Google-Smtp-Source: ABdhPJyedIeeWYMTN5FPef8oaXIwS86Sx3tNuYFJNr61JHKToFb8faQ4xuVvTGkScWaoAmdwqyoffw==
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr2586041eje.496.1608275198793; 
 Thu, 17 Dec 2020 23:06:38 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id d13sm10852263edx.27.2020.12.17.23.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 23:06:38 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 18 Dec 2020 09:06:31 +0200
Message-Id: <20201218070631.1182292-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218070631.1182292-1-amir73il@gmail.com>
References: <20201218070631.1182292-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/inotify10: Test two inotify groups with
 parent and child watches
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
Cc: Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a test case for commit fecc4559780d that fixes a bug introduced in
kernel v5.9:

     fsnotify: fix events reported to watching parent and child

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/inotify/inotify10.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/testcases/kernel/syscalls/inotify/inotify10.c b/testcases/kernel/syscalls/inotify/inotify10.c
index 17aafc773..eb2322090 100644
--- a/testcases/kernel/syscalls/inotify/inotify10.c
+++ b/testcases/kernel/syscalls/inotify/inotify10.c
@@ -8,6 +8,10 @@
  *     Check that event is reported to watching parent and watching child
  *     based on their interest
  *
+ * Test case #3 is a regression test for commit fecc4559780d that fixes
+ * a bug introduced in kernel v5.9:
+ *
+ *     fsnotify: fix events reported to watching parent and child
  */
 
 #include "config.h"
@@ -63,6 +67,11 @@ static struct tcase {
 		IN_ATTRIB, 0, 0,
 		0, IN_ATTRIB, IN_ATTRIB,
 	},
+	{
+		"Two Groups with parent and child watches for different events",
+		IN_ATTRIB, IN_OPEN, IN_OPEN,
+		IN_OPEN, IN_ATTRIB, IN_ATTRIB,
+	},
 };
 
 struct event_t event_set[EVENT_MAX];
@@ -199,6 +208,10 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test = verify_inotify,
 	.tcnt = ARRAY_SIZE(tcases),
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "fecc4559780d"},
+		{}
+	}
 };
 
 #else
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
