Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF35D02CE8
	for <lists+linux-ltp@lfdr.de>; Thu, 08 Jan 2026 14:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1767877215; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=1SX4dvcPly36inPYhwyH2iYGr9etaHkaxtYOtZaZfU4=;
 b=IKC2gwmAVRJI6W0S3kdR5NxNDR1yYLdEuQtBtUuwuDXA9S4oNYpBCIb7Y/VIGF98EdMSw
 GXZJqe89KLc1Rhoy1+hy/5mWJ/n90RY4zwsuypzPVHJV+wGDBeypWPXTgIozx9avLzNIJym
 RD6mhD9i3mwyRIh15oohMup+9QG/p7E=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC4D53C60BE
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jan 2026 14:00:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28B7A3C2E5D
 for <ltp@lists.linux.it>; Thu,  8 Jan 2026 14:00:11 +0100 (CET)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 17EC71400450
 for <ltp@lists.linux.it>; Thu,  8 Jan 2026 14:00:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-432777da980so1719929f8f.0
 for <ltp@lists.linux.it>; Thu, 08 Jan 2026 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767877209; x=1768482009; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W9AA9tGJtpov0t7YouxLATWuZ0WapdzuNr9/5rMvjw0=;
 b=KqDG81a1JkCThpBOLhHebGubTzENOjsj7/xGSvvf4OhYG6MPldIBOVfkSUQaULWTeb
 EFurqub3oBTFvXOERhHBiX0AHnaKZWCXyurlTyg/L3w3jPuWXdyeI7D+clulbZyE3FRK
 +khv489i7LsiaLzqScSVqNwBFKbFDzk+3PJqSJujnpplt7wdnNpVZMYfhFIBrJ6jC2Uo
 tlwjqDF/z6D7YfJzmzn2aVzTa6DR2duxwDe+0WRh5bE0Q4r/5Qy/IiSOv0qtyXHnZIxV
 HPbz4ZKp0imAbr/6gB4Q6AoPboJcWhEbEP/tKwOfxECL6MpPD1ZNuk+NGbAX+8E9FUuy
 TVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877209; x=1768482009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9AA9tGJtpov0t7YouxLATWuZ0WapdzuNr9/5rMvjw0=;
 b=pcttp7FSbPDQA4UVSZ5KmgjGoRRoIpU1vJ0xulQHscnu5rkMDGMr1hlkBYAtfx2g9T
 oW5twGsFHoMFDg1JxowxyfZC54MyYrDDAlSV5oKc3AVtlJ0xoBPImhB04/3Lk+3bKLnq
 pIUeKt1Qomwme27twLsdx+Yu0beIrEvmthQ+G3S6cmD3rXOomxGqFGo1OOMfwNvf8xoR
 FBvfSH8qhBvwp/cs02FW3aFZbvB4YAPnwXzSvOb7ZNOie+WTYQxkr+wTBjx8Ji7D2rcy
 IqAtpcgqaejyJ5eIefA3Lnp1hR62/CbH7NGE0NfqJpwmxoAXXpQ7pEWdM1eV7/54gZVY
 Tu9w==
X-Gm-Message-State: AOJu0Yz5THp1uFmJPd+TxvZ+t7n9r6ScoMjd2HsMo/Qn1WCzEkcsFSSa
 eZtkjyNp+4bg1Dc7vDai12w/0nmKocRtSCJqmormvccCfvzHmQJbYSlIsPxOAWUKaUz68Vmlnrk
 VfzkJEeA=
X-Gm-Gg: AY/fxX4S2w/zA55TgALU3wTQW3FXNyR//cyuAfLlxojEAtaVa1RkLta+b93AAgXyu8D
 uw4ufaN/mBSOIToimL4E5hg4wY2j7RIBRe5pb8kroR3jq3oZIOgQGhI9Uc93+FK8KXknAL+GVCU
 +2Ar8YHEJuTzBBCUO+Qqb+m+gmu39S3S03bbyMlc1iE2XhYOmvdqLJ69zNewzV0h0r7nIpGSRKh
 8KhExyV0Pe5dlOkGH51m8Ezt+G3aDj2DRoRUXDn8ggh7cUzlIU07YcQcWk7OaTB9JuVWhLaF5Ia
 t2iyTaznyGWYt7LZ6t3XkIonWfv2/hOEhR4FfVG8pK9bHhh7KJc7AknSWjMLJMBSSdckcVLSnKd
 eEoAvA7hWSYO7BKckM5HD201X2hrkzHKH5wEgWmw/ui3uZjB8aBT6GvL0Bdep4kz7bNJAnz0ZqM
 tXJDlKB/QtNU0ATw8=
X-Google-Smtp-Source: AGHT+IF4/v31g8Au/j/SEexe5QImwYMdQ3/pEqse+FyesMa1hOLEeaoG2Mn7ur/wyw8mEjPq1yZ7pw==
X-Received: by 2002:a05:6000:22c1:b0:431:74:cca with SMTP id
 ffacd0b85a97d-432c3760fa1mr7453048f8f.44.1767877208948; 
 Thu, 08 Jan 2026 05:00:08 -0800 (PST)
Received: from localhost ([2401:4900:883c:6313:f5f:2775:4dbf:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9afsm17656272f8f.24.2026.01.08.05.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:00:08 -0800 (PST)
To: ltp@lists.linux.it
Date: Thu,  8 Jan 2026 13:59:53 +0100
Message-ID: <20260108130002.256854-1-avinesh.kumar@suse.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] uaccess.c: Skip on Lockdown/Secure Boot
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
From: Avinesh Kumar via ltp <ltp@lists.linux.it>
Reply-To: Avinesh Kumar <avinesh.kumar@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

following the commit (fca9460dee fw_load: Skip on Lockdown/Secure Boot)
to take care of

ltp_uaccess    0  TINFO  :  module signature enforcement: off
insmod: ERROR: could not insert module ltp_uaccess.ko: Key was rejected by service

Signed-off-by: Avinesh Kumar <avinesh.kumar@suse.com>
---
 testcases/kernel/device-drivers/uaccess/uaccess.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/device-drivers/uaccess/uaccess.c b/testcases/kernel/device-drivers/uaccess/uaccess.c
index ab6fa58a7..f337aba64 100644
--- a/testcases/kernel/device-drivers/uaccess/uaccess.c
+++ b/testcases/kernel/device-drivers/uaccess/uaccess.c
@@ -29,6 +29,7 @@
 #include "test.h"
 #include "old_module.h"
 #include "safe_macros.h"
+#include "tst_security.h"
 
 #include "ltp_uaccess.h"
 
@@ -39,6 +40,12 @@ static const char dev_tcase[]	= "/sys/devices/" DEV_NAME "/tcase";
 static const char module_name[]	= DEV_NAME ".ko";
 static int module_loaded;
 
+static void setup(void)
+{
+	if (tst_lockdown_enabled() > 0 || tst_secureboot_enabled() > 0)
+		tst_brkm(TCONF, NULL, "Cannot load unsigned modules in Lockdown/Secure Boot");
+}
+
 static void cleanup(void)
 {
 	if (module_loaded)
@@ -94,6 +101,8 @@ int main(int argc, char *argv[])
 {
 	tst_parse_opts(argc, argv, NULL, NULL);
 
+	setup();
+
 	tst_require_root();
 	tst_sig(FORK, DEF_HANDLER, cleanup);
 
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
