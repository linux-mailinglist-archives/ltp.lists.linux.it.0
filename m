Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F220A4CC048
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 15:48:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 175CD3CA330
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 15:48:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E40833CA1EC
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 15:48:13 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 53512600066
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 15:48:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 629221F384
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646318892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rznVXEzQLdTVB4iS7RA37J1ESyLYcng3jaR268szmp4=;
 b=yb6MzhdJ3NP68nW6gtGQsMY6TE4H5APdCTvl9MYcVR/0buubd8vFHxdeWannoN30KOfrVI
 4XEtdN6+mJssT/8ORxBtsqxyeaHMc2P7MTW8Gr8F1wkibRHg+bKAlp7xFNs7hjS53N1/QF
 /0v/hoN1iuEOwWu3CakcJfC0/bxG4mI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646318892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rznVXEzQLdTVB4iS7RA37J1ESyLYcng3jaR268szmp4=;
 b=NKXVrK58hVGJUjzBV4z6zCjXF7CFc4IxImbXrE8dun3h8BCaXb/B5M709HN84JUBEy/9qm
 j/C4F778IdEz/0BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F3AF13AD9
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 14:48:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 44Y+EizVIGLxAgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 03 Mar 2022 14:48:12 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Mar 2022 15:50:25 +0100
Message-Id: <20220303145032.21493-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/7] ksm06 and libnuma cleanups and fixes
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

Most of the patches cleans up the ksm06 test however a fix for a free
memory estimate for the ltplibnuma is included as well.

Cyril Hrubis (7):
  ksm06: Move option parsing into the setup()
  mem/lib: Export group_check() as ksm_group_check()
  mem/ksm06: Move test code from library to the test
  mem/ksm06: SPDX + docparse comment
  mem/ksm06: Move ksm restoration into the tst_test struct
  libs: libltpnuma: Fix free memory estimate
  mem/ksm06: Make use of the new libltpnuma

 libs/libltpnuma/tst_numa.c         |   6 +-
 testcases/kernel/mem/include/mem.h |   2 +
 testcases/kernel/mem/ksm/Makefile  |   3 +
 testcases/kernel/mem/ksm/ksm06.c   | 146 +++++++++++++++++++----------
 testcases/kernel/mem/lib/mem.c     |  99 ++-----------------
 5 files changed, 114 insertions(+), 142 deletions(-)

-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
