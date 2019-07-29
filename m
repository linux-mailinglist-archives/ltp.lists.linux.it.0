Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC579788D2
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 11:47:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 089E93C1D61
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 11:47:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CE7CF3C1D14
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:47:51 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4821F1000543
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:47:45 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id 8so23694154uaz.11
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 02:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ot4IIyTFLJJ4iiIhqCYG05EhpaBm2g3nilDIOzZOeYE=;
 b=pJITT4AGirRiomtE2SHtt5AT4U4Ae89DeeBrGStJszjsyodZ/8uiGdJMRikTLaiP6j
 i+OZ99EQvxcBPnkNou20E/wlxGZxPwgcklX2CTR4W/3TARYr0UNYmtBdvYOnhujU2T6E
 gJgESpCP3fjU7gGnWsN8Rh45F9wxHfjktnAZcXP30f1EKD0SenLRyK0TMB4W/0fcKE8V
 bDSCcYVMIBrI9PEQIQR62bDX+vfas1e7Gp92OM4PTlXWvVS4soIeGfwnMacM9zEcx6EO
 SF8q9YHGZ9TL5dtCSczkBLvsmN7DbQ/dnScUbG6Vaw5FGbAU/5XLONjd+TCe3zLOOsJv
 jjlQ==
X-Gm-Message-State: APjAAAVmblTNM78f5ChzltokMg8Koqqm3z5/yZTLedenLZCmRMOlFEMr
 AKS4WlPodWUvSby2QOsiZuGWBcJXgXitbCdCvR0nlgYW6xbGsg==
X-Google-Smtp-Source: APXvYqyExDNBVPrFcGPtbOvGsx0mAjVQOL8aAQ96NwBiEh9pRMKwcDlQRZvRwqBjEBoKLUjx/Hc6X+fgm38MpfWZv24=
X-Received: by 2002:a9f:3105:: with SMTP id m5mr13887489uab.142.1564393669782; 
 Mon, 29 Jul 2019 02:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190726083701.9682-1-camann@suse.com>
In-Reply-To: <20190726083701.9682-1-camann@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Jul 2019 17:47:37 +0800
Message-ID: <CAEemH2caYaXAhHBR8UWHz7v-5kZdCO1mtK1pBrDOBBQHP-Zo4Q@mail.gmail.com>
To: Christian Amann <camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/timer_create: Add test for
 CVE-2017-18344
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

On Fri, Jul 26, 2019 at 4:37 PM Christian Amann <camann@suse.com> wrote:
>
> In kernels prior to 4.14.8 (missing commit cef31d9af908)
> the sigevent.sigev_notify field is not properly checked
> when creating a timer using timer_create(2).
> This can be used to read arbitrary kernel memory.
>
> Signed-off-by: Christian Amann <camann@suse.com>

Acked-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
