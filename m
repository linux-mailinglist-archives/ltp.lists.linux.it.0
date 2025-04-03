Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9EA7A0D4
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Apr 2025 12:19:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1D083CB27D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Apr 2025 12:19:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E1BE93CB251
 for <ltp@lists.linux.it>; Thu,  3 Apr 2025 12:19:20 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4F06D1400176
 for <ltp@lists.linux.it>; Thu,  3 Apr 2025 12:19:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E27761F385;
 Thu,  3 Apr 2025 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1743675559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xuQyKzG0H2f6MXDLS3kMJgSslzfue3Ww/w9d4mdRmgs=;
 b=PiKcwYiUuCChvlmoz1tHk1qbyxO/Ho0zRw5lyTJRxRHOvGWtpFo/nCBk+sXApv7y6UNX8H
 2S2bDvRny16L2qWL13/yEgjIRccjj0R/C7xsZ8jGuwed2dBLpjcFrN7EkHeX9eAMaKD2fQ
 jxWNzB3oucedpRVs5YCiqNP+TYZrq2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1743675559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xuQyKzG0H2f6MXDLS3kMJgSslzfue3Ww/w9d4mdRmgs=;
 b=x9bH5wZkH8UOHpLrUSRgqVMhCQa6XUu1bn6yF1FCGZoMyXVtaJnKkRbQ1XJka5/4BvffDe
 HlbQVIhL5A3IifCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1743675558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xuQyKzG0H2f6MXDLS3kMJgSslzfue3Ww/w9d4mdRmgs=;
 b=Wsb4iA4TabV4SOe/vwmZH8eQGMysHedE+oSSwfA8347J1JQ3EpbW/Bnd11w0gt84naKkeM
 mZ5keM6lbW53WSA3S5Pr7kwdQdtVnRyHM8HFUBA15kIjBCstJyAaEBiKlMzDNAT5ofElMX
 igVtDKQmjYVleRx3b2RIGrwjz0ZPXfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1743675558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xuQyKzG0H2f6MXDLS3kMJgSslzfue3Ww/w9d4mdRmgs=;
 b=RMv2+1R8ud7Uc1Sx76k5QOruGJCBZ9VYq101+w18yEgHLPh1wAbXhNYaKSMh6M6VQ8Y1vs
 zUkG8ObAgEzKT4Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B80A81392A;
 Thu,  3 Apr 2025 10:19:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pLX3K6Zg7mcUAgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 03 Apr 2025 10:19:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Apr 2025 12:19:10 +0200
Message-ID: <20250403101912.459507-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC][PATCH 0/2] Merge runtest files
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

Hi,

besides runtest/ipc, there are other small runtest files.  I know we are
slowly working towards removing runtest files, but until it happen we
might want to optimize (=> merge) small runtest files into others.

With this change we have in the runtest files (ignoring comments):

$ for i in runtest/*; do echo "$(grep -v '#' $i | wc -l): $i"; done | sort -rn


$ wc -l runtest/* | sort -nr # not taking into account the comments
1823: runtest/syscalls
392: runtest/controllers
140: runtest/scsi_debug.part1
140: runtest/ltp-aiodio.part1
137: runtest/net.nfs
...
9: runtest/watchqueue
9: runtest/tracing
9: runtest/ima
7: runtest/dma_thread_diotest
7: runtest/cpuhotplug
6: runtest/net.ipv6_lib
6: runtest/input
6: runtest/capability
5: runtest/power_management_tests_exclusive
5: runtest/power_management_tests
5: runtest/kvm
4: runtest/net.multicast
3: runtest/uevent
3: runtest/hyperthreading
3: runtest/crashme
3: runtest/can
2: runtest/nptl
1: runtest/s390x_tests
1: runtest/irq
1: runtest/fcntl-locktests
0: runtest/staging

I would suggest to:

* move runtest/can to runtest/kernel_misc (better
name would be kernel_drivers, but I don't want to do renames, even
merging runtest files will disturb folks testing with LTP.

* move runtest/fcntl-locktests to runtest/net.nfs.

* runtest/nptl is NPTL test for pthread_cond_timedwait(), can this be
  moved to runtest/sched? (there are other pthread_* tests). Not sure if
  tests are relevant now.

* runtest/irq Obviously we would need more IRQ tests (IMHO none even in
  kselftest)

I wonder if runtest/dma_thread_diotest. runtest/crashme,
runtest/power_management_tests and runtest/power_management_tests_exclusive
are still relevant or that much outdated, that it should be removed.

I think vmcp_m.sh (the only one in runtest/s390x_tests) should be removed.

Other should probably be kept separate.

runtest/staging is expected to be often 0.

Kind regards,
Petr

Petr Vorel (2):
  runtest/ipc: Enable named pipes on non-blocking IO
  runtest: Move ipc into syscalls

 runtest/ipc      | 30 ------------------------------
 runtest/syscalls |  9 +++++++++
 2 files changed, 9 insertions(+), 30 deletions(-)
 delete mode 100644 runtest/ipc

-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
