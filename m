Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07997356604
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:04:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A592A3C1DF7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:04:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 267EE3C1DE2
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:04:26 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 447D9200089
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617782663; i=@fujitsu.com;
 bh=GcTuYqeODm4zEQjhHmX64+CQv5qs6zxmrPPTnAGQEiQ=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=TQyHa0hZunOkjlviMgiS/l2yhmUjc6vy13J8qEdaHsQHlgzUQg+QqrSnaWJoF0EbA
 rLab76FJGIoVPthxV9+LNmycKpnyyGXTAeOHkP3FL9xSjQ6xOu5zdi8Tcjp8gat2st
 9Sn5x3Fe51Nsrfi9PMdIbCmG6HhWKgbHJop2Vc8EPwZdq+6VDB7gG1YeBHApi3ltf3
 ntuxKIBXj2M7cgvnMOKd0Qk20e/Mvq9G584Rf/K8x8FJKoUXnJmCHaIyBNXzY1cSmk
 svjCyJXxGTP4wi4uy2MqN8qsVuTH4sH6asQFK1XWgP3rp+afhK5qoTe4MBa716nhBb
 DbZ5IVCu49ciA==
Received: from [100.112.196.73] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-west-1.aws.symcld.net id DD/46-53303-7876D606;
 Wed, 07 Apr 2021 08:04:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxRbc9PTf
 BYOc8RosV33cwOjB67Pu9jjWAMYo1My8pvyKBNeNmy0/Ggp02Fd1X/rE2ME4y7WLk4hASmMck
 MeXyBiYIZzejRMfVmWxdjJwcbAKaEs86FzCD2CICEhIdDW/ZQWxmAXWJ5ZN+MYHYwgIhEj8Ov
 wOrYRFQkTh8ppUFxOYV8JA4euULmC0hoCAx5eF7sBpOAW2Jls8PweYICWhJbJ4yhQ2iXlDi5M
 wnLBDzJSQOvnjBDNGrKHGp4xsjhF0l0fnhONsERv5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9f
 QwEDX0NBI19DSTNfI1FQvsUo3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzAgUwqO/N/B
 uPzNB71DjJIcTEqivG2RuQlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgvpQHlBItS01Mr0jJzg
 NEBk5bg4FES4TUCRogQb3FBYm5xZjpE6hSjLsfOo/MWMQux5OXnpUqJ84qCzBAAKcoozYMbAY
 vUS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeY1BpvBk5pXAbXoFdAQT0BFSZzNBjihJREh
 JNTBNLyjuWvKj7kIgz5aUe858Re3KIskKqxgve5fvN5T4GnnD3ts1xPxha0nb9Y9rdNk6vus9
 uRA1T+y71lkZs8YVl9/UNRXv/ah80F33zvYlv4/febnh9/rnEQGWPeW87//k+qxcPHPX+XvrH
 2wwnrt4evkF0dlC8pdFbO2rVks/tRY4sDxlj/KCl43yOt1TO+cLCVwSXaLm6Hs1VrnQ0GvhdE
 9d/wM8vOb3k4LzT+UvMUg/s/yvRvznuWl2U0/vuSPw4ZCNyeJ47ySOKMMbkZ84E2YbvNoUcJ7
 Nmq/b9wf/hQxOniIfv6gd/yszzrpa8gpdKJfOOLTp+jn7TbrbHlubXG07veEMR5iFjP7E3otK
 LMUZiYZazEXFiQA9HfQUTwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-17.tower-291.messagelabs.com!1617782662!491015!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20263 invoked from network); 7 Apr 2021 08:04:22 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-17.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2021 08:04:22 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13784HpT017964
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 7 Apr 2021 09:04:22 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 7 Apr 2021 09:04:15 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 7 Apr 2021 17:04:17 +0800
Message-ID: <1617786257-6032-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <606D5E48.1060307@fujitsu.com>
References: <606D5E48.1060307@fujitsu.com>
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
Subject: [LTP] [PATCH v2] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
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
v1->v2:
add mssing .../dev_sim_framework/kernel_space/Makefile
 .../kernel/device-drivers/agp/kernel_space/Makefile    |  4 ++--
 testcases/kernel/device-drivers/base/tbase/Makefile    |  4 ++--
 .../dev_sim_framework/kernel_space/Makefile            |  4 ++--
 .../kernel/device-drivers/drm/kernel_space/Makefile    |  2 +-
 testcases/kernel/device-drivers/include/Makefile       |  4 ++--
 .../misc_modules/per_cpu_allocator_module/Makefile     |  8 ++++----
 testcases/kernel/device-drivers/nls/Makefile           |  6 +++---
 testcases/kernel/device-drivers/usb/tusb/Makefile      | 10 +++++-----
 .../kernel/device-drivers/v4l/kernel_space/Makefile    |  8 ++++----
 testcases/kernel/fs/scsi/ltpfs/Makefile                |  4 ++--
 10 files changed, 27 insertions(+), 27 deletions(-)

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
diff --git a/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile b/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
index e7e7be607..ccaf3f9ac 100644
--- a/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
+++ b/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
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
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
