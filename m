Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D27063BD82D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 16:18:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C56F3C9339
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 16:18:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F058E3C181C
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 16:18:20 +0200 (CEST)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 042D6200997
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 16:18:20 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id r16so29280702ljk.9
 for <ltp@lists.linux.it>; Tue, 06 Jul 2021 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O88/UORH3bJ+JR/WiesyJQ4KYjhfm+pc+fy7srTN5IA=;
 b=oyw9QfsyyMvxwMR9f/wa3rfoVG5b8gQXKEkSSEEhCP0eyQ4AVSEbKqJ4Ht/A3AoxF5
 TIFKgJ2aj4w+TcFWN1I3s6pZVdPgd8sKdR20m8i4qPj6R350Ptlu2ZWKx6NzLg2wolA7
 8zDEYtE6Sg2eyw6/Qj2u8tY/d14318a0DbviuGWnt8lzGtOd4xNsuEwHhErIOlGFKmXn
 wirZy3AnvE7xHiaVObdA8lBSvkXaYiekF6+uktzrK/43iyg24IkgDxsikeyE+8Q9E/AX
 EvEDMSBZEHDWxH7QxHRoN8ilpfm4FcpUXcO37kby7G4tty4wcVB5bOqLD9FHBt/sEk/F
 dj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O88/UORH3bJ+JR/WiesyJQ4KYjhfm+pc+fy7srTN5IA=;
 b=Kt9KMVGI4lfgzYEnk2vBeBlaUvoytEuhoLt7qR9Z7NgXofa7IaUyHDKjtWqBZ1OSo5
 tHrxQjFeIlwcSlHC9//Yr1NaWDfL2OgQzwfV/dALNyHTX84jUBZuAy5ypidB4pPbYEMf
 9oXnlFyZGs6Z+XtBP8jTeUCwJf4HOZIDt054ixbryuOSLxNCUlqoPQrRNOL4yUAqnKXK
 YmMCEkSCjOu0GtiH+Oly1/GTkffZV1TZksn1RLg9/9fADqeViCIXQoLPgxQc7QAQpf5P
 DIJ8+AqAEkSdLReezmQr+MZW1EBCZ57MXL8Ev3s9J6HKWOevy+/B1lcZ+8zoJeVwfOg0
 y5jA==
X-Gm-Message-State: AOAM530T19RyqVeLgiKkZW78wvRES9y1B1GNb2wcW4iItjk6j+PGSVn7
 QusylTV7ffCJI86mvEHdu9C+BYTCQDI6
X-Google-Smtp-Source: ABdhPJzSTGb4sBOi4dRxzx+gbXGXUmCEEHYa9ImlA/6/OLXzDA1unWj2bE2CIzQf+XeQSl8J0BtpBA==
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr15336792ljm.505.1625581099438; 
 Tue, 06 Jul 2021 07:18:19 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.5])
 by smtp.gmail.com with ESMTPSA id p4sm1407726lfk.222.2021.07.06.07.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:18:19 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: Li Wang <liwang@redhat.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
Message-ID: <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
Date: Tue, 6 Jul 2021 17:18:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06.07.2021 16:43, Alexey Kodanev wrote:
> Hi Li,
> On 06.07.2021 15:49, Li Wang wrote:
>> Hi Alexey,
>>
>> On Tue, Jul 6, 2021 at 6:59 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com <mailto:aleksei.kodanev@bell-sw.com>> wrote:
>>
>>     It's unlikely, but still possible that some of them could be
>>     created during the test as well, so the patch only checks
>>     errno.
>>
>>
>> Thanks for fixing this, seems the msgget03 has this problem as well.
>> https://github.com/linux-test-project/ltp/issues/842 <https://github.com/linux-test-project/ltp/issues/842>
> 
> Yes, it is the same, it can be easily reproduced:
> 
> $ ./msgget03
> tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
> msgget03.c:50: TINFO: The maximum number of message queues (32000) reached
> msgget03.c:29: TPASS: msgget(1627491660, 1536) : ENOSPC (28)
> 
> $ ipcmk -Q
> Message queue id: 32768
> 
> $ ./msgget03
> tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
> msgget03.c:46: TBROK: msgget failed unexpectedly: ENOSPC (28)
> 
> 
> We can fix it similarly.
> 

It's also possible that some resources will be freed during
the tests... perhaps, moving the loop to verify_*() is the
better option?

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index 76cf82cd3..5b760b1d6 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -26,29 +26,29 @@ static key_t msgkey;

 static void verify_msgget(void)
 {
-       TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
-               "msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
+       int num, res;
+
+       for (num = 0; num <= maxmsgs; ++num) {
+               res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
+               if (res == -1) {
+                       if (errno == ENOSPC) {
+                               tst_res(TPASS | TERRNO, "created queues %d", num);
+                               return;
+                       }
+                       tst_brk(TFAIL | TERRNO,
+                               "msgget failed unexpectedly, num %d", num);
+               }
+               queues[queue_cnt++] = res;
+       }
 }
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
