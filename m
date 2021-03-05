Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F132EF56
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 16:51:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5C753C6DE5
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 16:51:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 31C6E3C562B
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 16:51:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BB005600820
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 16:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614959496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sR2ylBTTTt2EByWTV5ONDjvwY2m/Hl2VMLDQI+YoiEA=;
 b=a6khQcdYve/oF2oH5vLq4dkwDv8dM7qSwNozLarGpC9U+ewCzCV4CtEFpcM9phPXy9sJdO
 5jGogEfd8WRDj/0n4X9pnlQ2U1hMi6DvWPYpHb6eO6RKCsiSNumgaK/iOWiLPw5UmtKAZ5
 epxTZPfoWU58SHvJAZf5ZC1uItv3zHk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03D40ACBF;
 Fri,  5 Mar 2021 15:51:36 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  5 Mar 2021 15:51:17 +0000
Message-Id: <20210305155123.18199-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/6] Fuzzy Sync yielding and validation test
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

As suggested by Cyril, I have created a validation test so that we do
not have to reproduce a range of different kernel bugs for each change
to Fuzzy Sync.

Also I have built on Leo Yu-Chi Liang's patch to introduce yield. It
seemed to work mostly fine as it was. However I added some extra bits
to be safe (hopefully).

Leo Yu-Chi Liang (1):
  fzsync: Add sched_yield for single core machine

Richard Palethorpe (5):
  fzsync: Add self test
  fzsync: Reset delay bias
  fzsync: Correctly print positive lower delay range bound
  fzsync: Move yield check out of loop and add yield to delay
  fzsync: Check processor affinity

 include/tst_fuzzy_sync.h            | 119 +++++++++++---
 lib/newlib_tests/.gitignore         |   1 +
 lib/newlib_tests/test16.c           |   2 +
 lib/newlib_tests/tst_fuzzy_sync01.c | 233 ++++++++++++++++++++++++++++
 4 files changed, 331 insertions(+), 24 deletions(-)
 create mode 100644 lib/newlib_tests/tst_fuzzy_sync01.c

-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
