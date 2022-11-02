Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CB5615F13
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Nov 2022 10:10:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34CEA3CAD30
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Nov 2022 10:10:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CAB6C3CA9C4
 for <ltp@lists.linux.it>; Wed,  2 Nov 2022 10:10:40 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B0591A0092D
 for <ltp@lists.linux.it>; Wed,  2 Nov 2022 10:10:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFE5C1F8C1;
 Wed,  2 Nov 2022 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1667380238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OB9BvzwK0TLoggOmdB8BLcwLE5zmU1aMEn6zEQMvZe8=;
 b=NntdxfYOVyPDb/2+z1iqHJKPpAaTGYNjrXoIUZXwbs+kam7kbpwCpsL/CULJKevQbTFPXg
 +L203mTbZFWOGWCLB6ffhOG/e8wsdMXFj1tB3Bhlc1VO26IRqL8lFas2Gtj8yvtL7Fwcx5
 7LyQULg0F+miuawJLvSP7ZgcWYr3Zsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1667380238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OB9BvzwK0TLoggOmdB8BLcwLE5zmU1aMEn6zEQMvZe8=;
 b=LygFHTSKWaHJORls+WQRx91b9Pyy6AykYrRjy6uBlnr0XcDv017UZWZDDdrLZPbeaErwwC
 SPFKtBMwLgLvWKBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC631139D3;
 Wed,  2 Nov 2022 09:10:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X5KMNA40YmOqJAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 02 Nov 2022 09:10:38 +0000
Date: Wed, 2 Nov 2022 10:12:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Vitaly Chikunov <vt@altlinux.org>
Message-ID: <Y2I0bNnuxmilC0+o@yuki>
References: <20221101160744.4qb3adfwaf375e6v@altlinux.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101160744.4qb3adfwaf375e6v@altlinux.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] statx01 test failure/bug on i586
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
Cc: LTP List <ltp@lists.linux.it>, "Dmitry V. Levin" <ldv@altlinux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>   statx01.c:98: TPASS: statx(AT_FDCWD, test_file, 0, 0, &buff)
>   statx01.c:105: TPASS: stx_uid(0) is correct
>   statx01.c:111: TPASS: stx_gid(0) is correct
>   statx01.c:117: TPASS: stx_size(256) is correct
>   statx01.c:125: TPASS: stx_mode(33188) is correct
>   statx01.c:131: TPASS: stx_blocks(8) is valid
>   statx01.c:138: TPASS: stx_nlink(1) is correct
>   statx01.c:82: TFAIL: statx.stx_mnt_id(23) is different from mount_id(13820440305888919575) in /proc/self/mountinfo
>   statx01.c:88: TPASS: /proc/9494/fdinfo/3 mnt_id: = 23
>   statx01.c:156: TPASS: statx(AT_FDCWD, mntpoint/blk_dev, 0, 0, &buff)
>   statx01.c:163: TPASS: stx_rdev_major(8) is correct
>   statx01.c:171: TPASS: stx_rdev_minor(1) is correct
> 
> Value "13820440305888919575" hints there may be integer overflow.
> 
> On Tue, Nov 01, 2022 at 06:31:20PM +0300, Dmitry V. Levin wrote:
> > $ grep -Fwn mnt_id testcases/kernel/syscalls/statx/statx01.c
> > 20: * - mnt_id
> > 58:	uint64_t mnt_id;
> > 68:		if (sscanf(line, "%ld %*d %d:%d", &mnt_id, &line_mjr, &line_mnr) != 3)
> > ...
> 
> On 32-bit systems sscanf of %ld would leave higher part of mnt_id
> uninitialized, resulting in false positive test failure.

The scanf format string should be obviously fixed so that it uses PRIu64
for the mnt_id. Will you send a patch?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
