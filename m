Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A53DD58D
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:21:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0ADD3C8A76
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:21:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E9C83C4E18
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:21:10 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B206E10009DD
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:21:09 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B19559F69E;
 Mon,  2 Aug 2021 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1627906868; bh=MBC5uU7c3QLXISaCcpkpihXMB+4EIJ4fBTTchIc9Tlw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=nmUjyljvDi2oM3Qn9xtm/oT/Iwd6SqwSGgdQ/Yts9CyfYBBmhlqn32OUlczsHsMIb
 bMp9yZ0m7zYGkDTjM5J6PIyapx8gC3tdfBDdBc0X9FkEonvGR0ezhex/RXChxWOm+v
 W0ZoiNXbT/P002BEarK4mA1DHw8yd98GQnsBDvB4=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210730133155.31284-1-chrubis@suse.cz>
 <d99456d3-c3d3-a180-7d0c-55bc3042e63c@jv-coder.de> <YQfZLXZznHjvlGJW@yuki>
 <YQfaZsdzHbPrhCV0@yuki> <e51c9469-73e5-69db-f5ff-c2abfd72dc95@jv-coder.de>
 <YQfhszoCgVv1mGjf@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <d02ab79b-b52a-d4c6-33a4-c836c30a7523@jv-coder.de>
Date: Mon, 2 Aug 2021 14:21:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfhszoCgVv1mGjf@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: tst_device: Allow more control over the
 device size
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On 8/2/2021 2:14 PM, Cyril Hrubis wrote:
> Hi!
>> The usage of foo foo_ and foo__ does not really help in reading the code :)
>> There could also be some logic errors hiding, e.g.
>> tst_acquire_loop_device should probably not default to DEV_SIZE_MB at all.
>> The caller should be responsible for finding a correct size and the two
>> users of this function (tst_device [the binary] and
>> tst_acquire_device__) do pass a concrete value for size.
> Actually the tst_device binary does not pass a concrete size unless the
> shell code that calls it passes an optional parameter, so the fallback
> to DEV_SIZE_MB if size == 0 has to stay in the double underscore
> function. I will send a v2 that just replaces the second occurence of
> MAX() in tst_device.c for now as it looks to me that any singificant
> cleanup would require complete redesing of the interface and quite
> possibly rewrite of the last 16 tests that use the old API as a
> pre-requisite.
I think we maximized confusion.
I was not arguing about the defaulting to DEV_SIZE_MB in the double 
underscore function, but about the defaulting in the 
tst_acquire_loop_device function. This function is never called with 
size=0, because the call is either from the double underscore function, 
that defaults to DEV_SIZE_MB or from the tst_device binary, that only 
calls tst_acquire_loop_device if the 3 argument version (tst_device 
acquire [size [filename]]) is used and size is not allowed to be 0 in 
that case.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
