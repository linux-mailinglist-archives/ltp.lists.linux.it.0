Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0D5091AF
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 22:56:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A05B3CA6BE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Apr 2022 22:56:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D96A3CA63C
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 22:56:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 12A091400BCE
 for <ltp@lists.linux.it>; Wed, 20 Apr 2022 22:56:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 112021F747;
 Wed, 20 Apr 2022 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650488182;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n30vADXsO03HDIoEBiy0aho89nL1t8xWHwovosAnKvQ=;
 b=nEPX23pzfZNHuklbnlh+gEuUx/Jc3Yy9lSXgK7JlRr1sGUqQkp5AAHxBb4RZ86UclkGDxt
 PVGXlX8SwpQNZizMihnQYveMTgMJpQ9mrv4APBu0o+dKTPLOFgOy8wVrJkl6GCY1wV+xg6
 wpm4kvBwI1sNZCBPC3K/kNLDIuQBoMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650488182;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n30vADXsO03HDIoEBiy0aho89nL1t8xWHwovosAnKvQ=;
 b=IBSAA4l3hCvpnsgO9sjl/vB3DlGjwGjyRIts8w543+A+QIKME9J0f0TKXIBQecmye+VZUS
 fuQ6tfVcOCLybyCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA18E13A30;
 Wed, 20 Apr 2022 20:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vm+CL3VzYGK4JwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 20 Apr 2022 20:56:21 +0000
Date: Wed, 20 Apr 2022 22:56:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YmBzdLLeX3kNfbvu@pevik>
References: <20220420114720.1463473-1-liwang@redhat.com>
 <20220420114720.1463473-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420114720.1463473-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] mkswap01: wait for the triggered events to
 complete
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/commands/mkswap/mkswap01.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mkswap/mkswap01.sh
> index f6494f6e3..cb3563b49 100755
> --- a/testcases/commands/mkswap/mkswap01.sh
> +++ b/testcases/commands/mkswap/mkswap01.sh
> @@ -128,7 +128,7 @@ mkswap_test()
>  		return
>  	fi

> -	udevadm trigger --name-match=$TST_DEVICE
> +	udevadm trigger --name-match=$TST_DEVICE --settle

>  	if [ -n "$device" ]; then
>  		mkswap_verify "$mkswap_op" "$op_arg" "$device" "$size" "$dev_file"

--settle option for udevadm trigger has been added in v238 (in 2018) [1].
This mean on SLES 12-SP5, RHEL-7.9, 18.04 LTS bionic, ... we get:

trigger: unrecognized option '--settle'

Do we ignore backward compatibility hoping that all distros aren't tested with
newer LTP?

Kind regards,
Petr

[1] https://github.com/systemd/systemd/commit/792cc203a67edb201073351f5c766fce3d5eab45

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
