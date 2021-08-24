Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA123F58FA
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 09:27:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 949BC3C318C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 09:27:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 19FC83C30C8
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 09:27:26 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D1FAB200C30
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 09:27:25 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 559ACA070D;
 Tue, 24 Aug 2021 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629790043; bh=u5JwCP8RIVPrkxbVbEj8vKVhV6VViU3ckShdueI46bQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=s+CqNxoEmhCnXPpDSSJdub0hAbRYtV1t1DnM/etBGuLoK8xTz+CWXI4/dBrq+1g1T
 WpY5mDbutAxf7Rlbfs3Fl65JFwLDlAIwQ/M5RwOkyhV4Qgafeibdc347TV/i6corKC
 3KXM/+57MeSE0YXMXk/5RKSYj7pOxDKWtcxsItn8=
To: Petr Vorel <pvorel@suse.cz>
References: <20210812043807.3497492-1-lkml@jv-coder.de>
 <20210812043807.3497492-2-lkml@jv-coder.de> <YR+Lc8aBnK6KBOnW@pevik>
 <d6443e3f-9859-82ff-7ba0-f8842cd2f437@jv-coder.de> <YSSRrEzZ2uSacXEM@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <5441d7fb-3a76-0160-8f48-b9c78be875dd@jv-coder.de>
Date: Tue, 24 Aug 2021 09:27:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSSRrEzZ2uSacXEM@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-1.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 2/2] pec: Improve reliability
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

Hi Petr,

On 8/24/2021 8:29 AM, Petr Vorel wrote:
> Hi Joerg,
>
> FYI, this patch breaks build:
>
> make[1]: Leaving directory 'ltp.git/lib'
> /usr/lib64/gcc/x86_64-suse-linux/11/../../../../x86_64-suse-linux/bin/ld: ../../../../lib/libltp.a(tst_checkpoint.o):ltp.git/lib/tst_checkpoint.c:36: multiple definition of `tst_futexes'; /tmp/ccITQEiq.o:ltp.git/testcases/kernel/connectors/pec/event_generator.c:168: first defined here
> collect2: error: ld returned 1 exit status
> make: *** [../../../../include/mk/rules.mk:37: event_generator] Error 1
Strange that it builds on my system... The symbol is indeed duplicated 
and a leftover from experimenting.
The declaration in event_generator.c can be removed.
Should I post a v3?

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
