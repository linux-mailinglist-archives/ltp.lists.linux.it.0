Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6741704C
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:26:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1D033C8FA0
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:26:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0136E3C8F19
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:26:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 956021001531
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:26:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EACAE1FFE2;
 Fri, 24 Sep 2021 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632479213;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VQNEy5rVycYgnQtsy+s/gSa0ssXqmb5FNdP+p+jEBK0=;
 b=Y+goneCIbJBQTBRfUlKzUE1SFPE8ZdX9Gma8Y/Curj708vZJ7KINuxMco8UG50s0FGkc8U
 nJsT38arW1PNYbzC6ndDTBc8zw+7mTchHn5PKGfiEECarvQejbjywMzYrAkqajGu3/Ls3s
 xHtDcFEG6I2ilKan0U2lvnBYQDigKsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632479213;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VQNEy5rVycYgnQtsy+s/gSa0ssXqmb5FNdP+p+jEBK0=;
 b=JIeIJPAQNHAOaqlGEdFj57LQNX7joa67ICSGh0jWGoQlBTxH8G/1eMjTNwGynakJBfiGpI
 oCbDZTrFm1AmzBDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 941D713AB5;
 Fri, 24 Sep 2021 10:26:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5KUKIe2nTWGtUAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 24 Sep 2021 10:26:53 +0000
Date: Fri, 24 Sep 2021 12:26:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YU2n6tamyCf13OS5@pevik>
References: <20210924092111.20012-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924092111.20012-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] msgrcv07: Check negative msg type filters
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

...
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
> @@ -232,6 +232,13 @@ static void test_negative_msgtyp(void)
>  			"-msgtyp didn't get the first message in the queue with the lowest type");
>  	}

> +	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE1, IPC_NOWAIT),
> +		     ENOMSG,
> +		     "-msgtype didn't recv next lowest msg");
> +	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE1, MSG_EXCEPT | IPC_NOWAIT),
> +		     ENOMSG,
> +		     "-msgtype (with except) didn't recv next lowest msg");
nit: I'd use msgtyp instead of msgtype (although it looks like typo, it's used
without 'e' as a parametr name in man msgop(2) and also throughout this test
(obviously can be changed during merge).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
