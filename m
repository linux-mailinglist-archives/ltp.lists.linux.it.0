Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D343D1F46
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 09:49:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB43C3C8190
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 09:49:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 426013C5613
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 09:49:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B20231A01150
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 09:49:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F3EC20381;
 Thu, 22 Jul 2021 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626940181;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNv8UgtoJ2mn0uuQLiRYREPFrA1MEiwqowZ/ooN4RDQ=;
 b=Tjx6CTbAXfgcvU7X7hUjvj+eU1nv/4kbRpj1ojUdYTDGtM/5x2I9u25t5kbBVQ5XYfa3Io
 AODNGpYzSMdTObzb4qkSl80Ftfa8Tx+r+Yp9V7312813h8f1Wkdbdjta8bqjfcTwvUyrtt
 8V1K4n1+1+2s1OAWrt/haZC1sdBplng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626940181;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNv8UgtoJ2mn0uuQLiRYREPFrA1MEiwqowZ/ooN4RDQ=;
 b=sHEgEpvDZmUBdIPtsXlVDpDRgZsVqywiazyLbHU3qnWcjR4/kPyOS2hp3xWzvZKO3R5joH
 uHWLHhsdLPSaogDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E3970137DE;
 Thu, 22 Jul 2021 07:49:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id KKZ6NRQj+WAXCwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jul 2021 07:49:40 +0000
Date: Thu, 22 Jul 2021 09:49:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <YPkjE3KHHnhYklp/@pevik>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722063422.18059-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] lib/tst_test.sh: skip test if ip returns
 "Error: Unknown device type"
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
Cc: radosla.kolev@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Radoslav,

> In network stress test groups there are tests expecting
> CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
> fail. There is a check for VTI support in the ip utility, but not
> for the kernel. Skip these tests if vti device type is not known by
> the kernel.

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> ---
>  testcases/lib/tst_test.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index c6aa2c487..0458c90c2 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -241,12 +241,13 @@ TST_RTNL_CHK()
>  	local msg1="RTNETLINK answers: Function not implemented"
>  	local msg2="RTNETLINK answers: Operation not supported"
>  	local msg3="RTNETLINK answers: Protocol not supported"
> +	local msg4="Error: Unknown device type"
>  	local output="$($@ 2>&1 || echo 'LTP_ERR')"
>  	local msg

>  	echo "$output" | grep -q "LTP_ERR" || return 0

> -	for msg in "$msg1" "$msg2" "$msg3"; do
> +	for msg in "$msg1" "$msg2" "$msg3" "$msg4"; do
>  		echo "$output" | grep -q "$msg" && tst_brk TCONF "'$@': $msg"
>  	done

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
