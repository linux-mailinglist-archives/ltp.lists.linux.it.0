Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AC40995C
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 18:38:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1422C3CA4FE
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 18:38:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 955143C92A3
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 18:37:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DC3CF1400DC7
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 18:37:51 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3A02521FA7;
 Mon, 13 Sep 2021 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631551071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukjfJreoMw53LXpC1is6zOLzl3+FYz1AmhI6dNJD7e4=;
 b=Fva338JhixxN1v2HEqQjQYnZ46xfRhk9Owb2a0ay7R0+rXp5TkWgF91BOyRfYzo2F2cLR+
 rw1KBSg7PGNcyS46jZkk7VbYLjdnR2eBIcQ/mTObWgLM8Ts00O1QPnirzEZDzCatFYCbCJ
 xuAQxHfBASTam3AkYM8iZ5qM8/0uVLw=
Received: from blezhepekov.udp.ovpn1.nue.suse.de (unknown [10.163.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 06786A3B81;
 Mon, 13 Sep 2021 16:37:50 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 13 Sep 2021 19:37:44 +0300
Message-Id: <20210913163745.28108-2-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913163745.28108-1-bogdan.lezhepekov@suse.com>
References: <20210913163745.28108-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/3] realtime:hrtimer-prio:run_auto: jump to
 current dir
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The patch makes possible to run the test from LTP root dir.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 testcases/realtime/func/hrtimer-prio/run_auto.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/realtime/func/hrtimer-prio/run_auto.sh b/testcases/realtime/func/hrtimer-prio/run_auto.sh
index ec3d83a85..a20dbe540 100644
--- a/testcases/realtime/func/hrtimer-prio/run_auto.sh
+++ b/testcases/realtime/func/hrtimer-prio/run_auto.sh
@@ -2,6 +2,7 @@
 
 profile=${1:-default}
 
+cd $(dirname $0) # Move to test directory
 if [ ! $SCRIPTS_DIR ]; then
         # assume we're running standalone
         export SCRIPTS_DIR=../../scripts/
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
