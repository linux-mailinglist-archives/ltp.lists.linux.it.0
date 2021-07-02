Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9481E3B9E83
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 11:48:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A4C03C84F9
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 11:48:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4730B3C6E4A
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 11:48:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C2F39200CED
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 11:48:49 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 400DA2006E;
 Fri,  2 Jul 2021 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625219329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXyHLYAfleoc+EPDa/Dyoxec8cJAe2aUQcrAtZoj9bs=;
 b=TAmfg3V3KpJ7b4cLZNOhV8V/Ynn7Gg0ENPjIlwINuGm8DjxNxVBtcc6Rj910oSc56uzrxk
 unL7RDkhr1oKi1CKXFWqvBBh7uHKLKR8e4KlyhRZ9gF7M3FQdgf43lMyVKT6J1v08Ew3BA
 39PhdW5Wvjb8iKFNYID2fLDvxwxHO5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625219329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXyHLYAfleoc+EPDa/Dyoxec8cJAe2aUQcrAtZoj9bs=;
 b=Fs9pbAz5YJUj5n/fFZQuFpRsfX1Mj0TmNtCzQrkF6owKLsqcFRRKDX3PlkHs4gfMwS5UjW
 +8Mr+AQnrJWUprBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2345011CD6;
 Fri,  2 Jul 2021 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625219329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXyHLYAfleoc+EPDa/Dyoxec8cJAe2aUQcrAtZoj9bs=;
 b=TAmfg3V3KpJ7b4cLZNOhV8V/Ynn7Gg0ENPjIlwINuGm8DjxNxVBtcc6Rj910oSc56uzrxk
 unL7RDkhr1oKi1CKXFWqvBBh7uHKLKR8e4KlyhRZ9gF7M3FQdgf43lMyVKT6J1v08Ew3BA
 39PhdW5Wvjb8iKFNYID2fLDvxwxHO5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625219329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXyHLYAfleoc+EPDa/Dyoxec8cJAe2aUQcrAtZoj9bs=;
 b=Fs9pbAz5YJUj5n/fFZQuFpRsfX1Mj0TmNtCzQrkF6owKLsqcFRRKDX3PlkHs4gfMwS5UjW
 +8Mr+AQnrJWUprBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dllRBwHh3mBASwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 02 Jul 2021 09:48:49 +0000
Date: Fri, 2 Jul 2021 11:23:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YN7bAlNkd1xaRj7Z@yuki>
References: <20210701055208.715395-1-liwang@redhat.com>
 <20210701055208.715395-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701055208.715395-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib: mount tmpfs name as ltp-tmpfs
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
> Given a specific name as "ltp-tmpfs" instead of the "/dev/loopX"
> string in order to make "tmpfs" filesystem more evident.
> 
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  lib/tst_test.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 27766fbfd..ab343e593 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -896,19 +896,23 @@ static void prepare_device(void)
>  	}
>  
>  	if (tst_test->mount_device) {
> +		const char *path_name = tdev.dev;
>  		char *mnt_data = tst_test->mnt_data;
>  
>  		if (!strcmp(tdev.fs_type, "tmpfs")) {
>  			tst_test->mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
>  					tst_test->dev_min_size);
> +			tdev.dev = "ltp-tmpfs";
>  		}
>  
>  		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
>  			   tst_test->mnt_flags, tst_test->mnt_data);
>  		mntpoint_mounted = 1;
>  
> -		if (!strcmp(tdev.fs_type, "tmpfs"))
> +		if (!strcmp(tdev.fs_type, "tmpfs")) {
>  			tst_test->mnt_data = mnt_data;
> +			tdev.dev = path_name;

Here as well, do we need to change the tdev.dev?

Can't we just create a function get_device_name(const char *fs_type)
that would return either tdev.dev pointer or pointer to static
"ltp-tmpfs" string based on the fs_type argument?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
