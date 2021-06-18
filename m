Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188D3AC3EC
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 08:32:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 260823C7399
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 08:32:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 268743C2462
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 08:32:08 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DB4F6140126A
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 08:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1623997927; i=@fujitsu.com;
 bh=viFxqGc5rqnkLGgDkVu6uWNZ08ecMK/HqbL1gWVBJQk=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=C9Hkb12xjPDzKBPtOnlMgnmT+jiIrM9a8SGK2kq2Kg0YM5+w+ugeHo4Ym2Zkvofez
 D+t7zc5oD+ssjel2FiVQlb4zSlsjFjrQhISRpORs4EBxxU71yT/QRlPvahbR2zKy6r
 KRHvTFZqm6IwbdVsiWI5ZaoBW3Gza5CSzdgr0f8C2Rq9mSzoCxyv93Dg3fKOONKxCJ
 EkPcgUqMxi1/N5Jk60ZhzVPPsRmGI9G/VT0vFR/vaE7ui16cjqNwzyf1gYv8L3xeXh
 hLYsn8UWBNvOKrpH0e0i2MNpYYoy2CPUKpppB0lsoMdU+F3WdqeliamdRXMhgiyeqN
 eZcJtAbJvHTTg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 88/6E-19780-6ED3CC06;
 Fri, 18 Jun 2021 06:32:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxVfeZ7Zk
 Egz3TZC1WfN/B6MDose/3OtYAxijWzLyk/IoE1oz7b46yFdxWqXiw8TZLA+N+hS5GLg4hgRYm
 idYNK9ggnD2MEoumTGLpYuTkYBPQlHjWuYAZxBYRkJDoaHjLDmIzC6hLLJ/0iwnEFhZQk+hc1
 cYKYrMIqErc2tcCZvMKeEpsn3uUDcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjKHGp4x
 sjhF0hMWPGNrYJjLyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxroGukamRXmKVbqJ
 eaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzDEUgoZ/uxgXP3mg94hRkkOJiVR3hVKZxKE
 +JLyUyozEosz4otKc1KLDzHKcHAoSfC+MADKCRalpqdWpGXmAMMdJi3BwaMkwrvRGijNW1yQm
 FucmQ6ROsWoKCXOu8oGKCEAksgozYNrg8XYJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvM
 kgU3gy80rgpr8CWswEtLhN6BTI4pJEhJRUA1N+najMykebWNl4kr0Xu60pNA7j7uadcsmKweV
 O5JWOZx4c7Ba3VNVSfKyNHQVjVL6v0lT657skf8rKRRZ6gcePKlRn3j+RZ59uwptTLMTe8rP+
 /ZF3h9ZuVriupxZZU7H1j4Jk7QTf5NnrWZSZSg5ziCyKm/30rV1YzU7NMsfpkSuSTBPipILjn
 HyUrwoofMmY33KUK9j8QNPNrBPqcrYtHmx9QW2xPR5RP9Z3ztqYHb3C81pL68eb74PErgXqnd
 rM07p26Zac4uWCSdc+xNdYsQqYfVnL9uOo+NeAJul3HdPvGkRq8q0/I6D7y1yo8/U+1qvHeHf
 P9s1I8Zn84wN/TPZeAeOVeRuLFssosRRnJBpqMRcVJwIAdc61gCwDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-18.tower-232.messagelabs.com!1623997925!94705!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18627 invoked from network); 18 Jun 2021 06:32:06 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-18.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Jun 2021 06:32:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I6Vxtt018677
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 07:32:05 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 07:31:57 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 18 Jun 2021 14:32:11 +0800
Message-ID: <1623997931-18117-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC] Makefile: simplify code
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

When these target use CFLAGS or LDLIBS, they can be in one line instead of separate lines.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 lib/newlib_tests/Makefile                  | 10 ++--------
 testcases/cve/Makefile                     | 13 ++-----------
 testcases/kernel/sound/Makefile            |  6 ++----
 testcases/kernel/syscalls/bind/Makefile    |  3 +--
 testcases/kernel/syscalls/futex/Makefile   | 11 ++---------
 testcases/kernel/syscalls/preadv2/Makefile |  3 +--
 6 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
index 30ca6810c..5bd68e95e 100644
--- a/lib/newlib_tests/Makefile
+++ b/lib/newlib_tests/Makefile
@@ -6,14 +6,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
 CFLAGS			+= -W -Wall
 LDLIBS			+= -lltp
 
-test08: CFLAGS+=-pthread
-test09: CFLAGS+=-pthread
-test15: CFLAGS+=-pthread
-test16: CFLAGS+=-pthread
-test16: LDLIBS+=-lrt
-tst_expiration_timer: LDLIBS+=-lrt
-tst_fuzzy_sync01: CFLAGS+=-pthread
-tst_fuzzy_sync02: CFLAGS+=-pthread
+test08 test09 test15 test16 tst_fuzzy_sync01 tst_fuzzy_sync02: CFLAGS += -pthread
+test16 tst_expiration_timer: LDLIBS += -lrt
 
 ifeq ($(ANDROID),1)
 FILTER_OUT_MAKE_TARGETS	+= test08
diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
index 301e19461..ddf8b6fe1 100644
--- a/testcases/cve/Makefile
+++ b/testcases/cve/Makefile
@@ -11,28 +11,19 @@ stack_clash:	CFLAGS += -fno-optimize-sibling-calls
 
 cve-2016-7042:	LDLIBS += $(KEYUTILS_LIBS)
 
-cve-2016-7117:	CFLAGS += -pthread
-cve-2016-7117:	LDLIBS += -lrt
-
-cve-2014-0196:  CFLAGS += -pthread
-cve-2014-0196:  LDLIBS += -lrt
+cve-2014-0196 cve-2016-7117 cve-2017-2671 cve-2017-17052 cve-2017-17053:  CFLAGS += -pthread
+cve-2014-0196 cve-2016-7117 cve-2017-2671:  LDLIBS += -lrt
 
 ifneq ($(ANDROID),1)
 cve-2014-0196:  LDLIBS += -lutil
 endif
 
-cve-2017-2671:	CFLAGS += -pthread
-cve-2017-2671:	LDLIBS += -lrt
-
 meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
 
 ifneq (,$(filter $(HOST_CPU),x86 x86_64))
 meltdown: CFLAGS += -msse2
 endif
 
-cve-2017-17052:	CFLAGS += -pthread
-cve-2017-17053:	CFLAGS += -pthread
-
 cve-2015-3290:	CFLAGS += -pthread -fomit-frame-pointer
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sound/Makefile b/testcases/kernel/sound/Makefile
index 5c728ef36..04a7c077f 100644
--- a/testcases/kernel/sound/Makefile
+++ b/testcases/kernel/sound/Makefile
@@ -6,9 +6,7 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 CPPFLAGS		+= -D_GNU_SOURCE
 
-snd_timer01: CFLAGS+=-pthread
-snd_timer01: LDLIBS+=-lrt
-snd_seq01:	CFLAGS += -pthread
-snd_seq01:	LDLIBS += -lrt
+snd_timer01 snd_seq01: CFLAGS += -pthread
+snd_timer01 snd_seq01: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/bind/Makefile b/testcases/kernel/syscalls/bind/Makefile
index 00db0e7ff..cc1d81423 100644
--- a/testcases/kernel/syscalls/bind/Makefile
+++ b/testcases/kernel/syscalls/bind/Makefile
@@ -5,8 +5,7 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-bind04 bind05:	CFLAGS		+= -pthread
-bind06: CFLAGS += -pthread
+bind04 bind05 bind06: CFLAGS += -pthread
 bind06: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/futex/Makefile b/testcases/kernel/syscalls/futex/Makefile
index c88af7c96..5713c615d 100644
--- a/testcases/kernel/syscalls/futex/Makefile
+++ b/testcases/kernel/syscalls/futex/Makefile
@@ -3,15 +3,8 @@
 
 top_srcdir		?= ../../../..
 
-futex_cmp_requeue01: LDLIBS+=-lrt
-futex_cmp_requeue02: LDLIBS+=-lrt
-futex_wait02: LDLIBS+=-lrt
-futex_wake03: LDLIBS+=-lrt
-futex_wait03: CFLAGS+=-pthread
-futex_wake02: CFLAGS+=-pthread
-futex_wake04: CFLAGS+=-pthread
-futex_wait05: LDLIBS+=-lrt
-futex_wait_bitset01: LDLIBS+=-lrt
+futex_cmp_requeue01 futex_cmp_requeue02 futex_wait02 futex_wake03 futex_wait05 futex_wait_bitset01: LDLIBS += -lrt
+futex_wait03 futex_wake02 futex_wake04: CFLAGS += -pthread
 
 include $(top_srcdir)/include/mk/testcases.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/preadv2/Makefile b/testcases/kernel/syscalls/preadv2/Makefile
index fbedd0287..d4f4f55be 100644
--- a/testcases/kernel/syscalls/preadv2/Makefile
+++ b/testcases/kernel/syscalls/preadv2/Makefile
@@ -11,8 +11,7 @@ include $(abs_srcdir)/../utils/newer_64.mk
 
 %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
 
-preadv203: CFLAGS += -pthread
-preadv203_64: CFLAGS += -pthread
+preadv203 preadv203_64: CFLAGS += -pthread
 preadv203_64: LDFLAGS += -pthread
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
