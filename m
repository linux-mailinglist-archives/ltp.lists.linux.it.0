Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LDMC1nEnWnORwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 16:31:37 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B1189089
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 16:31:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FE833E8B93
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 16:31:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83AC13E8B85
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 16:31:33 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0724A6006D7
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 16:31:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A80FA5BCE9;
 Tue, 24 Feb 2026 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771947091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2OwXvoRqyBwdj8gx9Lm5b9slwfr/A9dg9Vfv2VlVOMo=;
 b=VeRG62QB6b1pu9c9tZMk5eYaMW81I6+5fyn9jIUEn4WfLJstNknip5us6bjvnrbu2vGi+V
 +wET6g8bkuNz0aev6909FUtbG5aQQiYHEDTAg2mkic2HU67+EVRItZxT9YuC8ebFufA8CN
 HkEmtOttcPnGVk7uy+ZiX5bttvFz/A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771947091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2OwXvoRqyBwdj8gx9Lm5b9slwfr/A9dg9Vfv2VlVOMo=;
 b=KnwTZ5vQLfde6WKA9L0TTn9n8Sor5LDvTk81CcZ4mzOgTiI6U9/Tr84lN290/BC3TUDWaz
 v3+13waTQJYJm3Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771947091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2OwXvoRqyBwdj8gx9Lm5b9slwfr/A9dg9Vfv2VlVOMo=;
 b=VeRG62QB6b1pu9c9tZMk5eYaMW81I6+5fyn9jIUEn4WfLJstNknip5us6bjvnrbu2vGi+V
 +wET6g8bkuNz0aev6909FUtbG5aQQiYHEDTAg2mkic2HU67+EVRItZxT9YuC8ebFufA8CN
 HkEmtOttcPnGVk7uy+ZiX5bttvFz/A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771947091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2OwXvoRqyBwdj8gx9Lm5b9slwfr/A9dg9Vfv2VlVOMo=;
 b=KnwTZ5vQLfde6WKA9L0TTn9n8Sor5LDvTk81CcZ4mzOgTiI6U9/Tr84lN290/BC3TUDWaz
 v3+13waTQJYJm3Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D7C63EA68;
 Tue, 24 Feb 2026 15:31:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RlrQIVPEnWmFEAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 24 Feb 2026 15:31:31 +0000
Date: Tue, 24 Feb 2026 16:31:38 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinseok Kim <always.starving0@gmail.com>
Message-ID: <aZ3EWrWQCy7LeSTa@yuki.lan>
References: <aZgx0rp0MRHn4mMT@yuki.lan>
 <20260221134014.37652-1-always.starving0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260221134014.37652-1-always.starving0@gmail.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] poll: add basic POLLHUP semantics test
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,yuki.lan:mid]
X-Rspamd-Queue-Id: C16B1189089
X-Rspamd-Action: no action

Hi!
> Add a basic poll() test to verify that POLLHUP is reported when the
> peer end of a pipe is closed.
> 
> The test creates a pipe, closes the write end, and polls the read end
> for POLLIN events. poll() is expected to return successfully and set
> POLLHUP in revents.
> 
> This covers basic poll() lifecycle semantics that were not previously
> tested.
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  testcases/kernel/syscalls/poll/poll03.c | 62 +++++++++++++++++++++++++

This is missing runtest entry in runtest/syscalls file.

> +void verify_pollhup(void)
> +{
> +	struct pollfd pfd = {
> +		.fd = fds[0], .events = POLLIN,
> +	};
> +
> +	SAFE_CLOSE(fds[1]);

Doesn't this fail the test on a second iteration? Have you tried to run
the test with -i 2?

The fd should be closed only once in the setup.

> +	TEST(poll(&pfd, 1, -1));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "poll() failed");
> +		return;
> +	}
> +
> +	if (TST_RET != 1) {
> +		tst_res(TFAIL, "Unexpected poll() return value %ld", TST_RET);
> +		return;
> +	}
> +
> +	TST_EXP_EXPR(pfd.revents & POLLHUP);
> +	TST_EXP_EXPR((pfd.revents & ~POLLHUP) == 0);
> +
> +	tst_res(TPASS, "poll() reported POLLHUP");
> +}
> +
> +static void setup(void)
> +{
> +	SAFE_PIPE(fds);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (fds[0] > 0)
> +		SAFE_CLOSE(fds[0]);
> +
> +	if (fds[1] > 0)
> +		SAFE_CLOSE(fds[1]);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_pollhup,
> +};
> --
> 2.43.0

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
