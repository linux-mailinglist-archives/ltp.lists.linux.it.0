Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A92992DB
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:49:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A5FD3C264B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:49:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 07A703C2214
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 76626600839
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A78FAAD77
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:47 +0100
Message-Id: <20201026164756.30556-11-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 10/19] Unify error handling in lib/tst_net.c
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

- Properly format caller file:line location

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_net.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/tst_net.c b/lib/tst_net.c
index 8a589b0ad..de343bb39 100644
--- a/lib/tst_net.c
+++ b/lib/tst_net.c
@@ -212,10 +212,11 @@ void safe_getaddrinfo(const char *file, const int lineno, const char *src_addr,
 {
 	int err = getaddrinfo(src_addr, port, hints, addr_info);
 
-	if (err)
-		tst_brk(TBROK, "%s:%d: getaddrinfo failed, %s", file, lineno,
-				gai_strerror(err));
+	if (err) {
+		tst_brk_(file, lineno, TBROK, "getaddrinfo failed, %s",
+			gai_strerror(err));
+	}
 
 	if (!*addr_info)
-		tst_brk(TBROK, "%s:%d: failed to get the address", file, lineno);
+		tst_brk_(file, lineno, TBROK, "failed to get the address");
 }
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
