Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F13DF0CD
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 16:52:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 466943C88C5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 16:52:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 47D553C57B8
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 16:52:38 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BF9A01000D37
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 16:52:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F359520049;
 Tue,  3 Aug 2021 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628002356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxnXB4aXwbotCZqgSKA2ppDts5TgIWhzflFDy6Ehzcc=;
 b=qHjenGXxKOONomzMnWyvVPmROcES9eJphLtr0iXLfWVXQ0t7ugp2xcJ+U6husGH5zeg7Nr
 SmnWgHauiBi9xqu8vN4uK37/eczMDv3UzazTZhOsr0+x756QpDY7NR8lpB6NT4Vu1/Jr64
 z9kxtmPGOHHgcClTyAcoBTGlTdjhT3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628002357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxnXB4aXwbotCZqgSKA2ppDts5TgIWhzflFDy6Ehzcc=;
 b=i5PeH2vBkZBfK6hv9MzChoRn5GQD4O7IS5HBb3bzeHAac11Y2rYEdsJ3flLElgWCfVNV9a
 EtMPOr1PJu+X0PBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D823313CEB;
 Tue,  3 Aug 2021 14:52:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OMBTNDRYCWGECQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 14:52:36 +0000
Date: Tue, 3 Aug 2021 16:52:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YQlYPM1XuRsHVyV0@yuki>
References: <20210802160918.30861-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802160918.30861-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add test for CVE 2020-25704
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
> +static void run(void)
> +{
> +	struct sysinfo info1, info2;
> +	unsigned long diff, memunit;
> +	int i;
> +
> +	SAFE_SYSINFO(&info1);
> +
> +	/* leak about 100MB of RAM */
> +	for (i = 0; i < 12000000; i++)
> +		ioctl(fd, PERF_EVENT_IOC_SET_FILTER, "filter,0/0@abcd");
> +
> +	SAFE_SYSINFO(&info2);
> +	memunit = info1.mem_unit;
> +
> +	/* sysinfo(2) man page does not guarantee consistent mem_unit... */
> +	if (info1.mem_unit > info2.mem_unit) {
> +		diff = info1.mem_unit / info2.mem_unit;
> +		info2.freeram /= diff;
> +	} else if (info1.mem_unit < info2.mem_unit) {
> +		diff = info2.mem_unit / info1.mem_unit;
> +		info1.freeram /= diff;
> +		memunit = info2.mem_unit;
> +	}

I guess that SAFE_READ_MEMINFO() would be much easier to use with:

	memfree_before = SAFE_READ_MEMINFO("MemFree:");

	// do the test

	memfree_after = SAFE_READ_MEMINFO("MemFree:");

And the result is conviniently in kilobytes.

> +	if (info1.freeram > info2.freeram + 50 * 1024 * 1024 / memunit)
> +		tst_res(TFAIL, "Likely kernel memory leak detected");
> +	else
> +		tst_res(TPASS, "No memory leak found");
> +}
> +
> +static void cleanup(void)
> +{
> +	if (fd >= 0)
> +		SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "7bdb157cdebb"},
> +		{"CVE", "2020-25704"},
> +		{}
> +	}
> +};
> +
> +#else /* HAVE_PERF_EVENT_ATTR */
> +TST_TEST_TCONF("This system doesn't have <linux/perf_event.h> or "
> +	"struct perf_event_attr is not defined.");
> +#endif
> -- 
> 2.32.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
