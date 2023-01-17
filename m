Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430466D83D
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Jan 2023 09:33:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7EB93CB4B5
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Jan 2023 09:33:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B5183C30B4
 for <ltp@lists.linux.it>; Tue, 17 Jan 2023 09:33:18 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ABA3A200969
 for <ltp@lists.linux.it>; Tue, 17 Jan 2023 09:33:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03B7F3814C;
 Tue, 17 Jan 2023 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1673944397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hCPVWYzYMpsfzEKVIz5jNuWIloev5pS4ojTCQ1ryLc0=;
 b=jqeMlAKRjTGJ1xCXTj0GoguacgZE+/Lfdozadhc0l9nQF6UkdjpBJ3QPIJLWPVGsI32Qj2
 uVDKxGOwduKf7/ogG+BH5fPiE1Z7POHKkNbuon5G/91A3/VKOz5I83QBEv1Es1vMqWlsIk
 YnovC0C9ytHHdrC6XotOyGffVR5sm5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1673944397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hCPVWYzYMpsfzEKVIz5jNuWIloev5pS4ojTCQ1ryLc0=;
 b=te26UeLj8QZJy+Q8OhoN5hl82CoDW6fmmUJXQOXaJ2vibCQTFisqFg3TC61/w1QKjHEnsm
 Tfil2ItS/47P4XBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D28981390C;
 Tue, 17 Jan 2023 08:33:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M2d4MUxdxmOpWAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 17 Jan 2023 08:33:16 +0000
Date: Tue, 17 Jan 2023 09:33:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <Y8ZdSla1SoyThtBj@pevik>
References: <20230117040132.5245-1-wegao@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117040132.5245-1-wegao@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] tst_net.sh: Add more tst_require_cmds check
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

Hi Wei,

> More strict check for ns_xxx etc will help avoid following issue:
> https://github.com/linux-test-project/ltp/issues/991

> Signed-off-by: Wei Gao <wegao@suse.com>
> Suggested-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index ceb45c98d..ec915ad74 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -205,6 +205,7 @@ tst_rhost_run()
>  	sh_cmd="$pre_cmd $cmd $post_cmd"

>  	if [ -n "${TST_USE_NETNS:-}" ]; then
> +		tst_require_cmds ip ns_create ns_exec ns_ifmove
Why this? none of these commands is used here.

>  		use="NETNS"
>  		rcmd="$LTP_NETNS sh -c"
>  	else
> @@ -1006,6 +1007,7 @@ IPV6_RHOST="${IPV6_RHOST:-fd00:1:1:1::1/64}"
>  # tst_net_iface_prefix -h
>  # tst_net_vars -h
>  if [ -z "$_tst_net_parse_variables" ]; then
> +	tst_require_cmds tst_net_ip_prefix
This is correct.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
