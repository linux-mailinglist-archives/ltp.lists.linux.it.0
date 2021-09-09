Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769A40508A
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 14:41:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9DD23C8D7E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 14:41:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C3613C21EE
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 14:41:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DC909140118D
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 14:41:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B8FA222EC;
 Thu,  9 Sep 2021 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631191284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7naQQ7eBxE0XjdeVrXn5EIkrPDqMuOdUwW9GP1+QwCw=;
 b=Ns3rjBav2G8d9J80I1Cub+Chj97X+o803M2b69BYATuUcZMWJ2xgdIN8iO7mx2D7cLeH4c
 r44r1GY2ygrc8I/9Un7EKwvn0Euuzuil2VZjfnvPgaA5332LPIQ1FsuHIwI/MBopIsYdSQ
 9Y6x9m4CAFxH8LCJSRwcl9lYjLPgL8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631191284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7naQQ7eBxE0XjdeVrXn5EIkrPDqMuOdUwW9GP1+QwCw=;
 b=InZEYGZeqFdjX8PcqQXH1FxI9Wvuj9aLhwWmWEWnoNeemdPwoCCcQViIhssHst3wKVwigU
 aR4wBFa+rRNC5JAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47D5913C53;
 Thu,  9 Sep 2021 12:41:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bMkhFfQAOmHhfAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 09 Sep 2021 12:41:24 +0000
Date: Thu, 9 Sep 2021 14:41:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YToBAshr0Y94qcVU@yuki>
References: <878s0ikl6d.fsf@suse.de>
 <20210831114406.8527-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210831114406.8527-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: nhorman@gmail.com, Thomas Gleixner <tglx@linutronix.de>, anton@deadbeef.mx,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +	/* Read the CPU affinity masks for each IRQ. See bitmap_string() in the kernel (%*pb) */
> +	for (row = 0; row < nr_irqs; row++) {
> +		sprintf(path, "/proc/irq/%u/smp_affinity", irq_ids[row]);
> +		ret = SAFE_FILE_READAT(0, path, buf, size);
> +		if (ret < 1)
> +			tst_brk(TBROK, "Empty /proc/irq/%u/smp_affinity?", irq_ids[row]);
> +		c = buf;
> +		col = 0;
> +
> +		while (*c != '\0') {
> +			switch (*c) {
> +			case '\n':
> +			case ' ':
> +			case ',':
> +				c++;
> +				continue;
> +			case '0' ... '9':
> +				acc = *c - '0';
> +				break;
> +			case 'a' ... 'f':
> +				acc = 10 + *c - 'a';
> +				break;
> +			default:
> +				tst_res(TINFO, "%u/smp_affnity: %s", irq_ids[row], buf);
> +				tst_brk(TBROK, "Wasn't expecting 0x%02x", *c);
> +			}
> +
> +			for (mask_pos = 0; mask_pos < 4; mask_pos++) {
> +				if (mask_pos + col >= nr_cpus)
> +					break;
> +
> +				irq_affinity[row * nr_cpus + (nr_cpus - 1 - col - mask_pos)] =
> +					(acc & (8 >> mask_pos)) ? ALLOW : DENY;
> +			}

The mask here is actually wrong, since we go backward in the
irq_affinity array the bitmask has to grow not shrink so this should be
(acc & (1<<mask_pos))

> +			col += mask_pos;
> +			c++;
> +		}
> +	}
> +
> +	free(buf);
> +}
> +
> +static void print_irq_info(void)
> +{
> +	size_t row, col;
> +	unsigned int count;
> +	enum affinity aff;

It would be nice if we printed the CPUX header here as well so that it's
clear which column describes which CPU.

> +	for (row = 0; row < nr_irqs; row++) {
> +		tst_printf("%5u:", irq_ids[row]);
> +
> +		for (col = 0; col < nr_cpus; col++) {
> +			count = irq_stats[row * nr_cpus + col];
> +			aff = irq_affinity[row * nr_cpus + col] == ALLOW ? '+' : '-';
> +
> +			tst_printf("%10u%c", count, aff);
> +		}
> +
> +		tst_printf("\n");
> +	}
> +
> +	tst_printf("Total:");
> +
> +	for (col = 0; col < nr_cpus; col++)
> +		tst_printf("%11u", irq_stats[row * nr_cpus + col]);
                               ^
			       And I would change this to "%10u " so
			       that the value aligns with the rest of
			       the numbers in the columns.
> +	tst_printf("\n");
> +}

Otherwise the rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
