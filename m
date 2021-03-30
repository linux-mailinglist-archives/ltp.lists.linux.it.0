Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1834E78F
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 14:36:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6F8C3C2593
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 14:36:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 086543C251C
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:36:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 60AA260029F
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:36:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5BCAB2F5;
 Tue, 30 Mar 2021 12:36:51 +0000 (UTC)
References: <20210329145738.986-1-pvorel@suse.cz> <87czvhneqb.fsf@suse.de>
 <YGMYpaeR7Mp7rATD@pevik>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YGMYpaeR7Mp7rATD@pevik>
Date: Tue, 30 Mar 2021 13:36:50 +0100
Message-ID: <87a6qkom1p.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi,
>
> ...
>> > +	/*
>> > +	 * Workaround a problem:
>> > +	 * mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0', not
>> > +	 * making filesystem (use -I to override)
>> > +	 */
>> > +	if (!strcmp(fs_type, "vfat")) {
>> > +		argv[pos] = "-I";
>> > +		strcat(fs_opts_str, argv[pos++]);
>
>> Doesn't it need a space after -I?
> No, it's char *const argv[] passed to execvp() in tst_cmd_fds_(), which does the
> separation. Adding spaces on the contrary causes failure (equivalent of
> mkfs.vfat " -I " ...).
>
>> Might be better to put this after fs_opts and then you can check i > 0.
> Have I overlooked introduced regression? It works, only it needs to add " "
> space for formatting output, but functionality works, adding tested
> file.

Ah, well given Martin's comment as well, this LGTM.

>
> Kind regards,
> Petr
>
> Testing file:
>
> #include "tst_test.h"
> #define MOUNT_POINT "mount_ext"
>
> static void do_test(void)
> {
> 	tst_res(TPASS, "here");
> }
>
> static struct tst_test test = {
> 	.test_all = do_test,
> 	.mount_device = 1,
> 	.mntpoint = MOUNT_POINT,
> 	.needs_root = 1,
> 	.dev_fs_type = "vfat",
> 	.dev_fs_opts = (const char *const []){"-v", NULL},
> };
>
> Needed fix:
>
> --- lib/tst_mkfs.c
> +++ lib/tst_mkfs.c
> @@ -60,6 +60,7 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
>  	if (!strcmp(fs_type, "vfat")) {
>  		argv[pos] = "-I";
>  		strcat(fs_opts_str, argv[pos++]);
> +		strcat(fs_opts_str, " ");
>  	}
>  
>  	if (fs_opts) {


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
