Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ0iOuURp2k0cwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 17:52:53 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 894EA1F428F
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 17:52:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA0943DB038
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2026 17:52:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E1B03CC57C
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 17:52:41 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4A63510009E2
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 17:52:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 083313F926;
 Tue,  3 Mar 2026 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772556760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhcpFEP79OM9WNu2tUdLc0cwtom5M0IF5tP5AzuFRgs=;
 b=VtzBSdxHEf+FSjY/79Yj3wKABPJeY2yFhVSrMkQs+MF13HyRQVwwDCnnQkUe77DxsBx/yt
 h7V/Owd77cu8/KB21Sqq0RcP4u/N2/uqIp48rGPzKYGCgxAeD351MLuWMEXDnNMWhbU838
 omjdjfMmwUEn5juGQwx4//+2C9HD2f4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772556760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhcpFEP79OM9WNu2tUdLc0cwtom5M0IF5tP5AzuFRgs=;
 b=CRxGn/Ws1oKULuMvKZeXj+ick1jneeUYsMqh4CF6VVVEpMtD4L9WNfIZ2qbPZapUuZM5n/
 UJ8rPFQ5ALzFdrAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772556760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhcpFEP79OM9WNu2tUdLc0cwtom5M0IF5tP5AzuFRgs=;
 b=VtzBSdxHEf+FSjY/79Yj3wKABPJeY2yFhVSrMkQs+MF13HyRQVwwDCnnQkUe77DxsBx/yt
 h7V/Owd77cu8/KB21Sqq0RcP4u/N2/uqIp48rGPzKYGCgxAeD351MLuWMEXDnNMWhbU838
 omjdjfMmwUEn5juGQwx4//+2C9HD2f4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772556760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhcpFEP79OM9WNu2tUdLc0cwtom5M0IF5tP5AzuFRgs=;
 b=CRxGn/Ws1oKULuMvKZeXj+ick1jneeUYsMqh4CF6VVVEpMtD4L9WNfIZ2qbPZapUuZM5n/
 UJ8rPFQ5ALzFdrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E06FB3EA69;
 Tue,  3 Mar 2026 16:52:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XnDWNdcRp2kvKAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 03 Mar 2026 16:52:39 +0000
Date: Tue, 3 Mar 2026 17:52:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Pavithra <pavrampu@linux.ibm.com>
Message-ID: <aacR4TZCFT_UeMaB@yuki.lan>
References: <20250925060514.1009709-1-pavrampu@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925060514.1009709-1-pavrampu@linux.ibm.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] [PATCH v4] Hugetlb: Migrating libhugetlbfs test
 truncate_reserve_wraparound.c
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
Cc: ltp@lists.linux.it, Pavithra <pavrampu@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 894EA1F428F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.784];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,picard.linux.it:rdns,picard.linux.it:helo]
X-Rspamd-Action: no action

Hi!
> +/*\
> + *[Descripiton]
> + *
> + * Origin: https://github.com/libhugetlbfs/libhugetlbfs/blob/master/tests/truncate_reserve_wraparound.c
> + *
> + * At one stage, improper handling of tests against i_size could mess
> + * up accounting of reserved hugepages on certain truncate
> + * operations.
> + *
> + */
> +
> +#include <signal.h>
> +#include <setjmp.h>
> +#include "hugetlb.h"
> +
> +#define MNTPOINT "hugetlbfs/"
> +
> +static long hpage_size;
> +static int fd = -1;
> +
> +static sigjmp_buf sig_escape;
> +
> +static void sigbus_handler(int signum LTP_ATTRIBUTE_UNUSED, siginfo_t *si LTP_ATTRIBUTE_UNUSED, void *uc LTP_ATTRIBUTE_UNUSED)

Why do we bother with passing SA_SIGINFO to the sigaction() when we
ingnore the parameters later?

> +{
> +	siglongjmp(sig_escape, 17);
> +}
> +
> +static void run_test(void)
> +{
> +
> +	static int sigbus_count;
> +	unsigned long initial_rsvd, after_map_rsvd, after_touch_rsvd;
> +	unsigned long after_trunc_rsvd, after_unmap_rsvd, after_sigbus_rsvd;
> +	volatile unsigned int *q;
> +	void *p;
> +
> +	sigbus_count = 0;
> +
> +	initial_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count before map: %lu", initial_rsvd);
> +
> +	p = SAFE_MMAP(NULL, hpage_size, PROT_READ|PROT_WRITE, MAP_SHARED,
> +			fd, 0);
> +	q = p;
> +
> +	after_map_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after map: %lu", after_map_rsvd);

Shouldn't we check that after_mmap_rsvd == initial_rsvd + 1 ?

Also we do have nice macros for assertions so we can do:

        TST_EXP_EQ_LU(initial_rsvd + 1, after_mmap_rsvd);
	if (!TST_PASS)
		goto windup;

And we can use these macros in the rest of the comparsions as well. And
with that we do not need to print the useless
tst_res(TPASS, "Test passed"); message

> +	*q = 0;
> +	after_touch_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after touch: %lu", after_touch_rsvd);
> +
> +	if (after_touch_rsvd != initial_rsvd) {
> +		tst_res(TFAIL, "Reserved after touch %lu instead of %lu", after_touch_rsvd, initial_rsvd);
> +		goto windup;
> +	}
> +
> +	SAFE_FTRUNCATE(fd, 0);
> +	after_trunc_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after truncate: %lu", after_trunc_rsvd);
> +
> +	if (after_trunc_rsvd != initial_rsvd) {
> +		tst_res(TFAIL, "Reserved after truncate %lu instead of %lu", after_trunc_rsvd, initial_rsvd);
> +		goto windup;
> +	}
> +
> +	if (sigsetjmp(sig_escape, 1) == 0)
> +		*q; /* Fault, triggering a SIGBUS */
> +	else
> +		sigbus_count++;
> +
> +	if (sigbus_count != 1) {
> +		tst_res(TFAIL, "Didn't SIGBUS after truncate");
> +		goto windup;
> +	}
> +
> +	after_sigbus_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after sigbus: %lu", after_sigbus_rsvd);
> +
> +	if (after_sigbus_rsvd != initial_rsvd) {
> +		tst_res(TFAIL, "Reserved after SIGBUS %lu instead of %lu", after_sigbus_rsvd, initial_rsvd);
> +		goto windup;
> +	}
> +
> +	tst_res(TPASS, "Test passed!");
> +
> +windup:
> +	SAFE_MUNMAP(p, hpage_size);
> +	after_unmap_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after munmap: %lu", after_unmap_rsvd);
> +
> +}
> +
> +static void setup(void)
> +{
> +	hpage_size = tst_get_hugepage_size();
> +	fd = tst_creat_unlinked(MNTPOINT, 0, 0600);
> +
> +	struct sigaction sa = {
> +		.sa_sigaction = sigbus_handler,
> +		.sa_flags = SA_SIGINFO,
> +	};
> +
> +	SAFE_SIGACTION(SIGBUS, &sa, NULL);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (fd >= 0)
> +		SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.tags = (struct tst_tag[]) {
> +		{"linux-git", "ebed4bfc8da8"},
> +		{}
> +	},
> +	.needs_root = 1,
> +	.mntpoint = MNTPOINT,
> +	.needs_hugetlbfs = 1,
> +	.hugepages = {4, TST_NEEDS},
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run_test,
> +};
> -- 
> 2.43.5
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
