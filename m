Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 103B370DC0E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 May 2023 14:12:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 866443CDCA4
	for <lists+linux-ltp@lfdr.de>; Tue, 23 May 2023 14:12:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87B663CD331
 for <ltp@lists.linux.it>; Tue, 23 May 2023 14:12:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F04981A005EB
 for <ltp@lists.linux.it>; Tue, 23 May 2023 14:12:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A944720566;
 Tue, 23 May 2023 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1684843953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8b0spmDTtD8Ge6klHCBzVikkc5i3RNu0b68DeFAWGFA=;
 b=dwrQGzcdyMEqFNlWJEIINL51UJGwM+icUdxIgUfJ6ZPml2JMG4rq5PDcy/KYvRbPN0BQRD
 eMnmabd1nDkwTDwEpTcSBPHkzSw7L6RUKH8nmHchLTpEmjIL4711BoCjXgLfLmUOor/Txs
 sz0wmdQRJcnCx/CQPpjrz/f8td6VYPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1684843953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8b0spmDTtD8Ge6klHCBzVikkc5i3RNu0b68DeFAWGFA=;
 b=ghlBDhNV1uwCwlW4mxa4lzSOEshaBKeOQxq01zaLkQMMyQejYvF06GnZO0owIJGqf7y1Kl
 5QOsCo3zMInkH9BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9574413588;
 Tue, 23 May 2023 12:12:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yWnUI7GtbGTnIgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 23 May 2023 12:12:33 +0000
Date: Tue, 23 May 2023 14:13:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <ZGyt9l8lKwBk1z7d@yuki>
References: <20230517153642.26919-1-mdoucha@suse.cz>
 <20230517153642.26919-5-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517153642.26919-5-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] KVM: Add async communication helper functions
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
Cc: ltp@lists.linux.it, Nicolai Stange <nstange@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +int tst_kvm_wait_guest(struct tst_kvm_instance *inst, int timeout)
> +{
> +	volatile struct tst_kvm_result *result = inst->result;
> +	int32_t res;
> +	time_t start = time(NULL);
> +
> +	while ((res = result->result) != KVM_TSYNC) {
> +		if (res == KVM_TEXIT)
> +			return res;
> +
> +		if (timeout >= 0 && start + timeout <= time(NULL))
> +			return -1;

Can we please avoid using wall clock time for timeouts? That is broken
by desing, since the time is continually adjusted by ntp daemon these
days and can jump back and forth...

This should be really:

	struct timespec start

	tst_clock_gettime(CLOCK_MONOTONIC, &start);

	while (...) {
		struct timespec now;

		tst_clock_gettime(CLOCK_MONOTONIC, &now);

		if (tst_timespec_diff_ms(now, start) >= timeout_ms)
			return -1;

> +		usleep(1000);
> +	}
> +
> +	return 0;
> +}

The rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
