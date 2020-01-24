Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7A148ACD
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 15:58:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACD053C23A7
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 15:58:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7D2733C1FEC
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 15:58:21 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id EB7CA1A014A5
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 15:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579877899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GI8y0Xk4A+IH96B3XtCxoCNnn9Qhz5puFEM3Q+At8kU=;
 b=CDRov7pCEDPQjYo+6FaDEyyFGMEBpak+IQAT4fQ4mZKwjnEoD8tUT6eE11OUB3TJ+vX+KZ
 PgBNZzQdMhISW3vXak1a7TaPFhT/TDw6/x9xerGN+N5n6sdgjQPQm7++UpwbV67bIN+f0i
 tM3AOw0gPMbLa9052iI29uSl3Zc8FZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-cNS_2Fx6NdatEgqUsx0xNQ-1; Fri, 24 Jan 2020 09:58:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 575671937FC1
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 14:58:12 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE7B05C1B0
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 14:58:11 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 24 Jan 2020 15:58:05 +0100
Message-Id: <7a2d56fa03583ca7979cbe22a61ac648b3d6b6eb.1579877813.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: cNS_2Fx6NdatEgqUsx0xNQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] max_map_count: use default overcommit mode
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

max_map_count has been observed to sporadically fail on some
architectures, for example ppc64le (64k pages, ~3GB RAM).

Even though we don't touch all the mappings, the test is configuring
NO_OVERCOMMIT policy, which makes __vm_enough_memory() more strict
and we sporadically fail on a percpu counter, when we come close
to global CommitLimit:
        if (percpu_counter_read_positive(&vm_committed_as) < allowed)
                return 0;

Per comments from 2012 the main reason for this was bad OOM behaviour.
Let's go back to default overcommit mode. If we run into issues with
OOM again, we can lower the number of mappings to have larger reserve.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/mem/tunable/max_map_count.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/mem/tunable/max_map_count.c b/testcases/kernel/mem/tunable/max_map_count.c
index 5b03a60ec860..aa70fde59c77 100644
--- a/testcases/kernel/mem/tunable/max_map_count.c
+++ b/testcases/kernel/mem/tunable/max_map_count.c
@@ -65,7 +65,7 @@ static void setup(void)
 
 	old_max_map_count = get_sys_tune("max_map_count");
 	old_overcommit = get_sys_tune("overcommit_memory");
-	set_sys_tune("overcommit_memory", 2, 1);
+	set_sys_tune("overcommit_memory", 0, 1);
 
 	if (uname(&un) != 0)
 		tst_brk(TBROK | TERRNO, "uname error");
@@ -154,13 +154,8 @@ static void max_map_count_test(void)
 	 * 1) use a safe maximum max_map_count value as upper-bound,
 	 *    we set it 65536 in this case, i.e., we don't test too big
 	 *    value;
-	 * 2) make sure total mapping isn't larger tha
+	 * 2) make sure total mapping isn't larger than
 	 *        CommitLimit - Committed_AS
-	 *    and set overcommit_memory to 2, this could help mapping
-	 *    returns ENOMEM instead of triggering oom-killer when
-	 *    memory is tight. (When there are enough free memory,
-	 *    step 1) will be used first.
-	 * Hope OOM-killer can be more stable oneday.
 	 */
 	memfree = SAFE_READ_MEMINFO("CommitLimit:") - SAFE_READ_MEMINFO("Committed_AS:");
 	/* 64 used as a bias to make sure no overflow happen */
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
