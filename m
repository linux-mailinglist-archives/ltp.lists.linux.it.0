Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA93312C0
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:01:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F1FA3C6BE8
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:01:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 153483C556C
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:01:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BB418600868
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:01:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27DABAE1F
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 16:01:28 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  8 Mar 2021 17:01:22 +0100
Message-Id: <20210308160122.24522-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308160122.24522-1-pvorel@suse.cz>
References: <20210308160122.24522-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] docparse: Unify Description and Algorithm titles
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

Instead of fixing sources docs unify it during doc generation.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index b5ab02bc1..f3a657d4d 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -308,7 +308,7 @@ sub content_all_tests
 
 				# fix formatting for asciidoc [DOCUMENTATION] => *DOCUMENTATION*
 				if ($doc =~ s/^\[(.*)\]$/$1/) {
-					$doc = paragraph(bold($doc));
+					$doc = paragraph(bold(ucfirst(lc($doc))));
 				}
 
 				$content .= "$doc\n";
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
