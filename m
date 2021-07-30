Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED03DB440
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 09:08:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E30C23C620F
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 09:08:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00AFB3C27F3
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 09:08:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E64D51A0070B
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 09:08:34 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 336721FDB2;
 Fri, 30 Jul 2021 07:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627628913;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AHHgE5Rh03t4xb3N8EzZDWoOfjBvq4/3YJbib547yw=;
 b=SKNJvHen3W+i9+nYMdJu9vbyNMnMs1KynJByPmd5nxtOiln3p4kNKodUw5K7YrVPXu3qFR
 pCJ0aZvLBB5KKGZPJzgkej88YUmsBxs77lEHiiowcR6T7L10qMt45LujExECW8xdmvYTH8
 DPAcKtVtJti1D10TIQbWnI28fXHitoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627628913;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AHHgE5Rh03t4xb3N8EzZDWoOfjBvq4/3YJbib547yw=;
 b=O8SE+MRhgrKmC9sdpAIXn9iDoWwQIthvryEk9OIQHqN2kszNbvxdQGKs1208GkGW9qKxcT
 QTD7uHshnth4+8DA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 023BF13651;
 Fri, 30 Jul 2021 07:08:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2tBhOnClA2ETewAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 30 Jul 2021 07:08:32 +0000
Date: Fri, 30 Jul 2021 09:08:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <YQOlbyslKEiw9rCx@pevik>
References: <YQFWT/0MBcZsLNVV@pevik>
 <20210728140453.23356-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728140453.23356-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] ipsec_lib.sh: check ip_vti/ip6_vti are enabled
 or skip tests
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

Hi Radoslav,

...
> +	if [ "$TST_IPV6" ]; then
> +                tst_net_run -q "tst_check_drivers ip6_vti" || \
> +                        tst_brk TCONF "ip6_vti driver not available on lhost or rhost"
> +        else
> +                tst_net_run -q "tst_check_drivers ip_vti" || \
> +                        tst_brk TCONF "ip_vti driver not available on lhost or rhost"
> +        fi
nit: broken indentation, but that'll be fix during merge.

LGTM, but I'm going to merge shorter version (we have $TST_IPV6 for this
purpose).

tst_net_run -q "tst_check_drivers ip${TST_IPV6}_vti" || \
	tst_brk TCONF "ip${TST_IPV6}_vti driver not available on lhost or rhost"

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
