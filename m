Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E840995D
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 18:38:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 492723CA5E2
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 18:38:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C57D3C929E
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 18:37:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CFC761A0110D
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 18:37:52 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 67E7321FA7;
 Mon, 13 Sep 2021 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631551072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPUMtg2Lointp6mRSMf3FTSCY6iVWSKY0Anj9O0AaBM=;
 b=qZeEoSm+Ztey6Gd2ZXJ/34f3swcvuplfe7197Ndqsuj+Lqt9H59vdNjvVKHvNf9MIrsl3j
 Ydd6hjNrv6sfemMVW5Ai6Ik4k5vdZjAYacyG1NvlWRAmjDGC04AFn6fh8TIeiqPTC7+Xip
 U+IBUVIWBTSRuBDy149RPtRC+vjcGoI=
Received: from blezhepekov.udp.ovpn1.nue.suse.de (unknown [10.163.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 352BAA3B8E;
 Mon, 13 Sep 2021 16:37:52 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 13 Sep 2021 19:37:45 +0300
Message-Id: <20210913163745.28108-3-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913163745.28108-1-bogdan.lezhepekov@suse.com>
References: <20210913163745.28108-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 3/3] realtime:profiles: support hrtimer-prio
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

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 testcases/realtime/profiles/default | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/testcases/realtime/profiles/default b/testcases/realtime/profiles/default
index b0bb6b890..440096fbe 100644
--- a/testcases/realtime/profiles/default
+++ b/testcases/realtime/profiles/default
@@ -46,11 +46,15 @@ func/matrix_mult		matrix_mult -c 0.75
 # Default maxduration=0.5 s
 func/thread_clock		tc-2 -c 0.5
 
+# Pass if maximum timer latency is less than criterium (us).
+# Default latency=10 us
+func/hrtimer-prio       hrtimer-prio
+
 # The below tests have no pass/fail criterium.
 func/gtod_latency		gtod_latency
 func/sched_jitter		sched_jitter
-func/periodic_cpu_load		periodic_cpu_load
-func/periodic_cpu_load		periodic_cpu_load_single
+func/periodic_cpu_load	periodic_cpu_load
+func/periodic_cpu_load	periodic_cpu_load_single
 func/prio-wake			prio-wake
 func/sched_football		sched_football
 func/pi-tests			testpi-0
@@ -60,4 +64,4 @@ func/pi-tests			testpi-4
 func/pi-tests			testpi-5
 func/pi-tests			testpi-6
 func/pi-tests			sbrk_mutex
-func/rt-migrate                 rt-migrate
+func/rt-migrate         rt-migrate
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
