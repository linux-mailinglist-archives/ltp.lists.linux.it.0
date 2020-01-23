Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3731465E7
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 11:41:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE5E13C24F2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 11:41:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5E8EA3C0B90
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 11:41:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CFB0B1A01D5A
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 11:41:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3270EAD10
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 10:41:15 +0000 (UTC)
Date: Thu, 23 Jan 2020 11:41:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Message-ID: <20200123104114.GD27845@rei>
References: <20200116075633.29752-1-zlang@redhat.com>
 <20200116114900.GA4897@rei>
 <20200116150849.GF14282@dhcp-12-102.nay.redhat.com>
 <20200117074828.GA3979@dell5510>
 <20200117110554.GG14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117110554.GG14282@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/newmount: new test case for new mount
 API
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

Hi!
> > The only thing with bothers me is is that NTFS related failure
> > on CONFIG_NTFS_FS is not set and mkfs.ntfs installed.
> > I'd prefer at least to have a warning, but but better to fix it.
> > I guess it's LTP problem, see code at safe_mount() in lib/safe_macros.c
> > 
> > 	/*
> > 	 * Don't try using the kernel's NTFS driver when mounting NTFS, since
> > 	 * the kernel's NTFS driver doesn't have proper write support.
> > 	 */
> > 	if (!filesystemtype || strcmp(filesystemtype, "ntfs")) {
> > 		rval = mount(source, target, filesystemtype, mountflags, data);
> > 		if (!rval)
> > 			return 0;
> > 	}
> > 
> > But obviously we don't use it as we do mount in the test, not in the library.
> > So I propose (and can implement) to add flag TST_FS_SKIP_NTFS 0x02 into include/tst_fs.h
> > and use it in test.
> 
> Maybe LTP should do more check to decide a fs list will be tested, not only check
> mkfs.$FSTPE tools. For example, check:
> 1) mkfs.$FSTYPE is exist
> 2) ${FSTYPE}.ko is loaded, or can be loaded.

That obivously does not work for filesystems build into the kernel.

> Or check:
> 1) mkfs.$FSTYPE $tmpdev run passed
> 2) mount $tmpdev $tmpmnt passed
> 3) umount $tmpdev
> 4) remove $tmpdev and $tmpmnt

If you have a look at the lib/tst_supported_fs_types.c we actually do
this for filesystems implemented in the kernel. For FUSE we only check
that FUSE is enabled in the kernel and that mount.$fs_type is present,
which should be enough to tell if the filesystem is supported.

> For FUSE, I think we'd better to not test FUSE by default. Then let the case decide if
> it would like to support a FUSE fs test. Change the TST_FS_SKIP_FUSE to TST_FS_SUP_FUSE,
> if someone case wants to test a FUSE fs (likes ntfs), it should do special steps to mount
> it, or it'll test linux internal ntfs.ko.

It works fine for majority of testcases, the mount() and fsmount()
syscalls are kind of special here. I guess that all we need to do here
is to skip the fuse here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
