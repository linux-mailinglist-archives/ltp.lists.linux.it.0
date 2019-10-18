Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7033DC53F
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 14:46:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A587C3C2377
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 14:46:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 76D283C226C
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 14:45:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 404071A00EC1
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 14:45:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5CCEB3D0;
 Fri, 18 Oct 2019 12:45:25 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: ltp@lists.linux.it
Date: Fri, 18 Oct 2019 14:45:02 +0200
Message-Id: <20191018124502.25599-6-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191018124502.25599-1-cfamullaconrad@suse.de>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/5] Adopt doc for TST_RETRY_FUNC for
 LTP_TIMEOUT_MUL
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

Mention that time limit is mulitplied with LTP_TIMEOUT_MUL.
---
 doc/test-writing-guidelines.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index efff4d40c..905a4baa5 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2313,7 +2313,8 @@ Retry a function in limited time
 Sometimes LTP test needs retrying a function for many times to get success.
 This achievement makes that possible via keeping it retrying if the return
 value of the function is NOT as we expected. After exceeding a limited time,
-test will break from the retries immediately.
+test will break from the retries immediately. The time limit is multiplied
+with LTP_TIMEOUT_MUL.
 
 [source,c]
 -------------------------------------------------------------------------------
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
