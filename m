Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F11DA9C9
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 07:23:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 930653C4DF3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 07:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 43CC73C2055
 for <ltp@lists.linux.it>; Wed, 20 May 2020 07:23:23 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 32C9B1A01549
 for <ltp@lists.linux.it>; Wed, 20 May 2020 07:23:23 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id x15so1025036pfa.1
 for <ltp@lists.linux.it>; Tue, 19 May 2020 22:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=39ehopiB49EkdxIijUGZ2HNoAf/964EWvnoW3SS1HDk=;
 b=JRFNZbFlBFAaENssF4o3+W9ZFGmMJDpzYJp6fNNahtrQeqTOtAyPE1NLnP8xCRYjtq
 LL2SchJNb4qI8hHt1nlJ2299GgxF70bHt7ra8mOd0XVCLnLsXeew8GJNtpy4373UHRzr
 Df2vSiLuvBLsZnHpr3OsNene207G42PlbDTZ+mq54PRT5g0IJILRemmNUErMnJSMbgmF
 hDGSdKsjOKKDCS9GeiE1C09mQwiX+Bs9Xe0F4XvTQXUWcCwP6S74zOgByLmrxDIZ+BhY
 Fpg3MughMMKU5Klk8FnrF6wGigLQKkvInY9Bz1kPFrhdkl4XMa8bjlX8uZuHsi9gWHkT
 SwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=39ehopiB49EkdxIijUGZ2HNoAf/964EWvnoW3SS1HDk=;
 b=eNLKjM35CUf2/0Bo4LuKih+7OT8Mlll18t1iqhkvztGOEV8NcITFOkt1a+YrzHDk/p
 xu2Ox8DS48zFb020ev5Da1Gw2am2p4+0exe6N8YFr/vq5aRb4jfTZa0tkC2gfzE4OLbG
 mpF2Hr0QrGGnZbjZbQldP4kfOaKAqjQoASBBBlp9lyM/uFGM3XkXchdPrgJdD4+PEvBR
 f4NC2q8EA+uC2st1yBRQRi3QvFrOxfFHX4JfAqDP/9HFlAi0ZXYwbF4vJW8iq5nNSY3g
 aAoQhrCIsPT7NApvJIZSOL8NjkEJeKUP8JL3WK8Zh5vdclofyWKhjx0C8i7rr0tKIQCs
 l84g==
X-Gm-Message-State: AOAM5305S20ttuovMMzeixhYWszP8QNnWLLr0mx9AeT6NytYqy3r5Dvf
 nY1L8MM5Ixglq5amA3ZgC9PbD3urr7M=
X-Google-Smtp-Source: ABdhPJzB1UlakIoVKVpsB2Ogyfo1TaNi8G7QwFOqQDIAK02uuHrlXtnK9NZwW1k8ec5oG+5oem2zdw==
X-Received: by 2002:aa7:9559:: with SMTP id w25mr605534pfq.228.1589952201318; 
 Tue, 19 May 2020 22:23:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
 by smtp.gmail.com with ESMTPSA id m18sm969414pjl.14.2020.05.19.22.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 22:23:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 22:23:18 -0700
Message-Id: <20200520052318.3261805-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] ptrace01: Fix missing format string
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

Fixes
| ptrace01.c:89:2: error: format string is not a string literal
(potentially insecure) [-Werror,-Wformat-security]
|         tst_res(TINFO, tc->message);
|         ^              ~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 testcases/kernel/syscalls/ptrace/ptrace01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c b/testcases/kernel/syscalls/ptrace/ptrace01.c
index 87a99e4150..9071bbabaf 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace01.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace01.c
@@ -86,7 +86,7 @@ static void run(unsigned int i)
 
 	got_signal = 0;
 
-	tst_res(TINFO, tc->message);
+	tst_res(TINFO, "%s", tc->message);
 
 	if (tc->handler == 1) {
 		parent_act.sa_handler = parent_handler;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
