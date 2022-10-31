Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356F613485
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 12:32:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B265F3CAADD
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 12:32:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF1793CA9B6
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 12:32:13 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1AD792003AE
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 12:32:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 576E733712;
 Mon, 31 Oct 2022 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1667215932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8+DL05pbQ+cymUnUAFWm/TQYGGD+C3EPh/yG+wx4/+M=;
 b=BEP/NRL2+OinjigMMJAXxHkcEav5JnOwU2VBl5vC+cobomKjQ7CXcMh1vyXzbwqdY11jc5
 2W0fvH5Qmgu0jBUPELxY/o5zh3NxsX6vbqMCfPwXLsEkQXEQWj2pVWLZckNakJrtYxMm1i
 tgmwmF5PUdwvTuRyisFMIg6kVS8kHnM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01F2113AAD;
 Mon, 31 Oct 2022 11:32:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5dpyNzuyX2ObHQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Mon, 31 Oct 2022 11:32:11 +0000
To: ltp@lists.linux.it
Date: Mon, 31 Oct 2022 12:30:44 +0100
Message-Id: <20221031113046.9218-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Rewrite utstest suite
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

Added new tests and removed utstest which looked broken.

Andrea Cervesato (2):
  Add SAFE_SETHOSTNAME macro
  Rewrite utsname testing suite

 include/safe_net_fn.h                         |   3 +
 include/tst_safe_net.h                        |   3 +
 lib/safe_net.c                                |  17 +
 runtest/containers                            |   7 +
 .../kernel/containers/utsname/.gitignore      |   5 +-
 testcases/kernel/containers/utsname/Makefile  |  23 +-
 .../containers/utsname/runutstests_noltp.sh   |  41 --
 testcases/kernel/containers/utsname/utsname.h | 116 ++++++
 .../kernel/containers/utsname/utsname01.c     |  74 ++++
 .../kernel/containers/utsname/utsname02.c     |  97 +++++
 .../kernel/containers/utsname/utsname03.c     | 111 ++++++
 .../kernel/containers/utsname/utsname04.c     |  66 ++++
 testcases/kernel/containers/utsname/utstest.c | 356 ------------------
 13 files changed, 501 insertions(+), 418 deletions(-)
 delete mode 100755 testcases/kernel/containers/utsname/runutstests_noltp.sh
 create mode 100644 testcases/kernel/containers/utsname/utsname.h
 create mode 100644 testcases/kernel/containers/utsname/utsname01.c
 create mode 100644 testcases/kernel/containers/utsname/utsname02.c
 create mode 100644 testcases/kernel/containers/utsname/utsname03.c
 create mode 100644 testcases/kernel/containers/utsname/utsname04.c
 delete mode 100644 testcases/kernel/containers/utsname/utstest.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
