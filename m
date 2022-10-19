Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230C603F30
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Oct 2022 11:30:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 956213CB114
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Oct 2022 11:30:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4EE63CB0C5
 for <ltp@lists.linux.it>; Wed, 19 Oct 2022 11:30:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A17141A00CD3
 for <ltp@lists.linux.it>; Wed, 19 Oct 2022 11:30:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E8419339E2;
 Wed, 19 Oct 2022 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666171828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUhFQ8hzxWMu6jRXQjl7f1nqBdc0xyG43BBogh7ifsQ=;
 b=l+6emPaj6z+3Xo5yrqb3uhCVJVx1EfioZ75xfNe+IA9Aop91GiSSpOyMgkI6UJ6LYFKUS6
 +jqWbsOjzEPlfcpeOtu0EKSNBpsASubDhgWOzMCNJMwZiyTNPT/DmTIAKDST2PoITPsfnX
 opHMA6XBCzqpqXdjwK+nBwwIa5nW+/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666171828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUhFQ8hzxWMu6jRXQjl7f1nqBdc0xyG43BBogh7ifsQ=;
 b=oIqjLmtk82wpcd0r3m9B5Wwjdu64PcmugHmqfOhr1OrfWdV/82UkK9rnrtJqNpGhNfdPTh
 5BT8Jscc4xqut+DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D615713A36;
 Wed, 19 Oct 2022 09:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jr9WM7TDT2O6BAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 19 Oct 2022 09:30:28 +0000
Message-ID: <f15cfed9-b389-b176-9d7d-8f2fcc8aaff0@suse.cz>
Date: Wed, 19 Oct 2022 11:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20221018152527.4636-1-rpalethorpe@suse.com>
Content-Language: en-US
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20221018152527.4636-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] ptrace07: Fix compilation when not on x86
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

On 18. 10. 22 17:25, Richard Palethorpe via ltp wrote:
> Strictly cpuid.h should not be included on non-x86, but this means
> each test author has to remember not to include it. Instead we can set
> a blank macro to allow compilation.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---

Hi,
defining an empty macro is a bad idea because it'll allow a broken test 
to be compiled and then it'll behave erratically for no apparent reason. 
It's better to get a build failure.

Reverting 1df4de06206b079f24dde7157d037b48727c743d is the best solution 
here. Building ptrace07 and similar arch-specific tests without a key 
piece of code does not make sense. The preprocessor arch checks should 
wrap around the whole file, not just a small non-portable bit that's 
crucial for the test to work.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
