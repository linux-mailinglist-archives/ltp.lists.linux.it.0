Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D0FF9E6
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 14:32:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED36D3C223B
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 14:32:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E47B93C0638
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 14:32:55 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 146821A00816
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 14:32:55 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id b18so14873438wrj.8
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 05:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKSQRVb6UrUidVGOOFX7t0otR1bWKVx0qOMeobOQL5Q=;
 b=Q9qGAnzajsdfQEfJd62uV6xD1EGZHDCeRg+odXRSss2jKE5PmdbNyevUYUF5HqieiD
 GNUNtTyjwvv08jN42psQHi3M6udmxx+u0O81U3pE2MdLQl2HLu7uAID2XCbXquNNNVZU
 Y65F4P1GiadbeLm3aLDRSan8KLSCygL/3bOAaqv2xgZmPkFFDe/BoS7yKhAItTImstva
 MFadvdbcm/SNB3YGLyY4LnRvBPALXxpa6CMrijFnJcyr0mf9RWtU+Cz5VQciFteKm6XE
 wD7qiY/B2yqV9EHOaOGnhc8QRZDqiKqdXQLM4fKkNR0vAJ35HXfqP6203dX1HHMkqUyy
 aWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKSQRVb6UrUidVGOOFX7t0otR1bWKVx0qOMeobOQL5Q=;
 b=oXroNLeqeR9rmTNbYPyq2grcgmKUAxUZihcLJH1ti2wA8f8oobhYuRplXCTedsesRs
 ccJ2adVEzzeXRGyj0JxYHxmKytIMX+gcTGrsl8JGGEH344dtfMsaQRcNKSKaeP1oXqlL
 qLagVbuQ8n+hWYxx4ARSWEYqD6tCAs8wWCR50EjAZWVTCkB1hIeGGnFk6v5tV395Hdox
 avwfyd3Uj1Bf73VCFkwS0ukSakxwKsyEw8qJ7IjUbqlUBSzLlDsY9JpJO7OnFKGofK+P
 DQSot4at3Yaa/hWpnxdOG56GMHanqBbcwJRKn/vP/wlaMHpM1cAPYIyRmcYjrX/xg9Is
 dRXw==
X-Gm-Message-State: APjAAAVQimZH9rLVBQUvWVY5UJiA8FTCdBNKLk9EIJbI7lq1GbIeYtnM
 5jwcapHSJ0MoO0SLLE/8NSwsZ8rN
X-Google-Smtp-Source: APXvYqyMiwUvL09DACDl11OPt9p6k4UKCuKi63mLoy0Y6zBVV9DprnwaLrWTuT+MamRXFyHxoVEqaA==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr26792185wrs.329.1573997574345; 
 Sun, 17 Nov 2019 05:32:54 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id 91sm20521297wrm.42.2019.11.17.05.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 05:32:53 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun, 17 Nov 2019 14:32:47 +0100
Message-Id: <20191117133247.6304-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] utils/compat_16: Always include
 <sys/fsuid.h>
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

All major implementations have setfsuid() declaration in <sys/fsuid.h>.
This fixes build on musl and (probably) on uclibc).

NOTE: maybe we should guard presence of <sys/fsuid.h> with autotools,
but we're not doing that for other it's uses.

Fixes: 0e7a99b53 ("setfsgid, setfsuid: clean up and 16-bit version
fixes")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/syscalls/utils/compat_16.h     | 2 --
 testcases/kernel/syscalls/utils/compat_tst_16.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/testcases/kernel/syscalls/utils/compat_16.h b/testcases/kernel/syscalls/utils/compat_16.h
index 5b0338d38..75d5d2d28 100644
--- a/testcases/kernel/syscalls/utils/compat_16.h
+++ b/testcases/kernel/syscalls/utils/compat_16.h
@@ -24,9 +24,7 @@
 
 #include <errno.h>
 #include <grp.h>
-#if defined(__GLIBC__) || defined(__ANDROID__)
 #include <sys/fsuid.h>
-#endif
 #include <sys/types.h>
 #include <unistd.h>
 
diff --git a/testcases/kernel/syscalls/utils/compat_tst_16.h b/testcases/kernel/syscalls/utils/compat_tst_16.h
index 3b86ef3e3..09fa8b0d8 100644
--- a/testcases/kernel/syscalls/utils/compat_tst_16.h
+++ b/testcases/kernel/syscalls/utils/compat_tst_16.h
@@ -21,9 +21,7 @@
 
 #include <errno.h>
 #include <grp.h>
-#if defined(__GLIBC__) || defined(__ANDROID__)
 #include <sys/fsuid.h>
-#endif
 #include <sys/types.h>
 #include <unistd.h>
 
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
