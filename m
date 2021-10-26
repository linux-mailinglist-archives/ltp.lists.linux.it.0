Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB943AA77
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 04:46:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A4913C6743
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 04:46:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B8913C643E
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 04:46:44 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 00B601A016E6
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 04:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635216401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUEWHF+VmIsW6YB9TGAURz+yEGcyYg8Azsh8fkijLGE=;
 b=A25zZSqkKiRBIVRvpdgGsByMDFtCPQLhvNwBP7810F/I0OpDMTjNoUR7UZARSPqDvyWOnN
 //Q15QHW/8cEGfSdy0/remXfIai4xOZ/pYpN5qppXJVfeIC4UNZc+Og/igKyOzMNrekqT4
 9G958/IQD8ub7kwcQD3Sm4Sig04ENhQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-bQOfY9FHMPyAqk_Vy0CB4Q-1; Mon, 25 Oct 2021 22:46:39 -0400
X-MC-Unique: bQOfY9FHMPyAqk_Vy0CB4Q-1
Received: by mail-yb1-f198.google.com with SMTP id
 r67-20020a252b46000000b005bea12c4befso20231560ybr.19
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 19:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUEWHF+VmIsW6YB9TGAURz+yEGcyYg8Azsh8fkijLGE=;
 b=nHoLbzUIBhyEllhu9/YvVnoebT3q16FMJawzd0liLhfiU9y1xUfkh3q2J/DuAQjG55
 AgNVjfh62LSwmMDdo+f1oBVkPoSFbAWAUMcc6i4FoFyUzQJfzthKO62pCre7iuvOZY7V
 SQymCptgebIVxP3Pi2s38ju4rHcQzlhf3hcKCgT+s6qxKL4Ygni+y2iZKaLbwfmbvZv8
 ifvjkRtZ7D3VXf0X0Xtjkzr/pPZ+SetXEVluNmEBKva2H9EF2Fc0gKlOnaP0QegiHR2B
 jNUSjMdqaRgvEkKACzI5tMx5HZnwiE9fVoGwNiKc54ZmgGQUWpV5hSTy55k3e4sdWt8C
 4pbw==
X-Gm-Message-State: AOAM533ClYm7QK/fyiyo6sHqMGJDtpz+PUlrYF4qsb27PRriYChMdBif
 l5qt0Hnf5mLi/hdLTuR+OzgETHRQm1qVNC8eDXGBH/h037hwXVGFTV5nI6sPvFIhAUqaeYyxhqW
 8iIoTu/k4LLXGCauU+jAIrYCmzik=
X-Received: by 2002:a25:e4c7:: with SMTP id
 b190mr20685742ybh.302.1635216399142; 
 Mon, 25 Oct 2021 19:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv/M3CiRCEk4SZBVbPbl8NxzbZMmjFBrI80i0b7OmppR6urcWKkop9HMc9N35D4YmuiSypYezWZ58zHXjzzFQ=
X-Received: by 2002:a25:e4c7:: with SMTP id
 b190mr20685725ybh.302.1635216398940; 
 Mon, 25 Oct 2021 19:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211021083547.111590-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211021083547.111590-1-krzysztof.kozlowski@canonical.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Oct 2021 10:46:26 +0800
Message-ID: <CAEemH2f70sTOy+tHUr187XaYMBdViN3x5dpXhYBznSpSpz1zkA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Subject: Re: [LTP] [PATCH v4 1/2] lib: memutils: respect minimum memory
 watermark when polluting memory
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
Content-Type: multipart/mixed; boundary="===============1870617005=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1870617005==
Content-Type: multipart/alternative; boundary="00000000000097120305cf387c91"

--00000000000097120305cf387c91
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Patchset pushed, thanks!

-- 
Regards,
Li Wang

--00000000000097120305cf387c91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Krzysztof,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Patchset pushed, thanks!</div></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--00000000000097120305cf387c91--


--===============1870617005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1870617005==--

