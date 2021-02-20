Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBA320442
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Feb 2021 08:00:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31FD63C4EED
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Feb 2021 08:00:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 47E343C4E69
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 08:00:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4C20F1401248
 for <ltp@lists.linux.it>; Sat, 20 Feb 2021 08:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613804414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00Du+0iYpYAU1qmO18g3XSisFwHk7LFx1IJ9KQK4Y4c=;
 b=Pjsc/UGpUKX9yry3BsHJKRLzQ0DnNJubsSUcRpWubx3Sk/xQGmHO9yfFj3QACLR/GUfzWg
 VLH/25Oxs7VPs8rGqGLTrzoO47fLQ4bOjLWdIavbJehgzf9L0+SLdyd8JgV7CIA/+pAGPU
 egQnXqwMxDDd2cL8ZVk+MirRfabRtC8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-U4GLPIhjOPW8rAXQ9_yhKg-1; Sat, 20 Feb 2021 02:00:11 -0500
X-MC-Unique: U4GLPIhjOPW8rAXQ9_yhKg-1
Received: by mail-yb1-f198.google.com with SMTP id i2so9572224ybl.16
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 23:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00Du+0iYpYAU1qmO18g3XSisFwHk7LFx1IJ9KQK4Y4c=;
 b=m2YgKfzc+Ws4s3elC4/1EsX5A+07T4xZpO9AoTalRHejBVut5UQmxyK3S+bPr0o0Yf
 TrXCRoG7nyom6cdf5sUtipwiuTSK2KlrfW9lT/HPnGli9n5Oiz3KfzvqKUj4NRk9Vc/v
 rGild0oJL9d1OezEvRdQ5Harmb9F7shNQ9BYih7Cpda9mv7/NixNm3J9LVN+5JrD1OlE
 HG7omRdbeACgCa6J1GQ+FwqgvAwzcLQg2N8KRVQEPAaUAd9o9M+BJRsYs7oqGuH1dM9O
 oCukTOSDUxt939F1ZZq1xrcJhvzN40QnSXdJNrZoVzzDD+yGTqUhjBMQxFEN6+yn7Tus
 Nf4w==
X-Gm-Message-State: AOAM532HNAIl3WkcnL7nsblEF3i6f/8ebEIMY3tM2C7dI3KB3SKCUhQl
 mEpUkkKNnGdAVhGXDfBh/Jtb5RiJtbm3WOv0f05qzVun0nwljiz7bIsiwKN3Ea/Cmyuuda/nXVA
 A9ALeAcNo+Ld60Vw3ejBTxbIlJ0U=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr19955063ybd.243.1613804411381; 
 Fri, 19 Feb 2021 23:00:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6T83frbVAnfT5cHQj/lAXvWF5EdPN57lUZqkztWLxSeNjYIxprW1YDVFbOYcJNSGUxPkDe6Q5TT5JSzMAn+k=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr19955047ybd.243.1613804411156; 
 Fri, 19 Feb 2021 23:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20210220050948.142027-1-zhaogongyi@huawei.com>
In-Reply-To: <20210220050948.142027-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 20 Feb 2021 14:59:59 +0800
Message-ID: <CAEemH2d3VYV7Vh9G9NEe4tZGj1aHEDbT_xqc3N0PTdWVe7Sm8A@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] openposix/fork/11-1.c: Clean up temporary file
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
Content-Type: multipart/mixed; boundary="===============0774199908=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0774199908==
Content-Type: multipart/alternative; boundary="000000000000aa12bb05bbbf1e4d"

--000000000000aa12bb05bbbf1e4d
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

Thanks for your work, patch applied.
I'll send a separate patch for the test report issue.

-- 
Regards,
Li Wang

--000000000000aa12bb05bbbf1e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for your work, patch applied.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I&#39;ll send a separate patch for the test report is=
sue.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000aa12bb05bbbf1e4d--


--===============0774199908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0774199908==--

