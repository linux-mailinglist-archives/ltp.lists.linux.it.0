Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAO0McGPmGnjJgMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 17:45:53 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6A169628
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 17:45:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3285B3D0892
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 17:45:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 91EE43CCDDD
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 17:45:41 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 52233200AEF
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 17:45:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 953035C09E;
 Fri, 20 Feb 2026 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771605940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5jgmDWvBgb0yVxcAMKWFzAqaQFfD7FchS7++yA3kQg=;
 b=y9yNpJkVKInPVFgkDMTnUapvgsjaQVgLRVgVYK9s/VfCEYGr/rrvlhaTHD0Gfxcnjtmby7
 wjsetf2W0CQVuCeNuS0+J7QvTOOsW6Q5WOKjnvQF9P0SFlQ0UGOEGdZ+7FJw0+fxspsDOV
 YIAYgE7sIrbBBtGGZfVmoEjur2F/TPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771605940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5jgmDWvBgb0yVxcAMKWFzAqaQFfD7FchS7++yA3kQg=;
 b=FIJbXZtt8Gc+EiWDakT9HhNMmjG+kSyYxyNCii46P8OIB0LKc8YyBweX7u1hI1/w+4EJmB
 P/1tlGExXepeWoDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771605940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5jgmDWvBgb0yVxcAMKWFzAqaQFfD7FchS7++yA3kQg=;
 b=y9yNpJkVKInPVFgkDMTnUapvgsjaQVgLRVgVYK9s/VfCEYGr/rrvlhaTHD0Gfxcnjtmby7
 wjsetf2W0CQVuCeNuS0+J7QvTOOsW6Q5WOKjnvQF9P0SFlQ0UGOEGdZ+7FJw0+fxspsDOV
 YIAYgE7sIrbBBtGGZfVmoEjur2F/TPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771605940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5jgmDWvBgb0yVxcAMKWFzAqaQFfD7FchS7++yA3kQg=;
 b=FIJbXZtt8Gc+EiWDakT9HhNMmjG+kSyYxyNCii46P8OIB0LKc8YyBweX7u1hI1/w+4EJmB
 P/1tlGExXepeWoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AD883EA65;
 Fri, 20 Feb 2026 16:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tvOODLSPmGk2NAAAD6G6ig
 (envelope-from <rbranco@suse.de>); Fri, 20 Feb 2026 16:45:40 +0000
Message-ID: <15f20553-fdae-42e1-acb8-b65dfc4c2cfb@suse.de>
Date: Fri, 20 Feb 2026 17:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrea Cervesato <andrea.cervesato@suse.com>, ltp@lists.linux.it
References: <20260219225007.218697-1-rbranco@suse.de>
 <DGJWBYPFA8X4.O6DWVQQLRNGT@suse.com>
 <1a05954d-e6b9-4e43-85f2-90ea94e8b68a@suse.de>
 <DGJWNLRE9HZO.18VNRTVC0N7LM@suse.com>
From: Ricardo Branco <rbranco@suse.de>
In-Reply-To: <DGJWNLRE9HZO.18VNRTVC0N7LM@suse.com>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] userfaultfd: Add test using UFFDIO_POISON
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rbranco@suse.de,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-ltp];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Rspamd-Queue-Id: 76C6A169628
X-Rspamd-Action: no action



On 2/20/26 4:47 PM, Andrea Cervesato wrote:
> On Fri Feb 20, 2026 at 4:43 PM CET, Ricardo Branco wrote:
>>
>> On 2/20/26 4:32 PM, Andrea Cervesato wrote:
>>>> +
>>>> +	sa.sa_handler = sigbus_handler;
>>>> +	sigemptyset(&sa.sa_mask);
>>>> +	SAFE_SIGACTION(SIGBUS, &sa, NULL);
>>>> +
>>>> +	set_pages();
>>> This is done every cycle of -i > 1, but memory is never released and
>>> done once in cleanup().
>> I'm moving sigaction to setup but set_pages() is called in run() on the
>> rest of the tests.
> But all other tests also have a reset_pages() at the end of run()

Because I renamed reset_pages() to cleanup().

Will follow the template of the other tests in the next v5.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
