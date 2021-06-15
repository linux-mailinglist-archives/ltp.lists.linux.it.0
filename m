Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97A3A787E
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 09:51:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 490823C4CF0
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 09:51:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 405653C2E09
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 09:51:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 80CE01000A29
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 09:51:31 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0049A1FD56;
 Tue, 15 Jun 2021 07:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1623743491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pPuHVJAGPYyLS6m9EXgtU5VabBO/5JtDuMPW4VW7SL4=;
 b=AsUgv329GEFdppbgxttugN5mCnFsvshcdJB6URG8qwf6JekKOFCMjBk+W+oqcbj19gYvs8
 pbxFkZlqF/cQhoVgRdRP6uUlc1dMMXQqCWEdjJ07/gTJKcvuhA/FoSscZucS8W94NmfwVi
 AHzYoZAUdmAZC1etnhLcF018muq35DM=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id AFC53A3B8E;
 Tue, 15 Jun 2021 07:51:30 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 15 Jun 2021 08:51:04 +0100
Message-Id: <20210615075104.24870-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] icmp_rate_limit01: Require CONFIG_VETH
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

The test fails with TBROK if it can not create a virtual ethernet
pair. So add it to the kconfigs.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

Just thinking about the config meta data and embedded users. Functions
like tst_create_veth_pair could check needs_kconfigs for the required
config and TBROK if it is not there.

Alternatively (or in addition to) static analyses can be used to check
(or add) missing config.

In either case this may be wrong when a function is only used in a
branch. OTOH then the test needs splitting otherwise the metadata
can't be known ahead of execution.

 testcases/cve/icmp_rate_limit01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
index 0c2ac44df..f24ea5bf9 100644
--- a/testcases/cve/icmp_rate_limit01.c
+++ b/testcases/cve/icmp_rate_limit01.c
@@ -260,6 +260,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_kconfigs = (const char *[]) {
+		"CONFIG_VETH",
 		"CONFIG_USER_NS=y",
 		"CONFIG_NET_NS=y",
 		NULL
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
