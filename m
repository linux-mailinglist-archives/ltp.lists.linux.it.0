Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDA190132
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 23:49:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A623C4E37
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 23:49:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 00D083C4E37
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:49:43 +0100 (CET)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0CBDD2005E2
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:49:43 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id a25so19260316wrd.0
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3zthTxezEvDCYZafz47OS1g1Ufvn1gFEUApGNFJxbM=;
 b=g1E0tkp3aekecSWKxra1SbSsnenFpfM+in3V4+DvDkbuoiGu6WgOlWYq45x+2ZV7+I
 DcF5cKjGVSSB+JvfWN20ISxjAvMKieoBQMmRIjp6PKtQ92oNlYJm5vssef1U5N3aAror
 jgeMLvhpQv9+ZQvChpv8t5uMNSKDWx/p9bUoScbdLgIQxbaQpeWfbKB45pa+AIKKEf+x
 9yTQxyXHA0xH3hBap+EuLjDJ+1MRyoaZ/eRTiauOCI1/HRdw9pufL3A//dwNTheUnsgI
 bkd6J9BV/ur6Cb6mBlEEe+rzo15JcBeG/CCVJdCDYVR60k3A1ERe3P5XG+lOvQGaHYwP
 niWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T3zthTxezEvDCYZafz47OS1g1Ufvn1gFEUApGNFJxbM=;
 b=L+5E1hlIY5nLTN/2VdcAJJWVZnQebQovutGYX9fWuf27PhKREeIcWCt46Gln51rgvk
 +xHyjEZLdqMTcNJoD6JS/aRW+nK59FmRVJbDzk6b4Ac4XifanY9BY+waeb7lg9GY3F0N
 EzK28VYXd3Tozjr2L34iLdtJWO179mYAs/A0Bfl+9787NooSAijz0TxcvM8+BVSpt1M/
 MBl1P860K14S6zoV/+5/18W0LkWIx4eu9smMztMoJBLwHhW6TVvCydKdwtynFOPCpFXA
 2ClKwRe+U3fdsb6rPU152gLSp8uxfWPuBjXFsLDjPl9CXfv25xz/rcrC6VN+CvpeXopV
 bDiw==
X-Gm-Message-State: ANhLgQ1WILAFULDdSgATd7gIEkrvYDFrIqIszijA7SfW4Tg23Bw4Xo6z
 Z1gW1ZMOnJFT+75Sh7tbGmDH7KsI
X-Google-Smtp-Source: ADFU+vvGP1oSOzhll1o8+QAXefJWb/YCNCyWYguCicj9EjX6JD14vqcwNbRRoR4cqwUmnErGUE1nqg==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr33912153wrn.326.1585003782261; 
 Mon, 23 Mar 2020 15:49:42 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id k15sm2782317wrm.55.2020.03.23.15.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:49:41 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 23:49:32 +0100
Message-Id: <20200323224933.2613658-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323224933.2613658-1-petr.vorel@gmail.com>
References: <20200323224933.2613658-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] accept4: Remove fallback definitions
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

They're already defined in lapi/fcntl.h.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/syscalls/accept4/accept4_01.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
index a596b9b1a..55aa210ae 100644
--- a/testcases/kernel/syscalls/accept4/accept4_01.c
+++ b/testcases/kernel/syscalls/accept4/accept4_01.c
@@ -25,13 +25,6 @@
 
 #define PORT_NUM 33333
 
-#ifndef SOCK_CLOEXEC
-# define SOCK_CLOEXEC    O_CLOEXEC
-#endif
-#ifndef SOCK_NONBLOCK
-# define SOCK_NONBLOCK   O_NONBLOCK
-#endif
-
 static const char *variant_desc[] = {
 	"libc accept4()",
 	"__NR_accept4 syscall",
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
