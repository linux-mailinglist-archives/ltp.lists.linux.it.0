Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E029755BE7A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jun 2022 07:41:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B12113C9590
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jun 2022 07:41:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E789B3C8813
 for <ltp@lists.linux.it>; Tue, 28 Jun 2022 07:41:18 +0200 (CEST)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 02D551A00920
 for <ltp@lists.linux.it>; Tue, 28 Jun 2022 07:41:15 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id WBR00110;
 Tue, 28 Jun 2022 13:41:10 +0800
Received: from localhost.localdomain (10.200.104.57) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2507.9; Tue, 28 Jun 2022 13:41:09 +0800
From: wangkaiyuan <wangkaiyuan@inspur.com>
To: <ltp@lists.linux.it>
Date: Tue, 28 Jun 2022 13:41:07 +0800
Message-ID: <20220628054107.45405-1-wangkaiyuan@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.200.104.57]
tUid: 2022628134110db5b3ea16796d4434a0efdd7ab7647d1
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix the statistical number of results in the html
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
Cc: wangkaiyuan <wangkaiyuan@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The original statistical method policy expression "/\ TFAIL\ /" in
the original genhtml.pl for the test result type cannot match the 
"TFAIL:" in the normal test result, causing problems in the calculation
result. At the same time, the statistical method in genhtml.pl cannot
guarantee that each test item has only one test result, because the
output of a test item may include TFAIL, TCONF, and TPASS at the same time.

Signed-off-by: wangkaiyuan <wangkaiyuan@inspur.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 tools/genhtml.pl | 49 +++++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/tools/genhtml.pl b/tools/genhtml.pl
index 7e9bdd471..5f6016c47 100644
--- a/tools/genhtml.pl
+++ b/tools/genhtml.pl
@@ -50,6 +50,7 @@ my $retr_test_counter       = 0;
 my $retr_test_counter_flag  = 0;
 my $conf_test_counter       = 0;
 my $conf_test_counter_flag  = 0;
+my $test_passed             = 0;
 
 my $detected_fail = 0;
 my $detected_pass = 0;
@@ -115,7 +116,7 @@ foreach my $file (@ARGV) {
 		if ($line =~ /$end_tag/) {
                         print "$row_line";
 			$process_line  = 0;
-                        $flag  = 0;             $flag2 = 0;            $flag3 = 0;            $flag4 = 0;
+                        $flag  = 0;             $flag2 = 0;            $flag3 = 0;            $flag4 = 0;            $flag5 = 0;
                         $detected_fail = 0;     $detected_pass = 0;    $detected_warn = 0;    $detected_brok = 0;    $detected_retr = 0;    $detected_conf = 0;
                         $background_colour = 0; $failed_test_counter_flag = 0; $brok_test_counter_flag = 0; $warn_test_counter_flag = 0; $retr_test_counter_flag = 0; $conf_test_counter_flag = 0;  $row_line= "";
 		}
@@ -175,38 +176,30 @@ foreach my $file (@ARGV) {
                              $flag2 = 0;
                              $flag3 = 1;
                              $flag4 = 1;
+                             $flag5 = 1;
                              $row_line = $row_line . "</strong></pre></td>";
                         }
                         if ( $flag2 == 1 ) {
 			    $row_line = $row_line . "$line \n";
-			    if ($line =~ /\ TFAIL\ / ) {
-				$detected_fail = 1;
-				if ( $failed_test_counter_flag == 0 ) {
-				    $failed_test_counter++;
-				    $failed_test_counter_flag=1;
-				}
-			    } elsif ($line =~ /\ TBROK\ / ) {
-				$detected_brok = 1;
-				if ( $brok_test_counter_flag == 0 ) {
-				    $brok_test_counter++;
-				    $brok_test_counter_flag=1;
-				}
-			    } elsif ($line =~ /\ TWARN\ / ) {
-				$detected_warn = 1;
-				if ( $warn_test_counter_flag == 0 ) {
-				    $warn_test_counter++;
-				    $warn_test_counter_flag=1;
-				}
-			    } elsif ($line =~ /\ TCONF\ / ) {
-				$detected_conf = 1;
-				if ( $conf_test_counter_flag == 0 ) {
-				    $conf_test_counter++;
-				    $conf_test_counter_flag=1;
-				}
-                             } else {
-                                 $detected_pass = 1;
-                             }
                         }
+			 if ( $flag5 == 1 ) {
+			 	 if ($line =~  "termination_id=1" ) {
+					 $detected_fail = 1;
+					 $failed_test_counter++;
+				 } elsif ($line =~ "termination_id=2" ) {
+					 $detected_brok = 1;
+					 $brok_test_counter++;
+				 } elsif ($line =~ "termination_id=4" ) {
+					 $detected_warn = 1;
+					 $warn_test_counter++;
+				 } elsif ($line =~ "termination_id=32" ) {
+					 $detected_conf = 1;
+					 $conf_test_counter++;
+				 } elsif ($line =~ "termination_id=0" ) {
+					 $detected_pass = 1;
+					 $test_passed++;
+				 }
+			 }
                         if ( $line =~ /$output_tag/ ) {
                              $flag2 = 1;
                              $row_line = $row_line . "<td><pre><strong>";
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
