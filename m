Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E0390350
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:04:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 617893C77C1
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:04:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B3433C1A80
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:04:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE8CB200C87
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621951439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sk95rWweSXLwcPxAKvTjnxeFS2Q95/PAm6iK8UUF9zc=;
 b=bKLDQE5vA45s3tCi6otKKHx5bZFh1TDHw2pI+4PguRUeXR6tV9hxFXR0DzR3Dq2DJxo2m0
 pNs5aE42Rh6KO3ynxBHPcHR5RsqegdZqv1mV65Azu3WqKbfmEe3CvVmSJOyvgWt7whu8JT
 gGoEoHkfK9SxvKB9zLTDMGGYl08s1n0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621951439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sk95rWweSXLwcPxAKvTjnxeFS2Q95/PAm6iK8UUF9zc=;
 b=V/v5deV0PCr0jnJiIwfTN6gx7VGtc43KgIOzbZAcauSPUqT/7a3SnPl20n1h+k/mxqE6eD
 ixuApHt0oRhE5YBQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17A73AE34
 for <ltp@lists.linux.it>; Tue, 25 May 2021 14:03:59 +0000 (UTC)
References: <20210524144745.10887-1-rpalethorpe@suse.com>
 <YKzp0rxGfaxL1blw@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YKzp0rxGfaxL1blw@yuki>
Date: Tue, 25 May 2021 15:03:58 +0100
Message-ID: <87sg2akj01.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/4] Auto review and Coccinelle
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
>> I'm not sure how to integrate it with the build system. We may just
>> want to do something similar to the kernel. Also I guess we want to
>> have a way of checking patches sent to the mailing list.
>
> I guess that having it in travis as a post commit check would be better
> than nothing.
>
> Pre commit hook would be ideal but requiring coccinelle installed for
> LTP development would increase the bar for contribution too much I
> guess.

I fear this defeats my primary goal of giving very quick feedback
without involving patch submission. This makes me think of clang-tidy
(clang-tools?) again. It will probably be more difficult to write LTP
specific checks, but I guess every desktop Linux distro less than 10
years old has Clang?

I don't think there is much else I can do than try writing the same
check in clang as well. See how that goes...

Anyway, we could copy the kernel to some extent. Make it so running

make coccicheck

or

make clang-tidy

or more generic

make check

Will recursively run the checks on the files under the current
directory?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
