Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC387422D
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 22:48:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FB7B3D0B7C
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 22:48:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F65E3C2A69
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 22:48:33 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F3D21200C34
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 22:48:32 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73E0917043;
 Wed,  6 Mar 2024 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1709761711;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srLtQqcAjJTZB/z5Udtpwv8pkFrXUNtX9Je+JWlNHxs=;
 b=JDEb4teZufacUizeJ96QFLeAE3o9yr14N4YCOc800Y3nd9ZpPVAA4/bz5MT5kDFCnSBLud
 3jaYbg/Xq8GRbliWqVbvUnM3WsFniB1lMSqxKVBPSgKwwVKuyXVcUuBcupNxgsO2hVqU4H
 F/a7vBR/NGy1ArAiFzkvuypyNbqfoKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1709761711;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srLtQqcAjJTZB/z5Udtpwv8pkFrXUNtX9Je+JWlNHxs=;
 b=g2OVE3EU6k2yGzVcOksNHeaxtCZhjhCei2M/FGA4u3UdGH6oxX4WlHIZBTVGCh0IrJ+wXG
 NQo7fK08i3BL/SCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1709761711;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srLtQqcAjJTZB/z5Udtpwv8pkFrXUNtX9Je+JWlNHxs=;
 b=JDEb4teZufacUizeJ96QFLeAE3o9yr14N4YCOc800Y3nd9ZpPVAA4/bz5MT5kDFCnSBLud
 3jaYbg/Xq8GRbliWqVbvUnM3WsFniB1lMSqxKVBPSgKwwVKuyXVcUuBcupNxgsO2hVqU4H
 F/a7vBR/NGy1ArAiFzkvuypyNbqfoKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1709761711;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srLtQqcAjJTZB/z5Udtpwv8pkFrXUNtX9Je+JWlNHxs=;
 b=g2OVE3EU6k2yGzVcOksNHeaxtCZhjhCei2M/FGA4u3UdGH6oxX4WlHIZBTVGCh0IrJ+wXG
 NQo7fK08i3BL/SCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C179D13A79;
 Wed,  6 Mar 2024 21:48:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id DaX4Ja7k6GXGTgAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Wed, 06 Mar 2024 21:48:30 +0000
Date: Wed, 6 Mar 2024 22:48:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <20240306214821.GA107948@pevik>
References: <20240121161159.4106646-1-ruansy.fnst@fujitsu.com>
 <20240305212410.18978-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240305212410.18978-1-akumar@suse.de>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.30 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Score: -2.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] getxattr04,
 05: Change to docparse comment and typo fixes
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

Hi Avinesh, Shiyang,

I merged with following improvements below. Thanks!

> +++ b/testcases/kernel/syscalls/getxattr/getxattr04.c
> @@ -4,13 +4,15 @@
>   * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
>   */

> -/*
> +/*\
> + * [Description]
> + *
>   * This is a regression test for the race between getting an existing
>   * xattr and setting/removing a large xattr.  This bug leads to that
>   * getxattr() fails to get an existing xattr and returns ENOATTR in xfs
>   * filesystem.
>   *
> - * Thie bug has been fixed in:
> + * This bug has been fixed in:
>   *
>   * commit 5a93790d4e2df73e30c965ec6e49be82fc3ccfce
>   * Author: Brian Foster <bfoster@redhat.com>
Just single line:
* 5a93790d4e2d ("xfs: remove racy hasattr check from attr ops")

> diff --git a/testcases/kernel/syscalls/getxattr/getxattr05.c b/testcases/kernel/syscalls/getxattr/getxattr05.c
> index f12e2f813..069e2b3f9 100644
> --- a/testcases/kernel/syscalls/getxattr/getxattr05.c
> +++ b/testcases/kernel/syscalls/getxattr/getxattr05.c
> @@ -4,12 +4,14 @@
>   * Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
>   */

> -/*
> - * Description:
> - * 1) Witout a user namespace, getxattr(2) should get same data when
> - *    acquiring the value of system.posix_acl_access twice.
> - * 2) With/Without mapped root UID in a user namespaces, getxattr(2) should
> - *    get same data when acquiring the value of system.posix_acl_access twice.
> +/*\
> + * [Description]
> + *
> + * This test verifies that:
Here still needs to be empty line, I haven't managed to send v2 of the change
[1] which would allow to format it without empty line.

> + * - Without a user namespace, getxattr(2) should get same data when
> + *   acquiring the value of system.posix_acl_access twice.
> + * - With/Without mapped root UID in a user namespaces, getxattr(2) should
> + *   get same data when acquiring the value of system.posix_acl_access twice.
>   *
>   * This issue included by getxattr05 has been fixed in kernel:
>   * '82c9a927bc5d ("getxattr: use correct xattr length")'
no quotes:
    * 82c9a927bc5d ("getxattr: use correct xattr length")

+ I dared to use a 12 chars hash in "linux-git" (originally 11).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=388930&state=*

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
