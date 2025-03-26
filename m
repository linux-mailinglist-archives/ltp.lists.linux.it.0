Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0AA71827
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Mar 2025 15:12:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74C023C9AAD
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Mar 2025 15:12:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00C953C075B
 for <ltp@lists.linux.it>; Wed, 26 Mar 2025 15:12:49 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.dev (client-ip=95.215.58.188; helo=out-188.mta1.migadu.com;
 envelope-from=kent.overstreet@linux.dev; receiver=lists.linux.it)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E0AD600666
 for <ltp@lists.linux.it>; Wed, 26 Mar 2025 15:12:47 +0100 (CET)
Date: Wed, 26 Mar 2025 10:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1742998367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7Z4oJSARPv0B7zdpMmeQFMh9VQkOtH2iYeuikkNnHQ=;
 b=czkLKIsjYmOVuyhIpiMVteu0OYrR9jwyE0t8brSAV4Tj9ht8F0LGL4w1Pgo2upJw8Wb0G+
 JI4q+H5u0yGt5RkhVu4prvy1eA+8F/go/saIHaNaNd0HsPa3eyUDHXgoXT1GCYf2M8tf6r
 pZ+YTpENJYyvnBQ5oM7fIIFwytHtLuM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <7ry7netcdqchal5pyoa5qdiris5klyxg6pqnz3qj6toodfgyuw@zder35svbr7v>
References: <20250326-fix_ioctl_ficlone03_32bit_bcachefs-v1-1-554a0315ebf5@suse.com>
 <20250326134749.GA45449@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326134749.GA45449@pevik>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ioctl_ficlone03: fix capabilities on immutable
 files
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
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Mar 26, 2025 at 02:47:49PM +0100, Petr Vorel wrote:
> Hi all,
> 
> [ Cc Kent and other filesystem folks to be sure we don't hide a bug ]

I'm missing context here, and the original thread doesn't seem to be on
lore?

> 
> > From: Andrea Cervesato <andrea.cervesato@suse.com>
> 
> > Make sure that capabilities requirements are satisfied when accessing
> > immutable files. On OpenSUSE Tumbleweed 32bit bcachefs fails with the
> > following error due to missing capabilities:
> 
> > tst_test.c:1833: TINFO: === Testing on bcachefs ===
> > ..
> > ioctl_ficlone03.c:74: TBROK: ioctl .. failed: ENOTTY (25)
> > ioctl_ficlone03.c:89: TWARN: ioctl ..  failed: ENOTTY (25)
> > ioctl_ficlone03.c:91: TWARN: ioctl ..  failed: ENOTTY (25)
> > ioctl_ficlone03.c:98: TWARN: close(-1) failed: EBADF (9)
> 
> > Introduce CAP_LINUX_IMMUTABLE capability to make sure that test won't
> > fail on other systems as well.
> 
> > Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> > ---
> >  testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> > diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c b/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
> > index 6a9d270d9fb56f3a263f0aed976f62c4576e6a5f..6716423d9c96d9fc1d433f28e0ae1511b912ae2c 100644
> > --- a/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
> > +++ b/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c
> > @@ -122,5 +122,9 @@ static struct tst_test test = {
> >  	.bufs = (struct tst_buffers []) {
> >  		{&clone_range, .size = sizeof(struct file_clone_range)},
> >  		{},
> > -	}
> > +	},
> > +	.caps = (struct tst_cap []) {
> > +		TST_CAP(TST_CAP_REQ, CAP_LINUX_IMMUTABLE),
> > +		{}
> > +	},
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> LGTM, obviously it is CAP_LINUX_IMMUTABLE related.
> 
> This looks like fs/bcachefs/fs-ioctl.c
> 
> static int bch2_inode_flags_set(struct btree_trans *trans,
> 				struct bch_inode_info *inode,
> 				struct bch_inode_unpacked *bi,
> 				void *p)
> {
> 	...
> 	if (((newflags ^ oldflags) & (BCH_INODE_append|BCH_INODE_immutable)) &&
> 	    !capable(CAP_LINUX_IMMUTABLE))
> 		return -EPERM;
> 
> 
> We don't test on vfat and exfat. If I try to do it fail the same way (bcachefs,
> fat, exfat and ocfs2 use custom handler for FAT_IOCTL_SET_ATTRIBUTES).
> 
> I wonder why it does not fail for generic VFS fs/ioctl.c used by Btrfs and XFS:
> 
> /*
>  * Generic function to check FS_IOC_FSSETXATTR/FS_IOC_SETFLAGS values and reject
>  * any invalid configurations.
>  *
>  * Note: must be called with inode lock held.
>  */
> static int fileattr_set_prepare(struct inode *inode,
> 			      const struct fileattr *old_ma,
> 			      struct fileattr *fa)
> {
> 	int err;
> 
> 	/*
> 	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
> 	 * the relevant capability.
> 	 */
> 	if ((fa->flags ^ old_ma->flags) & (FS_APPEND_FL | FS_IMMUTABLE_FL) &&
> 	    !capable(CAP_LINUX_IMMUTABLE))
> 		return -EPERM;
> 
> 
> Kind regards,
> Petr
> 
> >  };
> 
> > ---
> > base-commit: 753bd13472d4be44eb70ff183b007fe9c5fffa07
> > change-id: 20250326-fix_ioctl_ficlone03_32bit_bcachefs-2ec15bd6c0c6
> 
> > Best regards,

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
