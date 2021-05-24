Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDA38E982
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 446BF3C2EA3
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 05E563C1886
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 660B1600A3C
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621867695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SZzdoA8+4yefwSswPBcK2GBKNtWZQ0g9IHqB90eTWP8=;
 b=MIl2gDF4wUeDvXLt/RklZ6JkrNPfxxwPcj0LqJNvqwD5Sblci23iVqeOmxuM3BgK30vscW
 AeKmhfti0TU4OGj4ULCBgmAxfb8/o1l9vVKawZ/kCjP8H4OFm/TVN1OWXH4NDp7ysdxkOL
 N7KH0Yjdw5pXRXu5omHHl09dAygL12E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD343AB6D;
 Mon, 24 May 2021 14:48:15 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 24 May 2021 15:47:41 +0100
Message-Id: <20210524144745.10887-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/4] Auto review and Coccinelle
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

tldr; It looks like we can do a lot with Coccinelle. Just need to
      figure out how to apply it. clang-tidy is in second place.

This patch set implements some checks for a basic LTP library rule and
contains the auto generated fix. The rule being: never use TEST,
TST_RET or TST_ERR in the library. So that the test author can assume
these never change unless they use TEST().

I think this is a good rule, atlhough I did not know it was a rule
until Cyril pointed it out in my CGroups patch. Then I fixed it in one
place, but still left another usage. The patch set was merged with the
error in.

The only way this error would be discovered is with further manual
code review or if a test author found it. As the safe_cgroup_*
functions are likely to always pass, this could have resulted in nasty
false negatives if a test used TEST then called SAFE_CGROUP_READ
before checking the results.

Of course errno has a similar problem, but then that is why we have
TST_ERR. If people feel it is necessary we could introduced TEST_LIB()
and associated variables.

Alot of review comments are just pointing out LTP library usage errors
or even basic C coding errors. I believe a large chunk of these errors
can be automatically detected. At least theoretically, in practice the
tools are a problem.

I have identified and spent some time with the following tools:

Coccinelle (spatch)
clang --analyze
clang-tidy
gcc -fanalyzer
gcc plugin API
sparse
smatch
check_patch.pl

Clang analyzer, GCC analyzer and Smatch are doing full state (value
range) tracking for variables. They are the most powerful tools here,
but they all have different issues. People should try using gcc and
clang in their personal workflows. However these do not represent low
hanging fruit IMO.

smatch is based on sparse, both are used on the kernel, but I ran into
all kinds of issues on my system when using these on the LTP. sparse
is simpler to understand than gcc, but then gcc works everywhere.

The same is mostly true of clang-tidy which we can probably just use
with a custom configuration to find some generic C errors. The plugin
interface looks easier to use than GCC's.

We should probably automate check_patch.pl somehow, but extending it
doesn't seem like a good idea.

Finally Coccinelle allows quite advanced analyses and updating without
huge effort. It doesn't appear to track variable states, although it
allows some scripting which may allow limited context
tracking. However that is not low hanging fruit. For checking stuff
like "tst_reap_children() is used instead of wait or SAFE_WAIT", it
should work fine.

I'm not sure how to integrate it with the build system. We may just
want to do something similar to the kernel. Also I guess we want to
have a way of checking patches sent to the mailing list.

Note that I haven't tested these changes by running all the
tests. Only that they compile!

Richard Palethorpe (4):
  Add scripts to remove TEST in library
  Add script to run Coccinelle checks
  API: Mostly automatic removal of TEST() usage by Coccinelle
  API: Removal of TST_ERR usage

 lib/tst_af_alg.c                              |  46 +++---
 lib/tst_cgroup.c                              |  13 +-
 lib/tst_crypto.c                              |  20 +--
 lib/tst_netdevice.c                           |  10 +-
 lib/tst_rtnetlink.c                           |   4 +-
 lib/tst_supported_fs_types.c                  |  10 +-
 .../coccinelle/libltp-test-macro-vars.cocci   |  54 +++++++
 scripts/coccinelle/libltp-test-macro.cocci    | 137 ++++++++++++++++++
 scripts/coccinelle/libltp_checks.sh           |  29 ++++
 9 files changed, 277 insertions(+), 46 deletions(-)
 create mode 100644 scripts/coccinelle/libltp-test-macro-vars.cocci
 create mode 100644 scripts/coccinelle/libltp-test-macro.cocci
 create mode 100755 scripts/coccinelle/libltp_checks.sh

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
