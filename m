Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731017A6A9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:48:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E21723C6536
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:48:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4FF803C650A
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D0BA6600B3B
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:48:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BEA8B125
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 13:48:36 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 14:48:27 +0100
Message-Id: <20200305134834.16736-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200305134834.16736-1-chrubis@suse.cz>
References: <20200305134834.16736-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/8] lapi/namespace_constants.h: Add CLONE_NEWTIME
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/lapi/namespaces_constants.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/lapi/namespaces_constants.h b/include/lapi/namespaces_constants.h
index da4a7a4a1..8f73c4302 100644
--- a/include/lapi/namespaces_constants.h
+++ b/include/lapi/namespaces_constants.h
@@ -24,5 +24,8 @@
 #ifndef CLONE_NEWUTS
 #  define CLONE_NEWUTS	0x04000000
 #endif
+#ifndef CLONE_NEWTIME
+#  define CLONE_NEWTIME 0x00000080
+#endif
 
 #endif /* __NAMESPACES_CONSTANTS_H__ */
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
