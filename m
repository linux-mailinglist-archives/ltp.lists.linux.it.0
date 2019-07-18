Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45C6CBB5
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 11:20:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E53A3C1D41
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 11:20:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 639913C14BE
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 11:20:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1681F14019DE
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 11:20:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43500AF7D;
 Thu, 18 Jul 2019 09:20:37 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Jul 2019 11:20:37 +0200
Message-Id: <20190718092037.13594-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] doc: Mention network tests in variables
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I'd prefer using hyperlinks in docs (as it's supposed to be viewed
mainly in a browser) but these are the only variants (which looks too
ugly to me):

NOTE: link:../../blob/master/testcases/network/README.md[Network tests] use additional variables
in 'tst_net.sh'.
(this one at least keeps links to forks)

NOTE: https://github.com/linux-test-project/ltp/blob/master/testcases/network/README.md[Network tests] use additional variables
in 'tst_net.sh'.

=> I'd be for giving up links.

Kind regards,
Petr

 doc/test-writing-guidelines.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 869e6ed35..e59d72065 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1883,6 +1883,9 @@ simply by setting right '$TST_NEEDS_FOO'.
 | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
 |=============================================================================
 
+NOTE: Network tests (see testcases/network/README.md) use additional variables
+in 'tst_net.sh'.
+
 Checking for presence of commands
 +++++++++++++++++++++++++++++++++
 
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
