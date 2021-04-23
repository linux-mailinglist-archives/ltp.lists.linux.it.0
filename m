Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 565343690F3
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 13:16:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 208303C69F7
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 13:16:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73BE13C19F2
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 13:16:27 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 58620100128F
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 13:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619176584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=LkZXR09SkUTDGfY252gCjFhm8e87XkpTKEKPJEIM+4I=;
 b=Zy2jTrT92t1FAAz/yHj6bVxkIz8MiyPCbZd+h770BG1ghs9KhGa9rgAmIxScA3J20kjjV/
 2gwhhg5kkjKESxP255bkl0zeT9I+JVrNLXJFGwu8P2Q/DQ7XWukaYpk4Q0clI1JXkFwBCZ
 GbE2jtT2eBniOeJTDhld/gb2gnRGX+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-TyIXqj6NOUy9dY2XaTlHOQ-1; Fri, 23 Apr 2021 07:16:20 -0400
X-MC-Unique: TyIXqj6NOUy9dY2XaTlHOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465EB83DD21
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 11:16:19 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.36.110.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C9C19D7D
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 11:16:18 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 23 Apr 2021 13:16:12 +0200
Message-Id: <f224defc029816a74c518c54af2fbf2b90a90da6.1619176445.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] mkfs: relax size check
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

Number of total data blocks in filesystem reported by statfs
may be less than current formula of 90%. For example ext4 will
subtract "s_first_data_block plus internal journal blocks".

With recent change to e2fsprogs, overhead calculated in user-space
increased slightly and LTP test started failing:
  https://github.com/tytso/e2fsprogs/commit/59037c5357d39c6d0f14a0aff70e67dc13eafc84

Since there's no strict rule how much the overhead will be,
as rule of thumb relax the condition to 80%.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
I haven't found better way to set the test expectation,
so to address immediate failures I propose to relax the check.

 testcases/commands/mkfs/mkfs01.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/commands/mkfs/mkfs01.sh b/testcases/commands/mkfs/mkfs01.sh
index 13491c9685ae..3e3e56719cf3 100755
--- a/testcases/commands/mkfs/mkfs01.sh
+++ b/testcases/commands/mkfs/mkfs01.sh
@@ -69,11 +69,11 @@ mkfs_verify_size()
 	# 1k-block size should be devided by this argument for ntfs verification.
 	if [ "$1" = "ntfs" ]; then
 		local rate=1024/512
-		if [ $blocknum -lt "$(($2/$rate*9/10))" ]; then
+		if [ $blocknum -lt "$(($2/$rate*8/10))" ]; then
 			return 1
 		fi
 	else
-		if [ $blocknum -lt "$(($2*9/10))" ]; then
+		if [ $blocknum -lt "$(($2*8/10))" ]; then
 			return 1
 		fi
 	fi
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
