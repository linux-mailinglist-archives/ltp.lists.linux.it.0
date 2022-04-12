Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 007254FD326
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Apr 2022 10:58:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B51153CA559
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Apr 2022 10:58:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C61F3C8C82
 for <ltp@lists.linux.it>; Tue, 12 Apr 2022 10:58:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5BF66600219
 for <ltp@lists.linux.it>; Tue, 12 Apr 2022 10:58:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D2AC210E3;
 Tue, 12 Apr 2022 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649753910;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hf4yPGRkEYaUNEXTHDtZVm4wDGg6PALO7kboTKerIk=;
 b=hAXz0GWp+rqdSIY4hIQoXJ+Nffxw3hXMPoXYsv6r79kuZLLD1PnEQaJuGqK4Vr+gG3WAGL
 LC3iKv6veZoJnkFf0RhgwoHZrU/oFqoa7XK7OUkjPl6tj4ky3fjMyM+sl4a8jIzqEJ2wev
 zMpsUOYioU1bBhl2qYvmj8ZX26mKOco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649753910;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hf4yPGRkEYaUNEXTHDtZVm4wDGg6PALO7kboTKerIk=;
 b=SpVVDC89Na5p3OdiCdrn1Hkr38IFjGOuQwr4B5KOrnYmomUvPXK1dprkLwKKOq76w2xDsJ
 4ehhJ7w9NjhQ7vBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AEAF13780;
 Tue, 12 Apr 2022 08:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BpWVCDY/VWLeIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 12 Apr 2022 08:58:30 +0000
Date: Tue, 12 Apr 2022 10:58:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YlU/NFQxrHOHx4nd@pevik>
References: <20220329074440.26214-1-rpalethorpe@suse.com>
 <20220329074440.26214-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329074440.26214-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] cgroups: Add first IO controller test
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

Hi Richie,

LGTM, just please remove needs_device as not needed.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +static void setup(void)
> +{
> +	char buf[PATH_MAX] = { 0 };
> +	char *path = SAFE_GETCWD(buf, PATH_MAX - sizeof("mnt") - 1);
> +	struct stat st;
> +
> +	strcpy(path + strlen(path), "/mnt");
> +
> +	tst_stat_mount_dev(path, &st);
> +	dev_major = major(st.st_rdev);
> +	dev_minor = minor(st.st_rdev);
If we ever support test setup run inside do_setup() (i.e. setup function which
would be run just once - before for_each_variant(), for_each_filesystem() and
fork_testrun()), this test would have use case for it (I suppose more tests
which use .all_filesystems). Because tst_stat_mount_dev() could be run just for
first filesystem. But that's not related to the testcase.

Kind regards,
Petr

> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.needs_device = 1,
> +	.mntpoint = "mnt",
> +	.mount_device = 1,
> +	.all_filesystems = 1,
> +	.skip_filesystems = (const char *const[]){ "ntfs", "tmpfs", NULL },
> +	.needs_cgroup_ver = TST_CG_V2,
> +	.needs_cgroup_ctrls = (const char *const[]){ "io", NULL },
> +};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
