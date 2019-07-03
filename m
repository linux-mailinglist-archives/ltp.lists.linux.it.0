Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E15E702
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 16:42:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80A2D3C1D6D
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 16:42:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0A01A3C1D47
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 16:42:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D743B100156D
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 16:42:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4912B68B;
 Wed,  3 Jul 2019 14:42:34 +0000 (UTC)
Date: Wed, 3 Jul 2019 16:42:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190703144236.GA1495@dell5510>
References: <20190606114134.GB13068@rei.lan>
 <1560156706-13617-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190620120122.GB31382@dell5510> <5D0C323B.5020505@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0C323B.5020505@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] sysctl/sysctl02: Add new regression test for
 overflow file-max
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yang,

> Hi Petr

>  I use 2 strings because sysctl uses "fs.file-max" but cat uses "fs/file-max" file.
>  Your big changes look good to me.  Thanks for your changes.
I pushed tiny changes to sysctl02.sh as 8e2d73a88 ("sysctl/sysctl02: Improve log messages").
See the diff below.

Kind regards,
Petr

diff --git a/testcases/commands/sysctl/sysctl02.sh b/testcases/commands/sysctl/sysctl02.sh
index 8a434183e..3964a9829 100755
--- a/testcases/commands/sysctl/sysctl02.sh
+++ b/testcases/commands/sysctl/sysctl02.sh
@@ -44,14 +44,17 @@ do_test()
 
 sysctl_test_overflow()
 {
+	local test_value="$1"
 	local old_value="$(cat $sys_file)"
-	sysctl -w -q $sys_name=$1 2>/dev/null
-	local test_value="$(cat $sys_file)"
 
-	if echo $test_value | grep -q $old_value; then
-		tst_res TPASS "$sys_file overflows, reject it and keep old value"
+	tst_res TINFO "trying to set $sys_name=$test_value"
+	sysctl -w -q $sys_name=$test_value 2>/dev/null
+	local new_value="$(cat $sys_file)"
+
+	if [ "$new_value" = "$old_value" ]; then
+		tst_res TPASS "$sys_file keeps old value ($old_value)"
 	else
-		tst_res TFAIL "$sys_file overflows and set to $test_value"
+		tst_res TFAIL "$sys_file overflows and is set to $new_value"
 	fi
 	cleanup
 }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
