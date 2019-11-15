Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591D100560
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 13:10:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 239CD3C185F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 13:10:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0CCDB3C07D6
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 23:10:03 +0100 (CET)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AFEA7140162D
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 23:10:02 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id l7so12539531wrp.6
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8JZuVKqWfTf587SZoVhX53qhvAupdelYJq6jhGN5OeM=;
 b=tpMD27ThW8Yxk+Uxh3Z889M+esQFGj20dg4EaxEDOybZQt5GwFfYC8qXvIZTaJsHh4
 DRi3fjBQvohuRawfSuk9iUj5tVsrl+lnQuq3d3oqt99SU1Uku47caaskyS0Jg8YaFDyF
 WKdDW64UaFzxm00g0VI/2Ocioo6UwvGEIt7EcG+4iuE/FHd18ISIqPOhqvSaXzPhgPux
 yNLk8JHht5AxTEzguCK1JqBADraXZzNRXtC2KaZygDSrj8EL9+5U+X3siE0LPj/LanJM
 Sff2EhtscUzFD1kwnZviM0Mr6L9fZAqCjJxo29PglpvxoEOVB65l0fsRptxIu7Kk0dr0
 eANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8JZuVKqWfTf587SZoVhX53qhvAupdelYJq6jhGN5OeM=;
 b=ado9M6ZvwSSumRGSoj/y4izEHadgLoIs/7L74u6pNBadPQq3QkVLGqWIJAu96F7/Gy
 lYMNBEoeXc8eVrLG8/8pMh4TwUt1H6MeBtbsKVYrQCoCrWWPXSubuT/0dH4tfqtGJI++
 qGEFKB7uXaJ0N4I8+O6Y8kj4fkz20Ok9kxZSJZ2qOPsVIfZrFOyCux9Tkge9ZZz4LfGs
 oFHinowL7DZn0fp5XPlvqACY1w6IV2qE7/YjbIQ5JqSdwHVNKwltp4uKVRZjkEimTpf0
 0I+CXhgPack/mkWOMO1B2kyioItRf7gnLtHTySSREAxSFo1pxLOKInNI+10xi2sFTS0M
 keMQ==
X-Gm-Message-State: APjAAAUkCUe0nv3SodD8TXP/AwEWF4oMZ1w8W8QCdH0bLP1RyOLRCkBi
 R78uz/ezW2IMOeqrQ4PA+ichIcnC
X-Google-Smtp-Source: APXvYqzfjBv0Y10yDoSIyxnLMvVJLX8P06TjwCLMsIjb5diDQ4kXRITZV33+7e5rvSxLI2JadfErAA==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr17549548wre.11.1573855802008; 
 Fri, 15 Nov 2019 14:10:02 -0800 (PST)
Received: from kali.home (lfbn-1-3732-187.w86-229.abo.wanadoo.fr.
 [86.229.230.187])
 by smtp.gmail.com with ESMTPSA id a2sm9360840wrt.79.2019.11.15.14.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 14:10:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: ltp@lists.linux.it
Date: Fri, 15 Nov 2019 23:10:38 +0100
Message-Id: <20191115221038.14383-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 18 Nov 2019 13:10:08 +0100
Subject: [LTP] [PATCH] Fix static linking with musl-fts
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Don't append libraries to LDLIBS but prepend them in cpuset_lib/Makefile
and cpuset/Makefile.inc to allow the user to provide its FTS library
such as -lfts for musl/uclibc through LDLIBS

This will fix static build of ltp with musl-fts on uclibc

Fixes:
 - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 testcases/kernel/controllers/cpuset/Makefile.inc        | 2 +-
 testcases/kernel/controllers/cpuset/cpuset_lib/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
index db6a84305..c03dd77d7 100644
--- a/testcases/kernel/controllers/cpuset/Makefile.inc
+++ b/testcases/kernel/controllers/cpuset/Makefile.inc
@@ -41,7 +41,7 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
 
 LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
 
-LDLIBS			+= -lcpu_set -lcontrollers -lltp
+LDLIBS			:= -lcpu_set -lcontrollers -lltp $(LDLIBS)
 
 INSTALL_TARGETS		?= *.sh
 
diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
index 322d03cac..069ebc38c 100644
--- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
+++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
@@ -25,7 +25,7 @@ top_srcdir 		?= ../../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS			+= -lm -lcontrollers -lltp
+LDLIBS			:= -lm -lcontrollers -lltp $(LDLIBS)
 
 LIB			:= libcpu_set.a
 
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
