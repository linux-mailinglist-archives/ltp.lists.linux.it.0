Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E3B3889E0
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 10:53:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06BF83C3081
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 10:53:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A43AE3C01D9
 for <ltp@lists.linux.it>; Wed, 19 May 2021 10:53:13 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1DC306002DE
 for <ltp@lists.linux.it>; Wed, 19 May 2021 10:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621414391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xAvrGay6HRJLqC5B93CNTa/sgryj/H8z1BGHBP0ej94=;
 b=b9fyXukEyAPhNkq48ePByir0veaFI8co5i3BQEkdPLxt/g4T5Q1WjTdxHM8T//nCE/k+NB
 SkvWX3cueNbhwgIopNfZCv1yF6bZnVfQwDrtxhPZJD3rAGFDpvYbH5Sg2IoE84OtkK9cLR
 MgZzh6RLVmjig+1kOXTnYLwiCqqJvps=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-idXIB7WXOSi-i05GUeyi0w-1; Wed, 19 May 2021 04:53:09 -0400
X-MC-Unique: idXIB7WXOSi-i05GUeyi0w-1
Received: by mail-yb1-f199.google.com with SMTP id
 d20-20020a25add40000b02904f8960b23e8so17074102ybe.6
 for <ltp@lists.linux.it>; Wed, 19 May 2021 01:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAvrGay6HRJLqC5B93CNTa/sgryj/H8z1BGHBP0ej94=;
 b=li/zGWfPN9tefa47eSUhvlEZcUKJS2DduSX4PAx9i9X9DKmGzED7POMMllWdVchImg
 IgVYo4UQlM01ZWr58ngdraZ591zGKapvyKu1MR5h3u+jCGYoANPMe+MtshfFXRNobfRi
 gxUz4rhPDsPVU+FKTbqrCUX7lejYWgKJQ82IdKxi6evpsuXv24PxOosDj+dymn8PCs34
 Esnsbcf7cp8hIWxa8OMWKCfYnwS2mpHWiGo2O806aaCBFRJqPehEZCo0cUVEF6Ufy2ha
 gf7BcSJM0Tt1Fh8gTjgCrKp7zvfZS4jHdTrWhjgD6gb9uAKJjuqM1QZeXDOmtmD3EruZ
 rnew==
X-Gm-Message-State: AOAM5302YOQRHsljzaYy5FXmuU1UrR3KWeYFn0b1HcNewPEOTvqZQVLb
 J7bw8/lyn4PF17OH/aaXQW579wn2QcuxIIH384HmOubVTbw3IIAjf7czGmichc8afcVPcPU7rGt
 Y9u/sSBIJUw4jyRPF524OQXGbL/c=
X-Received: by 2002:a25:d186:: with SMTP id i128mr468970ybg.252.1621414389378; 
 Wed, 19 May 2021 01:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi2NozBP9bN2dQcFa6Ia3X2CDixxUB6dPJO1jqa6UD7tf2TqBPGl21/AdIwCZciAb85kmkaJ3H094BjgW2+8g=
X-Received: by 2002:a25:d186:: with SMTP id i128mr468951ybg.252.1621414389161; 
 Wed, 19 May 2021 01:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
 <d70f9e5f-0008-02aa-e099-2a8243c4b3fa@jv-coder.de>
In-Reply-To: <d70f9e5f-0008-02aa-e099-2a8243c4b3fa@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 May 2021 16:52:57 +0800
Message-ID: <CAEemH2cjXaSLv9pwr9wqEnj9w+e-Y3mALG0dBovx-yN6KjwreA@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> This works fine.
> +Reviewed-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> after my remarks are resolved.

Thanks for the above comments, I will fix them all in patch V2.

> But one more strange thing here.
> I wonder why this even works. $pid is used in _tst_kill_test and defined
> in _tst_setup_timer as a local variable.
> It looks like it is inherited through the call chain and since it is
> copied to the background process, it cannot be manipulated by the tests.
> Still I would vote for changing this at some point, because it is highly
> confusing.

+1

Agree, I look at it a while and seems a local variable can only be
visible in the sub-function/call-chain of SHELL.

But I vote to fix the problem in a separate patch, it'd be appreciated
if you help make the patch.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
