Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E971A98D8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:28:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A44F73C2B03
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:28:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5FC213C2AF5
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:28:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CC6DB1A01194
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:28:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CE25AE4E;
 Wed, 15 Apr 2020 09:28:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 11:28:05 +0200
Message-Id: <20200415092809.20240-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415092809.20240-1-pvorel@suse.cz>
References: <20200415092809.20240-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 4/8] kernel/mem: Fix linking error with -fno-common
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

Adding missing extern.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/mem/include/mem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/mem/include/mem.h b/testcases/kernel/mem/include/mem.h
index a12c2231f..cce9c0497 100644
--- a/testcases/kernel/mem/include/mem.h
+++ b/testcases/kernel/mem/include/mem.h
@@ -37,7 +37,7 @@ static inline void clean_node(unsigned long *array)
 #define MLOCK			2
 #define KSM			3
 
-long overcommit;
+extern long overcommit;
 void oom(int testcase, int lite, int retcode, int allow_sigkill);
 void testoom(int mempolicy, int lite, int retcode, int allow_sigkill);
 
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
