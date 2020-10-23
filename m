Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6689E296872
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 04:10:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F30823C3240
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 04:10:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D2D8C3C24E4
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 04:10:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9210A1A01010
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 04:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603419014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hKfC3vhqYcWbOHuJnDBiMlq7q9gHZ1HX9nl5svsvGzw=;
 b=iI9kfsS9T2iWEfkBNoPN34YhTs4JslAQW3TbQVe2BWA6rFOJpzgRFf9TBF4ITrcilexiLI
 CKiS018gavpFnOMCTuI1JCAWz+sQCjzX2pUXOFZjJwjr0xd5IKM5rf7Cqzg6kNzv9UYLvW
 qNxl1ZDINs6thpCDBbbYPvdvGEBQTjo=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-KRNBE22RN462n5UxYyUuuA-1; Thu, 22 Oct 2020 22:10:11 -0400
X-MC-Unique: KRNBE22RN462n5UxYyUuuA-1
Received: by mail-yb1-f200.google.com with SMTP id z4so197092ybk.15
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 19:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKfC3vhqYcWbOHuJnDBiMlq7q9gHZ1HX9nl5svsvGzw=;
 b=ixi4YoSIvIyJhoIRoZu4V1bCNoKbvWBosM3TqIIDpGD8O6rXTmg3R8+HqD90aZJc0M
 DdZqzwPGhciRA3cQRsfGvsdueA6qisinEZvMEkxPIGzghN5VTEOJe8acAAhPOUKcjov0
 z4LLOaCAzn5jBye42qy84wLySV5jSbAW6ZF05GamoziT9lLojwlc6ml6/98QrW8Hlj5l
 KnccND4zs9UzyloxsKw4N4jXN9/3UTqDo2OmVH4yRxhkBesmYv8B34FCKOR3CxzmU/Qr
 sexzxrJ9e+RRqB7+8yHN9JzDBgPzx97UUDep4fgSyRKq4oUOL37XvFHpjdERN7dN69Kt
 VPng==
X-Gm-Message-State: AOAM531oKTG24EOzxrW27ipYziIgrcSaiFvMxmj4a/y/R2g4I2/7+XST
 P7fy+TMrCYP+P4VxFITJntVa8UAy2VAQIZ5uURW07/vqZ4MqctLuUFPcqUiK1B+bVE+0L6Dl8Cp
 ToECDhwmrUqfF9dRxrNyggTVFgiA=
X-Received: by 2002:a25:3183:: with SMTP id x125mr359376ybx.252.1603419010511; 
 Thu, 22 Oct 2020 19:10:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR7ch3s6HxTE5W5Km926UAPQABbpQYX+RqrVGdHAHQC1Kq0xfJfRx2Ua8doU9uHt4m2dRgPj3UGq6Se/QRd9E=
X-Received: by 2002:a25:3183:: with SMTP id x125mr359351ybx.252.1603419010199; 
 Thu, 22 Oct 2020 19:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <5F913024.7050303@cn.fujitsu.com>
 <1603352029-11446-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1603352029-11446-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Oct 2020 10:09:58 +0800
Message-ID: <CAEemH2enndeLbZ8Kr8EgVEc1OF7znrtB4vJwpacpBxyTY7YdGA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Remove ftime and sys/timeb.h
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

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> The two case uses ftime to get the current milliseconds and it was
> used to generate random value. Using gettimeofday() to get the microseconds
> can reach the same aim.
>
> This also fixes the travis build error[1] on Fedora:Rawhide because the <sys/timeb.h>
> has been deprecated[2].
>
> [1] https://travis-ci.org/github/linux-test-project/ltp/jobs/737698948
> [2] https://www.spinics.net/lists/fedora-devel/msg279545.html
>
> Reviewed-by: Li Wang <liwang@redhat.com>
> Acked-by: Jan Stancek <jstancek@redhat.com>
> Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Pushed, thanks!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
