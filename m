Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A96FBAE
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 10:58:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69B893C1D01
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 10:58:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9A1AF3C1C97
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 10:58:08 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3358E20096E
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 10:58:04 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6M8vYNs029486
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 01:57:51 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 22 Jul
 2019 01:57:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <ltp@lists.linux.it>
Date: Mon, 22 Jul 2019 16:57:24 +0800
Message-ID: <1563785844-28983-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] *.sh: convert hardcoded python2 to python3
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

We had converted python2 to python3 for all *.py in commit
5a8408bc32f0eada5cbf65ac63d5cd2410f95249. But there are still hardcoded
python2 in some scripts. Convert these python2 to python3.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 testcases/kernel/power_management/runpwtests05.sh          |  2 +-
 .../kernel/power_management/runpwtests_exclusive01.sh      |  2 +-
 .../kernel/power_management/runpwtests_exclusive02.sh      |  2 +-
 .../kernel/power_management/runpwtests_exclusive03.sh      |  2 +-
 .../kernel/power_management/runpwtests_exclusive04.sh      |  2 +-
 .../kernel/power_management/runpwtests_exclusive05.sh      |  2 +-
 testcases/network/nfsv4/acl/runtest                        | 14 +++++++-------
 testcases/realtime/func/pi-tests/run_auto.sh               |  6 +++---
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/power_management/runpwtests05.sh b/testcases/kernel/power_management/runpwtests05.sh
index 8a7d0f6..43e234d 100755
--- a/testcases/kernel/power_management/runpwtests05.sh
+++ b/testcases/kernel/power_management/runpwtests05.sh
@@ -35,7 +35,7 @@ else
 	max_sched_smt=1
 fi
 
-tst_test_cmds python
+tst_test_cmds python3
 
 if ! grep sched_debug -qw /proc/cmdline ; then
 	tst_brkm TCONF "Kernel cmdline parameter 'sched_debug' needed," \
diff --git a/testcases/kernel/power_management/runpwtests_exclusive01.sh b/testcases/kernel/power_management/runpwtests_exclusive01.sh
index ec78319..9fefcbf 100755
--- a/testcases/kernel/power_management/runpwtests_exclusive01.sh
+++ b/testcases/kernel/power_management/runpwtests_exclusive01.sh
@@ -35,7 +35,7 @@ else
 	max_sched_smt=1
 fi
 
-tst_test_cmds python
+tst_test_cmds python3
 
 hyper_threaded=$(is_hyper_threaded)
 multi_socket=$(is_multi_socket)
diff --git a/testcases/kernel/power_management/runpwtests_exclusive02.sh b/testcases/kernel/power_management/runpwtests_exclusive02.sh
index e107fce..2cd0ecb 100755
--- a/testcases/kernel/power_management/runpwtests_exclusive02.sh
+++ b/testcases/kernel/power_management/runpwtests_exclusive02.sh
@@ -33,7 +33,7 @@ else
 	max_sched_smt=1
 fi
 
-tst_test_cmds python
+tst_test_cmds python3
 
 hyper_threaded=$(is_hyper_threaded)
 multi_socket=$(is_multi_socket)
diff --git a/testcases/kernel/power_management/runpwtests_exclusive03.sh b/testcases/kernel/power_management/runpwtests_exclusive03.sh
index 490344b..ab3a5d1 100755
--- a/testcases/kernel/power_management/runpwtests_exclusive03.sh
+++ b/testcases/kernel/power_management/runpwtests_exclusive03.sh
@@ -35,7 +35,7 @@ else
 	max_sched_smt=1
 fi
 
-tst_test_cmds python
+tst_test_cmds python3
 
 hyper_threaded=$(is_hyper_threaded)
 multi_socket=$(is_multi_socket)
diff --git a/testcases/kernel/power_management/runpwtests_exclusive04.sh b/testcases/kernel/power_management/runpwtests_exclusive04.sh
index 978ca02..438ef60 100755
--- a/testcases/kernel/power_management/runpwtests_exclusive04.sh
+++ b/testcases/kernel/power_management/runpwtests_exclusive04.sh
@@ -27,7 +27,7 @@ export TST_TOTAL=2
 # Checking test environment
 check_kervel_arch
 
-tst_test_cmds python
+tst_test_cmds python3
 
 hyper_threaded=$(is_hyper_threaded)
 multi_socket=$(is_multi_socket)
diff --git a/testcases/kernel/power_management/runpwtests_exclusive05.sh b/testcases/kernel/power_management/runpwtests_exclusive05.sh
index a0dad58..3a9afdb 100755
--- a/testcases/kernel/power_management/runpwtests_exclusive05.sh
+++ b/testcases/kernel/power_management/runpwtests_exclusive05.sh
@@ -35,7 +35,7 @@ else
 	max_sched_smt=1
 fi
 
-tst_test_cmds python
+tst_test_cmds python3
 
 hyper_threaded=$(is_hyper_threaded)
 multi_socket=$(is_multi_socket)
diff --git a/testcases/network/nfsv4/acl/runtest b/testcases/network/nfsv4/acl/runtest
index d2e1b4c..a859e85 100755
--- a/testcases/network/nfsv4/acl/runtest
+++ b/testcases/network/nfsv4/acl/runtest
@@ -22,7 +22,7 @@ do
 done
 
 #  creation of users on the remote machine (removed only at the end of the tests)
-rsh -n $REMOTEHOST python $PWD/create_users.py -u 50 -g 50
+rsh -n $REMOTEHOST python3 $PWD/create_users.py -u 50 -g 50
 
 echo "Starting ACL testing"
 
@@ -51,19 +51,19 @@ echo "Basic tests finished"
 
 echo "LONG ACL TEST"
 echo "creating necessary users and groups"
-python create_users.py -u 50 -g 50
+python3 create_users.py -u 50 -g 50
 echo "creating necessary users and groups on the remote host"
 mkdir $NFSMNTDIR/lacl-testdir
-python test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
+python3 test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
 rm -rf $NFSMNTDIR/lacl-testdir
 echo "Long ACL test OK with $MAXLENGTH entries"
 echo "ACL STRESSING TEST"
-python setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
+python3 setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
 
 # remove local an remote users
-python cleanusers.py
-python cleangroups.py
-rsh -n $REMOTEHOST python $PWD/cleanusers.py
+python3 cleanusers.py
+python3 cleangroups.py
+rsh -n $REMOTEHOST python3 $PWD/cleanusers.py
 
 echo "Test OK"
 
diff --git a/testcases/realtime/func/pi-tests/run_auto.sh b/testcases/realtime/func/pi-tests/run_auto.sh
index d130260..2779885 100755
--- a/testcases/realtime/func/pi-tests/run_auto.sh
+++ b/testcases/realtime/func/pi-tests/run_auto.sh
@@ -15,15 +15,15 @@ $SCRIPTS_DIR/run_c_files.sh $profile testpi-0
 
 export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-1.log"
 $SCRIPTS_DIR/run_c_files.sh $profile testpi-1
-PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
+PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
 
 export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-2.log"
 $SCRIPTS_DIR/run_c_files.sh $profile testpi-2
-PYTHONPATH=../../  python parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
+PYTHONPATH=../../  python3 parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
 
 export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-4.log"
 $SCRIPTS_DIR/run_c_files.sh $profile testpi-4
-PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
+PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
 
 
 export LOG_FILE=""
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
