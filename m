Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED163D271
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 10:50:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E6543CC503
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 10:50:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3BD2D3C01D2
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 10:50:42 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 97C791400DB8
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 10:50:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F89021AF4;
 Wed, 30 Nov 2022 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669801840;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDWFOFxjPNlMAJGWMkiRsVGUeuuisjQs0l0/WicaIVg=;
 b=aL6P/0ZhLpC9zrBtdr3jeEgVmoqx6oYpwBaO+POE/DKPKfT937LDt2QASirI5dRDAbcPTE
 mgzy2rOZgeCHdz0SGJy+0Ui51ooKUg8rLRuDWZGtrRXuiJN0Xs/rDyZl+dHNzMOmPjgJ1y
 eZIiRdOwh9rqpZRDgHK8pbsNOBQGr/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669801840;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDWFOFxjPNlMAJGWMkiRsVGUeuuisjQs0l0/WicaIVg=;
 b=5JSRaJYAV3W/tunPfpWnOJLEOlRD0eIgwghuCSCVKn5VFnWS358EO8MBXTk5pDqEmqmSyf
 jHuDLL+4jFoHhsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A25313A70;
 Wed, 30 Nov 2022 09:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id puRfA3Anh2OsawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 30 Nov 2022 09:50:40 +0000
Date: Wed, 30 Nov 2022 10:50:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Message-ID: <Y4cnbaAtMAtw3IWC@pevik>
References: <87r0xmt3ts.fsf@suse.de> <20221130070500.28664-1-akumar@suse.de>
 <Y4cZxK/SqTtpQb07@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4cZxK/SqTtpQb07@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] statvfs01: Convert to new LTP API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > +static struct tst_test test = {
> > +	.test_all = run,
> > +	.setup = setup,
> > +	.needs_root = 1,
> > +	.mount_device = 1,
> > +	.mntpoint = MNT_POINT,
> > +	.all_filesystems = 1,
> > +	.skip_filesystems = (const char *const[]) {
> > +		"vfat",
> > +		"exfat",
> I was looking what's wrong with vfat and exfat.
> statvfs.f_namemax returns 1530, which is obviously too long, thus valid_fname
> obviously returns ENAMETOOLONG (36). Tested on 6.1.0-rc6-1.g4c01546-default.
> I wonder why, isn't that a bug?

To reply myself, both glibc and musl defines:
statvfs->f_namemax = statfs->f_namelen;

TL;DR: 6 * 255 = 1530 due names being in UTF-8:

Therefore looking into kernel sources for statfs->f_namelen:

include/linux/nls.h
#define NLS_MAX_CHARSET_SIZE 6 /* for UTF-8 */

=== exfat ===
exfat/exfat_raw.h
#define EXFAT_MAX_FILE_LEN 255

exfat/super.c
static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
{
	...
    /* Unicode utf16 255 characters */
    buf->f_namelen = EXFAT_MAX_FILE_LEN * NLS_MAX_CHARSET_SIZE;

=== vfat ===
include/uapi/linux/msdos_fs.h
#define FAT_LFN_LEN 255     /* maximum long name length */

fat/inode.c
static int fat_statfs(struct dentry *dentry, struct kstatfs *buf)
{
	...
    buf->f_namelen =
        (sbi->options.isvfat ? FAT_LFN_LEN : 12) * NLS_MAX_CHARSET_SIZE;

=> i.e. for vfat without long filename support it'd be 72.

How about
1) don't skip exfat and vfat but just skip creating file with valid name? or

2) Add #define NLS_MAX_CHARSET_SIZE 6 and for vfat and exfat calculate
length as: buf.f_namemax / NLS_MAX_CHARSET_SIZE - 1 ?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
