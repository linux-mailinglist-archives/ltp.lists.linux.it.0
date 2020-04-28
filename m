Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA941BB9C3
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:23:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FD053C287C
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:23:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E26BC3C282E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:22:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1D2D600A6C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:22:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 060B5ACED;
 Tue, 28 Apr 2020 09:22:56 +0000 (UTC)
Date: Tue, 28 Apr 2020 11:22:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200428092256.GC18634@dell5510>
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421065002.12417-5-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/fanotify: New test for FAN_MODIFY_DIR
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

...
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
...
> +	fd_notify = fanotify_init(FAN_REPORT_FID, 0);
> +	if (fd_notify == -1) {
> +		if (errno == EINVAL) {
> +			tst_brk(TCONF,
> +				"FAN_REPORT_FID not supported by kernel");
> +			return;
tst_brk() exits the test, so return is not needed.
> +		}
> +		tst_brk(TBROK | TERRNO,
> +			"fanotify_init(FAN_REPORT_FID, 0) failed");
> +	}
> +
> +	/*
> +	 * Watch dir modify events with name in filesystem/dir
> +	 */
> +	if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
> +			  AT_FDCWD, MOUNT_PATH) < 0) {
> +		if (errno == EINVAL) {
> +			tst_brk(TCONF,
> +				"FAN_DIR_MODIFY not supported by kernel");
> +			return;
Also here.
> +		}
> +		tst_brk(TBROK | TERRNO,
> +		    "fanotify_mark (%d, FAN_MARK_ADD | %s, "
> +		    "FAN_DIR_MODIFY, AT_FDCWD, '"MOUNT_PATH"') "
> +		    "failed", fd_notify, mark->name);
> +	}

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Suggesting these changes:

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fanotify/fanotify16.c testcases/kernel/syscalls/fanotify/fanotify16.c
index 0ec151841..7c29d256a 100644
--- testcases/kernel/syscalls/fanotify/fanotify16.c
+++ testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -116,11 +116,10 @@ static void do_test(unsigned int number)
 
 	fd_notify = fanotify_init(FAN_REPORT_FID, 0);
 	if (fd_notify == -1) {
-		if (errno == EINVAL) {
+		if (errno == EINVAL)
 			tst_brk(TCONF,
 				"FAN_REPORT_FID not supported by kernel");
-			return;
-		}
+
 		tst_brk(TBROK | TERRNO,
 			"fanotify_init(FAN_REPORT_FID, 0) failed");
 	}
@@ -130,11 +129,10 @@ static void do_test(unsigned int number)
 	 */
 	if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
 			  AT_FDCWD, MOUNT_PATH) < 0) {
-		if (errno == EINVAL) {
+		if (errno == EINVAL)
 			tst_brk(TCONF,
 				"FAN_DIR_MODIFY not supported by kernel");
-			return;
-		}
+
 		tst_brk(TBROK | TERRNO,
 		    "fanotify_mark (%d, FAN_MARK_ADD | %s, "
 		    "FAN_DIR_MODIFY, AT_FDCWD, '"MOUNT_PATH"') "
@@ -365,7 +363,8 @@ static void do_test(unsigned int number)
 				(unsigned)event->pid, event->fd, filename,
 				event->event_len, info_type,
 				event_fid->hdr.len, fhlen,
-				event_fid->fsid.val[0], event_fid->fsid.val[1],
+				FSID_VAL_MEMBER(event_fid->fsid, 0),
+				FSID_VAL_MEMBER(event_fid->fsid, 1),
 				expected->fid->fsid.val[0],
 				expected->fid->fsid.val[1]);
 		} else if (strcmp(expected->name, filename)) {
@@ -427,6 +426,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = do_test,
 	.tcnt = ARRAY_SIZE(test_cases),
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
 	.setup = setup,
 	.cleanup = cleanup,
 	.mount_device = 1,

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
