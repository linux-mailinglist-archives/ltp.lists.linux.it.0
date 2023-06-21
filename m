Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A43738271
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jun 2023 13:54:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C57B93CDACB
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jun 2023 13:54:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF3683C9D07
 for <ltp@lists.linux.it>; Wed, 21 Jun 2023 13:54:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 58A266006D5
 for <ltp@lists.linux.it>; Wed, 21 Jun 2023 13:54:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 533B921C28;
 Wed, 21 Jun 2023 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687348484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7v2JcSEvy3gvW+3aDGQ/wyn6thILZnrZBux8OAwvw4Y=;
 b=req+NbUDvhQPcdp2CLrPQA+Oc5t+d7EeewIT8roHlgcuKKqNajAljYJyq2czPw5P7E1MjT
 TPcaa75aKfmAsfeLrayBckii9zqprS+5DuugPlO2gldsXadDvQr+S2tipOHqTmkUBoX3/O
 jQevtJFlRNWph6xObZeL7NPLdbGQxV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687348484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7v2JcSEvy3gvW+3aDGQ/wyn6thILZnrZBux8OAwvw4Y=;
 b=p48B/D+bFdtCxcMmxGJJ3oxotZnRSZCoiU/yuFHhqnIbY/mXYL/dA9xHhw+zDb0dxZSkmc
 wdTCCLQ9W/eiwvBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 406F3133E6;
 Wed, 21 Jun 2023 11:54:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VRnSDgTlkmSuOQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 21 Jun 2023 11:54:44 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: Li Wang <liwang@redhat.com>,
	ltp@lists.linux.it
Date: Wed, 21 Jun 2023 13:54:18 +0200
Message-ID: <20230621115443.12676-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Remove KVM tests from CVE runfile
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

KVM tests are currently limited to baremetal testing of x86 machines only.
They have their own special runfile. The CVE runfile is used for testing
any architecture and machine type including virtual ones. Adding KVM
tests to it will cause non-x86 platforms to complain that the tests do
not exist.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/runtest/cve b/runtest/cve
index bbc552bea..7d1e84f89 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -73,8 +73,6 @@ cve-2020-29373 io_uring02
 cve-2020-36557 pty06
 cve-2021-3444 bpf_prog05
 cve-2021-3609 can_bcm01
-cve-2021-3653 kvm_svm01
-cve-2021-3656 kvm_svm02
 cve-2021-4034 execve06
 cve-2021-4197_1 cgroup_core01
 cve-2021-4197_2 cgroup_core02
@@ -82,7 +80,6 @@ cve-2021-4204 bpf_prog06
 cve-2021-22555 setsockopt08 -i 100
 cve-2021-26708 vsock01
 cve-2021-22600 setsockopt09
-cve-2021-38198 kvm_pagefault01
 cve-2021-38604 mq_notify03
 cve-2022-0847 dirtypipe
 cve-2022-2590 dirtyc0w_shmem
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
