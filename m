Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A743E2469
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:48:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2C813C7AF3
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:48:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC9143C1892
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:48:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 48C97200ADB
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:48:47 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 768B91FEAF;
 Fri,  6 Aug 2021 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628236126;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vO5Ol7HjYebPG5fPCz8hxD+o75eRTnGVs6F28uLMFTA=;
 b=hTmFyBoYYIG1cLp+mZtm+w6KV0gLQqpQejVrCrOkHdWcPNFgCSy8kJWrCW7MgjJAHsHNSo
 ceWMwWoVo92OIYmFjlmpQO5kqnj27yET8J0MsqSa/bkHg+mfYByFu/N/oxCKXIIru2KnG1
 tzfWV6BzmAL2IXlQsP0xd/l0a2xbqhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628236126;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vO5Ol7HjYebPG5fPCz8hxD+o75eRTnGVs6F28uLMFTA=;
 b=PEs3MqXqaBU2uiIgpZUmuad6U38vKl5D1bo1HcwET1w1lAw+dWsJuNUNlrpfx9aFrsJWmg
 oON42br1J5+Ok3AQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4C0EB13990;
 Fri,  6 Aug 2021 07:48:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id U6EmEV7pDGG3GQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 06 Aug 2021 07:48:46 +0000
Date: Fri, 6 Aug 2021 09:48:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <YQzpXHDvFmoaSFhi@pevik>
References: <20210805140806.3884-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805140806.3884-1-bogdan.lezhepekov@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] connectors/cn_pec: improve reliability
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

Hi Bogdan, Joerg,
> Sometimes pec_listener has not enough time to handle all
> the generated events.

> This patch only returns back the delay that was removed
> in a recent patch.

> Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
> ---
>  testcases/kernel/connectors/pec/cn_pec.sh | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/testcases/kernel/connectors/pec/cn_pec.sh b/testcases/kernel/connectors/pec/cn_pec.sh
> index 9b85a5c81..24b1db761 100755
> --- a/testcases/kernel/connectors/pec/cn_pec.sh
> +++ b/testcases/kernel/connectors/pec/cn_pec.sh
> @@ -77,6 +77,8 @@ test()
>  	tst_sleep 100ms

>  	ROD event_generator -n $num_events -e $event \>gen_$event.log 2\>gen_$event.err
> +    # sleep until pec_listener has seen and handled all of the generated events
> +    tst_sleep 100ms
nit: mixing tabs and spaces (script uses tabs), can be fixed during merge.

If I understand the code correctly, pec_listener keeps receiving msg from PEC
until got signaled by kill. We generally try to avoid sleep in tests [1].

@Joerg: I'm not sure if it's reasonable to add another signal handler in which
pec_listener would print number of already handled requests (with write() as
printf() is not reentrant). Then we could loop for certain time before sending INT.

Kind regards,
Petr

[1] https://people.kernel.org/metan/why-sleep-is-almost-never-acceptable-in-tests

>  	kill -s INT $pid 2> /dev/null
>  	wait $pid

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
