Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932B483DEB
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:18:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B41FD3C8FF0
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:18:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 198653C222E
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4CEF60073E
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 184D4210E3;
 Tue,  4 Jan 2022 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641284319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gYJeoPHXQsuGTafZ7n/p5afz1RL9QXqlnPhWqWGSpCI=;
 b=r9ldmN2CkrncimQTxzL8E+Cznb+UKEm8imxNZwN3ljD62MF77GN84viw/2BJjlqivuTi+U
 8UhjJ7tmS73fOpPOfaARkzxvcqyR5PXw08VAAyNjwo1jjq8sfoPGw4LTDnq/YO99AyLfkt
 6xIFLRDN66U9EjLP1X1E7S671ZNKKPg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A83E513AB9;
 Tue,  4 Jan 2022 08:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 059LJN4C1GGeZwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 04 Jan 2022 08:18:38 +0000
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 09:18:26 +0100
Message-Id: <20220104081836.22827-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 00/10] watchqueue testing suite
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

This patch-set add a new testing suite for the watch queue kernel feature
described in https://www.kernel.org/doc/html/latest/watch_queue.html

Andrea Cervesato (10):
  Prepare watchqueue testing suite build
  Add wqueue01 new test
  Add wqueue02 new test
  Add wqueue03 new test
  Add wqueue04 new test
  Add wqueue05 new test
  Add wqueue06 new test
  Add wqueue07 new test
  Add wqueue08 new test
  Define watchqueue testing suite in runtest

 runtest/watchqueue                     |   8 ++
 scenario_groups/default                |   1 +
 testcases/kernel/Makefile              |   1 +
 testcases/kernel/watchqueue/.gitignore |  10 ++
 testcases/kernel/watchqueue/Makefile   |   8 ++
 testcases/kernel/watchqueue/common.h   | 153 +++++++++++++++++++++++++
 testcases/kernel/watchqueue/wqueue01.c |  68 +++++++++++
 testcases/kernel/watchqueue/wqueue02.c |  68 +++++++++++
 testcases/kernel/watchqueue/wqueue03.c |  68 +++++++++++
 testcases/kernel/watchqueue/wqueue04.c |  68 +++++++++++
 testcases/kernel/watchqueue/wqueue05.c |  68 +++++++++++
 testcases/kernel/watchqueue/wqueue06.c |  67 +++++++++++
 testcases/kernel/watchqueue/wqueue07.c |  68 +++++++++++
 testcases/kernel/watchqueue/wqueue08.c |  83 ++++++++++++++
 14 files changed, 739 insertions(+)
 create mode 100644 runtest/watchqueue
 create mode 100644 testcases/kernel/watchqueue/.gitignore
 create mode 100644 testcases/kernel/watchqueue/Makefile
 create mode 100644 testcases/kernel/watchqueue/common.h
 create mode 100644 testcases/kernel/watchqueue/wqueue01.c
 create mode 100644 testcases/kernel/watchqueue/wqueue02.c
 create mode 100644 testcases/kernel/watchqueue/wqueue03.c
 create mode 100644 testcases/kernel/watchqueue/wqueue04.c
 create mode 100644 testcases/kernel/watchqueue/wqueue05.c
 create mode 100644 testcases/kernel/watchqueue/wqueue06.c
 create mode 100644 testcases/kernel/watchqueue/wqueue07.c
 create mode 100644 testcases/kernel/watchqueue/wqueue08.c

-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
