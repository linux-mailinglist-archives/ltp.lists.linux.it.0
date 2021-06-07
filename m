Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F639D7A1
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:44:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C145C3C7C01
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:44:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC1193C2691
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:44:02 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6AFA31400422
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623055440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4tJjgFxVwwzMsFmq+BWsYtm3XGDLBGyRHJ/3tRC0oUo=;
 b=i4S9Syn/pde03iqUaHzDTshCqjcINern/hOgsOPf0a7wO9r9CpZ7BMrImGpNtUVPg1mY1+
 QvCDfr3z7mxnrp+j16DWlmmq3K0VOwYk6XEVLRg0YRHxh0DePgRWEtRS4XYtq9P8nJ8P0v
 qde0Y27GudwEW8b+VIsSWHHCQa6H0Os=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-tninX5eDM5CI8gEY4lv-kw-1; Mon, 07 Jun 2021 04:43:58 -0400
X-MC-Unique: tninX5eDM5CI8gEY4lv-kw-1
Received: by mail-yb1-f197.google.com with SMTP id
 n129-20020a2527870000b02904ed02e1aab5so21418786ybn.21
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 01:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tJjgFxVwwzMsFmq+BWsYtm3XGDLBGyRHJ/3tRC0oUo=;
 b=rbfLr55KiQxS1czL0tmzZIjwvZQowJjQGpUn+M6j+hOUp2G36bH0Mg/s4aQLYemIFa
 peBKqAYjOG0Rnjoa5YHTCVgnuGj6RWkrLQXzgS5NRzZyHQHLw3CeHCFzG25qIy9T7hnR
 Tnbpru/9AF63MHaPUMgP2o7wnX5PZtFMfBH0YnutHn28fzfdtSOrZh5B7vEMEQ6zlAoQ
 4sS6/wlVGnLoE+lvx3xd6FL+aI48FapfckOSN+kQKzR9OYGWvYPGRlgwucalVTJLZju8
 /tLMprKSKECJocBoMCiSCMw2k6SALvbsgwfYIq0ZT8Ge7xMubAz7oXKNz7E1U3JYANtH
 W3Zg==
X-Gm-Message-State: AOAM533DH5F3hzWDzhJOpGqoCwVN0ET8ai6xLnymgIllvccimz+EL6Pb
 VdfO+EyV3KjyAB+sOI7duXnDBxyQ/wj6WbvdMkVeL36JfwqxOgdz8n2I5OSKVQNrYvIJb9x0SYm
 Uo4SqPlvknYN3TxpiJ0VXsyzpnc4=
X-Received: by 2002:a25:42d4:: with SMTP id p203mr22066420yba.97.1623055437923; 
 Mon, 07 Jun 2021 01:43:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnhi4lOX0n3xHc2uvkUMzl8Mh9eiv6aX1OyBbbFqCtqyPsyNTg7fFHfwelSvYEi5LVTGNWZjXTp/qdHZajJ1Q=
X-Received: by 2002:a25:42d4:: with SMTP id p203mr22066395yba.97.1623055437681; 
 Mon, 07 Jun 2021 01:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210607080742.21377-1-xieziyao@huawei.com>
In-Reply-To: <20210607080742.21377-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 7 Jun 2021 16:43:46 +0800
Message-ID: <CAEemH2cuUTYpgv2qiSw=_pWNkBqLGoiSVUHe3grrPKCnJBYg+Q@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fchown: Make output nicer and add checks
 before SAFE_CLOSE(fd)
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

Xie Ziyao <xieziyao@huawei.com> wrote:

> 1. Print values not variable names in TST_EXP_PASS().
> 2. Check if the fd has been opened in cleanup().

I helped tweak the format and pushed, thanks!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
