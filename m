Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 636B5306CF9
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 06:32:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07A713C3021
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 06:32:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E98C53C2FE3
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 06:32:38 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C059E1000B5C
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 06:32:37 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 038C99F920;
 Thu, 28 Jan 2021 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1611811956; bh=hi/2jN6Pao27dJnv9hOL/nW8Rv+psrEfN+IKPjQJe5E=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Ub0BufYKr6MBFPBwzCdLxwxcrqRrFUPrJvZOmGO0xWwjJif/I33F9slvFkhqxcD2B
 zWtbvrkV3qBpfwywgf8bMLMPt6tQknmYHt6Hi6sm/2W6xvmcnB2eh22SVxhJropE6M
 jGxaNKASDqEkv1ofEAdCaq0HrL8+0Z4uOxU30tzk=
To: Petr Vorel <pvorel@suse.cz>
References: <20210125131746.74630-1-lkml@jv-coder.de> <YBG49Ge71bTx5LZF@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c01f4728-f8aa-7836-88c7-951ba506f8c3@jv-coder.de>
Date: Thu, 28 Jan 2021 06:33:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBG49Ge71bTx5LZF@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg/functional: Convert to newlib
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 1/27/2021 8:03 PM, Petr Vorel wrote:
> Hi,
>
> FYI there is bug related to these tests:
> https://github.com/linux-test-project/ltp/issues/780
Additionally there is
https://github.com/linux-test-project/ltp/issues/698
https://github.com/linux-test-project/ltp/issues/326
https://github.com/linux-test-project/ltp/issues/93

I guess the last one is invalid.
326 and 698 are basically duplicates due to inaccurate memory accounting 
in cgroups. The same as 780.
I did not fix these failures for now. I haven't checked the kernel sources.
There is a hint in the documentation for memory.usage_in_bytes "Of 
course, when necessary, it's synchronized.".
Maybe it is possible to force synchronization somehow.

I will look into this, after this is merged.
>
> Kind regards,
> Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
