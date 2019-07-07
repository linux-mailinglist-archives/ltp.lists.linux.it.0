Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A99AC6163F
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:01:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50D243C1D3F
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:01:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EE3FC3C1C91
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:36 +0200 (CEST)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 445821000A62
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:24 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id a15so13630572wmj.5
 for <ltp@lists.linux.it>; Sun, 07 Jul 2019 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4kt2Y0SPgziIiUrzo39L91Xyz7Gl5F+MJsgHI3a7dM=;
 b=O0ht+c7/ytcyKAkdwA23EpPK8peU3ab6AbzKkKN5BEkRtS7ZL9T2eUf7MAdBnlljza
 a1WO19u5tEILOwMRBYNjuhrUcZc9PZqYJTxFYA0pmbNgkqd14PY46lNiCAE+j9XYD3Ce
 X9iIWKPLDQpAawMNgVzpY/s9I6Sy5LOF4alQJaZ5D6ZPCgBfqckdBKj2GX9bnkj7ymNq
 dbUU9xguSBimbS7gLMBjpITDTnkO6C+Ffea0XqPlaSt8aqKeC5eSudzs3wS90H6G3ylG
 MWyxgtw/hJfPMmFC90wCgnfxY8sxqxiICOPkDk7sSiVOH+SMcNr66pDX8+1zaazl6c7n
 Yc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4kt2Y0SPgziIiUrzo39L91Xyz7Gl5F+MJsgHI3a7dM=;
 b=B6IcmReySgMY3H0CDW5RL6br5/bTuJdhQqfVDTYJBt7Z0Omz60xzC3wPuIkhlLlY/E
 A9AhF5PhMKPnAY4+RDUZQkJekD6cBFcQ/geg/j7/tpv09sa1XYAcY1LCV6TLbg66Q11/
 0VkF5vUkj3JMWPO9stei6LJZr4SbExHBmE62I51qx57sOaoh1VvocRkoZpvddcJcUTOC
 6dFZt7m62/jTd+KobIPhZ6ErM1Tut0X5WD7d1z0dk3kEEWIFrqQVrYQ4Sq9ENuUA2mOV
 W1Z9QRqiGWztwwhPXIi1Z/xRDl6DrWty4Hs/klGj6axSFPxj7GQWPDxCv8imfk795OKX
 iLpw==
X-Gm-Message-State: APjAAAWoK6AB+bfOcJjjiL0/u+TuBTXPLfPqMJyMtaPv4L0odWVp7ywo
 G6YHCHJPZ3b3pAyqa8EUhOGKDpjl
X-Google-Smtp-Source: APXvYqyqynHKAZLIVz2iSp0EurkS9TP5Mt6zGD99pGNOi3dJHkPE8Tk9NgqCuF75Ve4hUNJG/S3v6Q==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr12612865wmf.162.1562526028331; 
 Sun, 07 Jul 2019 12:00:28 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm16403849wro.18.2019.07.07.12.00.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 12:00:27 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun,  7 Jul 2019 21:00:13 +0200
Message-Id: <20190707190016.27296-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707190016.27296-1-petr.vorel@gmail.com>
References: <20190707190016.27296-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] lapi: Add utsname.h
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

Non-standard _UTSNAME_DOMAIN_LENGTH and _UTSNAME_LENGTH constants aren't
defined for MUSL and Bionic.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 configure.ac           |  1 +
 include/lapi/utsname.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/lapi/utsname.h

diff --git a/configure.ac b/configure.ac
index f78db90ce..97991e85f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -57,6 +57,7 @@ AC_CHECK_HEADERS([ \
     sys/prctl.h \
     sys/shm.h \
     sys/ustat.h \
+    sys/utsname.h \
     sys/xattr.h \
 ])
 
diff --git a/include/lapi/utsname.h b/include/lapi/utsname.h
new file mode 100644
index 000000000..6209eac47
--- /dev/null
+++ b/include/lapi/utsname.h
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
+ */
+
+#ifdef HAVE_SYS_UTSNAME_H
+# include <sys/utsname.h>
+#endif
+
+#ifndef _UTSNAME_LENGTH
+# define _UTSNAME_LENGTH 65
+#endif
+
+#ifndef _UTSNAME_DOMAIN_LENGTH
+# define _UTSNAME_DOMAIN_LENGTH _UTSNAME_LENGTH
+#endif
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
