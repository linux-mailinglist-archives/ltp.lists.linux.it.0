Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C495DF3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 13:55:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B91E43C1CF5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 13:55:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 140723C1347
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 13:55:43 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CA26C1000BEE
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 13:55:36 +0200 (CEST)
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C60050F4D
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 11:55:41 +0000 (UTC)
Received: by mail-vs1-f70.google.com with SMTP id r129so1852763vsr.3
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 04:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ly6RZ7HYiznRxPILTOeznkz8vLnE8sNjmnOlPxKUfb8=;
 b=Gs+hbY65PtDI2pIX+SONnOdIoohS6PKwdsnaI91jP49oMG3QU0ChSq9wrdlCeQI12v
 vOeljg+dQqnm9w3j4CryEBVvWmeEP+xSh/4/YSiPwXIJa4mj0qLP4KIq/cGyNmGj/Mvx
 Qy22+rPpxUXyWizYq28NZ/r2F1IJL+sGJ+icmMauuZ37FFJXiXY73QPwDiv0BpwFpZcp
 IfX3HSYfJ9/nS5FgZ2pnnSgSWJnkTY3ASmu4ij5o0GDPs04huXhaJXie65d2XNQYGDlG
 TwDpIgCS7n90fnVQHIMBnsDeZIq4AcdY/V4W+7FiYzdmpabJZq2yxOXICGTn+bnYBAby
 P1HA==
X-Gm-Message-State: APjAAAUuioKWGH3ZUOYA3s2jGQRFAjPNMy9tiJj65muZnQxfM5cRLRIY
 hSDPn7PKi2OSUOiEDM4kC7+HNAdlUdimtSTiyOAxSsaeRJdOZT5jfVgoobZbCSVR60la2tBWk+I
 NsPixzR07wZJ8aQQLGipaqvvzuDw=
X-Received: by 2002:a1f:d586:: with SMTP id m128mr2510987vkg.24.1566302140600; 
 Tue, 20 Aug 2019 04:55:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3eZw/+21lzdT44DtyOI/Vu3bmys3AqVnIQu7/6TfVyge/DbRATQIEFU61lCEpplMq7o2JRSePMThmpkK8k/g=
X-Received: by 2002:a1f:d586:: with SMTP id m128mr2510980vkg.24.1566302140257; 
 Tue, 20 Aug 2019 04:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190812143941.8119-1-chrubis@suse.cz>
 <CAEemH2daVNZM+Jf2+vooouRFfSpjWTgfT9+KneAikE5ncLys_A@mail.gmail.com>
 <20190820112340.GA23164@rei.lan>
In-Reply-To: <20190820112340.GA23164@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 20 Aug 2019 19:55:29 +0800
Message-ID: <CAEemH2fmkhGA0KHt8vgJmcZnquqWT39cqCM8+d7N-JPg3Ngj9w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/11] Introduce guarded buffers
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

> > And I will keep going to review the patchset in the next few days.
> > Will let you know if I can find more issues.
>
> Have you found anything else or can I push the patchset?

Sure, it's ok to push them. Actually, I have read the patchset many
times, it looks pretty good to me.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
