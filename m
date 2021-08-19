Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B84273F1207
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 05:41:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61F863C677C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 05:41:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 872CC3C248D
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 05:41:14 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 026FF1000EC2
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 05:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629344471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hYfT7+BSdAveupckhai3mopEMu7OkkqZtL+UtbWxm4I=;
 b=U0HmRhFH+cVje3vQQ/pen+pKVrKbnPbL8xllCD3zpneDYG57c2Erth8cbVzFd+sGDCJCOY
 T0yMUkS26BIyW+3iWtEetycMCCh2LKT3kuWY1lcdX6NkN0KqVzJ+jH2el0lB3dcWp/pd1i
 S1QLx0q+XkC5XK5syH2U/H1bgmsNcDg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-ClDjlvMEOymeuAiAzR2M8A-1; Wed, 18 Aug 2021 23:41:08 -0400
X-MC-Unique: ClDjlvMEOymeuAiAzR2M8A-1
Received: by mail-yb1-f198.google.com with SMTP id
 w200-20020a25c7d10000b02905585436b530so5182870ybe.21
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 20:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYfT7+BSdAveupckhai3mopEMu7OkkqZtL+UtbWxm4I=;
 b=sloHwVh6Sl/de9zP0+dCjwGDRsyWXpa62qJ9ZZ1aPENb0S6H77zRFMtLmmXqjbVKDO
 tounePcg+WwiPaw59tLRBpiaQHe4OlLrs4DLLsoENzIEBOmdJog199yuGdvvEsaAduZI
 32rkvBngR0ZrwSEqTYgOrRQw+GDlNgockG0N2QKxqemily+o1/7lk53CZHmRywOtmp7M
 9KkviuX1W7L8RXIPam2UBmKTuKEOPVNLlk/SO1nKQkzRE3PhEEfI18gRgjCO1axehLnc
 b/3sF4uAllaOV8Gl/46VVIH2IEy+pF078b0vaQmdoUvGVieZYJtgVaiFiP/CLCu5Ttiv
 OM7w==
X-Gm-Message-State: AOAM532sp3VvT+pk4q+qJJf3XwR4qNfFaq9zKXEwgFJxYgJf8SRbY+rV
 t5RDVW+G70TVKeMoUUle/Ka+QhwDe2KzLbc3c8+RUL/XLk2Vp8ZXK9wKgZPglL8WXNLDy/nWygn
 PYBGnqUJG/3M8HWSIrrDKRvRUZ+I=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr15996417ybc.86.1629344468221; 
 Wed, 18 Aug 2021 20:41:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx27JHbXpolzNsZL9aggAdCJS1sl51gWygGw6kg3juO47LyV1k6/r2WN9Y/4hoUNuzxnwA20XOOdDcF1SiDT6A=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr15996389ybc.86.1629344467864; 
 Wed, 18 Aug 2021 20:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210818110440.285-1-egor.petrov@oracle.com>
In-Reply-To: <20210818110440.285-1-egor.petrov@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Aug 2021 11:40:55 +0800
Message-ID: <CAEemH2cC36KjDTu7Z_WPxxcP+66EUT_8gtGU9XHQ-3gV46i47w@mail.gmail.com>
To: Egor Petrov <egor.petrov@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fixed SELinux path check in tst_get_enforce()
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
Content-Type: multipart/mixed; boundary="===============0581213112=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0581213112==
Content-Type: multipart/alternative; boundary="0000000000003963b505c9e15248"

--0000000000003963b505c9e15248
Content-Type: text/plain; charset="UTF-8"

Hi Egor,

Patch applied, thanks!

-- 
Regards,
Li Wang

--0000000000003963b505c9e15248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Egor,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Pa=
tch applied, thanks!</div></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--0000000000003963b505c9e15248--


--===============0581213112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0581213112==--

