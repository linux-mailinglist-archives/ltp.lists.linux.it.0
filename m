Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DE77138
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 20:25:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADFC83C1D48
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 20:25:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 28D453C1CFA
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 20:25:44 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 460091001D9A
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 20:25:30 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id n9so18928783pgc.1
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4UqvoT3BDRIJytOvEcEzKDm/K6lrdEYKKvH6s5dgMM=;
 b=AgL1Qmqhg2omfMVRYhny0k0IuVSm9bQHquLN3zg1TAtvIZCIrAA0gaZtITh1D2NkK1
 yFQ/JioD1xBugJd5eTKtUq082EjPPnLMysH2CVLxP8V7QbklMcO4xZkiRw/mrXhA4OIt
 J02njlCcJaNUzuhZGzL5p2VnrM3A9wDT5CLvjQrJr/1KtOEME9YpLvaLMP2nNXLhJkrx
 PjdmYtkQWnYS4K9ME8U5SIKobBOdA5yJNdcIlAyHa2W5lplK4FFZ+og7yvRSZQhp21Bi
 39U95o3uplWupSNqgcg5vQ23NRFr+S5Lj8LD0jVxLLi/DQJVPVVRFBFqnJO2GAT1nkH6
 FS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4UqvoT3BDRIJytOvEcEzKDm/K6lrdEYKKvH6s5dgMM=;
 b=cKfqyhNufr9OotpsN1xD7zstrcSQT6XLcIXxsPggQnjivWy1T9cjmcWAwIlL9wWPDE
 kyiI1OKXdBqS6zJC/Xt73/uTbq77fkQpeWJXnJhXyiZ6/8P7EGw3+J81tTgUisCpTFO8
 /tiRLDpXxXmTLslNvgYb6b6t/e+l0hoQdKirVO8pfWJHyS96Bi1dl2Yx9ZX0iC8eENjN
 SMN0+8aEns5dFC4Qn9d8XBNukNFhsmFfzY4ONVEj4E49NIo7asH7s/RYT+C1iSCa5lQU
 xdNcLet2YHdtz6MS8PHz8v0zkCeGAkbBK4qVuldfCtmne0I/zFtXrcbbz4kxSSPnbq2W
 MiLQ==
X-Gm-Message-State: APjAAAUotl9xi65jYng+lpExK1FjhnLYRMgFcCb1Pk+NbY8ABumKpqKK
 /JYuhOTw2z3XXIEA6ygGtec9b0Sy+bQ=
X-Google-Smtp-Source: APXvYqyZm1Ji8E3w94aF4pSPy+9G1f2vDzwxbWLpd4WCi6LYMqYkT+CCK7UTFMi3qU6uAwODxzhR5w==
X-Received: by 2002:a17:90a:2244:: with SMTP id
 c62mr101733256pje.29.1564165533476; 
 Fri, 26 Jul 2019 11:25:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
 [73.71.176.3])
 by smtp.gmail.com with ESMTPSA id j20sm51230978pfr.113.2019.07.26.11.25.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 11:25:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Fri, 26 Jul 2019 11:25:23 -0700
Message-Id: <20190726182524.43149-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add configure time check for getdents/getdents64
 APIs
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

glibc 2.30 has added wrapper for getdents64 this will help in detecting
right condition to use fallback

Check for getdents API as well while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 configure.ac                                  | 2 ++
 testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/configure.ac
+++ b/configure.ac
@@ -65,6 +65,8 @@ AC_CHECK_FUNCS([ \
     fallocate \
     fchownat \
     fstatat \
+    getdents \
+    getdents64 \
     kcmp \
     mkdirat \
     mknodat \
--- a/testcases/kernel/syscalls/getdents/getdents.h
+++ b/testcases/kernel/syscalls/getdents/getdents.h
@@ -23,7 +23,7 @@
 #include <stdint.h>
 #include "test.h"
 #include "lapi/syscalls.h"
-
+#include "config.h"
 /*
  * See fs/compat.c struct compat_linux_dirent
  */
@@ -34,12 +34,17 @@ struct linux_dirent {
 	char            d_name[];
 };
 
+#if HAVE_GETDENTS
+#include <unistd.h>
+#else
 static inline int
 getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
 {
 	return ltp_syscall(__NR_getdents, fd, dirp, size);
 }
 
+#endif /* HAVE_GETDENTS */
+
 struct linux_dirent64 {
 	uint64_t	d_ino;
 	int64_t		d_off;
@@ -48,10 +53,13 @@ struct linux_dirent64 {
 	char		d_name[];
 };
 
+#if HAVE_GETDENTS64
+#include <unistd.h>
+#else
 static inline int
 getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
 {
 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
 }
-
+#endif /* HAVE_GETDENTS64 */
 #endif /* GETDENTS_H */

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
