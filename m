Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1703B062C
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 15:49:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 957993C8E68
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 15:49:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A02263C2298
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 15:49:06 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1E3AD1400199
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 15:49:05 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F5AC1FD36;
 Tue, 22 Jun 2021 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624369745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHV0wkrkR+4W6OAp1euYaJv9/lIwfZvvEOW4obgML6Q=;
 b=pLsJk3bllEBXf7B6p6qNCEtKTPRiX5HftobGpLywbd1O0tevN62hJ3sFMPPwAafGVtEcgP
 VCfZbSqicc4/cOLU9kXfmsn/WetNcf/gKUnoZfxvLPLGq+P7XsCwuncPTzbKt+B3vp3jsW
 kbJneJxXU0ogdbOv8PYFoTQstp0Ki4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624369745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHV0wkrkR+4W6OAp1euYaJv9/lIwfZvvEOW4obgML6Q=;
 b=QOkMEPDi3bsi7WNDjWP4S/gkRhz7oV+eQ5dAtKfHag1Kgv8o3Lcolwj1q0SZUW4cteygXs
 w8SBGGMqnTF0uWDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4D46C118DD;
 Tue, 22 Jun 2021 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624369745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHV0wkrkR+4W6OAp1euYaJv9/lIwfZvvEOW4obgML6Q=;
 b=pLsJk3bllEBXf7B6p6qNCEtKTPRiX5HftobGpLywbd1O0tevN62hJ3sFMPPwAafGVtEcgP
 VCfZbSqicc4/cOLU9kXfmsn/WetNcf/gKUnoZfxvLPLGq+P7XsCwuncPTzbKt+B3vp3jsW
 kbJneJxXU0ogdbOv8PYFoTQstp0Ki4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624369745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHV0wkrkR+4W6OAp1euYaJv9/lIwfZvvEOW4obgML6Q=;
 b=QOkMEPDi3bsi7WNDjWP4S/gkRhz7oV+eQ5dAtKfHag1Kgv8o3Lcolwj1q0SZUW4cteygXs
 w8SBGGMqnTF0uWDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id G/gwEVHq0WAJRAAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Tue, 22 Jun 2021 13:49:05 +0000
To: rpalethorpe@suse.de, Cyril Hrubis <chrubis@suse.cz>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com> <YMirQoiYRYsDP7Sb@yuki>
 <87czsk51fc.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1e7ecce7-2e46-ea46-3c5b-357d53a238c3@suse.cz>
Date: Tue, 22 Jun 2021 15:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87czsk51fc.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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

On 15. 06. 21 9:40, Richard Palethorpe wrote:
> The test author is guaranteed that the library will not set TST_ERR
> except via the TEST macro and similar.

Hi, who decided to guarantee this and where is the guarantee documented?

I was planning to document that RTNL_SEND_VALIDATE() and
RTNL_CHECK_ACKS() will pass error codes found in rtnetlink ACK messages
through TST_ERR.

On 17. 06. 21 10:40, Richard Palethorpe wrote:
> Hello,
> 
> Cyril Hrubis <chrubis@suse.cz> writes:
>> I do not like this fix. If nothing else it's fragile and would make any
>> patch review for these libraries much harder.
>>
>> I would prefer having these functions modified to return the errors
>> instead even if I have to do the work.

Changing the return value to always return errno will be a major PITA
because 95% of error handling happens after some safe_syscall() which
clobbers errno by calling tst_brk() after failure. And if you only want
to return error codes from rtnetlink ACK messages, then there's the
problem what to return when a safe_syscall() fails during cleanup().

> I think there are some other issues here as well. Like the macros are
> not prefixed with SAFE_. A lot of the functions are not used or they are
> just used internally, but are not marked as static.

All the functions which are intended as internal-only are already static
in both tst_netlink.c and tst_netdevice.c. The macros are not prefixed
with SAFE_ because they're not simple syscall wrappers. They're prefixed
with RTNL_ and NETDEV_ instead.

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
