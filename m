Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168A509BDF
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Apr 2022 11:14:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 260ED3CA6CA
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Apr 2022 11:14:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF7A63CA6AC
 for <ltp@lists.linux.it>; Thu, 21 Apr 2022 11:14:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6374A200ACF
 for <ltp@lists.linux.it>; Thu, 21 Apr 2022 11:14:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9FDC121115;
 Thu, 21 Apr 2022 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650532443;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R13EgPPfx6f6Y5Ctb8qBTbsc4hqGoHu2aHnzhLBfRYE=;
 b=vWgQgPh++um34nzI1OSrjJTDY6Wr8QXZUa8xFT3Z9sigz6+kPvx4YCqG/NCCjuJ6QQp+6F
 fbz8aHoT+HRtXhQf9FkSxUOQJ7u3zroKMuxldacj2XeKoFrHAc8QoXXOJ8XhdGe0hB17aV
 S0k6K2Pl47ng6VJDILOgS8rcVeNR1KY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650532443;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R13EgPPfx6f6Y5Ctb8qBTbsc4hqGoHu2aHnzhLBfRYE=;
 b=ZjTalJeSi/cy3oIPivqTbTI34FsxBFqA3SGIL2fHNuf16S44EPcWKl7oWB0iv89Dgj1Tw2
 WQAuOc0SyVJ0x7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A0D913446;
 Thu, 21 Apr 2022 09:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id StnUBlsgYWKMPgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 21 Apr 2022 09:14:03 +0000
Date: Thu, 21 Apr 2022 11:14:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YmEgWnz8Sr1jiYPT@pevik>
References: <20220420102926.866-1-chenhx.fnst@cn.fujitsu.com>
 <YmBwWqS0GEuwnb/d@pevik> <YmEgVS3DBARBkYOx@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmEgVS3DBARBkYOx@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mount_setattr01: Add basic functional
 test
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
Cc: ltp@lists.linux.it, Chen Hanxiao <chenhx.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > +struct mount_attr {
> > > +	uint64_t attr_set;
> > > +	uint64_t attr_clr;
> > > +	uint64_t propagation;
> > > +	uint64_t userns_fd;
> > > +};
> > Interesting enough: in kernel tools/testing/selftests/mount_setattr/mount_setattr_test.c
> > defines it as __u64 (IMHO should be really uint64_t as that test is userspace as
> > Cyril pointed out) but real kernel code in fs/namespace.c happily uses "unsigned
> > int" :).

> You are just confused by the fact that there are two different
> structures there is mount_attr and mount_kattr, the mount_setattr()
> syscall gets the mount_attr from userspace and then fills in mount_kattr
> based on that. See the function build_mount_kattr() in fs/namespace.c

> I guess that this is simply done so that there is enough space for flags
> to be added in the future without a need to change the structure.

Ah, thx for info.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
