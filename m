Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BF1BAA61
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 18:49:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 359693C5FBA
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 18:49:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 317283C226C
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 18:49:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8426A1000553
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 18:49:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 079CFABCC;
 Mon, 27 Apr 2020 16:49:03 +0000 (UTC)
Date: Mon, 27 Apr 2020 18:49:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200427164902.GA4544@dell5510>
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421065002.12417-5-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

thank you for this patchset!

...
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c

...

> +		} else if (memcmp(&event_fid->fsid, &expected->fid->fsid,
> +				  sizeof(event_fid->fsid)) != 0) {
> +			tst_res(TFAIL,
> +				"got event: mask=%llx pid=%u fd=%d name='%s' "
> +				"len=%d info_type=%d info_len=%d fh_len=%d "
> +				"fsid=%x.%x (expected %x.%x)",
> +				(unsigned long long)event->mask,
> +				(unsigned)event->pid, event->fd, filename,
> +				event->event_len, info_type,
> +				event_fid->hdr.len, fhlen,
> +				event_fid->fsid.val[0], event_fid->fsid.val[1],

This needs to be:
+				FSID_VAL_MEMBER(event_fid->fsid, 0),
+				FSID_VAL_MEMBER(event_fid->fsid, 1),

FSID_VAL_MEMBER() is a wrapper struct fanotify_event_info_fid, needed to fix
build on musl (and it shouldn't be used for struct event_t).

https://travis-ci.org/github/pevik/ltp/jobs/680149701

Also I got problems on FUSE:
safe_macros.c:754: INFO: Trying FUSE...
tst_test.c:1244: INFO: Timeout per run is 0h 05m 00s
fanotify16.c:112: INFO: Test #0: FAN_REPORT_FID with mark type: FAN_MARK_FILESYSTEM
fanotify16.c:138: BROK: fanotify_mark (3, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, FAN_DIR_MODIFY, AT_FDCWD, 'fs_mnt') failed: ENODEV (19)
tst_device.c:373: INFO: umount('fs_mnt') failed with EBUSY, try  1...
tst_device.c:377: INFO: Likely gvfsd-trash is probing newly mounted fs, kill it to speed up tests.

Skipping FUSE fixes it:
.dev_fs_flags = TST_FS_SKIP_FUSE,

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
