Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00F1558FA
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:04:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A11EA3C23B4
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 15:04:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DDC963C144F
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:04:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90950616657
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 15:04:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E02F1AD3A;
 Fri,  7 Feb 2020 14:04:47 +0000 (UTC)
Date: Fri, 7 Feb 2020 15:04:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200207140404.GA8492@dell5510>
References: <20200206162722.18945-1-pvorel@suse.cz>
 <20200207132001.GC19508@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207132001.GC19508@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/fsmount01: Add test for new mount
 API v5.2
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

Hi,

> > +	while (fgets(line, LINELENGTH, file) != NULL) {
> > +		if (strstr(line, mntpoint) != NULL) {

> It's not necessary to check against NULL, we can simply write these as:

> 	while (fgets(line, sizeof(line), file)) {
> 		...

> > +			ret = 1;
> > +			break;
> > +		}
> > +	}
> > +	SAFE_FCLOSE(file);
> > +	return ret;
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +	if (is_mounted) {
> > +		TEST(tst_umount(MNTPOINT));
> > +		if (TST_RET != 0)
> > +			tst_brk(TBROK | TTERRNO, "umount failed in cleanup");

> I do remmeber commenting this that the tst_umount() already prints a
> WARN which will fail the test anyways, so there is no point in handling
> the return from tst_umount() here.
I guess SAFE_UMOUNT(MNTPOINT) will be the best.

...
> > +	if (ismount(MNTPOINT)) {
> > +		tst_res(TPASS, "new mount API from v5.2 works");
> > +		TEST(tst_umount(MNTPOINT));
> > +		if (TST_RET != 0)
> > +			tst_brk(TBROK | TTERRNO, "umount failed");

> And here as well.

> Apart from these two minor comments the test looks good, you can add my
> Reviewed-by.

Thanks for review, sorry for not catching these errors.
Going to fix it with your Reviewed-by, with these fixes.

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fsmount/fsmount01.c testcases/kernel/syscalls/fsmount/fsmount01.c
index 7ba50753f..64e8c4744 100644
--- testcases/kernel/syscalls/fsmount/fsmount01.c
+++ testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -25,7 +25,7 @@ static int ismount(char *mntpoint)
 
 	file = SAFE_FOPEN("/proc/mounts", "r");
 
-	while (fgets(line, LINELENGTH, file) != NULL) {
+	while (fgets(line, sizeof(line), file)) {
 		if (strstr(line, mntpoint) != NULL) {
 			ret = 1;
 			break;
@@ -37,11 +37,8 @@ static int ismount(char *mntpoint)
 
 static void cleanup(void)
 {
-	if (is_mounted) {
-		TEST(tst_umount(MNTPOINT));
-		if (TST_RET != 0)
-			tst_brk(TBROK | TTERRNO, "umount failed in cleanup");
-	}
+	if (is_mounted)
+		SAFE_UMOUNT(MNTPOINT)
 }
 
 static void test_newmount(void)
@@ -80,9 +77,7 @@ static void test_newmount(void)
 
 	if (ismount(MNTPOINT)) {
 		tst_res(TPASS, "new mount API from v5.2 works");
-		TEST(tst_umount(MNTPOINT));
-		if (TST_RET != 0)
-			tst_brk(TBROK | TTERRNO, "umount failed");
+		SAFE_UMOUNT(MNTPOINT)
 		is_mounted = 0;
 	} else
 		tst_res(TFAIL, "new mount API from v5.2 works");

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
