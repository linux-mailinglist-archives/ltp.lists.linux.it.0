Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C73E4581
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 14:21:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DD173C6788
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 14:21:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 12FE93C6561
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 14:21:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 950346007A0
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 14:21:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C6921FDCF;
 Mon,  9 Aug 2021 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628511689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFLEWrZVVKaA2eZyNsMWZeycdhfETYZqVF3gckmqSEQ=;
 b=10u8uqBQ0yvkP9/5HaSUZUJ2HlNZ2hj3jnduJOC5PtI1ketjZo/UBiBcb2pmFDzyfHe8Se
 0o9Brit64YMsIICB3Gms0DfpqVIjMXP5c0Aqv2OGrTa2PaH3FXlKvCH2M5eS4R+6XAOYWJ
 LHRBlLxrqdJ1az6qCNlh0ldQLGL/4xo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628511689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFLEWrZVVKaA2eZyNsMWZeycdhfETYZqVF3gckmqSEQ=;
 b=G0qXgAkz0+AKPjIvxo8SPMBJomARFKe65ZXAm5g0Ul6mUFeoOiKzpLJ73PzD0Pp+0H7MJ6
 UNXemvMCdpWL8gBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEC7413BAA;
 Mon,  9 Aug 2021 12:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id onFEOcgdEWFQDQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 12:21:28 +0000
Date: Mon, 9 Aug 2021 14:21:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YREd08mkfysYkjzZ@yuki>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
 <20210806164730.51040-14-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806164730.51040-14-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 13/16] syscalls/sched_setscheduler02: convert
 to new API
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
>  #define SCHED_INVALID	99
>  #define INVALID_PID	999999

I guess that we should remove these two unused macros as well.

> +	if (!pid) {
> +		struct sched_param p = { .sched_priority = 1 };
> +
> +		SAFE_SETEUID(nobody_uid);
> +		TST_EXP_FAIL(tv->sched_setscheduler(0, SCHED_FIFO, &p), EPERM,
> +			     "sched_setscheduler(0, SCHED_FIFO, %d)",
> +			     p.sched_priority);
> +		SAFE_SETEUID(0);

And we do not have to reset the UID before we call exit(0)

> +		exit(0);
> +	}
> +	tst_reap_children();
>  }

Other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
