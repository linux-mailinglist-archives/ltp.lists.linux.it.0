Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9483F77D3
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 16:54:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 205663C9DA4
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 16:54:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D69793C2F5C
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 16:54:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 69BE76006E0
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 16:54:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B19BF2011E;
 Wed, 25 Aug 2021 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629903269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRtQuPU2nvt+P4rjhhhzyzyP4upfUTxBdzK9oi5cV9A=;
 b=XWuQVK44lTdPTyn5/Atnc5W6PfeyyBC66dFRtaOinQMIWYfGXn1vmdHbSj+a71UwyiSfke
 R8uWp85fV0P5820inogWk04LS6Dx3liUToXetliVoRd4x7aCx9ROtWOfzuluFfs+eg4q91
 5Xs6Ve+dz8FmeTpu3/P3Rw51YMNAZwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629903269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRtQuPU2nvt+P4rjhhhzyzyP4upfUTxBdzK9oi5cV9A=;
 b=SuudqKii3xocVkk5dM5+Yn7AJEryZuWrxMfeLPuMk+r7X1SWY2HhylLVv/awlyoFiJzVMo
 aeawEohdtMz5BzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D89813AD7;
 Wed, 25 Aug 2021 14:54:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOXJJaVZJmGMcQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 14:54:29 +0000
Date: Wed, 25 Aug 2021 16:54:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSZZrdiYVCUa2zeI@yuki>
References: <20210825071420.5751-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825071420.5751-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: TST_MNTPOINT should be full path
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Document changed behavior in 205a43dfb ("Make argument to tst_umount an
> absolute path").
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/shell-test-api.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
> index ecdbe9e6a..afc01dd01 100644
> --- a/doc/shell-test-api.txt
> +++ b/doc/shell-test-api.txt
> @@ -515,8 +515,8 @@ The 'tst_mount' mounts '$TST_DEVICE' of '$TST_FS_TYPE' (optional) to
>  '$TST_MNT_PARAMS'. The '$TST_MNTPOINT' directory is created if it didn't
>  exist prior to the function call.
>  
> -If the path passed (optional, defaults to '$TST_MNTPOINT') to the 'tst_umount' is
> -not mounted (present in '/proc/mounts') it's noop.
> +If the path passed (optional, should be full path, defaults to '$TST_MNTPOINT')
                                  ^          ^
				  must     absolute


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
