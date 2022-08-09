Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E239258D316
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Aug 2022 07:11:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B8E53C9453
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Aug 2022 07:11:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 291FE3C6D2E
 for <ltp@lists.linux.it>; Tue,  9 Aug 2022 07:11:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 237871A003F4
 for <ltp@lists.linux.it>; Tue,  9 Aug 2022 07:11:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F20F42025E;
 Tue,  9 Aug 2022 05:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660021888;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDNFpNRBlJa/QvWQRI2W54+2IWDnB4rEU2LfTu9h66s=;
 b=oGgz2TVUDEODJGw4IWXukV4ecSbOHd+4f+6wQK3x5p1OGHdX4cZgwtzsbk0sctCBCVrr10
 FuyksymA62/JwSQKxV9hDxPm5GBkt9bEWQBzx5TSZ4p7tZA3Ippont19N7pyDbOXnH0WOu
 dOmD8bJ4UghpNt33LmF0C5FwGDILipE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660021888;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDNFpNRBlJa/QvWQRI2W54+2IWDnB4rEU2LfTu9h66s=;
 b=b3JIQbfjXZbImo5u+rKXv1HA2K2+mpswOy6Z9BJcvOvnKHBK7FhBjlGwSDIBbRsB4cTT4e
 JU9P1It1u79wlLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB06B13A9D;
 Tue,  9 Aug 2022 05:11:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7jESJIDs8WKBQgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 09 Aug 2022 05:11:28 +0000
Date: Tue, 9 Aug 2022 07:11:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Dylan Jhong <dylan@andestech.com>
Message-ID: <YvHsfjWhgaqlzw+u@pevik>
References: <20220808110416.2244071-1-dylan@andestech.com>
 <YvEHNbOm0dSSmjoI@pevik> <YvHNHt87WPxg7faE@atcsi01>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvHNHt87WPxg7faE@atcsi01>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs_bind: Fix incorrect mount option
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
Cc: "x5710999x@gmail.com" <x5710999x@gmail.com>,
 "Alan Quey-Liang Kao\(\(\(\(\(\(\(\(\(\(\)" <alankao@andestech.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Dylan,

> Hi Petr:

> Thanks for the review.

> >>>>> I wonder why test didn't failed (at least on SUT I tested it).
> Some mount command implementations[*1] use getopt_long() to parse mount 
> options, but getopt_long() seems to treat "--make-share" and "--make-shared"
> as the same option.

> The error I encounter this time is using busybox's mount command[*2], which 
> uses strncasecmp() to parse the argements, It will treat "--make-share" and 
> "--make-shared" as different options.

> According to the manual of mount command, "--make-shared" should be the correct
> option.

> reference:
>     [*1] https://kernel.googlesource.com/pub/scm/utils/util-linux/util-linux/+/stable/v2.13/mount/mount.c#1816
>     [*2] https://github.com/brgl/busybox/blob/master/util-linux/mount.c#L372
>     [*3] https://linux.die.net/man/8/mount

Thanks for info. Please next time include this in the commit message
(useful info, but as I wrote yesterday I already merged your commit).

Kind regards,
Petr

> Best,
> Dylan

> On Mon, Aug 08, 2022 at 08:53:09PM +0800, Petr Vorel wrote:
> > Hi Dylan,

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > I wonder why test didn't failed (at least on SUT I tested it).

> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
