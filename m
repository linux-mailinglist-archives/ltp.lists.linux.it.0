Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74359397095
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:50:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F345A3C7E64
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:50:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 519FA3C222C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:50:40 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A4E581400BCA
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622541038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E3KlOt/SC3//iMQfV10aDCZLMbMG2kaoVDTOp0EKm1Y=;
 b=FUWdkeOidHH6NeIVuHJ2dDv3F274kkPQ+DBhpWYkjB2tMw8rhQYLhXnLNIA57l11k94tXe
 fnWWF/93pjI9DAcjld/wuW6otFpnkCldubGO00enN0y7skDt9n/0ioAHK0giFMZOkEJmV6
 Vur14NR3TZqgxaGm37cdPkucw5UHv3w=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-udR2BxpAPSS7d0wSeXm_og-1; Tue, 01 Jun 2021 05:50:34 -0400
X-MC-Unique: udR2BxpAPSS7d0wSeXm_og-1
Received: by mail-yb1-f200.google.com with SMTP id
 s186-20020a2577c30000b02905353e16ab17so10043670ybc.20
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 02:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3KlOt/SC3//iMQfV10aDCZLMbMG2kaoVDTOp0EKm1Y=;
 b=QsLNtQoStg2Rsw5scdONqugEIIUTL4lvfJQSG04Era9ed//M2cUI+BNdkAdDVzYeKB
 /gYwEZAer/5/lsMovlNbqtI11/Y0nAhuihHIi+JHq4A22+UmbB245GEa0qgJdIBWL/l0
 ZcnlDd9CiRMoLuS1JKgb7Z7WoiMgsfThnflMxcbt1oGrvtUpM4Yc7BZ7w4vXvo/nPuUZ
 GXGVSkA0LDAkNDlEnqQ8+dtcv9F28NcCz6mN4LBkF1RuynvtFjExy14/yCxrxoqCYKSe
 tSqWXkUWVUSCrNIeHdgMNXCvyfSZO5Vd6r83teGjg0vhXVsGfcxStWdHIXKYDsdcYQ3E
 2YHQ==
X-Gm-Message-State: AOAM531xlzIuIJRuu7M5iAcAUleE/Kdfb7YrjBp6gso7alBeY/sQaTQE
 0JB/273U170wLbTXLxiuAinEGYexS1tcKfIaYoYXN+1QPZmz4RUdUoY8PUWsddu+PwT4a1UTqlT
 9qv3BzZeHHzclDotD6Z9XQ9NaHvk=
X-Received: by 2002:a5b:787:: with SMTP id b7mr37126306ybq.243.1622541033693; 
 Tue, 01 Jun 2021 02:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc8yNo777efMP/pPlKXziT5f0Bvdxgx0ttq+HUxeUrdFBw14M/uaVVa01XFfQ4d1d1fEjtcpesQPCkB0WsOj4=
X-Received: by 2002:a5b:787:: with SMTP id b7mr37126274ybq.243.1622541033455; 
 Tue, 01 Jun 2021 02:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210531165052.8731-1-pvorel@suse.cz>
 <20210531165052.8731-4-pvorel@suse.cz> <YLX69YxFykMahpoB@yuki>
In-Reply-To: <YLX69YxFykMahpoB@yuki>
From: Li Wang <liwang@redhat.com>
Date: Tue, 1 Jun 2021 17:50:21 +0800
Message-ID: <CAEemH2d4Q2H2L5oQ3kxu-zg6-4q3+ovMZAjcjVfktZzohoU=1w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH 3/3] CI: Move from Travis to GitHub Actions
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
Cc: LTP List <ltp@lists.linux.it>, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > Fixes: https://github.com/linux-test-project/ltp/issues/761
>
> Good work, thanks for doing this, acked.
>
> Also please do not forget to remove the travis user from LTP github repo
> once this is applied.

Btw, seems also need to remove Travis stuff from docs:).

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
