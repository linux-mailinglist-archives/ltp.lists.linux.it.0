Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6BD65FF8F
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Jan 2023 12:31:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BED8A3CCD15
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Jan 2023 12:31:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 727C03CB620
 for <ltp@lists.linux.it>; Fri,  6 Jan 2023 12:31:35 +0100 (CET)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EDB3C1A009A4
 for <ltp@lists.linux.it>; Fri,  6 Jan 2023 12:31:34 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id h16so993644wrz.12
 for <ltp@lists.linux.it>; Fri, 06 Jan 2023 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hDS2JnjUxbEW8HvwZzQk1z86lijPqBuaxQJzxNhEpPk=;
 b=qfCM0i+SVfndSToCY7i3H/qhLN7aSxr6G86ZIUdZ2Lqaq0wlbFp76KyjKLrMGsuVMv
 lZxZ3HdmHJpyRr/8JK9nZuMT2hSdkXQxM2AaUIBlsRehGvPvqDzqTbqp2xfHuYxUx6iN
 ybGTAORFZ1uO/NQ8OdegHQjSNkF29bAO6sLusrvgCyjmSkjIoco59JiDjNpfNBj+PnEm
 STgO3Ivvmg4+AXhyxiIJwTs6FpiSwonjD9U5Lgp3nOdkd+U1Ei2qE42pDyN/TCnJprz/
 7kKbs4157hzvz+M8E/ihDcAMO22cDTDLOHncs8OT1HuNSB5n2+q6eU0WMYIrOOybkpUT
 iZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDS2JnjUxbEW8HvwZzQk1z86lijPqBuaxQJzxNhEpPk=;
 b=A8Z+A0srN4VkdG5iwVF0whg3f68se+6CTFEW+qkUetKx3WTAEOH18LPGWlqB38Umaz
 0k6Myn4WKkumN6PRUKuyCLm6CaIpbFCI1oloc5iIFK26lt46tVlpijYvVgiZd/3vewH8
 RjtDX2Ct8wP3c5dcbu7tUkW62fNqNLGIXkVpRuf8T9itwwORG0Mx0Uew3dm7DO4YoZG8
 DuudQTFyB7IsdP2gLACVYnplOHcYQCQJt+c/jRmXAPcg3w6ghhcYFdyncx1A6t9gBOoz
 Z5Nlbgt5uBqwbudpPvOMwu7WOaXBxgAQ3GdUuI7d/CHkdExukgYufgXX8G4LBrSfSrwR
 Xk+A==
X-Gm-Message-State: AFqh2koTSpIml9xfS51t8dQ69WdeLyxtamnYMyWdffybzIGqxLWeXdqC
 DUe1Nls+ExcCXEIbKShBOTfL0mWiYu0D5jIL
X-Google-Smtp-Source: AMrXdXu4ckr5Lvw9MTFEbo118NR7uBeE13iKzZJ+Q3rUL/ZjQ5Kx0kX5HyICyKc1koTOhJKrfQDBkw==
X-Received: by 2002:adf:ce0e:0:b0:27c:dcd7:1c97 with SMTP id
 p14-20020adfce0e000000b0027cdcd71c97mr25516055wrn.40.1673004694472; 
 Fri, 06 Jan 2023 03:31:34 -0800 (PST)
Received: from aa.suse.de ([2408:8207:25e3:3da0:a00:27ff:fef1:8431])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b00294176c2c01sm898567wrx.86.2023.01.06.03.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 03:31:34 -0800 (PST)
From: coolgw <coolgw1126@gmail.com>
X-Google-Original-From: coolgw <wegao@suse.com>
To: ltp@lists.linux.it
Date: Fri,  6 Jan 2023 06:31:26 -0500
Message-Id: <20230106113126.5304-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Add containers/share to PATH when call
 init_ltp_netspace
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

When run single test case use command such as:
LTP_SHELL_API_TESTS=shell/net/tst_rhost_run.sh make test-shell
Error msg such as "ns_create: command not found" will popup, so
need update PATH before call ns_create etc..

Signed-off-by: WEI GAO <wegao@suse.com>
---
V2 -> V3: move path to test case itself 
V1 -> V2: add tst_require_cmds for init_ltp_netspace()

 lib/newlib_tests/shell/net/tst_rhost_run.sh | 2 +-
 testcases/lib/tst_net.sh                    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
index 773b8dd33..70087aa61 100755
--- a/lib/newlib_tests/shell/net/tst_rhost_run.sh
+++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
@@ -3,7 +3,7 @@
 # Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
 
 TST_TESTFUNC=do_test
-PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
+PATH="$(dirname $0)/../../../../testcases/lib/:$(dirname $0)/../../../../testcases/kernel/containers/share/:$PATH"
 
 export TST_NET_RHOST_RUN_DEBUG=1
 
diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index ceb45c98d..2849f6bc6 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -128,10 +128,11 @@ tst_net_require_ipv6()
 
 init_ltp_netspace()
 {
+
 	local pid
 
 	if [ ! -f /var/run/netns/ltp_ns -a -z "$LTP_NETNS" ]; then
-		tst_require_cmds ip
+		tst_require_cmds ip ns_create ns_exec ns_ifmove
 		tst_require_root
 
 		tst_require_drivers veth
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
