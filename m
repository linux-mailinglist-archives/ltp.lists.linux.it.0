Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80E4955BC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jan 2022 22:01:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B87F43C96BF
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jan 2022 22:01:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9BBF3C920D
 for <ltp@lists.linux.it>; Thu, 20 Jan 2022 22:01:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3C521600CE8
 for <ltp@lists.linux.it>; Thu, 20 Jan 2022 22:01:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33C392195F;
 Thu, 20 Jan 2022 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642712506;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UaXDKza4Sh7YIM3Vzo5bFIWT6IENs7PssxfIjC5umQw=;
 b=yywB5zTfYaE/pN5XftHj78h2EijpEUz2xT5plerQTtOJ2qh5xiIEiethu3x/0Df6VruRVi
 2aEoqO009UgkK1FSwwBpfxcNdz6YN4iaHzsFoGDun2ZU63Ugk8QOZLMvny68Vzg5i5gwBE
 D+daUNXBN5ec81kEPxwttaYR2Qw/s2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642712506;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UaXDKza4Sh7YIM3Vzo5bFIWT6IENs7PssxfIjC5umQw=;
 b=CDulFiSjc14GO/F1AdHtEvXx+UAh+0L0JxXOBSVAFb7b/kaGC5Ux+BgF8tgarOPwcxI2SI
 Vrf9ohp2dptbkiBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C474C13EC3;
 Thu, 20 Jan 2022 21:01:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id swaqLLnN6WGaQwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 20 Jan 2022 21:01:45 +0000
Date: Thu, 20 Jan 2022 22:01:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Message-ID: <YenNsuS1gcA9tDe3@pevik>
References: <20220120143727.27057-1-nikita.yushchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120143727.27057-1-nikita.yushchenko@virtuozzo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] rpc_lib.sh: fix portmapper detection in case of
 socket activation
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
Cc: NeilBrown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel@openvz.org,
 Steve Dickson <SteveD@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Nikita,

[ Cc: Steve as user-space maintainer, also Neil and whole linux-nfs ]

> On systemd-based linux hosts, rpcbind service is typically started via
> socket activation, when the first client connects. If no client has
> connected before LTP rpc test starts, rpcbind process will not be
> running at the time of check_portmap_rpcbind() execution, causing
> check_portmap_rpcbind() to report TCONF error.

> Fix that by adding a quiet invocation of 'rpcinfo' before checking for
> rpcbind.

Looks reasonable, but I'd prefer to have confirmation from NFS experts.

> For portmap, similar step is likely not needed, because portmap is used
> only on old systemd and those don't use systemd.

> Signed-off-by: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
> ---
>  testcases/network/rpc/basic_tests/rpc_lib.sh | 6 ++++++
>  1 file changed, 6 insertions(+)

> diff --git a/testcases/network/rpc/basic_tests/rpc_lib.sh b/testcases/network/rpc/basic_tests/rpc_lib.sh
> index c7c868709..e882e41b3 100644
> --- a/testcases/network/rpc/basic_tests/rpc_lib.sh
> +++ b/testcases/network/rpc/basic_tests/rpc_lib.sh
> @@ -8,6 +8,12 @@ check_portmap_rpcbind()
>  	if pgrep portmap > /dev/null; then
>  		PORTMAPPER="portmap"
>  	else
> +		# In case of systemd socket activation, rpcbind could be
> +		# not started until somebody tries to connect to it's socket.
> +		#
> +		# To handle that case properly, run a client now.
> +		rpcinfo >/dev/null 2>&1
nit: Shouldn't we keep stderr? In LTP we put required commands into
$TST_NEEDS_CMDS. It'd be better not require rpcinfo (not a hard dependency),
and thus it'd be better to see "command not found" when rpcinfo missing and test
fails.

Kind regards,
Petr

> +
>  		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
>  			tst_brk TCONF "portmap or rpcbind is not running"
>  	fi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
