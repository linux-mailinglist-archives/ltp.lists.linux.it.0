Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 249413E1540
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 15:04:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D66F63C7DB8
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 15:04:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 704F93C5F73
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 15:04:01 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6C5511A00E0C
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 15:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeBE/SfKCclXm6Htv7ILmcZurHzYFgRfgjE2UZIru0s=;
 b=DwnLJ8uMJI1COIhyg/6EZhKjJvW+QUYIJs3MzpxltdZfLbEe9GAfFKhNhldALMOvnJx0+W
 XcYUCsPjvi/nkYKLssQIjbyAIIxmef6J5mJ87HeZNjtJz8chmqkJTIy6V3COzCNDIBaDKp
 /n9jCA68ipfRtFkHbqH2Ito8sw4KCBI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-VgCXX1chPpKU7tQBr90-QA-1; Thu, 05 Aug 2021 09:03:57 -0400
X-MC-Unique: VgCXX1chPpKU7tQBr90-QA-1
Received: by mail-yb1-f198.google.com with SMTP id
 d69-20020a25e6480000b02904f4a117bd74so6170257ybh.17
 for <ltp@lists.linux.it>; Thu, 05 Aug 2021 06:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeBE/SfKCclXm6Htv7ILmcZurHzYFgRfgjE2UZIru0s=;
 b=J80THSRfgbm74flodmCTzssay4KNDf2J1J+4K/tFkSEJcLj/VJ9WFoabJBB4jZ9uae
 lha3LmG6VMtedLSkp+V/2CEq998wy/nGrSKEWN8XWo43upmuvjWnUsdXH72cBowWFhJO
 y3uOQVZWg+AX80FFQY6fCDI5heKYTL3LpmHIcIi50DOL6hMEgOFcvpHAdxm7tMDAn2vz
 Pq+xfssIMS0qASUDXFvj6iqWX/TYHffCN28g9XrzHKff3uJhE3jPwhtobUcOdILM26w5
 jX2BKnlTP3IAQOr2MbNlT5T2TZNWajYvwNHngVFdY41WpfMfwMl9TaJYSN+FkVJnEDtN
 zOUw==
X-Gm-Message-State: AOAM532D2zNc13f/97sll2+vTniGkQh1dMTfUmU/1yboDrWSaODZfLKn
 pEm6BXmJfD8JfK2xbXSR75fNXchINmgwKjIA45l1a4e/UO0Q573s13+lzhP3hlVdv9nN+Z+oxS7
 YW8PEwB18SsJkhgEN9BDQJueqRFk=
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr5986719ybn.286.1628168636033; 
 Thu, 05 Aug 2021 06:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXQrwVbeQqe/R8bCipVZuY/m3UKMS3dqMRMy2FAANnhIW4ORXA7DRIO1XAUbcq7L/P877YvRY/7dOuRGZXrmM=
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr5986694ybn.286.1628168635828; 
 Thu, 05 Aug 2021 06:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 5 Aug 2021 21:03:44 +0800
Message-ID: <CAEemH2cf2b+xhrfD+BGVhZ59T4wOm=N+KxhYdVKhhQ9aF441YQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/3] libs/libnewipc: Alter get_used_queues api
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
Content-Type: multipart/mixed; boundary="===============1423298657=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1423298657==
Content-Type: multipart/alternative; boundary="0000000000002c5fcd05c8cf8d37"

--0000000000002c5fcd05c8cf8d37
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

I have just gone through all of the discussions on this topic
and am feeling this method is not quite perfect but currently
I have no better idea.

So, I agree to apply the method and see how it performs in
real test executing.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000002c5fcd05c8cf8d37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I ha=
ve just gone through all of the discussions on this topic</div><div class=
=3D"gmail_default" style=3D"font-size:small">and am feeling this method is =
not quite perfect but currently</div><div class=3D"gmail_default" style=3D"=
font-size:small">I have no better idea.=C2=A0=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">So, I agree to apply the method and see how it p=
erforms in</div><div class=3D"gmail_default" style=3D"font-size:small">real=
 test executing.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Re=
viewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blan=
k">liwang@redhat.com</a>&gt;</div></div><div><br></div>-- <br><div dir=3D"l=
tr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--0000000000002c5fcd05c8cf8d37--


--===============1423298657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1423298657==--

