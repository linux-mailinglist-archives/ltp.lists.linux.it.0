Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDDB68F254
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 16:48:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C31793CC170
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 16:48:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14FF13C304A
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 16:48:26 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 25BBC1400184
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 16:48:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B4031F8A6;
 Wed,  8 Feb 2023 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675871305;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FNUHqD67/yrNeSP5t3hFQQRexZZ531MuEGyEsT9G5Z4=;
 b=HRS9dXFwOq4zXUSKaQMXaLl8zz/eZxMjVPLeIeOhExgB0b68wxDadC1BqXXr6n6VVEKqSe
 ZRBh1K0RYloyFicOORytqhPe0hnvZ4GQYfyIXRrfo2Jr3tSrgk/EYF8bukSmZcxht+cGZW
 AmEqvyCZEWhn8Mgn37LyjLiG5oJQtAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675871305;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FNUHqD67/yrNeSP5t3hFQQRexZZ531MuEGyEsT9G5Z4=;
 b=eXdO0iA0G7jhVP2XMqMFWvR/kAFPHF9sptzjWUyiCgh8BIMV+RBZ8Fo2eqVOvMft4QzF28
 nfsKqkY8PMX2zwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35C871358A;
 Wed,  8 Feb 2023 15:48:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ouimC0nE42PbSAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 08 Feb 2023 15:48:25 +0000
Date: Wed, 8 Feb 2023 16:48:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <20230208154823.GD1918@pevik>
References: <20230129115021.25778-1-wegao@suse.com> <Y9pf5075zsuAhznN@pevik>
 <Y+DYmkBnv/NQK8gZ@aa> <Y+Eoqd5+bWPxlpXD@pevik>
 <20230208090148.GA8108@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208090148.GA8108@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] fsconfig: New case cover CVE-2022-0185
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

> On Mon, Feb 06, 2023 at 05:19:53PM +0100, Petr Vorel wrote:
> > Hi Wei,

> > ...
> > > > Hm, there is a kernel fix from 5.17 [1]. But test fails when I run it on 6.2.0-rc5:

> > > > tst_supported_fs_types.c:165: TINFO: Skipping FUSE based ntfs as requested by the test
> > > > tst_supported_fs_types.c:157: TINFO: Skipping tmpfs as requested by the test
> > > > tst_test.c:1634: TINFO: === Testing on ext3 ===
> > > > tst_test.c:1093: TINFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> > > > mke2fs 1.46.5 (30-Dec-2021)
> > > > fsconfig03.c:44: TFAIL: fsconfig(FSCONFIG_SET_STRING) failed: EINVAL (22)

> > > > Isn't it the opposite: we expect to fail, thus TST_EXP_FAIL() should here be
> > > > used?

> > > I have not test on 6.2.0 kernel, i need reproduce this firstly.

> > FYI 6.0.6 is also broken, works on 5.10.46.


> After long investigation i finally get what's happen now since i have
> never touch kernel fs code before :)

> The root caused is cebe85d570cf8 which make udpate initialize of
> ext3_fs_type.
What exactly happen in cebe85d570cf ("ext4: switch to the new mount api")
from v5.17-rc1? This enables fsconfig, thus test *should* be working on >=
v5.17-rc1, right? But it does not.

BTW xfs also uses new mount API 73e5fff98b64 ("xfs: switch to use the new
mount-api") in v5.5-rc1.  Obviously legacy ext2 driver does not use it.

I'd expect fsopen_supported_by_kernel() is enough and no filesystem needs to be
filtered out (at least not real linux filesystems like ext2 or xfs).

> Each file system will initialize a struct file_system_type and ext3 initialize 
> in fs/ext4/super.c(maybe ext3 much same as ext4 so they put in same file).
Yes, ext3 and ext4 share the same code (ext4 driver). This code also servers
ext2 filesystem if CONFIG_EXT4_USE_FOR_EXT2=y (mostly the default), otherwise
there is ext2 driver: CONFIG_EXT2_FS).

Kind regards,
Petr

> This patch add new memeber .init_fs_context in ext3 file_system_type struct and 
> this new member will lead pase function which called by fsconfig change
> from legacy_parse_param to ext4_parse_param(this function will check
> parameter and not allow 0x00)

> ===key change part of cebe85d570cf8===
>  static struct file_system_type ext3_fs_type = {
> -       .owner          = THIS_MODULE,
> -       .name           = "ext3",
> -       .mount          = ext4_mount,
> -       .kill_sb        = kill_block_super,
> -       .fs_flags       = FS_REQUIRES_DEV,
> +       .owner                  = THIS_MODULE,
> +       .name                   = "ext3",
> +       .init_fs_context        = ext4_init_fs_context,  // in this patch init_fs_context start set ext4_init_fs_context
> +       .parameters             = ext4_param_specs,
> +       .kill_sb                = kill_block_super,
> +       .fs_flags               = FS_REQUIRES_DEV,
>  };
> ===key change part of cebe85d570cf8===


> Following logic will decide whether use legacy_init_fs_context base on
> exist of init_fs_context, obviously before patch we have no
> init_fs_context but after patch we have it

> ==function alloc_fs_context== 
>         .....
>         init_fs_context = fc->fs_type->init_fs_context;
>         if (!init_fs_context)
>                 init_fs_context = legacy_init_fs_context;  //before patch cebe85d570cf8, legacy_init_fs_context will be set.
>         ret = init_fs_context(fc);

> ==function alloc_fs_context== 


> ====code example for set parse function used by fsconfig===
> const struct fs_context_operations legacy_fs_context_ops = {
>         .free                   = legacy_fs_context_free,
>         .dup                    = legacy_fs_context_dup,
>         .parse_param            = legacy_parse_param,   
>         .parse_monolithic       = legacy_parse_monolithic,
>         .get_tree               = legacy_get_tree,
>         .reconfigure            = legacy_reconfigure,
> };

> /*
>  * Initialise a legacy context for a filesystem that doesn't support
>  * fs_context.
>  */
> static int legacy_init_fs_context(struct fs_context *fc)
> {
>         fc->fs_private = kzalloc(sizeof(struct legacy_fs_context), GFP_KERNEL_ACCOUNT);
>         if (!fc->fs_private)
>                 return -ENOMEM;
>         fc->ops = &legacy_fs_context_ops;
>         return 0;
> }
> ====code for set parse function used by fsconfig===


> ====final call parse function within fsconfig logic==
> vfs_parse_fs_param
> 145             if (fc->ops->parse_param) {
> 146                     	ret = fc->ops->parse_param(fc, param); //this will call legacy_parse_param or ext4_parse_param                                   
> 147                     if (ret != -ENOPARAM)
> 148                             return ret;
> 149             }
> ====final call parse function within fsconfig logic==



> Just FYI the fs_type real data show in GDB(init_fs_context= 0 in kernel5.x but in kernel 6.x init_fs_context=ext4_parse_param):

> (gdb) p *fs_type
> $4 = {name = 0xffffffff822278e1 "ext3", fs_flags = 1, init_fs_context = 0x0 <fixed_percpu_data>, parameters = 0x0 <fixed_percpu_data>,
>   mount = 0xffffffff812ec510 <ext4_mount>, kill_sb = 0xffffffff811f7220 <kill_block_super>, owner = 0x0 <fixed_percpu_data>,
>   next = 0xffffffff82564600 <ext2_fs_type>, fs_supers = {first = 0x0 <fixed_percpu_data>}, s_lock_key = {<No data fields>},
>   s_umount_key = {<No data fields>}, s_vfs_rename_key = {<No data fields>}, s_writers_key = 0xffffffff825645e8, i_lock_key = {<No data fields>},
>   i_mutex_key = {<No data fields>}, invalidate_lock_key = {<No data fields>}, i_mutex_dir_key = {<No data fields>}}


> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
