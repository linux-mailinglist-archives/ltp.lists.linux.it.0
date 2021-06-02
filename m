Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A0398E66
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06A3E3C560C
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76B2A3C54D7
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AF0E120075B
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 13F0534171;
 Wed,  2 Jun 2021 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622647136;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QHKCzfAOdTd605WITX6bba7GmgBq9P1l3pauKw6q7Yo=;
 b=qLlevYLNQsT3RVL2VD0S5hvoPE99c+Uc4lkFZrS48OT+Fgk/MEUxgIzCCi/2MgIOYQyytr
 A4IrJaQq1pXcDDW/n0QXm4dLUhzpSa3kcc0snZSB8S6YpvUSrf8iF89PPmJaJU8WlWB3JE
 Rlaql62LY3ebBaHy3V3MwMOR/WWCDjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622647136;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QHKCzfAOdTd605WITX6bba7GmgBq9P1l3pauKw6q7Yo=;
 b=c49kSGllCWBVhKZczIzGrcDy2W0MDVZcEhYZVASD3bnZICXZu8KudfUdQ44hsO2n1/IoWL
 jHwW1/YGGivVtHCg==
Received: by relay2.suse.de (Postfix, from userid 51)
 id 0E213A3BBD; Wed,  2 Jun 2021 15:54:44 +0000 (UTC)
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E5D63A4723;
 Wed,  2 Jun 2021 10:05:29 +0000 (UTC)
References: <20210601105521.27459-1-rpalethorpe@suse.com>
 <CAEemH2c2W1Z9W3dm2LoyMbtqJxtgZjEBHF8VDU3O1ZSJ2ZQmeA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2c2W1Z9W3dm2LoyMbtqJxtgZjEBHF8VDU3O1ZSJ2ZQmeA@mail.gmail.com>
Date: Wed, 02 Jun 2021 11:05:29 +0100
Message-ID: <87eedkk2dy.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.2 required=7.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/6] cfs_bandwidth01 and CGroup API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

>> This adds a test scheduler test which uses the cpu controller.
>>
>> Also included are some additions and fixes to the CGroup API related
>> to the test.
>>
>> V3:
>> * Reverse order of writing cpu.cfs_period_us and cpu.cfs_quota_us to fix V1.
>> * Add may_have_waiters to indicate we should try waking and cleaning up
>>   children during cleanup. At worst this can result in timeout warnings if there
>>   are less than 9 children waiting.
>>   Which is probably better than failing to cleanup the CGroups.
>
> I helped to test the patchset and push. Thanks~

Much thanks!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
