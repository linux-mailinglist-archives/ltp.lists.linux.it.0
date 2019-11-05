Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624FEFCD7
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 13:00:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 203CB3C22C6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 13:00:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A61A33C2296
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:00:56 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CD90C601715
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:00:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3783B50E;
 Tue,  5 Nov 2019 12:00:54 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 13:00:53 +0100
Message-Id: <20191105120053.9173-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test: Warn on repeated options
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

The library is not designed in a way that would allow us to pass an
option mutiple times, if such case the last option occurence replaces
all previous ones.

This patch adds a warning in a case that the option pointer is non-NULL,
which means that it has been set at least once already.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Jan Stancek <jstancek@redhat.com>
---
 lib/tst_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index c7b46d0d5..f41baf3cf 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -468,6 +468,9 @@ static void parse_topt(unsigned int topts_len, int opt, char *optarg)
 	if (i >= topts_len)
 		tst_brk(TBROK, "Invalid option '%c' (should not happen)", opt);
 
+	if (*toptions[i].arg)
+		tst_res(TWARN, "Option passed -%c multiple times", opt);
+
 	*(toptions[i].arg) = optarg ? optarg : "";
 }
 
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
