Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 112AA3BE496
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 10:48:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA5903C687D
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 10:48:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 471593C6863
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 10:48:04 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C8B2520076B
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 10:48:03 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B7F39A0476;
 Wed,  7 Jul 2021 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625647681; bh=8YzYQbWTbQj4PSxcH2kv+p4byJc4Dpn0J3/W+LVct+I=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=MmfN8WuGC465lUNqUH7U4CV2EGVV7iqZvPttxZ0nxhvn1u/BjOFGiWEqb86n6EHM7
 7fl0Hs691+7K/hqkrlDo+8DvwmmTFjJ+2JsAnorbyAONl+wMipuHixxf8B4KCiWxSy
 AHWwLQYf90lJLdTmma64xYATceUqp6g3fRh1tZic=
From: Joerg Vehlow <lkml@jv-coder.de>
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210707071838.27834-1-rpalethorpe@suse.com>
 <43e8b66b-04df-9c4f-c47b-aba13347b6d8@jv-coder.de>
Message-ID: <6c665478-d831-9e3f-470c-8538a399e4f7@jv-coder.de>
Date: Wed, 7 Jul 2021 10:48:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <43e8b66b-04df-9c4f-c47b-aba13347b6d8@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] kill13, CVE-2018-10124: Reproduce INT_MIN negation
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

Hi,

On 7/7/2021 10:35 AM, Joerg Vehlow wrote:
> Hi Richard,
>
> On 7/7/2021 9:18 AM, Richard Palethorpe via ltp wrote:
>>
> Results in INT_MIN? What does this mean or did you meant to write 
> results in ESRCH?
> Default negating int min in two's complement yields 0 (INT_MIN = 
> b1000... and negating means inverting the first bit -> thus 0).
Nevermind... Just checked. Looks like somehow x86 keeps -INT_MIN.
Now I know what you mean with "results in INT_MIN"

Joerg




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
