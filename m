Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5AB0573D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jul 2025 11:56:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D71F23CCEA0
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jul 2025 11:56:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 099A93CCE83
 for <ltp@lists.linux.it>; Tue, 15 Jul 2025 11:56:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 85150600CDA
 for <ltp@lists.linux.it>; Tue, 15 Jul 2025 11:56:42 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8739F1F397;
 Tue, 15 Jul 2025 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lhe93ERkfUHZ1oU0fZvq3MltavcwrO53c8W/GTK0vXc=;
 b=h6QOBy8L+aSMzsR2Sbq7mobhCk5jLbAEBJXFt+E7SewOtWUdlapqIV2mdAubQoMlsWsoDZ
 wAQZ9VpNkCaRXqwT0T9lOTjd0C4RPszTelBRwd+psN+9lrL/vg5+MW5jQQbn0iTdQQcT0C
 uti/EkP9F/WqP3if89xxuJ5MzP08+Sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lhe93ERkfUHZ1oU0fZvq3MltavcwrO53c8W/GTK0vXc=;
 b=SZDCJ92wQfaXJbU72bz+HsYZG57O4Xd2duTB9+bY/0N9FCppx49gi0mOQCkml9JvSzPGxO
 A9kTbfxo0d9FaaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lhe93ERkfUHZ1oU0fZvq3MltavcwrO53c8W/GTK0vXc=;
 b=h6QOBy8L+aSMzsR2Sbq7mobhCk5jLbAEBJXFt+E7SewOtWUdlapqIV2mdAubQoMlsWsoDZ
 wAQZ9VpNkCaRXqwT0T9lOTjd0C4RPszTelBRwd+psN+9lrL/vg5+MW5jQQbn0iTdQQcT0C
 uti/EkP9F/WqP3if89xxuJ5MzP08+Sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lhe93ERkfUHZ1oU0fZvq3MltavcwrO53c8W/GTK0vXc=;
 b=SZDCJ92wQfaXJbU72bz+HsYZG57O4Xd2duTB9+bY/0N9FCppx49gi0mOQCkml9JvSzPGxO
 A9kTbfxo0d9FaaAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7362113A68;
 Tue, 15 Jul 2025 09:56:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LUW1Gdkldmh9cAAAD6G6ig
 (envelope-from <akumar@suse.de>); Tue, 15 Jul 2025 09:56:41 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 15 Jul 2025 11:56:40 +0200
Message-ID: <2811499.mvXUDI8C0e@thinkpad>
In-Reply-To: <20250630125509.22775-1-chrubis@suse.cz>
References: <20250630125509.22775-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 CTE_CASE(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.cz:email]
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/statmount{04,05}: Enable on FUSE
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

Hi,

On Monday, June 30, 2025 2:55:09 PM CEST Cyril Hrubis wrote:
> These tests works fine for me fine on NTFS mounted via FUSE on 6.14
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>

Reviewed-by: Avinesh Kumar <akumar@suse.de>

Regards,
Avinesh
> ---
>  testcases/kernel/syscalls/statmount/statmount04.c | 4 ----
>  testcases/kernel/syscalls/statmount/statmount05.c | 4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/statmount/statmount04.c b/testcases/kernel/syscalls/statmount/statmount04.c
> index 7fd4fe8c5..332f6dd4d 100644
> --- a/testcases/kernel/syscalls/statmount/statmount04.c
> +++ b/testcases/kernel/syscalls/statmount/statmount04.c
> @@ -92,10 +92,6 @@ static struct tst_test test = {
>  	.mount_device = 1,
>  	.mntpoint = MNTPOINT,
>  	.all_filesystems = 1,
> -	.skip_filesystems = (const char *const []) {
> -		"fuse",
> -		NULL
> -	},
>  	.bufs = (struct tst_buffers []) {
>  		{&st_mount, .size = sizeof(struct statmount)},
>  		{}
> diff --git a/testcases/kernel/syscalls/statmount/statmount05.c b/testcases/kernel/syscalls/statmount/statmount05.c
> index a517f8212..56a2cb328 100644
> --- a/testcases/kernel/syscalls/statmount/statmount05.c
> +++ b/testcases/kernel/syscalls/statmount/statmount05.c
> @@ -110,10 +110,6 @@ static struct tst_test test = {
>  	.mount_device = 1,
>  	.mntpoint = MNTPOINT,
>  	.all_filesystems = 1,
> -	.skip_filesystems = (const char *const []) {
> -		"fuse",
> -		NULL
> -	},
>  	.bufs = (struct tst_buffers []) {
>  		{&st_mount, .size = SM_SIZE},
>  		{}
> 





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
