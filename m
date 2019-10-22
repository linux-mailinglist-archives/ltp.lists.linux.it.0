Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C05CDDFC0E
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 04:56:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84E403C2433
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 04:56:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D9CAE3C2427
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 04:55:59 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id ED21E600A60
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 04:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZmkHv
 ztHY13hg38WzSNtc5hqRp1NmHqmSelf+CcavWc=; b=UM/9tZHKO4wA0yA0ehMZU
 NO5P4RY7wcCrgGg0txKt16rJF89Dp1yME67GFbGl+4Ry1agahCGConHdo+1kbXHE
 4Sxm/pqwgL/TWN5ZmnOLWZvlzSDMqs71tE0g3lWra+0TvpoNAvmzIhfdU4pMdPfK
 Rfih83kVC8xHA7/RUDPk5E=
Received: from localhost.localdomain (unknown [112.25.212.39])
 by smtp9 (Coremail) with SMTP id DcCowABXUvO3b65day3mFw--.40S2;
 Tue, 22 Oct 2019 10:55:52 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Tue, 22 Oct 2019 10:54:56 +0800
Message-Id: <20191022025456.15711-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CM-TRANSID: DcCowABXUvO3b65day3mFw--.40S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5KrWrCF1rZrW8KF48WFg_yoW8XF1xpr
 1ay342k3s5Xa1DGasrZw1kWryjq3yYyr18Wrs8Zr48J3Z3AF1vqr9rK3WxZry3KrWv9ay8
 tFWUWFW2q3WUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UE2NNUUUUU=
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiOw1WXlXlnC9YdwAAsS
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] fs/binfmt_misc02.sh: Fix local variable assignment
 for dash
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
Cc: limingyu <limingyu@deepin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Only the first one can be accepted if more than one string are assigned
to local valiable.  For example, only "This" is assigned to $string:
------------------------------------
tstring="This is test for extension"
...
local string=$tstring
------------------------------------

We add a pair of quotes to fix the issue now. Besides we can also fix
the issue by splitting declaration and assignment(e.g. local string &
string=$tstring).

See the explanation from:
https://wiki.ubuntu.com/DashAsBinSh#local

Fixes: #601
Reported-by: limingyu <limingyu@deepin.com>
Suggested-by: limingyu <limingyu@deepin.com>
Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
index 8d0ecd895..9dbcd68cc 100755
--- a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
+++ b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
@@ -26,7 +26,7 @@ TST_NEEDS_CMDS="which cat head"
 recognised_unrecognised()
 {
 	local file=$1
-	local string=$2
+	local string="$2"
 
 	eval $file >temp 2>&1
 	if [ $? -ne 0 ] || ! grep -q "$string" temp; then
@@ -52,7 +52,7 @@ recognised_unrecognised()
 unrecognised()
 {
 	local file=$1
-	local string=$2
+	local string="$2"
 
 	eval $file >temp 2>&1
 	if [ $? -eq 0 ] || grep -q "$string" temp; then
-- 
2.21.0



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
