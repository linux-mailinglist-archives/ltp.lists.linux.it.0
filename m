Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A53B180C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 12:24:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 962BA3C6FDC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 12:24:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D5F13C30EA
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 12:24:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9C1DF1400517
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 12:24:10 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id F0EEF2196A
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624443849;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDe6Qpha37egxrw3q1apbBo7RQK9SID2xUgKpomTbzQ=;
 b=ZaAzjpVhvZr+t4onb3fUgIVCAp+pHJvp005DfY8wLLdpBLbht4RqEIjb4fc/mHF3CqLOwj
 +j9YhziPcbi+jRYukHp/B3nDMYUESDNFi8T5AkPkoJ9xxntDIKtOg/IbbwZMSTBFAhtxEu
 MlCU8rzjCWsUTnHkUEtUlUZBTFN0IuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624443849;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDe6Qpha37egxrw3q1apbBo7RQK9SID2xUgKpomTbzQ=;
 b=kzYF3pCItWdOevGO2rcjlMPmJ8+3+teybSETIPTkSXxE6kAYSLuJq6Lu6D1eR9TaCJLCIl
 Na+QUkbRuQbgCSDw==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8EA82A3B8A;
 Wed, 23 Jun 2021 10:24:09 +0000 (UTC)
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com> <YMirQoiYRYsDP7Sb@yuki>
 <87czsk51fc.fsf@suse.de> <1e7ecce7-2e46-ea46-3c5b-357d53a238c3@suse.cz>
 <YNHoS1L+0toUtAWT@yuki> <3dfda1bd-3829-7188-6add-e1755e91df4f@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <3dfda1bd-3829-7188-6add-e1755e91df4f@suse.cz>
Message-ID: <87wnqk516f.fsf@suse.de>
Date: Wed, 23 Jun 2021 11:24:08 +0100
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> On 22. 06. 21 15:40, Cyril Hrubis wrote:
>> Hi!
>>>> The test author is guaranteed that the library will not set TST_ERR
>>>> except via the TEST macro and similar.
>>>
>>> Hi, who decided to guarantee this and where is the guarantee documented?
>
> Guaranteeing that TST_RET and TST_ERR will not be modified makes sense
> for SAFE_SYSCALL()s because they will be used extensively throughout
> test code. But the case is not so clear for primarily setup()/cleanup()
> functions like the af_alg, rtnetlink and netdevice libraries. And note
> that the rtnetlink library allows you to check ACKs manually without
> calling the two functions which will modify TST_ERR.

Cyril said not to use it (on my CGroups patch set) and when I thought
about it, it made a lot of sense. I don't want to discuss it again here,
we can do that on a doc RFC.

>
> So again, where is the extent of this guarantee documented? I haven't
> found any mention of it in the doc/ dir and Richie didn't add any docs
> changes in his patchset either. Documenting this is necessary for both
> test writers and library maintainers.

Yes, it needs documenting, we should have done that once the discussions
concluded. I think this highlights a process issue. I don't really know
where to put such a rule. I can just arbitrarily put it in the API docs
somewhere, but that is suboptimal IMO.

As well as explanatory API documentation I think we need a simple
machine readable document which lists rules like this (e.g. CSV file
with ID and description columns). Then we can have a process for
deciding on rules like this. Where someone makes an RFC patch to update
the rule.

I also think we need an automated way of enforcing (some of) these rules
and making test authors aware of them. Which is why I'm trying to create
a SA tool specifically for LTP. In the SA error message we can list the
ID of the rule it violates.

I can add this to the Sparse patch set with the TEST macro and
TST_RET,TST_ERR rules.

The problem with documentation is that people do not read it once their
code works. Also it is easy to miss or forget about something like
TST_ERR being set.

>
>>> Changing the return value to always return errno will be a major PITA
>>> because 95% of error handling happens after some safe_syscall() which
>>> clobbers errno by calling tst_brk() after failure. And if you only want
>>> to return error codes from rtnetlink ACK messages, then there's the
>>> problem what to return when a safe_syscall() fails during cleanup().
>> 
>> For the current code it would be as easy as:
>
> That code will only result in RTNL_SEND_VALIDATE() always returning 0
> regardless of success or failure, except when tst_brk() terminates the
> whole program.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
