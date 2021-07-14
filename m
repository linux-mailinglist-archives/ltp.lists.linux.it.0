Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF03C8212
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:52:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 991833C871A
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:52:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 77CAC3C562F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:51:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E60FB1000EDA
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:51:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35C1C2027B;
 Wed, 14 Jul 2021 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626256316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JSZDS/Upe25ZWXif78l+QilhDSlRKoJ2ekOA+stZ2rI=;
 b=iQ4K1S4KHukikIxDsszogG9VIVrQxk3+jN++erQsLyie7adfkVpQ16wvPXM4F5zJkZ5b8F
 tuB89ESp6LTK6jMIuAH77CLULV3f0g8V36ouIqtuJB1duvhcvPgFZQqiiuEWhrkmdyzVAZ
 MEWTBE9T2n2YJNcglJ7UX1P+Hr+Ah0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626256316;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JSZDS/Upe25ZWXif78l+QilhDSlRKoJ2ekOA+stZ2rI=;
 b=x0hoXx5Fubo7nCUeTvcDoDaWztn2y+bJs6/PCVhmbV9ONY7DAf/ol4vhvliRhyrQ5ij5oV
 ln7cViW/N+LY7YAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23CE013BFB;
 Wed, 14 Jul 2021 09:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6kWaB7yz7mAUJwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 14 Jul 2021 09:51:56 +0000
Date: Wed, 14 Jul 2021 11:26:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YO6tv6cboxnLOuL+@yuki>
References: <20210714055253.1668374-1-lkml@jv-coder.de> <YO6hz+OQLThjUQA1@yuki>
 <c4012edf-226b-ef55-8872-44d7398282da@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4012edf-226b-ef55-8872-44d7398282da@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] squashfs: Add regression test for sanity check
 bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Is there any guideline? I used regression suffix, because it 
> specifically is a regression test and there are several regression 
> tests, that use it.
> I dropped a number prefix, because there are several tests without a 
> number...
> I don't really care what the name is here. If you don't have a strong 
> opinion on the regression suffix, I will use squashfs_regression01.

Unfortunatelly apart from syscalls there is no clear rule how to name
tests and we are figuring out stuff as we go. Hoever most of the
regression tests do not have regression in name and generally tests are
named as "syscall/driver/filesystem/cve-nickname/etc" followed by a
number.

> > We do have tst_umount() in the test library that retries the umount if
> > it failed because the mount point was bussy. This is because certain
> > damons scan all newly mounted filesystems and prevent us from umounting
> > shortly after mount.
> >
> > Also we usually keep track if device was mounted in a global flag that
> > is set after succesful mount and unset after successful umount and the
> > cleanup does:
> >
> > 	if (device_mounted)
> > 		tst_umount("mnt");
> Ok, but this could leave the mount, if the test is aborted between 
> mounting and setting of the flag, but that should be a rare case.

As long as the flag is set/cleared right after the mount/umount it will
not happen.

Also looking at the code, we have to handle the return value from
tst_umount() in the run() function since it does not call tst_brk().

> > We do have tst_cmd() that can do all this easily in C including the
> > redirection, it will look like:
> >
> > 	const char *argv[] = {"mksquashfs", "data", "image.raw", "-noI", "-noD", "-noX", "-noF"};
> >
> > 	tst_cmd(argv, "/dev/null", "/dev/null", 0);
> >
> > And this will redirect stdout and stderr to "/dev/null" and also do all
> > the error checks and exit the test if mksquashfs has failed.
> Did not know about that, also it requires a NULL at the end.

We do have most of the library functions documented at:

https://github.com/linux-test-project/ltp/wiki/C-Test-API

And yes, the argv has to be NULL terminated, sorry for forgetting that
part.

> >> +	SAFE_MKDIR("mnt", 0777);
> > This preparatory part should be in the test setup otherwise the test
> > will fail with '-i 2'.
> Right, I'll move the whole setup part to setup.
> >
> >> +	TST_EXP_PASS(tst_system("mount -tsquashfs -oloop image.raw mnt"));
> > Can we please use the mount() syscall here instead? That should be as
> > easy as mount("image.raw", "mnt", "squashfs", 0, "-oloop")
> Nope, -oloop does not work, because this is interpreted by the mount 
> utility, not by the syscall.
> I guess I'll use the need_device stuff, to get rid of mount utility call 
> then.

Ah my bad, so the mount command discovers the device in userspace then,
it makes much more sense to use the library to allocate free device for
the test.

But I guess that it would probably be better to use the raw
tst_find_free_loopdev() because the .needs_device flag prepares a
backing file for the device and attaches it as well.

> >> +
> >> +	SAFE_UMOUNT("mnt");
> > Here as well, please use tst_umount();
> Ok
> 
> >
> >> +	tst_res(TPASS, "Test passed");
> > This is redundant, isn't it? Or is the umount part that fails?
> Since I cannot use TST_EXP_PASS further up, I will keep this and check 
> the return of mount manually like this:
> 
> static void run(void)
> {
>  ?????? tst_res(TINFO, "Test squashfs sanity check regressions");
> 
>  ?????? if (mount(tst_device->dev, MOUNT_DIR, "squashfs", 0, NULL) != 0) {
>  ?????? ?????? tst_brk(TFAIL | TERRNO, "Mount failed");
>  ?????? }
>  ?????? mounted = 1;
> 
>  ?????? tst_umount("mnt");
>  ?????? mounted = 0;
> 
>  ?????? tst_res(TPASS, "Test passed");
> }
> 
> Would that be ok for you or is there another variant of TST_EXP*, that 
> uses tst_brk?

I guess that we should check the return value from tst_umount() here as
well, so ti would be better as:

	if (tst_umount("mnt")) {
		tst_brk(TBROK, "Failed to unmount squashfs");
	} else {
		mounted = 0;
		tst_res(TPASS, "Squashfs unmounted");
	}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
