Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1231E86C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 11:19:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFB4D3C6618
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 11:19:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 92B783C66F9
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 05:46:08 +0100 (CET)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1D56F1000EBE
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 05:46:08 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id b8so543736plh.12
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 20:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=VaqrhXAdS9dgbiLjPl1B9PtuhFOovF86rD6246oim9Q=;
 b=vCukmZOdOTsegmdsqWrfDak2JyJMZphTXXM0PZAhP+n3ZIg3X6Q1EwDi/z+goHg8rN
 USmLSAdglQRdwL8GTnQ1C2eGzDLJHvWouCjqyaY0RMdCaKN0edbCL+P9XcacC532nVbk
 6gEQc6Q3iIQBrjJFiDthASr+UM9zlIE+Jv0XmrfPRwo27OH02is2eXuckNuIPWHiRjrz
 uF3oSDpfgjX04dBKurbdAN4RUngu0w2XHGoVowoukMbikANlKUm/z3DpPnb432H3BTPh
 GVr5ukyXhtS++enEcuxZU8zyKojycCvWOOoaz2t9i0daP5v2YIl63YAOEhi0hrIzZjrf
 NdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=VaqrhXAdS9dgbiLjPl1B9PtuhFOovF86rD6246oim9Q=;
 b=b2a+edmYkWPVF0Q7L2hj03Nv+/wRZtd6E/cFY8jDJ9Bf0zpEtWLNRqe8hFoT5Vv8wu
 TznkjNO6oAKPKBvT2MYu+lqKHAhB/zvGKo0PNs+1bxE3i1ZynVx9MOiyoCVcovfJD2E9
 ifqtAQPSd2J3RcbVkHoJwTNG7S40h9P2JsIr8ieGS+kKyut3jVuHiHrSpGABD3Y+gy9s
 9hY3xmf3IhsMl7EOtu9Nm8zR1+mRw8yxk7r3GBhxb5U4p5Nvlzhs+iCne6rZRDfWb7My
 Ldw5iJ+xB2gzOd8I9btxKYPNWpwj4l3XwkjynjCyLTCyAXLLxsVu/5noa82JIF6vE/zC
 GvcQ==
X-Gm-Message-State: AOAM530fzUWvjDvHiUY4H5KvixpSZkFFC5Sz5nintPo8K3SqpABRR6hc
 sRrup/tkNKytjTpNC14E2+Av8w==
X-Google-Smtp-Source: ABdhPJznZU33gpF4eo7XUpnDcUkrf2QR43MXpF2XtRPv/8tDfThDvFMTh3TN+rs2eJR17UYrCZMafA==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr2276220pjg.189.1613623566226; 
 Wed, 17 Feb 2021 20:46:06 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v26sm3899162pff.195.2021.02.17.20.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 20:46:05 -0800 (PST)
Date: Wed, 17 Feb 2021 20:45:52 -0800
Message-Id: <20210218044553.2514218-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 18 Feb 2021 11:19:39 +0100
Subject: [LTP] [PATCH 1/2] fsstress: Indicate sg_handler's argument is unused
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
From: Palmer Dabbelt via ltp <ltp@lists.linux.it>
Reply-To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This argument can't be removed because it's part of sigaction, but it's
triggering an unused argument warning.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 testcases/kernel/fs/fsstress/fsstress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/fsstress/fsstress.c b/testcases/kernel/fs/fsstress/fsstress.c
index 811e6ff14..b53a99180 100644
--- a/testcases/kernel/fs/fsstress/fsstress.c
+++ b/testcases/kernel/fs/fsstress/fsstress.c
@@ -280,7 +280,7 @@ void usage(void);
 void write_freq(void);
 void zero_freq(void);
 
-void sg_handler(int signum)
+void sg_handler(int signum __attribute__((unused)))
 {
 	should_stop = 1;
 }
-- 
2.30.0.478.g8a0d178c01-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
