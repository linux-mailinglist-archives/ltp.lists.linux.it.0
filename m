Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB14C6E44
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 14:33:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99C743CA29C
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 14:33:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4D2A3C9753
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 14:33:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A8101A010D3
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 14:32:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C8E52199F;
 Mon, 28 Feb 2022 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646055179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3M2oRwb3HSNQFITqBvWY5hO1LX+q9YS2QqFN2dV+v5Y=;
 b=GpdfsMyH8WNd40uHhmsL46dy5TArkKFEZTb1W/kQe1G2Wn/xdIZiDf4nFOKo5lUaHaJ38d
 bWDGQfGD+EG/5Tfbl3OE2aSx4rkLRQUzBZaqYYK1mC99gaicdbVUppyqEyZ0Btwb/JVJyv
 vpIkETqYv8nRIeXUKCjy2mmlYsN79Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646055179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3M2oRwb3HSNQFITqBvWY5hO1LX+q9YS2QqFN2dV+v5Y=;
 b=GsALAmItlDxwNK7APjXj6F/2nyUsps0kIqpepzOlr9AElVBoKMBA8MF5AukUxOw/azep/r
 x2nH8rWMyAtc2UDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01CF813C29;
 Mon, 28 Feb 2022 13:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kR+pOArPHGKhRQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Mon, 28 Feb 2022 13:32:58 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon, 28 Feb 2022 14:32:50 +0100
Message-Id: <20220228133256.12763-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/6] Rewrite mountns testing suite
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

mountns testing suite has been rewritten using new LTP API and libclone
has been removed from dependences.

Andrea Cervesato (6):
  Rewrite mountns01 test using new LTP API
  Rewrite mountns02 test using new LTP API
  Rewrite mountns03 test using new LTP API
  Rewrite mountns04 test using new LTP API
  Removed obsolete mountns_helper.h
  Removed libclone usage from mountns testing suite

 testcases/kernel/containers/mountns/Makefile  |  21 +--
 testcases/kernel/containers/mountns/mountns.h |  50 ++++++
 .../kernel/containers/mountns/mountns01.c     | 148 +++++++---------
 .../kernel/containers/mountns/mountns02.c     | 145 +++++++---------
 .../kernel/containers/mountns/mountns03.c     | 158 ++++++++----------
 .../kernel/containers/mountns/mountns04.c     |  95 +++++------
 .../containers/mountns/mountns_helper.h       |  61 -------
 7 files changed, 285 insertions(+), 393 deletions(-)
 create mode 100644 testcases/kernel/containers/mountns/mountns.h
 delete mode 100644 testcases/kernel/containers/mountns/mountns_helper.h

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
