Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F19907DBF
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2024 23:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1718312498; h=date :
 in-reply-to : mime-version : references : message-id : to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=f/MJSyIL2EJpgSKKpyp7/LDpJtKAdjCJPT6iEhTOKLw=;
 b=Paoy6lNaGZzqiP9Lb1RYKN7XMcDArvBAfshxbg+XWzYaXisfSCutuM3itjETybqWSHlky
 WesxQLZwq7Me3vlTXV9r50pyHWrxWhu/PSQM9cya/poQAsexyxodbkcJvI1yNKVeZHjHFRg
 w3Kkdor8DaucK4jd497F8CkGSl3zvec=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A3FC3D0C6B
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2024 23:01:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68EA13D0C5A
 for <ltp@lists.linux.it>; Thu, 13 Jun 2024 23:01:06 +0200 (CEST)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BB7771A00438
 for <ltp@lists.linux.it>; Thu, 13 Jun 2024 23:01:05 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-6e4d1605a03so1400164a12.3
 for <ltp@lists.linux.it>; Thu, 13 Jun 2024 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718312464; x=1718917264; darn=lists.linux.it;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=j6mpbqsQj4TDIMg3c1XJXVU2quuYMeVG+UUMI9pH1XQ=;
 b=JXgwj5+P/QfKQMkfLeI0P4rdc7P/HsSAq5jii7C3qL1CvF3JP2YdjtpUPHwg4xFtGv
 eHP7af6etfKctog+aYD+h+8jTUSXdb9Gk7ggmAay1Ikpq/lpQqxywl5S2FQbA1U8YXn0
 6kWDNZCSIvdTtaGIcOv2t94RmgkuuxiLl7Ps0Tb0rdHJSzsUIqX9bvo4JkQQm3QbkHG+
 V4ZMFRy6syUk+sxpp8C8o2voge14rjRKb4EMR9wRAZ8WjZ74qy1eUj9TR1xt2BTHvgKm
 /BKIfhqQmDP3E1lnm0jDPg0UGQkK6/4rRWpZr5oDbXcxHTOfdn+UeXeRWOyUitgFA5sl
 lvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718312464; x=1718917264;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6mpbqsQj4TDIMg3c1XJXVU2quuYMeVG+UUMI9pH1XQ=;
 b=O9/Y/zvk/XlRfvp70qm67mOhF/bIyHAb/izUQStj640xlkrfsuS9i6LLRjIX65/J+s
 OiOXeTgE+kdImamNJrDzjOJh3huSflkv15hIVqNc5M92Vd6/XumDsP6PexdkA8oF34fJ
 IceJt/U8V5kD7ognmHYX9wwgj2Hv2SINF2n81iMliFcfbE+s7YkTekTQuZ0Ikbk+ZbUW
 zYohUCh13nNAZBKTYuhN7osInu1pNIRryjafVJ9K2D+/EsIqb67eU4TM+XKkXYMqBEO8
 WM6Rq3vlhokXtlqBBYONw0oLWjSZeVnBKKFPrC0j/mU0Hmybz9MvEguPSXuvfHw999po
 SAyg==
X-Gm-Message-State: AOJu0YwqV55Vibr4NETHwWfUyNN586t+CeAYR2hfTtn1Jonz/IlX0iAi
 og16uRlO7q+f50Yrq6ChTnCmbbN8xYLHudKEVDwhBGhe94pM1xmC7ll/EBUVqhN6vsrtRx4+nAd
 q6hxElnDk2Tw2r4UaNSqG02ftP1r5prilVTB1g3y3cjTeruOe+iwmOEWNcxRL/Gwzf5Wq6Bzb1k
 KIcefoi/QBMuTVuVebetCy/ZKA2z4=
X-Google-Smtp-Source: AGHT+IGf6xMrRzS959QtvDEDIAwLioXT83+UfAQ4dfpeGqS2o3OgMhvNca5cC1jEaIlGYXt0uOz5RWcQEIk=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:2446:0:b0:6be:96a4:1363 with SMTP id
 41be03b00d2f7-7019a78c7d5mr2029a12.10.1718312463886; Thu, 13 Jun 2024
 14:01:03 -0700 (PDT)
Date: Thu, 13 Jun 2024 21:00:58 +0000
In-Reply-To: <20240613210059.352767-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240613210059.352767-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240613210059.352767-2-edliaw@google.com>
To: ltp@lists.linux.it
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 1/2] sched/starvation: Fix sched_setaffinity return
 check
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TST_EXP_POSITIVE to check the return value is incorrect because
sched_setaffinity returns 0 on success / -1 on failure.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 testcases/kernel/sched/cfs-scheduler/starvation.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/sched/cfs-scheduler/starvation.c b/testcases/kernel/sched/cfs-scheduler/starvation.c
index eb9fd6ff5..1d0d5ff97 100644
--- a/testcases/kernel/sched/cfs-scheduler/starvation.c
+++ b/testcases/kernel/sched/cfs-scheduler/starvation.c
@@ -54,7 +54,8 @@ static void setup(void)
 
 	CPU_SET(0, &mask);
 
-	TST_EXP_POSITIVE(sched_setaffinity(0, sizeof(mask), &mask));
+	if (!sched_setaffinity(0, sizeof(mask), &mask))
+		tst_brk(TBROK | TERRNO, "sched_setaffinity() failed");
 
 	if (tst_parse_long(str_loop, &loop, 1, LONG_MAX))
 		tst_brk(TBROK, "Invalid number of loop number '%s'", str_loop);
-- 
2.45.2.627.g7a2c4fd464-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
