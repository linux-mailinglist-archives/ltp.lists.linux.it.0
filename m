Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFD37670E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:32:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C22403C6F2E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:32:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 09BB13C1C5B
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:32:11 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 156F96011F8
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620397929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IoxejD873i5fN4TVkpLtvDqu3O4KWn8IcoRbwmMiJig=;
 b=DIGbjPVKg+fTwcXJRlaUDS/GUfoqg0sBFJKWJmTb6JWMKfg5rZvJkS6NC5RYWVXaEds7Gn
 yyRNBkmBsaV0drDpOcmAoz3drj+TSOiiCFqIoV1+dILByzmQEzHgW4/o9wyzafwQq99Jdo
 t7wa8RoDM1xZjL0IdG05EZz42jO4aKY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-qaRLG24gNJG9WdSuH3Msvw-1; Fri, 07 May 2021 10:32:08 -0400
X-MC-Unique: qaRLG24gNJG9WdSuH3Msvw-1
Received: by mail-yb1-f200.google.com with SMTP id
 c17-20020a5b09910000b02904f8953b50ddso460308ybq.10
 for <ltp@lists.linux.it>; Fri, 07 May 2021 07:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IoxejD873i5fN4TVkpLtvDqu3O4KWn8IcoRbwmMiJig=;
 b=QD/1uj6vhDnqynuyktd3LcQcPjlh+pFZBaQOQ3hIwlHsy9aoprjrWfYmb5hMlfy05f
 dDyXJ3HX+wHoStkmqEvJOSGxwjrIJPwumXk3SIMFJkR+gacN++9BFyS7/ybgtDLmfJAK
 H6B+2+XO+emiay5t4tTaTllcXJejnNV7/N0OSkBuL+dxuMK36KINVv9VJwKVa9aa9L/P
 9ajVNWBRa8NVF2pSqyKhS507Y+ioUO5B8P/iEZINieapb9p9R1ZRX2lpH8giQiZlqmjY
 LaL4tT+aQh55CyztOKhaWkcf9IZC5ZRqoUcE+nOb/z+9itI9xW7deNlo3L4AzMPAlpAm
 pe0g==
X-Gm-Message-State: AOAM531HOcz2DUUpE/xYDaPEZ57OcvtnvNJjr8MpSwuvtSOLqo11QnrH
 nxYyLptHJMnTOXKoQoqQ8yBlEv66X/YMoiooTh6YK4wVg3dVKuq7NaSq3ekJaaRLsKmxBzp+1aH
 g+Qh3xOkenWIQLK762+Jk9HHuME0=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr12919295ybp.366.1620397927839; 
 Fri, 07 May 2021 07:32:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIWW9bn7u8Kj51Nw0qEqW8ue8PvfpG+RQYK8UaqiXwPg0wP9AlJ/4PlQrj4mvhKwcFeEbctdsfZ4l+TO29FxY=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr12919276ybp.366.1620397927614; 
 Fri, 07 May 2021 07:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210507103258.232174-1-lkml@jv-coder.de>
 <20210507103258.232174-3-lkml@jv-coder.de>
 <CAEemH2fucJPyeTL-HZJD92ves7GLMaMHcaPzi8kS_qWL+x=Hcg@mail.gmail.com>
 <YJVNKebKn6jTvyG/@pevik>
In-Reply-To: <YJVNKebKn6jTvyG/@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 May 2021 22:31:56 +0800
Message-ID: <CAEemH2fgcFm4tsJdtj+J=sqvOy24w54QR+7M=Bhk2E7NDE68Gg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] shell: Prevent orphan timeout sleep
 processes
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > ================
> > (This below is not related to your patches)
>
> > But there is another issue I found that the timeout03 can NOT
> > be killed after timed out in calling cleanup(), the reason is
> > tst_brk stop the _tst_kill_test running in the background so that
> > it does not output as what we expected:
> Good catch, I'll try to have a look as well.

The simplest way I can think of is to let _tst_kill_test ignores
the TERM and INT signals. If you agree to this, we can fix it in
a separate patch:).

--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -439,6 +439,8 @@ _tst_kill_test()
 {
        local i=10

+       trap " " TERM INT
+
        tst_res TBROK "Test timeouted, sending SIGINT! If you are
running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
        kill -INT -$pid
        tst_sleep 100ms


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
