Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD13DE9BE
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:35:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D691B3C57B8
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:35:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 450D03C2AB9
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:35:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AEA6C6008F0
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:35:55 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F394C1FD6D
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627983354;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oJjpQVQoISDhxXMaGTAy+CeDs4DKh++fPegrnCfhyBI=;
 b=tvvM2Q6MtwzTU9p0LgKmQ2hcJNMEWd3eCIXBJhxQLVGWKiyUwyM165WuN3GjmjZdqd6GJJ
 oIZsq751XqIe2BfZM2mSO2zp++gNtMzTkKO8Msku/zEmQ1zbAZ4J2yBbGDHaNixrMPpkrx
 ixtM129bVEBgEXj6U/oDtp89+1VqKKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627983354;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oJjpQVQoISDhxXMaGTAy+CeDs4DKh++fPegrnCfhyBI=;
 b=GprIX3CbknFO1h0FFOz/Lt/S0CKXuqMix1w6OnO6PHcXWYIHquL2DF7iH5AjajVI5lIb+b
 tEMum2kavy2pt4Aw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B5FDAA3BC9;
 Tue,  3 Aug 2021 09:35:54 +0000 (UTC)
References: <20210803070520.30885-1-rpalethorpe@suse.com>
 <20210803083836.8612-1-rpalethorpe@suse.com>
 <20210803083836.8612-2-rpalethorpe@suse.com>
 <731330a9-f374-2908-538e-3bb115897ab0@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <731330a9-f374-2908-538e-3bb115897ab0@suse.cz>
Date: Tue, 03 Aug 2021 10:35:54 +0100
Message-ID: <87czquna4l.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add setsockopt08, CVE-2021-22555
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
Cc: Nicolai Stange <nstange@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Martin Doucha <mdoucha@suse.cz> writes:

> Hi,
> since this vulnerability is in the compat syscall wrappers, you should
> also copy the arch bits check from setsockopt03 setup().

+1

Will roll another patch after a delay.

>
> On 03. 08. 21 10:38, Richard Palethorpe via ltp wrote:
>> This is a copy and paste of Nicolai's reproducer. The main difference
>> is that I moved some code around. Of course I also used LTP library
>> features, but essentially it works the same.
>> 
>> There are some hard coded values which I do not like. I guess these
>> could be calculated or varied somehow. However I struggle to understand
>> what the kernel is doing. This perhaps needs more investigation. We
>> could try generalising this test and setsockopt03


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
