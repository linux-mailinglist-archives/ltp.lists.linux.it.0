Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EA819099E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 10:36:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFEC03C4D34
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 10:36:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D8A8C3C231A
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 10:36:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0ABD5600F19
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 10:36:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7814CAD2A;
 Tue, 24 Mar 2020 09:36:33 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Mar 2020 10:36:22 +0100
Message-Id: <20200324093622.21091-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324093622.21091-1-pvorel@suse.cz>
References: <20200324093622.21091-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] xinetd: Fix pattern for NetKit telnet
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
 testcases/network/xinetd/xinetd_tests.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/network/xinetd/xinetd_tests.sh b/testcases/network/xinetd/xinetd_tests.sh
index b7c6273ba..f7f5db7bc 100755
--- a/testcases/network/xinetd/xinetd_tests.sh
+++ b/testcases/network/xinetd/xinetd_tests.sh
@@ -92,7 +92,7 @@ xinetd_test()
 
 	for a in $check_addr; do
 		p=$(echo $pattern | sed "s/ADDR/$a/")
-		echo '' | telnet $a 2>&1 | grep -qi "$p"
+		echo '' | telnet $a 2>&1 | grep -qiE "$p"
 		[ $? -ne 0 ] && \
 			tst_brk TFAIL "not expected output for 'telnet $a'"
 	done
@@ -103,7 +103,7 @@ do_test()
 {
 	case $1 in
 	1) xinetd_test $1 "disabled" \
-			"telnet: connect to address ADDR: Connection refused";;
+			"telnet: (connect to address ADDR|Unable to connect to remote host): Connection refused";;
 	2) xinetd_test $1 "enabled" \
 			"Connection closed by foreign host";;
 	esac
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
