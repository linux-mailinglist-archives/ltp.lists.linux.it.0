Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 758527DDDAF
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Nov 2023 09:23:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 378C83CD4F7
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Nov 2023 09:23:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F41AB3CC87F
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 09:23:29 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4DEF6600C60
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 09:23:28 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 69F6521A3B
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698827007;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpV8Hm1NvRdhZpMHzwY5thz9zm5H7rcTe/JSEeS0tKM=;
 b=FkKEMd3MkX/YWwqcu0XY4g7Aq2hXVF9c6NBphS7R8XTNeaSw5bZkxshfZfEdYzGhtqRHR7
 gyJ7aJzazd+37iXLTE5HQPUDAdS8OFrpSn4LCAvoT9Jcf2cGZhFRNHlILIXqQQeaVFxtVi
 gXML4SBTaCxWCrb96Cj0TkILEYAbehU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698827007;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpV8Hm1NvRdhZpMHzwY5thz9zm5H7rcTe/JSEeS0tKM=;
 b=iWfdIVp3Zs5LM1MwkafzvLCgtH90Vef39kTtK604NXr4eAWliWJe+/tNJhj/XP5KKT3aik
 GJ9Sab1XnYt/+mAw==
Received: from g78 (rpalethorpe.tcp.ovpn1.nue.suse.de [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E796B2CDEE;
 Wed,  1 Nov 2023 08:23:26 +0000 (UTC)
References: <20230906080950.23155-1-andrea.cervesato@suse.de>
 <87a5sw10qb.fsf@suse.de> <87zfzzrvbc.fsf@suse.de> <ZUEkhFYIJogalhpq@yuki>
User-agent: mu4e 1.10.7; emacs 29.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 01 Nov 2023 08:11:14 +0000
Organization: Linux Private Site
In-reply-to: <ZUEkhFYIJogalhpq@yuki>
Message-ID: <87r0l9swzl.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Refactor fork12 using new LTP API
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> This test also randomly fails outside of a container. Also other tests
>> that are testing the limits. This makes me think more that setting lower
>> prlimits is needed. Also this rewrite gets higher priority.
>
> Just note that this test is not in syscalls runtest file but in the
> crashme runtest file, which contains highly questionable stuff.
>
> I guess that the original test does not really take things like
> overcommit and OMM into an account, so shifting the test goals by
> setting the RLIMIT_NPROC so that we effectively check that the
> limits are enforced is probably reasonable way how to fix the test.
> Either we do that or we remove fork12.c.

Looking at the setrlimit tests we already do this in setrlimit01 as
well.

I guess someone might want to test a fork bomb. However I don't see how
it could be a reliable or meaningful test unless you set reasonable
limits for the particular system that the test is running on.

Just a thought; IMO stress tests are better handled by a tool like
stress-ng and some bespoke scripts for a particular system. Or else we
have to create a framework inside LTP for deciding on and implementing
reasonable limits.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
