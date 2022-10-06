Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA055F64CC
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Oct 2022 13:08:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DC653CAE01
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Oct 2022 13:08:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5FC0F3CABDE
 for <ltp@lists.linux.it>; Thu,  6 Oct 2022 13:07:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 94F341400060
 for <ltp@lists.linux.it>; Thu,  6 Oct 2022 13:07:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9848219A6;
 Thu,  6 Oct 2022 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665054475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2rq38K52K4+ajJiwKSVsxavBIQFFTtY3wlr9tIKDXSs=;
 b=hZ1ePHGX3sbZTD+x2V9hFIrIyMfc8B8YxPRhR4DDYTuiFq+Z40+QAN7TKFB6L5XEk7zUwR
 NYMsVhwUJUMHecQjDnouKdXBHxLyjskI6HZoES/CRy91wMlfilwJnrass6qb4247qvquYG
 uSutkWWOR/adf7Km2lkX5auYamAUjzU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BACF21376E;
 Thu,  6 Oct 2022 11:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A7FsKwu3PmNmBQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Thu, 06 Oct 2022 11:07:55 +0000
To: ltp@lists.linux.it
Date: Thu,  6 Oct 2022 13:06:38 +0200
Message-Id: <20221006110642.12410-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/3] Add process_madvise support
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Added process_madvise testing suite to test MADV_COLD and MADV_PAGEOUT.
It requires MADV_COLD and MADV_PAGEOUT definition inside LTP before
push.

Andrea Cervesato (3):
  Add process_madvise01 test
  Add process_madvise02 test
  Add process_madvise03 test

 testcases/kernel/syscalls/cma/.gitignore      |   3 +
 testcases/kernel/syscalls/cma/cma.h           | 101 ++++++++++++
 .../kernel/syscalls/cma/process_madvise01.c   | 153 ++++++++++++++++++
 .../kernel/syscalls/cma/process_madvise02.c   | 128 +++++++++++++++
 .../kernel/syscalls/cma/process_madvise03.c   | 139 ++++++++++++++++
 5 files changed, 524 insertions(+)
 create mode 100644 testcases/kernel/syscalls/cma/cma.h
 create mode 100644 testcases/kernel/syscalls/cma/process_madvise01.c
 create mode 100644 testcases/kernel/syscalls/cma/process_madvise02.c
 create mode 100644 testcases/kernel/syscalls/cma/process_madvise03.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
