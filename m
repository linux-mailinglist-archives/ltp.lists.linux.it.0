Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA898B0D891
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jul 2025 13:52:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D2883CCCB9
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jul 2025 13:52:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66DA43CAE38
 for <ltp@lists.linux.it>; Tue, 22 Jul 2025 13:52:40 +0200 (CEST)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1455B1400432
 for <ltp@lists.linux.it>; Tue, 22 Jul 2025 13:52:36 +0200 (CEST)
Received: from loongson.cn (unknown [113.200.148.30])
 by gateway (Coremail) with SMTP id _____8AxHHKAe39oSZIvAQ--.30860S3;
 Tue, 22 Jul 2025 19:52:33 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
 by front1 (Coremail) with SMTP id qMiowJBxpeR_e39oPdUhAA--.45195S2;
 Tue, 22 Jul 2025 19:52:31 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Linux Test Project <ltp@lists.linux.it>
Date: Tue, 22 Jul 2025 19:52:30 +0800
Message-ID: <20250722115230.2521-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxpeR_e39oPdUhAA--.45195S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1UJr43XF4UXF4UCryxXrc_yoW8Jw1xpF
 WDCFWUCr4UWF17WF95XF4I9Fy8X3WkC34fu3ZFy3s0grZIkFZ2qr4vgr9Iqw1IqrZ7JFWa
 ga1UtrW0g3W8A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU82-e7UUUUU==
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] ltp_block_dev: Check HAVE_LINUX_GENHD_H to include
 genhd.h
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

After the LTP commit d4dd360b05f8 ("device-drivers/acpi/ltp_acpi_cmds:
Fix build errors"), HAVE_LINUX_GENHD_H is defined to 1 if you have the
<linux/genhd.h> header file.

The macro definition DISK_NAME_LEN may be completely removed, so it is
better to use #ifdef HAVE_LINUX_GENHD_H to include genhd.h.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
By the way, it seems that the following file is not used, should it be
deleted? If yes, I will send a formal patch later.

  testcases/kernel/device-drivers/block/block_dev_kernel/test_genhd.c

 .../device-drivers/block/block_dev_kernel/ltp_block_dev.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.c b/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.c
index 0fd278981..f50530f23 100644
--- a/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.c
+++ b/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.c
@@ -13,7 +13,7 @@
 #include <linux/device.h>
 #include <linux/fs.h>
 #include <linux/blkdev.h>
-#ifndef DISK_NAME_LEN
+#ifdef HAVE_LINUX_GENHD_H
 # include <linux/genhd.h>
 #endif
 
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
