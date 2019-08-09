Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 791B08723D
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DF403C1C96
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 982CC3C183A
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:13 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C70821401A5D
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:12 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 23:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="326543105"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2019 23:30:09 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Fri,  9 Aug 2019 14:19:58 +0800
Message-Id: <20190809062000.8671-3-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809062000.8671-1-yixin.zhang@intel.com>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH ltp 3/5] runtest/ltp-aiodio.part4: rename
 aiodio_append tests to avoid duplication
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

The name AD00{1..9} is already used in ltp-aiodio.part1, change them to
ADA00{1..9}.

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 runtest/ltp-aiodio.part4 | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/runtest/ltp-aiodio.part4 b/runtest/ltp-aiodio.part4
index bb8abfdf1..1c845cd7d 100644
--- a/runtest/ltp-aiodio.part4
+++ b/runtest/ltp-aiodio.part4
@@ -34,16 +34,16 @@ DIO07 dio_sparse
 DIO08 dio_sparse
 DIO09 dio_sparse
 #Running aiodio_append
-AD000 aiodio_append $TMPDIR/aiodio.$$/file2
-AD001 aiodio_append $TMPDIR/aiodio.$$/file2
-AD002 aiodio_append $TMPDIR/aiodio.$$/file2
-AD003 aiodio_append $TMPDIR/aiodio.$$/file2
-AD004 aiodio_append $TMPDIR/aiodio.$$/file2
-AD005 aiodio_append $TMPDIR/aiodio.$$/file2
-AD006 aiodio_append $TMPDIR/aiodio.$$/file2
-AD007 aiodio_append $TMPDIR/aiodio.$$/file2
-AD008 aiodio_append $TMPDIR/aiodio.$$/file2
-AD009 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA000 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA001 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA002 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA003 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA004 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA005 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA006 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA007 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA008 aiodio_append $TMPDIR/aiodio.$$/file2
+ADA009 aiodio_append $TMPDIR/aiodio.$$/file2
 #Running dio_append
 ADI000 dio_append
 ADI001 dio_append
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
