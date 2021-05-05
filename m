Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76545373623
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 10:18:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E481E3C57B2
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 10:18:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F2A873C2170
 for <ltp@lists.linux.it>; Wed,  5 May 2021 10:18:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 840CE600072
 for <ltp@lists.linux.it>; Wed,  5 May 2021 10:18:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A37A6B1A4
 for <ltp@lists.linux.it>; Wed,  5 May 2021 08:18:46 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  5 May 2021 10:18:42 +0200
Message-Id: <20210505081845.7024-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505081845.7024-1-mdoucha@suse.cz>
References: <20210505081845.7024-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/6] Add SAFE_IOCTL() variant for library code
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

SAFE_IOCTL() cannot be implemented as a function due to the variadic argument
but the macro still needs a variant which accepts arbitrary file:line position
for error messages as arguments.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch

 include/tst_safe_macros.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d6f32ef4c..dcef58bda 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -211,13 +211,16 @@ pid_t safe_getpgid(const char *file, const int lineno, pid_t pid);
 #define SAFE_READDIR(dirp) \
 	safe_readdir(__FILE__, __LINE__, NULL, (dirp))
 
-#define SAFE_IOCTL(fd, request, ...)                         \
+#define SAFE_IOCTL_(file, lineno, fd, request, ...)          \
 	({int tst_ret_ = ioctl(fd, request, ##__VA_ARGS__);  \
 	  tst_ret_ < 0 ?                                     \
-	   tst_brk(TBROK | TERRNO,                           \
+	   tst_brk_((file), (lineno), TBROK | TERRNO,        \
 	            "ioctl(%i,%s,...) failed", fd, #request), 0 \
 	 : tst_ret_;})
 
+#define SAFE_IOCTL(fd, request, ...) \
+	SAFE_IOCTL_(__FILE__, __LINE__, (fd), (request), ##__VA_ARGS__)
+
 #define SAFE_FCNTL(fd, cmd, ...)                            \
 	({int tst_ret_ = fcntl(fd, cmd, ##__VA_ARGS__);     \
 	  tst_ret_ == -1 ?                                  \
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
