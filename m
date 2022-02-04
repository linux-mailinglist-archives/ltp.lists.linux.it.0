Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C432A4A99C2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Feb 2022 14:14:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1499E3C9AE4
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Feb 2022 14:14:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E8393C70EC
 for <ltp@lists.linux.it>; Fri,  4 Feb 2022 14:14:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 89CC62002C7
 for <ltp@lists.linux.it>; Fri,  4 Feb 2022 14:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643980456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bAvfnlhBkuIEiImBd7w8HLp81B6N4LyYbbbGnp6+HIU=;
 b=FfWCtH4+DlXKwwVMKhnKJd3CnZa07DOji6nHhpAWjeuIv5jdaRIOtWb2XGjz/NE7I2sswS
 VG0Cnt4J5dSCGbp38/dYEBte5pvGBI8HIRJyR7Rsfx4AQN0aLhPEDcc2vq8kK2wRWBi/pw
 X67fXZ6D8W/YkcuSGCZ+8RWMr2l4Jk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-2pVe91RaNyePfGH0BMDgVw-1; Fri, 04 Feb 2022 08:14:14 -0500
X-MC-Unique: 2pVe91RaNyePfGH0BMDgVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEBE281F02F
 for <ltp@lists.linux.it>; Fri,  4 Feb 2022 13:14:12 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.192.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 468D322DE1
 for <ltp@lists.linux.it>; Fri,  4 Feb 2022 13:14:11 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  4 Feb 2022 14:14:00 +0100
Message-Id: <cover.1643980361.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] mkdir09: rewrite in new LTP API
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

Changes:
- 'use all_filesystems = 1'
  This gives us back reproducer we used to have before statx04 rewrite for commit
  07bfa4415ab6 ("fat: work around race with userspace's read via blockdev while mounting")
- fix description comment
- comments moved before functions
- separate loop with SAFE_MKDIR moved to setup
- introduce TST_EXP_FAIL_SILENT (patch 1/2)
- used TST_EXP_PASS_SILENT in test2 and test3
- fixed TPASS message in test2 to say "remove dirs"

Jan Stancek (2):
  tst_test_macros: add TST_EXP_FAIL_SILENT
  syscalls/mkdir09: rewrite in new LTP API

 doc/c-test-api.txt                        |   3 +
 include/tst_test_macros.h                 |  15 +-
 testcases/kernel/syscalls/mkdir/Makefile  |   2 +
 testcases/kernel/syscalls/mkdir/mkdir09.c | 494 ++++------------------
 4 files changed, 106 insertions(+), 408 deletions(-)

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
