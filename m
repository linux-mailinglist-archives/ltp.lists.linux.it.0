Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 870EE4265D7
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Oct 2021 10:22:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E0F33C959F
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Oct 2021 10:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2407B3C5858
 for <ltp@lists.linux.it>; Fri,  8 Oct 2021 10:22:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 745B86008A6
 for <ltp@lists.linux.it>; Fri,  8 Oct 2021 10:22:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70E2E2010A;
 Fri,  8 Oct 2021 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633681367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y6WGti90lxYz15Tp/0z7W/d67e2iwEIj/TcbqW4oys4=;
 b=3X/kENrXEGUs8IEsyf62TquKG2oaYOBBduXa5LeC5Dmb1N5VWgqTNOH5fIFEIkR4BuXyh5
 VuFRv/z6ZdKloEEKNxh8vkvemqlbKTZEHOs2fT5sg9yp2WOvjdLe2PL5LzNByCwnofdj8c
 pQdWYeTNTHS76GvuD83z6mPHHJQrtvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633681367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y6WGti90lxYz15Tp/0z7W/d67e2iwEIj/TcbqW4oys4=;
 b=u/Lqf/dQf+Td6aj9jcjgYGWB6kW3oQjwFIzf/cImyBwbcV6qLK3KneEGLEWtlklHBC726G
 TO//IuG/txhKq6Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5ECE013D3D;
 Fri,  8 Oct 2021 08:22:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TMb9Fdf/X2EyYwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 08 Oct 2021 08:22:47 +0000
Date: Fri, 8 Oct 2021 10:23:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YV//+xhzYHN5349v@yuki>
References: <20210909140911.44EC9A4308@relay2.suse.de>
 <20210916123248.4974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210916123248.4974-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] kernel/irq: Add irqbalance01
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
> +	/* Read the CPU affinity masks for each IRQ. The first CPU is in the
> +	 * right most (least significant) bit. See bitmap_string() in the kernel
> +	 * (%*pb)
> +	 */
> +	for (row = 0; row < nr_irqs; row++) {
> +		sprintf(path, "/proc/irq/%u/smp_affinity", irq_ids[row]);
> +		buf = read_proc_file(path);
> +		c = buf;
> +		col = 0;
> +
> +		while (*c != '\0')
> +			c++;

A minor nit, we alredy know the lenght, but we do not return it from the
read_proc_file() we may as well change this so taht the read_proc_file
returns both buffer pointer and the size. E.g. add size_t *len parameter
to the read_proc_file() and set it if it's not NULL.

Other than that the parsing looks good now.

> +static void evidence_of_change(void)
> +{
> +	size_t row, col, changed = 0;
> +
> +	for (row = 0; row < nr_irqs; row++) {
> +		for (col = 0; col < nr_cpus; col++) {
> +			if (!irq_stats[row * nr_cpus + col])
> +				continue;
> +
> +			if (irq_affinity[row * nr_cpus + col] == ALLOW)
> +				continue;
> +
> +			changed++;
> +		}
> +	}
> +
> +	tst_res(changed ? TPASS : TFAIL,
> +		"Heuristic: Detected %zu irq-cpu pairs have been dissallowed",
> +		changed);
> +}

I'm still unusure about this part though.

The test fails on my workstation where the IRQs are nicely distributed
by the hardware/BIOS.

Maybe we should check if IRQs are distributed somehow evenly and PASS
the test if that is the case as well.

In my case there is 27 IRQs, 18 of them have non-zero counters and there
is 12 CPUs. For active IRQs that gives 18/12 = 1.5 IRQ per CPU and there
are 7 CPUs that handle 2 IRQs, 4 CPUs that handle 1 IRQ and 1 CPU that
doesn't handle anything. I wonder if we can figure out some kind of
heuristic, but I guess that in the end it wouldn't be worth the effort.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
