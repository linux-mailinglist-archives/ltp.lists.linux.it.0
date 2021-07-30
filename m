Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB83DB5F4
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 11:32:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6F953C6215
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 11:32:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A44D3C22F1
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 11:32:23 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7AAB710011B1
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 11:32:22 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 224529F953;
 Fri, 30 Jul 2021 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1627637541; bh=mIB0TQZdV3irJ6g7IieA+Mg1OmMxrxuNY74fjFwDjsw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=nzZDIcQxQsQwrILyUKYpfkKGxkyJ+K3Rh/sjA+aU5UR0ffZWyIAXs+XWrGOxNupFv
 XC5B8ZQPyDDmO+nK3sup7ZvuM2zYloeHLwAYjjWUg4geeKjX2hHFDXcDwLO2PITNyB
 C2/AoVFnkStmLq0UEygahR2nydroNMCcEFwukVo4=
To: Cyril Hrubis <chrubis@suse.cz>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>
References: <20210720101249.10118-1-aleksei.kodanev@bell-sw.com>
 <YQPCcew5Are2VrDh@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <0c978fd5-9772-ad4e-c14e-c8b4a8344506@jv-coder.de>
Date: Fri, 30 Jul 2021 11:32:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQPCcew5Are2VrDh@yuki>
Content-Language: en-US
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] crypto/af_alg02: thread termination fixes
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

Hi

On 7/30/2021 11:12 AM, Cyril Hrubis wrote:
> Hi!
>> On musl, pthread_kill() doesn't return ESRCH if thread id is not found
>> (POSIX only recommends to return ESRCH). Use tst_atomic_store/load()
>> instead, when waiting for the thread.
>>
>> Also, the thread's resources wasn't properly freed after the run(),
>> so adding pthread_join() should fix that.
> I do not think that we even need atomic operations here as we do not
> have competing threads setting the value, it should work fine with
> regular assignments as long as the completed variable is marked as
> volatile (which will prevent compiler mis-optimizations).

+1 Using a volatile variable should be enough here.
If only pthread_timedjoin_np was not _np... This is exactly the function 
that could be used here without any boilerplate.
But is the custom timeout handling in this test even required? Does the 
default timeout using SIGALRM not work?
The thread was introduced, because SIG_ALRM was apparently not able to 
interrupt the read call on linux < 4.14.
But even there it should be possible to interrupt pthread_join. So just 
replacing the whole loop with pthread_join should be enough.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
