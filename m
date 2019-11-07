Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C60F3366
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 16:35:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BCF73C2074
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 16:35:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 47A943C061B
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 16:35:27 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 141C060207B
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 16:35:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9CCBBB2A3;
 Thu,  7 Nov 2019 15:35:25 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Thu,  7 Nov 2019 16:34:58 +0100
Message-Id: <20191107153458.16917-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107153458.16917-1-rpalethorpe@suse.com>
References: <20191107153458.16917-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] lib: Allow timeout coefficient < 1
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
Cc: automated-testing@yoctoproject.org, dvyukov@google.com,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For the Syzkaller reproducers we want to allow the test runner to set the
timeout to be a fraction of the default amount.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 6239acf89..2e00fd86b 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1107,7 +1107,7 @@ void tst_set_timeout(int timeout)
 	if (mul) {
 		float m = atof(mul);
 
-		if (m < 1)
+		if (m <= 0)
 			tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul);
 
 		results->timeout = results->timeout * m + 0.5;
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
