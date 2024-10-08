Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F17BD9952C7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 17:01:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0F053C20C9
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2024 17:01:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8B7673C1D0B
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 17:00:12 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9CDD41A00F07
 for <ltp@lists.linux.it>; Tue,  8 Oct 2024 17:00:08 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 369F21FCE7;
 Tue,  8 Oct 2024 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728399608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRkAhFPCIcOZJZeCZWci64d3TF06+IPDpZRAxk3upqk=;
 b=aGDVvqtA4LvUdV0JZ4YBl61CHTkE2khQzAAFizlrCozuzpsSo2TwlPngyqH2SSt4FYXxFS
 S4lcy+xPpieMfwTc6ns5t58OIpwhWEbVVOp5O8KBXH3iQx3ZBgXZSGHHoVKxRaFAovqQhg
 rv4B5GrT1ZDJIMlcnKh6A7RaGpMbon0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728399608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRkAhFPCIcOZJZeCZWci64d3TF06+IPDpZRAxk3upqk=;
 b=CXE5jinyROP/6/FV0z4Oh/oTgjgf9Zi1wNEDFV9xD4OX6b0bfEyChQxcGe1A/mA4GiDZt9
 aNYoLvZAU45euODQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aGDVvqtA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CXE5jiny
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728399608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRkAhFPCIcOZJZeCZWci64d3TF06+IPDpZRAxk3upqk=;
 b=aGDVvqtA4LvUdV0JZ4YBl61CHTkE2khQzAAFizlrCozuzpsSo2TwlPngyqH2SSt4FYXxFS
 S4lcy+xPpieMfwTc6ns5t58OIpwhWEbVVOp5O8KBXH3iQx3ZBgXZSGHHoVKxRaFAovqQhg
 rv4B5GrT1ZDJIMlcnKh6A7RaGpMbon0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728399608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRkAhFPCIcOZJZeCZWci64d3TF06+IPDpZRAxk3upqk=;
 b=CXE5jinyROP/6/FV0z4Oh/oTgjgf9Zi1wNEDFV9xD4OX6b0bfEyChQxcGe1A/mA4GiDZt9
 aNYoLvZAU45euODQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADCC8137CF;
 Tue,  8 Oct 2024 15:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mI98JPdIBWf6KgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 08 Oct 2024 15:00:07 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 08 Oct 2024 16:59:58 +0200
MIME-Version: 1.0
Message-Id: <20241008-listmount_statmount-v6-3-0fd456b6b9bf@suse.com>
References: <20241008-listmount_statmount-v6-0-0fd456b6b9bf@suse.com>
In-Reply-To: <20241008-listmount_statmount-v6-0-0fd456b6b9bf@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728399605; l=6709;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=9tHG4xrUQVc3KnoXc0vEEtCQs39dALcEvHEz5qnQ1v8=;
 b=aZGXNn346wmzA9tIycOolwp5mi1BidPHH41iOTK+XXyijStnkeaEnuGk2DG+2/yuedZ5OX8Sn
 mS3u6uQ32HlCOdpKUl6xNyQRx3FTKqM4otH1KslzZZtzHEzZO5oMubj
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: 369F21FCE7
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.com:email,suse.com:mid];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v6 03/16] Add listmount/statmount syscalls
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Reviewed-by: Avinesh Kumar <akumar@suse.de>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/lapi/syscalls/aarch64.in   | 2 ++
 include/lapi/syscalls/arc.in       | 2 ++
 include/lapi/syscalls/arm.in       | 2 ++
 include/lapi/syscalls/hppa.in      | 2 ++
 include/lapi/syscalls/i386.in      | 2 ++
 include/lapi/syscalls/ia64.in      | 2 ++
 include/lapi/syscalls/loongarch.in | 2 ++
 include/lapi/syscalls/mips_n32.in  | 2 ++
 include/lapi/syscalls/mips_n64.in  | 2 ++
 include/lapi/syscalls/mips_o32.in  | 2 ++
 include/lapi/syscalls/powerpc.in   | 2 ++
 include/lapi/syscalls/powerpc64.in | 2 ++
 include/lapi/syscalls/s390.in      | 2 ++
 include/lapi/syscalls/s390x.in     | 2 ++
 include/lapi/syscalls/sh.in        | 2 ++
 include/lapi/syscalls/sparc.in     | 2 ++
 include/lapi/syscalls/sparc64.in   | 2 ++
 include/lapi/syscalls/x86_64.in    | 2 ++
 18 files changed, 36 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 61d4450bf..c184f5710 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -303,4 +303,6 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
 _sysctl 1078
diff --git a/include/lapi/syscalls/arc.in b/include/lapi/syscalls/arc.in
index 752cc54fd..ff58f1be2 100644
--- a/include/lapi/syscalls/arc.in
+++ b/include/lapi/syscalls/arc.in
@@ -323,3 +323,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 84203ca4d..ff1415f52 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -402,3 +402,5 @@ futex_waitv (__NR_SYSCALL_BASE+449)
 cachestat (__NR_SYSCALL_BASE+451)
 fchmodat2 (__NR_SYSCALL_BASE+452)
 mseal (__NR_SYSCALL_BASE+462)
+statmount (__NR_SYSCALL_BASE+457)
+listmount (__NR_SYSCALL_BASE+458)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index 8240c69ce..ac6cd691d 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -50,3 +50,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index f6e8c7258..d2f8c295d 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -437,3 +437,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 8f55029a9..cd770bace 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -350,3 +350,5 @@ futex_waitv 1473
 cachestat 1475
 fchmodat2 1476
 mseal 1486
+statmount 1481
+listmount 1482
diff --git a/include/lapi/syscalls/loongarch.in b/include/lapi/syscalls/loongarch.in
index 3df354fce..7e40e01bf 100644
--- a/include/lapi/syscalls/loongarch.in
+++ b/include/lapi/syscalls/loongarch.in
@@ -308,3 +308,5 @@ set_mempolicy_home_node 450
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/mips_n32.in b/include/lapi/syscalls/mips_n32.in
index d85c567c7..1c64e9ab4 100644
--- a/include/lapi/syscalls/mips_n32.in
+++ b/include/lapi/syscalls/mips_n32.in
@@ -377,3 +377,5 @@ futex_waitv 6449
 cachestat 6451
 fchmodat2 6452
 mseal 6462
+statmount 6457
+listmount 6458
diff --git a/include/lapi/syscalls/mips_n64.in b/include/lapi/syscalls/mips_n64.in
index c34a85bbe..e3895b1ea 100644
--- a/include/lapi/syscalls/mips_n64.in
+++ b/include/lapi/syscalls/mips_n64.in
@@ -353,3 +353,5 @@ futex_waitv 5449
 cachestat 5451
 fchmodat2 5452
 mseal 5462
+statmount 5457
+listmount 5458
diff --git a/include/lapi/syscalls/mips_o32.in b/include/lapi/syscalls/mips_o32.in
index 10d77787b..043747da7 100644
--- a/include/lapi/syscalls/mips_o32.in
+++ b/include/lapi/syscalls/mips_o32.in
@@ -423,3 +423,5 @@ futex_waitv 4449
 cachestat 4451
 fchmodat2 4452
 mseal 4462
+statmount 4457
+listmount 4458
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index af3ae5c90..a3b8fdabf 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -430,3 +430,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index af3ae5c90..a3b8fdabf 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -430,3 +430,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index e8e7fff0b..bf55073d6 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -417,3 +417,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 0ee3bd897..d11e22bd3 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -365,3 +365,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 5701f2285..67cf85d50 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -411,3 +411,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 172969f60..56e275f74 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -416,3 +416,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index 5b667f10f..cfe221919 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -381,3 +381,5 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 1993f343a..8919487c8 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -358,6 +358,8 @@ futex_waitv 449
 cachestat 451
 fchmodat2 452
 mseal 462
+statmount 457
+listmount 458
 rt_sigaction 512
 rt_sigreturn 513
 ioctl 514

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
