Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028EA0017
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 12:43:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E92A3C1CFF
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 12:43:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D6B253C1822
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 12:43:30 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5F963201590
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 12:43:30 +0200 (CEST)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B6AE87630
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 10:43:28 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id g204so708297oif.14
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 03:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0W7YfSovapZg77e2uSB1m5J4GbHmyKnFS/Yj6WRqdUw=;
 b=bWNBTCAfdXztFxN75+w/W0lEYnwAABMNxFttGh+2k5py47vL0VFIvILYbwrI1O9cDw
 OT3PYpMHZLO9ZGqLct67Q0F2IICeWBptBQYtcOj3Z4De8hMXmle5O+zNjRtIShk4xXUj
 mfXSqWR3S1LJ0g+kclcpG6aDwh4sEKjllhjdudwl4zePaLZQk10gcvkhiBECGYPoCKH6
 71+9ePgsWe+E/jsmHgMXYS86UbKqqlUXX9KGG9r3Fol60qHBqdvRuGuy9iUy25plL8Ma
 xTJHi2ejD+x1Zk7TiveOuUe23T7zOkGmW5SmJHs9rSGcSjjTmEAdkk5KYwSHdYMaf89w
 7fIw==
X-Gm-Message-State: APjAAAX2A74YOdI5NyeauvqQP9BrlUYPrgyDGXSwu78ruuohSFJXFxw9
 W29dvAV4PUqjP3kG/mJC+pUlT7aOxCkSio+GtY0dSZSUredD0CUsLGiqC2wHgfZ5qA90DNEnhA3
 9w/A1b1crQZFkm94/htaeNJGD4Kk=
X-Received: by 2002:a05:6830:134a:: with SMTP id
 r10mr794755otq.17.1566989008056; 
 Wed, 28 Aug 2019 03:43:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzv2SwEWsiQmCrTbSKLhAe09rZk/1BsSo3olwejbQTDgxUwtbjsk+XjHNf1wVhGRco2RSOrf0dnXK6gI+oL3gM=
X-Received: by 2002:a05:6830:134a:: with SMTP id
 r10mr794738otq.17.1566989007825; 
 Wed, 28 Aug 2019 03:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190823094621.21747-1-rpalethorpe@suse.com>
In-Reply-To: <20190823094621.21747-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 28 Aug 2019 18:43:16 +0800
Message-ID: <CAEemH2dVf66_sKT4iBSEOXg+yFhpL7mAp4Uar5OT6vmbiMa0ZQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] capability: Introduce capability API
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
Cc: mmoese@suse.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> The capability will be dropped in between 'setup' and 'run'.

I'm not sure to put this cap function behind 'setup' is a better choice.

Although it provides more capability in different test phase and makes
test flexible, that also involves more complexity for LTP users,
sometimes test needs to spawn children in the 'setup' and do more
testing in next 'run' phase, which obviously makes us have to consider
more in this case writing.

Anyway, the patchset looks good. We can do some improvements in real
situations then.

    Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
