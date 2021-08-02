Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4573DCFCE
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 06:39:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D70543C8AB0
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 06:39:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E4943C53C4
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 06:39:53 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 53A181400512
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 06:39:52 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6A21C9F69E;
 Mon,  2 Aug 2021 04:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1627879190; bh=tf/LRMeSPMYcizhQ7Zg/1RdtopZjugz8s8oCWpB/xMw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=NA8ik0KX7gvAU+n3sjITVZjigWICUvm2LwLnAPIFKFMO2fKQA3PAYAm4GsZR3U3Nf
 LdTLuxsu6OsGAWS68ijcOUOGfcsCWLXC+OYAzaBdTOeXzCM0VZBe3z7u7tIH8UdchV
 lhJ2odcb4Yt47bTZfp8tsTXNPxck+CvYgeXt/Qjw=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210720101249.10118-1-aleksei.kodanev@bell-sw.com>
 <YQPCcew5Are2VrDh@yuki> <0c978fd5-9772-ad4e-c14e-c8b4a8344506@jv-coder.de>
 <CAEemH2d8sHSWCAst9-q6KiKfJTSULYS8-KivWHrS04mR6ZXjzQ@mail.gmail.com>
 <668aa923-dda1-b3ce-8f5e-042e3a2174f5@jv-coder.de> <YQPl9f6JYE8zlNrm@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <4c22b97d-a9de-d4ef-7486-5fe3c38582dd@jv-coder.de>
Date: Mon, 2 Aug 2021 06:39:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQPl9f6JYE8zlNrm@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 7/30/2021 1:43 PM, Cyril Hrubis wrote:
> Hi!
>>> That should work but no precise log to indicate where goes wrong,
>>> so I vote to go the loop way:).
>> Does it really matter? The being stuck in the read does not seem to be
>> the failure case tested with this test. Otherwise it would TFAIL.
>> Additionally the loop and "custom" timeout was only introduced at a
>> later stage of the test. Initially it relied on the default timeout
>> handling.
>> If my assumption, that being stuck in the read is not the failure case
>> of this test, then your argument is invalid. Your argument would work for
>> each and every line of code, that might be executed, when the timeout hits.
> The top level in the test actually says that for some kernels the read()
> does not return, which is a kernel bug so the test should report this
> case as a failure as well and also the commit that fixes this should be
> added to the tags structure.
Ups, yes sorry, should have read the whole test and not just assumed, 
that the not returning read was something else.
In that case +1 on keeping the custom handling, but maybe use FAIL and 
not BROK in that case?
I guess there is no other good reason, why the test can trigger the timeout

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
