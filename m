Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF245A2FE
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 13:43:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FBD63C8DF7
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 13:43:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20B963C0D0A
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 13:43:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A175201030
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 13:43:57 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 89C631FD58;
 Tue, 23 Nov 2021 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1637671436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NKRNuD65A6XNoXWSelKiEOowQ/KrxhWUrzb7hX/dOt0=;
 b=mvTeZsvz24Ez7u2BxKlk8bqmGRkrMop623kWuYhN0bjY7osX+aG0tmUFAWch+G1B69A3Wx
 Vw9De+Gkr3wbcRFuR+MLKDMZVwbo0SC0HrQMHntikg0E/lXUWaFT8o598PtqyhP97CwV6N
 8I/eXvc5BhXxASpnDyqKASrRmllRpe4=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 54B57A3B88;
 Tue, 23 Nov 2021 12:43:56 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 23 Nov 2021 12:43:45 +0000
Message-Id: <20211123124348.31073-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] tools/sparse: Add static check
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

This teaches 'make check' to flag missing static keywords. Note that I
am not sure how this avoids flagging symbols only declared in header
files. However I haven't noticed any false positives and I think false
negatives will only occur when the author uses function prototypes to
reference private symbols before their definition.

The statx patch is just included to show one issue it caught.

Richard Palethorpe (3):
  tools/sparse: Add static check
  doc: Add LTP-003 and LTP-004 static and tst API prefix rules
  statx: Add missing static keyword to tcase variable

 doc/library-api-writing-guidelines.txt    | 10 +++++
 doc/rules.tsv                             |  2 +
 doc/test-writing-guidelines.txt           |  8 ++++
 testcases/kernel/syscalls/statx/statx01.c |  2 +-
 testcases/kernel/syscalls/statx/statx02.c |  2 +-
 testcases/kernel/syscalls/statx/statx04.c |  2 +-
 testcases/kernel/syscalls/statx/statx05.c |  2 +-
 testcases/kernel/syscalls/statx/statx07.c |  2 +-
 tools/sparse/sparse-ltp.c                 | 53 +++++++++++++++++++++++
 9 files changed, 78 insertions(+), 5 deletions(-)

-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
