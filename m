Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEAA34E779
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 14:25:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2CD13C2593
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 14:25:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F32E03C243A
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:25:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7879B1A00938
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:25:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D89BB2E7;
 Tue, 30 Mar 2021 12:25:10 +0000 (UTC)
Date: Tue, 30 Mar 2021 14:25:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YGMYpaeR7Mp7rATD@pevik>
References: <20210329145738.986-1-pvorel@suse.cz>
 <87czvhneqb.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czvhneqb.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_mkfs: Add -I option to mkfs.vfat
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> > +	/*
> > +	 * Workaround a problem:
> > +	 * mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0', not
> > +	 * making filesystem (use -I to override)
> > +	 */
> > +	if (!strcmp(fs_type, "vfat")) {
> > +		argv[pos] = "-I";
> > +		strcat(fs_opts_str, argv[pos++]);

> Doesn't it need a space after -I?
No, it's char *const argv[] passed to execvp() in tst_cmd_fds_(), which does the
separation. Adding spaces on the contrary causes failure (equivalent of
mkfs.vfat " -I " ...).

> Might be better to put this after fs_opts and then you can check i > 0.
Have I overlooked introduced regression? It works, only it needs to add " "
space for formatting output, but functionality works, adding tested file.

Kind regards,
Petr

Testing file:

#include "tst_test.h"
#define MOUNT_POINT "mount_ext"

static void do_test(void)
{
	tst_res(TPASS, "here");
}

static struct tst_test test = {
	.test_all = do_test,
	.mount_device = 1,
	.mntpoint = MOUNT_POINT,
	.needs_root = 1,
	.dev_fs_type = "vfat",
	.dev_fs_opts = (const char *const []){"-v", NULL},
};

Needed fix:

--- lib/tst_mkfs.c
+++ lib/tst_mkfs.c
@@ -60,6 +60,7 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 	if (!strcmp(fs_type, "vfat")) {
 		argv[pos] = "-I";
 		strcat(fs_opts_str, argv[pos++]);
+		strcat(fs_opts_str, " ");
 	}
 
 	if (fs_opts) {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
