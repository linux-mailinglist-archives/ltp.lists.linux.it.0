Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D6037A3A9
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 11:29:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89D503C64B6
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 11:29:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F4933C4E12
 for <ltp@lists.linux.it>; Tue, 11 May 2021 11:29:39 +0200 (CEST)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D51F910001B6
 for <ltp@lists.linux.it>; Tue, 11 May 2021 11:29:37 +0200 (CEST)
Received: from localhost (unknown [192.168.167.224])
 by lucky1.263xmail.com (Postfix) with ESMTP id C37C0BA684
 for <ltp@lists.linux.it>; Tue, 11 May 2021 17:29:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P12381T139987899971328S1620725366454728_; 
 Tue, 11 May 2021 17:29:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5965cc81ac99f88e30621b689809352f>
X-RL-SENDER: caojin@uniontech.com
X-SENDER: caojin@uniontech.com
X-LOGIN-NAME: caojin@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Cao jin <caojin@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 11 May 2021 17:29:26 +0800
Message-Id: <20210511092926.20509-1-caojin@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] runltp: Miscellaneous cleanups
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

1. typofix: then --> than
2. Drop useless HTML file name creating code, as g: mandatorily requires
   argument.
3. Make direcotry create symmetrical. There is no need to always see:

        INFO: creating $LTPROOT/results directory

   except the real creation of it. Also indent the code.

4. fix a variable misnomer

Signed-off-by: Cao jin <caojin@uniontech.com>
---
 runltp | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/runltp b/runltp
index 7cd0c159f..29779b853 100755
--- a/runltp
+++ b/runltp
@@ -300,7 +300,7 @@ main()
             version_of_ltp
 	    ;;
         f)  # Execute user defined set of testcases.
-            # Can be more then one file, just separate it with ',', like:
+            # Can be more than one file, just separate it with ',', like:
             # -f nfs,commands,/tmp/testfile
             CMDFILES=$OPTARG;;
 	F)	INJECT_KERNEL_FAULT=1
@@ -502,10 +502,6 @@ main()
           OUTPUTFILE_NAME="$DEFAULT_FILE_NAME_GENERATION_TIME"
           OUTPUTFILE="-o $LTPROOT/output/LTP_RUN_ON-$OUTPUTFILE_NAME.output"
           ALT_DIR_OUT=1
-          if [ ! "$HTMLFILE" ] ; then                        ## User has not mentioned HTML File name, We need to create one
-             HTMLFILE_NAME=`basename $OUTPUTFILE_NAME`
-             HTMLFILE="$LTPROOT/output/$HTMLFILE_NAME.html"
-          fi
        fi
     fi
 
@@ -522,16 +518,17 @@ main()
             }
         }
     }
+
     # If we need, create the results directory
     [ "$ALT_DIR_RES" -eq 1 ] && \
     {
-        echo "INFO: creating $LTPROOT/results directory"
         [ ! -d $LTPROOT/results ] && \
         {
-           mkdir -p $LTPROOT/results || \
-           {
-               echo "ERROR: failed to create $LTPROOT/results"
-               exit 1
+            echo "INFO: creating $LTPROOT/results directory"
+            mkdir -p $LTPROOT/results || \
+            {
+                echo "ERROR: failed to create $LTPROOT/results"
+                exit 1
             }
         }
     }
@@ -840,12 +837,12 @@ EOF
        export LTP_VERSION=$version_date
        export TEST_START_TIME="$test_start_time"
        export TEST_END_TIME="$(date)"
-       OUTPUT_DIRECTORY=`echo $OUTPUTFILE | cut -c4-`
+       OUTPUT_FILE=`echo $OUTPUTFILE | cut -c4-`
        LOGS_DIRECTORY="$LTPROOT/results"
        export TEST_OUTPUT_DIRECTORY="$LTPROOT/output"
        export TEST_LOGS_DIRECTORY=$LOGS_DIRECTORY
        echo "Generating HTML Output.....!!"
-       ( perl $LTPROOT/bin/genhtml.pl $LTPROOT/bin/html_report_header.txt test_start test_end test_output execution_status $OUTPUT_DIRECTORY  > $HTMLFILE; )
+       ( perl $LTPROOT/bin/genhtml.pl $LTPROOT/bin/html_report_header.txt test_start test_end test_output execution_status $OUTPUT_FILE  > $HTMLFILE; )
        echo "Generated HTML Output.....!!"
        echo "Location: $HTMLFILE";
 
-- 
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
