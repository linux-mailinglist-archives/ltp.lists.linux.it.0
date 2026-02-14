Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z5bMLGxpkGllZQEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Sat, 14 Feb 2026 13:24:12 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 444C613BD5F
	for <lists+linux-ltp@lfdr.de>; Sat, 14 Feb 2026 13:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771071851; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=6M7PKYCAuC4eUMEVjDHOW0598bqmShPdyRpZPbWLtv0=;
 b=kXdUqwSuLIdASqGOMN/fUuditcuL1nJcuPXtEomkJg8kdZtrxQt9im/b0zfSkos9SDqlh
 kKYqcpSdadAu2MC6Ar3vpWAr9iHN7UJ5tT7AdAE8CfuzqxPcgZtQxOZzRuoRI9fBDp/w1Qr
 SUI/nYfFIUm/fnYh1TGq75OPq3HUAyE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21AE3CFF03
	for <lists+linux-ltp@lfdr.de>; Sat, 14 Feb 2026 13:24:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5D983CCBC9
 for <ltp@lists.linux.it>; Sat, 14 Feb 2026 13:24:08 +0100 (CET)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A85891000643
 for <ltp@lists.linux.it>; Sat, 14 Feb 2026 13:24:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A5166011F;
 Sat, 14 Feb 2026 12:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE63C16AAE;
 Sat, 14 Feb 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771071845;
 bh=30f27v+mHS60nppfktd31AaQvXVA9o6eescZJPxBXZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWMmdqkDhmfOZr3aXjc9BVKN2U14OO46QgfaGYtdndCZlh5NYvxVQI10lZs7vaWUp
 aRRl95KcLhc7Qx1JJXqbsmhc1cYuOt2FCHwi7jkmeOwwDwbOupmohcShLqUQNJfHTL
 pXYKKJkjzX00z3p8JOgvsqMQfnxIofD3Rb9rs3orEYfvPw4XgrysVW9xtyjJ3QUwl6
 EqS6jP5ptpDd2e1Hsn4SnaK5odM0TR2XcH0I/+6XFhPIT90bYJhbXzFLNKDZPun7zC
 So3qZvtY4wLzYRkqJHI2pU2arunRu0zDbT22E9Ai2CeFKMFya3OzpoqOkA1P0lVMKg
 cDZO0imesPO7g==
Date: Sat, 14 Feb 2026 13:24:00 +0100
To: Cyril Hrubis <chrubis@suse.cz>, Mark Brown <broonie@kernel.org>
Message-ID: <20260214-ausformuliert-aufgearbeitet-7b45890e036a@brauner>
References: <202602122354.412c5e65-lkp@intel.com> <aY7wZwHXH2zS_Sj-@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY7wZwHXH2zS_Sj-@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linux-next:master] [mount] 4f5ba37ddc: ltp.fsmount02.fail
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
From: Christian Brauner via ltp <ltp@lists.linux.it>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, oe-lkp@lists.linux.dev,
 kernel test robot <oliver.sang@intel.com>, linux-fsdevel@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.linux.it:+,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 444C613BD5F
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:35:35AM +0100, Cyril Hrubis wrote:
> Hi!
> > commit: 4f5ba37ddcdf5eaac2408178050183345d56b2d3 ("mount: add FSMOUNT_NAMESPACE")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> The relevant part of the log is:
> 
> fsmount02.c:56: TFAIL: invalid-flags: fsmount() succeeded unexpectedly (index: 1)
> 
> This is another case where new flag was added so the invalid flag value
> is not invalid anymore. The test needs to be adjusted if/once the patch
> hits mainline.

Ah, very good to know. Adding Mark so he's aware that this is an
expected failure.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
