Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 071723562E6
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 07:12:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4D583C1DE8
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 07:12:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 356943C0E0A
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 07:12:45 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8F608201004
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 07:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617772362; i=@fujitsu.com;
 bh=36zrYHF+ZdQQqtRpUmwle3T4RpVD1s2aE6v77yI9VAg=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=iZMaKn4xsGs1t6+lPKbohlFxQADDDqeHi+8hHljSPjdgSegbNJUdfx5z2S8pT8+8G
 OY8zU7AWdLEqkUtfPhG3bIBp/uKm1pq/5HRlkLFJdON3SXKCCegDE8dcHJizRyvkSI
 0qsSr1oVqae7JWe+SGdwVB6X4oaSJVK9uh2Jvdx6bVXG3Dsy+0N+A8QtI8IzWOD0U8
 kNxekDHG+fyt3Bu4jhGSpAD7RpKU9Ze9FFN62RtpQoE1W/mAZdzpd0N8eE2ozAPs3s
 WSUBnmFO6FdXq2Ff4yE0ekqx0/8x4DrwdjfsQL0WiUuWbZ8t3yaPdvmQ0NdT8MwzN7
 w1eP2g/MCs2KA==
Received: from [100.112.193.211] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 0C/74-56778-A4F3D606;
 Wed, 07 Apr 2021 05:12:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRoutln5t
 g0LSTw2LF9x2MDowe+36vYw1gjGLNzEvKr0hgzfiyZxZjwU6zijlzN7E0MD7S72Lk4hASmMck
 cePUQ7YuRk4gZzejxMstDiA2m4CmxLPOBcwgtoiAhERHw1t2EJtZQF1i+aRfTCC2sECgxNufC
 xlBbBYBFYmXpw+xgti8Ah4SJzvng9kSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWoUJS51fG
 OEsKskOj8cZ5vAyDsLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGloCsYmJXmKVbqJ
 eaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgeKUUHJiwg3H/6w96hxglOZiURHl5BHIThPiS
 8lMqMxKLM+KLSnNSiw8xynBwKEnwZtgB5QSLUtNTK9Iyc4ChDpOW4OBREuGdYw2U5i0uSMwtz
 kyHSJ1i1OXYeXTeImYhlrz8vFQpcV47kBkCIEUZpXlwI2Bxd4lRVkqYl5GBgUGIpyC1KDezBF
 X+FaM4B6OSMK8UyBSezLwSuE2vgI5gAjpC6mwmyBEliQgpqQamrBv33py3Zwm+8avVIbjLMuP
 J1u0PP7F+Y3o8Te4r54FDyqmR2u0fuFf/3pu4+4zxy1crp3/jWiDtqH7seGl7/pP7uys0pCvv
 xJmum8HLuGePg0K+UW1I5XdRC+u1m+42iV5b3TdpRl9XeP3U6E7+yPXrNz8MWNTCuz5N7MK8F
 2K5O8Uv+J/2kXAsq7x4vqT06ZcrbcGPFHmDDvc5yE77pdFieJ/3ZRDnQf5tFuJ/Xr7Q0mT+N3
 Wp8G9ut4vv7h/68v6XatyEy9M1fNOe6M2LSLYLsj25eVWJYrn6fAUn+6IYP2fBysKsr4+qw24
 fnnpuAZ+o49zda2JerW6dZNzy+lrlkdpnOW5b467U1+97oMRSnJFoqMVcVJwIAE5zUzs2AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-4.tower-267.messagelabs.com!1617772361!284446!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15301 invoked from network); 7 Apr 2021 05:12:42 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-4.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2021 05:12:42 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1375CWJU013138
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 7 Apr 2021 06:12:41 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 7 Apr 2021 06:12:30 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 7 Apr 2021 14:12:31 +0800
Message-ID: <1617775951-3717-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Makefile: Use M to build extern kernel module instead
 of SUBDIRS
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

Since 5.3 kernel commit 7e35b42591c0 ("kbuild: remove SUBDIRS support"),
SUBDIRS has been removed. We can only use make M=dir or set the environment
variable KBUILD_EXTMOD to specify the directory of external module to build.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 .../kernel/device-drivers/agp/kernel_space/Makefile    |  4 ++--
 testcases/kernel/device-drivers/base/tbase/Makefile    |  4 ++--
 .../kernel/device-drivers/drm/kernel_space/Makefile    |  2 +-
 testcases/kernel/device-drivers/include/Makefile       |  4 ++--
 .../misc_modules/per_cpu_allocator_module/Makefile     |  8 ++++----
 testcases/kernel/device-drivers/nls/Makefile           |  6 +++---
 testcases/kernel/device-drivers/usb/tusb/Makefile      | 10 +++++-----
 .../kernel/device-drivers/v4l/kernel_space/Makefile    |  8 ++++----
 testcases/kernel/fs/scsi/ltpfs/Makefile                |  4 ++--
 9 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/device-drivers/agp/kernel_space/Makefile b/testcases/kernel/device-drivers/agp/kernel_space/Makefile
index 5357c135e..5a10064f0 100644
--- a/testcases/kernel/device-drivers/agp/kernel_space/Makefile
+++ b/testcases/kernel/device-drivers/agp/kernel_space/Makefile
@@ -14,8 +14,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR)  SUBDIRS=$(PWD) modules
-#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
+#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 endif
 
 clean:
diff --git a/testcases/kernel/device-drivers/base/tbase/Makefile b/testcases/kernel/device-drivers/base/tbase/Makefile
index 6f7e5e2c1..5e5a40e61 100644
--- a/testcases/kernel/device-drivers/base/tbase/Makefile
+++ b/testcases/kernel/device-drivers/base/tbase/Makefile
@@ -13,8 +13,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
-#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
+#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 endif
 
 clean:
diff --git a/testcases/kernel/device-drivers/drm/kernel_space/Makefile b/testcases/kernel/device-drivers/drm/kernel_space/Makefile
index 11e54d9be..24b768d76 100644
--- a/testcases/kernel/device-drivers/drm/kernel_space/Makefile
+++ b/testcases/kernel/device-drivers/drm/kernel_space/Makefile
@@ -11,7 +11,7 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD)  modules
+	$(MAKE) -C $(KDIR) M=$(PWD)  modules
 endif
 
 clean:
diff --git a/testcases/kernel/device-drivers/include/Makefile b/testcases/kernel/device-drivers/include/Makefile
index c9810ba5e..72d7293c2 100644
--- a/testcases/kernel/device-drivers/include/Makefile
+++ b/testcases/kernel/device-drivers/include/Makefile
@@ -13,9 +13,9 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
 	${CC} -Wall -o userBlockInclude userBlockInclude.c
-#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
+#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 endif
 
 clean:
diff --git a/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile b/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
index 3bc274dad..ae802f77c 100644
--- a/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
+++ b/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
@@ -9,16 +9,16 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 modules:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
 
 clean:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
+	$(MAKE) -C $(KDIR) M=$(PWD) clean
 	rm -f modules.order
 
 help:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
+	$(MAKE) -C $(KDIR) M=$(PWD) help
 
 modules_install:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
+	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
 
 endif
diff --git a/testcases/kernel/device-drivers/nls/Makefile b/testcases/kernel/device-drivers/nls/Makefile
index 172510fe8..a1fab20f8 100644
--- a/testcases/kernel/device-drivers/nls/Makefile
+++ b/testcases/kernel/device-drivers/nls/Makefile
@@ -12,12 +12,12 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
 	${CC} $(EXTRA_CFLAGS) -o userBlockNLS userBlockNLS.c
-#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
+#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 
 clean:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
+	$(MAKE) -C $(KDIR) M=$(PWD) clean
 	rm -f modules.order
 	rm -f userBlockNLS
 
diff --git a/testcases/kernel/device-drivers/usb/tusb/Makefile b/testcases/kernel/device-drivers/usb/tusb/Makefile
index 9488cd563..4dcbca36c 100644
--- a/testcases/kernel/device-drivers/usb/tusb/Makefile
+++ b/testcases/kernel/device-drivers/usb/tusb/Makefile
@@ -13,17 +13,17 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
-#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
+#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 
 clean:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
+	$(MAKE) -C $(KDIR) M=$(PWD) clean
 	rm -f modules.order
 
 help:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
+	$(MAKE) -C $(KDIR) M=$(PWD) help
 
 modules_install:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
+	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
 
 endif
diff --git a/testcases/kernel/device-drivers/v4l/kernel_space/Makefile b/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
index 56e255b04..549c37d5c 100644
--- a/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
+++ b/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
@@ -9,16 +9,16 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 modules:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
 
 clean:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
+	$(MAKE) -C $(KDIR) M=$(PWD) clean
 	rm -f modules.order
 
 help:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
+	$(MAKE) -C $(KDIR) M=$(PWD) help
 
 modules_install:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
+	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
 
 endif
diff --git a/testcases/kernel/fs/scsi/ltpfs/Makefile b/testcases/kernel/fs/scsi/ltpfs/Makefile
index 7c46a4c4d..5f4030661 100644
--- a/testcases/kernel/fs/scsi/ltpfs/Makefile
+++ b/testcases/kernel/fs/scsi/ltpfs/Makefile
@@ -14,9 +14,9 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
 PWD	:= $(shell pwd)
 
 default:
-	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
+	$(MAKE) -C $(KDIR) M=$(PWD) modules
 	${CC}  $(CFLAGS) -o ltpfstest -lm  main.c
-#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
+#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
 endif
 
 clean:
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
