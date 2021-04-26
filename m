Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67436B9F5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 21:25:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14F5C3C676F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 21:25:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 954923C27BB
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 21:25:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2513E1000B11
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 21:25:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2757AAC87;
 Mon, 26 Apr 2021 19:25:46 +0000 (UTC)
Date: Mon, 26 Apr 2021 21:25:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YIcTuE34yq8KISC5@pevik>
References: <20210425030440.12762-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210425030440.12762-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Ignore ntfs file system
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

> If the fuse file system is ignored and the kernel enable CONFIG_NTFS_FS,
> then the mount.ntfs of fuse is used when mounting ntfs,
> which is equivalent to not ignoring the fuse file system.

...
> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> @@ -123,6 +123,7 @@ static struct tst_test test = {
>  	.all_filesystems = 1,
>  	.skip_filesystems = (const char *const []){
>  		"fuse",
> +		"ntfs",

Shouldn't "ntfs" *replace* "fuse"?

Testing on SLES kernel 5.3 (heavily patched) which is without CONFIG_NTFS_FS:
...
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
...
Summary:
passed   21
failed   0
broken   0
skipped  0
warnings 0

Testing Debian kernel 4.9.0-11-amd64 which is with CONFIG_NTFS_FS:
tst_supported_fs_types.c:148: TINFO: Skipping ntfs as requested by the test
...
Summary:
passed   15
failed   0
broken   0
skipped  0
warnings 0


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
