Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A7A4EC5BF
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 15:37:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2702B3C9E57
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 15:37:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C3FE83C9AA2
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 15:37:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 457C0200388
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 15:37:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C21F1F37B;
 Wed, 30 Mar 2022 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648647470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUUZEQJylhChe3ZB7pAXkYpwIIIq60cVA/6ATzYPiJI=;
 b=EVkM4jgB+uSSNq4K3hmnmvb3fHUzlFb20A4iqtmk95yR3eqGV2H41TrjZfmU7apJQn9mBb
 7YKZtie20HTvj3P8n0eLy3O4Sqm6sSBopZ5BN+Hwoh6yj5KXLNccxPS4fg1z5uEHZr5RtE
 ao5LptqDhnh6dDub3VzfLuZQaBzEZs4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648647470;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUUZEQJylhChe3ZB7pAXkYpwIIIq60cVA/6ATzYPiJI=;
 b=AdvuN8wpXjnvc2kcVPhjDLqV/0IAvUW9rWjfpcLvYBWEohXrgyRdsk3p3UGpYoCfKEdJiF
 TybQIITyGZ9g4wDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45E6D13AF3;
 Wed, 30 Mar 2022 13:37:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t5/HDy5dRGKBWwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Wed, 30 Mar 2022 13:37:50 +0000
Message-ID: <c9f5b441-2f3f-f2c3-2c3c-32dd3f9595ae@suse.cz>
Date: Wed, 30 Mar 2022 15:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: rpalethorpe@suse.de, Cyril Hrubis <chrubis@suse.cz>
References: <20220310105533.3012-1-chrubis@suse.cz> <YinZzNWCiKalyWhd@yuki>
 <87ee2vclsf.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <87ee2vclsf.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/waitid10: Fix on ARM,
 PPC and possibly others
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

On 21. 03. 22 16:48, Richard Palethorpe wrote:
> I'm wondering if we should branch on the architecture. If it's x86[_64]
> then we only do divide by zero as it's reasonable to think that if the
> signal is not raised then this is a bug.

It's more likely to be a hardware bug/missing feature though. Do we
really care? I'd argue that removing the division altogether and just
calling raise(SIGFPE) in the child process is all we need in this
particular test.

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
