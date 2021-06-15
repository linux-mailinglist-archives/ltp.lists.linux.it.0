Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC143A868E
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78D723C8AE3
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D9513C71CC
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B308B1000A59
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD2401FD65;
 Tue, 15 Jun 2021 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M38YaOorHKLtJu903lpEUEHJpNHVPpNV5YilQkRQj4g=;
 b=mnZbhCGSUMNRVaFrzDpZCuRDZyMGnDwQjsRTwpc4AS0sGqhWhkUVjP7CwsiRLjHAx+GkgN
 lEg+xZ0CvCFBpm3u7JcwId/O9vTRy5zSI6aPEnuPX2Q1kKcpv6pm3cCMb3o2xJknHa+PwW
 Bk6YgY4/JmsQUO+GPT7D3HXftVdSAvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M38YaOorHKLtJu903lpEUEHJpNHVPpNV5YilQkRQj4g=;
 b=arxI/n+MZpfgzxOFejM8dibg1DSBh6uQPbREck8/5bgWUXHjNz8Ixt/yFkSjDp0qytkBQk
 6O1XQyOtWSBGmrBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7C224118DD;
 Tue, 15 Jun 2021 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M38YaOorHKLtJu903lpEUEHJpNHVPpNV5YilQkRQj4g=;
 b=mnZbhCGSUMNRVaFrzDpZCuRDZyMGnDwQjsRTwpc4AS0sGqhWhkUVjP7CwsiRLjHAx+GkgN
 lEg+xZ0CvCFBpm3u7JcwId/O9vTRy5zSI6aPEnuPX2Q1kKcpv6pm3cCMb3o2xJknHa+PwW
 Bk6YgY4/JmsQUO+GPT7D3HXftVdSAvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M38YaOorHKLtJu903lpEUEHJpNHVPpNV5YilQkRQj4g=;
 b=arxI/n+MZpfgzxOFejM8dibg1DSBh6uQPbREck8/5bgWUXHjNz8Ixt/yFkSjDp0qytkBQk
 6O1XQyOtWSBGmrBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DaRLHErWyGDdfQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 16:33:14 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 15 Jun 2021 18:33:04 +0200
Message-Id: <20210615163307.10755-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/3] C,
 shell API: Add $LTPROOT/testcases/bin into PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

although we need to set $LTPROOT/testcases/bin in LTP runner
(i.e. keep it in runltp and runltp-ng), we can add this path when
running from installed LTP (to simplify normal setup).

We could rethink running from git tree (setting TST_DATAROOT),
or adding variable for remote LTP installation location for SSH based
network tests. But that's another step.

Kind regards,
Petr

Petr Vorel (3):
  tst_test.sh: Add $LTPROOT/testcases/bin into PATH
  lib: Add $LTPROOT/testcases/bin into PATH
  doc: Update LTPROOT and PATH environment variables

 README.md                 |  2 +-
 doc/user-guide.txt        |  5 +++--
 lib/tst_test.c            | 22 +++++++++++++++++++---
 testcases/lib/tst_test.sh |  4 ++++
 4 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
