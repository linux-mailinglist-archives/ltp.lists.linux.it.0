Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4B45B880
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Nov 2021 11:40:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24A263C4D65
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Nov 2021 11:40:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 381FC3C0894
 for <ltp@lists.linux.it>; Wed, 24 Nov 2021 11:40:04 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BDE3B601E76
 for <ltp@lists.linux.it>; Wed, 24 Nov 2021 11:40:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04D8721958;
 Wed, 24 Nov 2021 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637750402;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/HHLWuOx/5jB+RRapOoNMKfyTXRaJjW9pkkg8fquSaE=;
 b=gZnKYa+4rcP6Oq4Fs/5nFNZXbQLlrTpoHuEY1/gan6hJA0vY7N8T0owd5Ns5CsId2t6M+D
 1doAaZTDWtbZxOlZI195WnLjMVGf3oXAJtqrrGDitgykI9Ke2SoC5UZEG90eVhhmLBR9Bd
 +DXsdtV4Q0qKT92DHh/2debsNcmYeQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637750402;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/HHLWuOx/5jB+RRapOoNMKfyTXRaJjW9pkkg8fquSaE=;
 b=WYm6kzBgfH2Z+TMpbCcH4igUmF9lca0lksVJMfwOL8Zbk4OvTatOCc1u+wQS36gSlb+MBd
 LTgeLqKCRHbJAMBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C43313F05;
 Wed, 24 Nov 2021 10:40:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u+qZHIEWnmHvagAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 24 Nov 2021 10:40:01 +0000
Date: Wed, 24 Nov 2021 11:39:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, kernel@collabora.com,
 Khazhismel Kumykov <khazhy@google.com>,
 Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.com>,
 Ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Message-ID: <YZ4Wf3d+J36NPMfS@pevik>
References: <20211118235744.802584-1-krisman@collabora.com>
 <CAOQ4uxhbDgdZZ0qphWg1vnW4ZoAkUxcQp631yZO8W49AE18W9g@mail.gmail.com>
 <8735nsuepi.fsf@collabora.com> <YZtLDXW01Cz0BfPU@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZtLDXW01Cz0BfPU@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/9] Test the new fanotify FAN_FS_ERROR event
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

<snip>
> > Hi Amir,

> > I have pushed v4 to :

> > https://gitlab.collabora.com/krisman/ltp.git -b fan-fs-error_v4

> FYI I've rebased it on my fix 3b2ea2e00 ("configure.ac: Add struct
> fanotify_event_info_pidfd check")

> https://github.com/linux-test-project/ltp.git -b gertazi/fanotify21.v4.fixes

FYI I removed branch from official LTP repository and put it to my fork
https://github.com/pevik/ltp.git -b fan-fs-error_v4.fixes

Kind regards,
Petr

> diff to krisman/fan-fs-error_v4:

> diff --git configure.ac configure.ac
> index a9dc25249..d25183368 100644
> --- configure.ac
> +++ configure.ac
> @@ -160,8 +160,8 @@ AC_CHECK_MEMBERS([struct utsname.domainname],,,[
>  AC_CHECK_TYPES([enum kcmp_type],,,[#include <linux/kcmp.h>])
>  AC_CHECK_TYPES([struct acct_v3],,,[#include <sys/acct.h>])
>  AC_CHECK_TYPES([struct af_alg_iv, struct sockaddr_alg],,,[# include <linux/if_alg.h>])
> -AC_CHECK_TYPES([struct fanotify_event_info_fid, struct fanotify_event_info_header,
> -		struct fanotify_event_info_error],[],[],[#include <sys/fanotify.h>])
> +AC_CHECK_TYPES([struct fanotify_event_info_fid, struct fanotify_event_info_error,
> +		struct fanotify_event_info_header, struct fanotify_event_info_pidfd],,,[#include <sys/fanotify.h>])
>  AC_CHECK_TYPES([struct file_dedupe_range],,,[#include <linux/fs.h>])

>  AC_CHECK_TYPES([struct file_handle],,,[

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
