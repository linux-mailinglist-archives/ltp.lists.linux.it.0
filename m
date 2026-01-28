Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ef+sHn+2eWlHygEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:10:55 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D09D985
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769584254; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=17KeKyKZgGVY7QdmVwdDH1m1kQ1W66+KedggwOQfLxU=;
 b=UC3iRmZZXy6UNBlST1pcnATopox1EUn3BCoOkWfE3zPyQRqQohw7Ht037UPnEBbApkHvk
 +NN21IBL8++b0pjlsj1VhoqqQew3MgU5JVCjC3p8cEefyVEBATPOqMBxCB3yvp/2C4CJXhh
 9BNEBk5B3C8mjrD7zu7fAXmV8afQ+QY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B3353CA727
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:10:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF9D33CA110
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 08:10:50 +0100 (CET)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5CFBB600768
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 08:10:50 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so3895647f8f.0
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 23:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769584249; x=1770189049; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/2yVYhuokoGwSzHdeTcXvw2j3zf1lcwWIn+Qc3brmoE=;
 b=VCPND73es6jYQ5K2/4izxofiNMysZUck9K2fb0orvUQix8QwVCRKi0OvwGgBAJacU8
 NR6tBdjxx7PNcW/I9OTKwsGY3MwQE0qSK47LiiIdwIKdI4bkvQTKDsGb1ltidKqNKuV0
 yr59TwWd6m1TMkCD1W443rf4RTcVfUK3acPHTTTDXiBIvcBrGKsOKtQajJnS3WfPSi9R
 8+xtGct8a4KyUPCn/KNxn/uTc3t+I1XBu06KqfzBz4W8TAKDyxN3YpA3Y9j511AXrHly
 V3hcMRlHLy34lye1hUEFUkRKdI89/amlPN3cUTJlS+ZuA55b0Frv7RdMxy9Ro6sS+l20
 TJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769584249; x=1770189049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2yVYhuokoGwSzHdeTcXvw2j3zf1lcwWIn+Qc3brmoE=;
 b=MveUGj82cAAeOzS2+W5wM4VVQcD+dayO9pc4PvzAlMss679wy5Ft+WG7+Pbl0lunsx
 4YHi/uwmOypeM1ngvY88RoZYEmr0AD9aCEo172qEgP/vYYLBRVv7PLBwHmHvRgnf7CJ/
 9fyCXJ/7nXeg5xsMgyKju6i7qQdds2R1S2mgs24uieB4BqWXur/WJjUcC7310kqce79H
 pi7xUsNXfgE7Z7SmAIWG88rDPlrXZxEsxS3ynB8JdQ/4MjLF8v2sYkmsEoz+CBYjFWqA
 PTYcmjNnax8MlgC8/BXA6vTV1J3Nx61tfofJrijuFF2wrHCDVaYnm1/F2zycf2MDdVFG
 sVsw==
X-Gm-Message-State: AOJu0Yy3W3ej/nhK4UhECHaHSXKyj3VUb12ym9bWk9PvDPiIMt8cFj0y
 LP00F+sWcKsQmxd2aLgDrd1H3AYFiTTUPdWeDo90vw+Aownt+r1tIT134QkvB7XGkTKfHFZ3bY/
 ADYQ=
X-Gm-Gg: AZuq6aK9STdMO/8ndptpreWKNU2XdAaedeIiKQVSbZiq5WUuGZtfjWXI4GWd6R3vr3g
 5cXMt5ACFdk4qx4807ztjehCHrYYYpvOPR7GOwBgkA8JcIAtZp6DO87BLT0JShWjLozCX6qpXqQ
 E9u6DcMFIAq6D9L02fKCOthsLmHdVKpsCm5fZxTauEjZAnn7UBqK/1+8S9+UyXC2pcijgrYRolb
 c9+EWyM8awnAkNqyJCOuTgWmJHfgeXgoEjzMD7VRSBoSkC1P9WRBPKLzwMyOLoclox2kzB+ys9z
 riWYoVFTeVmLX2oYZ5n8KFMr9B/QWBygGu4WWoeO/reku+N7OBHHPmsWAzUEvcoirx6PJ6EmAO4
 /28ejFXN4HxD/kJMQHMhu1qaQqFdcVRo2kcuZqkLj+cRBFreDUWHu3KQ6VE7UwJ4eJqNHquVLJb
 o=
X-Received: by 2002:a05:6000:186e:b0:435:9770:9eb8 with SMTP id
 ffacd0b85a97d-435dd05c7e8mr6116056f8f.25.1769584249484; 
 Tue, 27 Jan 2026 23:10:49 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-435e1354205sm4743925f8f.41.2026.01.27.23.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 23:10:49 -0800 (PST)
To: ltp@lists.linux.it
Date: Wed, 28 Jan 2026 07:10:37 +0000
Message-ID: <20260128071040.802-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1] shmctl03: Fix 32-bit compat mode failure by
 forcing limits
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,suse.com:mid,lists.linux.it:dkim]
X-Rspamd-Queue-Id: EC8D09D985
X-Rspamd-Action: no action

On 64-bit kernels, the default shmmax and shmall values often exceed
the range of a 32-bit unsigned long or are clipped differently by the
kernel's compat syscall layer than they appear in /proc.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl03.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
index a3291c37f..335a60980 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl03.c
@@ -13,6 +13,13 @@
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
 
+/* Force 32-bit limits to avoid overflow/mismatch on 64-bit kernels */
+#if __WORDSIZE == 32
+# define SET_SHM_LIMIT "2147483647"
+#else
+# define SET_SHM_LIMIT NULL
+#endif
+
 static void verify_ipcinfo(void)
 {
 	struct shminfo info;
@@ -37,4 +44,9 @@ static void verify_ipcinfo(void)
 
 static struct tst_test test = {
 	.test_all = verify_ipcinfo,
+	.save_restore = (const struct tst_path_val[]) {
+		{"/proc/sys/kernel/shmmax", SET_SHM_LIMIT, TST_SR_TCONF_MISSING},
+		{"/proc/sys/kernel/shmall", SET_SHM_LIMIT, TST_SR_TCONF_MISSING},
+		{}
+	},
 };
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
