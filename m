Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B08D2746
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2024 23:50:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B16B3CE3C4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2024 23:50:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CE2A3CE3C4
 for <ltp@lists.linux.it>; Tue, 28 May 2024 23:50:35 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=neilb@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D8AFD1000A10
 for <ltp@lists.linux.it>; Tue, 28 May 2024 23:50:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51F7320460;
 Tue, 28 May 2024 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1716933033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MPbjQO4/6DjZZK/gT9uFBpU9IheTq5ys6Wrm1gmG4o=;
 b=u2xS2ONrFBb9/z6Z+3QfHCI+zEkvCTQYOClV1u0TM0G7VVSyW9jNSelbWpuksd/8TtTu07
 D8MlCzFyXdZ/mhSFOctR+412xBBpSsDKzodyJYoPDwSDX9EmXrr6H4UOfp3nuZ3n0bUxli
 8yMygQ8PPlIMVYqlUnH21sd09uyjuyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1716933033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MPbjQO4/6DjZZK/gT9uFBpU9IheTq5ys6Wrm1gmG4o=;
 b=ebzOKaGxa3oj+7t8lgAVz60b4rjMShia+ZVdbTEmuWAnjs9Ty/UkKTkvhfKryQTQ3V3eO7
 0QBC/ZqUKbxgEqDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u2xS2ONr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ebzOKaGx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1716933033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MPbjQO4/6DjZZK/gT9uFBpU9IheTq5ys6Wrm1gmG4o=;
 b=u2xS2ONrFBb9/z6Z+3QfHCI+zEkvCTQYOClV1u0TM0G7VVSyW9jNSelbWpuksd/8TtTu07
 D8MlCzFyXdZ/mhSFOctR+412xBBpSsDKzodyJYoPDwSDX9EmXrr6H4UOfp3nuZ3n0bUxli
 8yMygQ8PPlIMVYqlUnH21sd09uyjuyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1716933033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MPbjQO4/6DjZZK/gT9uFBpU9IheTq5ys6Wrm1gmG4o=;
 b=ebzOKaGxa3oj+7t8lgAVz60b4rjMShia+ZVdbTEmuWAnjs9Ty/UkKTkvhfKryQTQ3V3eO7
 0QBC/ZqUKbxgEqDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1737D13A5D;
 Tue, 28 May 2024 21:50:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CcdKK6ZRVmYxGAAAD6G6ig
 (envelope-from <neilb@suse.de>); Tue, 28 May 2024 21:50:30 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "James Clark" <james.clark@arm.com>
In-reply-to: <20240528105249.69200-1-james.clark@arm.com>
References: <171134496555.13576.1334297096866165638@noble.neil.brown.name>,
 <20240528105249.69200-1-james.clark@arm.com>
Date: Wed, 29 May 2024 07:50:26 +1000
Message-id: <171693302629.27191.6082161442961829667@noble.neil.brown.name>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 51F7320460
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] NFS: add atomic_open for NFSv3 to handle O_TRUNC
 correctly.
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
Cc: Aishwarya.TCV@arm.com, linux-nfs@vger.kernel.org, broonie@kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 28 May 2024, James Clark wrote:
> On Mon, 25 Mar 2024, NeilBrown wrote:
> > With two clients, each with NFSv3 mounts of the same directory, the sequence:
> > 
> >    client1            client2
> >   ls -l afile
> >                       echo hello there > afile
> >   echo HELLO > afile
> >   cat afile
> > 
> > will show
> >    HELLO
> >    there
> > 
> > because the O_TRUNC requested in the final 'echo' doesn't take effect.
> > This is because the "Negative dentry, just create a file" section in
> > lookup_open() assumes that the file *does* get created since the dentry
> > was negative, so it sets FMODE_CREATED, and this causes do_open() to
> > clear O_TRUNC and so the file doesn't get truncated.
> > 
> > Even mounting with -o lookupcache=none does not help as
> > nfs_neg_need_reval() always returns false if LOOKUP_CREATE is set.
> > 
> > This patch fixes the problem by providing an atomic_open inode operation
> > for NFSv3 (and v2).  The code is largely the code from the branch in
> > lookup_open() when atomic_open is not provided.  The significant change
> > is that the O_TRUNC flag is passed a new nfs_do_create() which add
> > 'trunc' handling to nfs_create().
> > 
> > With this change we also optimise away an unnecessary LOOKUP before the
> > file is created.
> > 
> 
> Hi Neil,
> 
> There's an LTP test failure that Aishwarya bisected back to this patch.
> Possibly because the new function doesn't check the max filename length
> before hitting this warning in encode_filename3():
> 
>   WARN_ON_ONCE(length > NFS3_MAXNAMLEN);

Thanks.  I know about that.  I fixed it in our SUSE kernels but I
thought I was being ignored by upstream as I never got any reply at all
so I never got around to resubmitting upstream.  I'll post a patch.

Thanks,
NeilBrown


> 
> I saw some old commit message that mentioned callers should be
> checking it, so it seems like a plausible bisect because the test is
> testing invalid name lengths. But I didn't look in any more detail than
> that.
> 
> statvfs01 and inotify02 tests are failing. The full output is at the
> end.
> 
> Thanks
> James
> 
> statvfs01.c:32: TPASS: statvfs(TEST_PATH, &buf) p<4>[ 7735.368939] ------------[ cut here ]------------
> assed
> <4>[ 7735.376605] WARNING: CPU: 3 PID: 387286 at fs/nfs/nfs3xdr.c:188 encode_filename3+0x44/0x4c
> statvfs01.c:44: TPASS: creat(vali<4>[ 7735.385773] Modules linked in: quota_v2 quota_tree dummy veth overlay binfmt_misc btrfs blake2b_generic libcrc32c xor xor_neon raid6_pq zstd_compress fuse drm backlight ip_tables x_tables ipv6 crct10dif_ce onboard_usb_dev smsc [last unloaded: binfmt_misc]
> d_fname, 0444) returned fd 3<4>[ 7735.411537] CPU: 3 PID: 387286 Comm: statvfs01 Not tainted 6.9.0-next-20240523 #1
> 
> <4>[ 7735.421719] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, BIOS EDK II Jan 30 2024
> <4>[ 7735.432948] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> <4>[ 7735.440191] pc : encode_filename3+0x44/0x4c
> <4>[ 7735.444650] lr : nfs3_xdr_enc_create3args+0x44/0xf8
> <4>[ 7735.449807] sp : ffff800088703800
> <4>[ 7735.453386] x29: ffff800088703800 x28: ffff8000826b6388 x27: ffff800088703c70
> <4>[ 7735.460812] x26: ffff00082752f780 x25: 0000000000000001 x24: 0000000000440040
> <4>[ 7735.468238] x23: 0000000000000100 x22: ffff000827520010 x21: ffff00082712b600
> <4>[ 7735.475663] x20: ffff000827520010 x19: 0000000000000100 x18: 0000000000000000
> <4>[ 7735.483088] x17: 0000000000000000 x16: 0000000000000000 x15: 6262626262626262
> <4>[ 7735.490512] x14: 6262626262626262 x13: 14269a2303320025 x12: 43956040606e0dbf
> <4>[ 7735.497937] x11: ce4b9be95ac6e1de x10: 00000000017009cd x9 : 0332002543956040
> <4>[ 7735.505362] x8 : 606e0dbfce4b9be9 x7 : 5ac6e1de00000000 x6 : 017009cd01070001
> <4>[ 7735.512786] x5 : ffff00082589b87c x4 : ffff00082410216e x3 : ffff800080445400
> <4>[ 7735.520211] x2 : 0000000000000100 x1 : ffff000827520010 x0 : ffff8000887038b8
> <4>[ 7735.527636] Call trace:
> <4>[ 7735.530345]  encode_filename3+0x44/0x4c
> <4>[ 7735.534457]  nfs3_xdr_enc_create3args+0x44/0xf8
> <4>[ 7735.539264]  rpcauth_wrap_req_encode+0x1c/0x2c
> <4>[ 7735.543986]  rpcauth_wrap_req+0x20/0x2c
> <4>[ 7735.548097]  call_encode+0x114/0x294
> <4>[ 7735.551947]  __rpc_execute+0xb0/0x3a0
> <4>[ 7735.555883]  rpc_execute+0x9c/0xbc
> <4>[ 7735.559557]  rpc_run_task+0x128/0x1cc
> <4>[ 7735.563494]  rpc_call_sync+0x58/0xb8
> <4>[ 7735.567343]  nfs3_rpc_wrapper+0x3c/0x84
> <4>[ 7735.571454]  nfs3_proc_create+0xb0/0x2cc
> <4>[ 7735.575651]  nfs_atomic_open_v23+0xfc/0x14c
> <4>[ 7735.580107]  path_openat+0x64c/0xee0
> <4>[ 7735.583957]  do_filp_open+0x80/0x12c
> <4>[ 7735.587806]  do_sys_openat2+0xb4/0xe8
> <4>[ 7735.591739]  __arm64_sys_openat+0x64/0xac
> <4>[ 7735.596021]  invoke_syscall+0x48/0x118
> <4>[ 7735.600047]  el0_svc_common.constprop.0+0x40/0xe0
> <4>[ 7735.605029]  do_el0_svc+0x1c/0x28
> <4>[ 7735.608617]  el0_svc+0x34/0xdc
> <4>[ 7735.611944]  el0t_64_sync_handler+0xc0/0xc4
> <4>[ 7735.616404]  el0t_64_sync+0x190/0x194
> <4>[ 7735.620339] ---[ end trace 0000000000000000 ]---
> statvfs01.c:48: TFAIL: creat(toolong_fname, 0444) expected ENAMETOOLONG: EIO (5)
> <6>[ 7735.689265] EXT4-fs (loop0): unmounting filesystem 99c92af1-0341-4dd6-920c-bc7461170ff2.
> tst_test.c:1650: TINFO: === Testing on ext3 ===
> tst_test.c:1105: TINFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.46.2 (28-Feb-2021)
> tst_test.c:1119: TINFO: Mounting /<6>[ 7737.794577] EXT4-fs (loop0): mounting ext3 file system using the ext4 subsystem
> dev/loop0 to /ltp-tmp/ltp-aTUvKrI1Ui/LTP_stakwdpzv/mntpoint fstyp=ext3 flags=0
> <6>[ 7737.818721] EXT4-fs (loop0): mounted filesystem 91699e00-ff2a-49b3-8159-38ae80bdd87d r/w with ordered data mode. Quota mode: none.
> <4>[ 7737.830824] ext3 filesystem being mounted at /ltp-tmp/ltp-aTUvKrI1Ui/LTP_stakwdpzv/mntpoint supports timestamps until 2038-01-19 (0x7fffffff)
> statvfs01.c:32: TPASS: statvfs(TEST_PATH, &buf) passed
> statvfs01.c:44: TPASS: creat(valid_fname, 0444) returned fd 3
> statvfs01.c:48: TFAIL: creat(toolong_fname, 0444) expected ENAMETOOLON<6>[ 7737.861118] EXT4-fs (loop0): unmounting filesystem 91699e00-ff2a-49b3-8159-38ae80bdd87d.
> G: EIO (5)
> tst_test.c:1650: TINFO: === Testing on ext4 ===
> tst_test.c:1105: TINFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.46.2 (28-Feb-2021)
> tst_test.c:1119: TINFO: Mounting /dev/loop0 to /ltp-tmp/ltp-aTUvKrI1Ui/LTP_stakwdp<6>[ 7738.791447] EXT4-fs (loop0): mounted filesystem fe0ff94a-6c04-4158-9b0e-069ac82b6c8d r/w with ordered data mode. Quota mode: none.
> zv/mntpoint fstyp=ext4 flags=0
> <4>[ 7738.805833] ext4 filesystem being mounted at /ltp-tmp/ltp-aTUvKrI1Ui/LTP_stakwdpzv/mntpoint supports timestamps until 2038-01-19 (0x7fffffff)
> statvfs01.c:32: TPASS: statvfs(TEST_PATH, &buf) passed
> statvfs01.c:44: TPASS: creat(valid_fname, 0444) returned fd 3
> statvfs01.c:48: TFAIL: creat(toolong_fname, 0<6>[ 7738.837563] EXT4-fs (loop0): unmounting filesystem fe0ff94a-6c04-4158-9b0e-069ac82b6c8d.
> 444) expected ENAMETOOLONG: EIO (5)
> tst_test.c:1650: TINFO: === Testing on tmpfs ===
> tst_test.c:1105: TINFO: Skipping mkfs for TMPFS filesystem
> tst_test.c:1086: TINFO: Limiting tmpfs size to 32MB
> tst_test.c:1119: TINFO: Mounting ltp-tmpfs to /ltp-tmp/ltp-aTUvKrI1Ui/LTP_stakwdpzv/mntpoint fstyp=tmpfs flags=0
> statvfs01.c:32: TPASS: statvfs(TEST_PATH, &buf) passed
> statvfs01.c:44: TPASS: creat(valid_fname, 0444) returned fd 3
> statvfs01.c:48: TFAIL: creat(toolong_fname, 0444) expected ENAMETOOLONG: EIO (5)
> Summary:
> passed   8
> failed   4
> 
> inotify02.c:165: TPASS: get event: wd=1 mask=40000004 cookie=0     len=0  name=\"\"
> inotify02.c:181: TFAIL: get event: wd=1 mask=00000020 (expected 100) cookie=0     len=16 name=\"test_file1\" (expected \"test_file1\") 0
> inotify02.c:181: TFAIL: get event: wd=1 mask=00000100 (expected 20) cookie=0     len=16 name=\"test_file1\" (expected \"test_file1\") 0
> inotify02.c:165: TPASS: get event: wd=1 mask=00000008 cookie=0     len=16 name=\"test_file1\"
> inotify02.c:165: TPASS: get event: wd=1 mask=00000040 cookie=5537  len=16 name=\"test_file1\"
> inotify02.c:165: TPASS: get event: wd=1 mask=00000080 cookie=5537  len=16 name=\"test_file2\"
> inotify02.c:165: TPASS: get event: wd=1 mask=00000800 cookie=0     len=0  name=\"\"
> inotify02.c:165: TPASS: get event: wd=1 mask=00000200 cookie=0     len=16 name=\"test_file2\"
> inotify02.c:165: TPASS: get event: wd=1 mask=00000800 cookie=0     len=0  name=\"\"
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
