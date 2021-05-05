Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4197D3736DB
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:16:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3A093C583D
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:16:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 785CE3C17CE
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 04516600CF9
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620206189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7s1x+L4BnlIcN0xQRr0QDaEcOr+K68pNULQ18eHlxZ4=;
 b=bqjAKjlT+e6pBaSlUgFa8oiGbJ8iLGIZVvA5r7DhR1pTghOkMaUaQtNsv/ccfOEhC+rYLt
 TkQIWe7Eo5xtaPxm6+g1IcYiyfHMzChLiIAb8imll4IHTAP1N7QI6zHa0j0EpSaLb4PB+n
 evNbx/P4gkWK+nabwDj6Dl0wUfPJRZs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58BA8B05D;
 Wed,  5 May 2021 09:16:29 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  5 May 2021 10:16:19 +0100
Message-Id: <20210505091623.29121-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/4] BPF refactor and add bpf_prog05
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

V3:

* constify and add attributes

* replace insn builder with BPF_MAP_ARRAY_STX macro to insert multiple
  instructions.

V2:

* Added a number of helper functions to bpf_common and used them on
  all tests.

* Added some instruction concatenation helpers, but only used these on
  bpf_prog05 as they don't seem to make the other tests better to
  read.

* Further shorten bpf_prog05 by using a generic expect function

Richard Palethorpe (4):
  lapi/bpf: Add /= and %=
  bpf: Add map_array helper functions/macro and constify
  bpf: Add helper to run socket programs
  bpf: Check truncation on 32bit div/mod by zero

 include/lapi/bpf.h                         |   2 +
 runtest/cve                                |   1 +
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/bpf/.gitignore   |   1 +
 testcases/kernel/syscalls/bpf/bpf_common.c |  64 ++++++--
 testcases/kernel/syscalls/bpf/bpf_common.h |  53 +++++-
 testcases/kernel/syscalls/bpf/bpf_prog01.c |  32 +---
 testcases/kernel/syscalls/bpf/bpf_prog02.c |  54 ++-----
 testcases/kernel/syscalls/bpf/bpf_prog03.c |  32 +---
 testcases/kernel/syscalls/bpf/bpf_prog04.c |  17 +-
 testcases/kernel/syscalls/bpf/bpf_prog05.c | 177 +++++++++++++++++++++
 11 files changed, 308 insertions(+), 126 deletions(-)
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_prog05.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
