Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D736ECF5
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:05:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9912F3C615B
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 17:05:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1C253C0F91
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8D6061A00CD7
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 17:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619708718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ymh50rZcJ3bweEYgum9+a5yxP6I3fEMVDPVyKT9/ypg=;
 b=EgyO8nhwb4+W0cy0SfhvXu2iRs2nYFiFRiOlWDI+i/oDlIdZuUlOoCVIZesctDsyXLYzrw
 aLUd/4G7INjoV6WJGJQcnU+MA121GBIpE2u7DPoDMPKazNi+H40Yc7gTRsNMxcNnHp6ilE
 KMiQqVZ4kn9P17l1Bo80UnM86hnc2xI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93737B16E;
 Thu, 29 Apr 2021 15:05:18 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 29 Apr 2021 16:05:05 +0100
Message-Id: <20210429150510.21585-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/5] BPF refactor and add bpf_prog05
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

V2:

* Added a number of helper functions to bpf_common and used them on
  all tests.

* Added some instruction concatenation helpers, but only used these on
  bpf_prog05 as they don't seem to make the other tests better to
  read.

* Further shorten bpf_prog05 by using a generic expect function

Richard Palethorpe (5):
  lapi/bpf: Add /=, %= and BPF_MAXINSNS
  bpf: Add map_array helper functions
  bpf: Add helper to run socket programs
  bpf: Add bpf_insn_buf, map and instruction concatenation helpers
  bpf: Check truncation on 32bit div/mod by zero

 include/lapi/bpf.h                         |   6 +
 runtest/cve                                |   1 +
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/bpf/.gitignore   |   1 +
 testcases/kernel/syscalls/bpf/bpf_common.c |  89 +++++++++++
 testcases/kernel/syscalls/bpf/bpf_common.h |  26 ++-
 testcases/kernel/syscalls/bpf/bpf_prog01.c |  32 +---
 testcases/kernel/syscalls/bpf/bpf_prog02.c |  54 ++-----
 testcases/kernel/syscalls/bpf/bpf_prog03.c |  32 +---
 testcases/kernel/syscalls/bpf/bpf_prog04.c |  17 +-
 testcases/kernel/syscalls/bpf/bpf_prog05.c | 175 +++++++++++++++++++++
 11 files changed, 320 insertions(+), 114 deletions(-)
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog05.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
