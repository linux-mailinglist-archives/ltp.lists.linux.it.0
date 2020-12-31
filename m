Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BF2E7EAC
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 09:15:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 021773C555C
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 09:15:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8AEAA3C2863
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 09:15:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A7C15600970
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 09:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609402506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2XVHoHcZUlpfO8fsRtNSQpb12jjwgTuAAeCPfSuOyKo=;
 b=QeVC3TTDh+oipsrP4sNf8RO1jHRqXVKoCFjPwAak5+51Re7AlgL6BsGrEXJXXErfeQ8KEB
 Tbnh9lGIPVQ7GxcydGeT0Xo0ec86xBhutC3yuXZ6NjwwaZ0ncPz2woqQvfp97OJUlmjKQl
 BlQFaSPh/E1/H5GFnZVj/GU5dmHFOH4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-VUUfauH9NCS-I9FSWJUynQ-1; Thu, 31 Dec 2020 03:15:01 -0500
X-MC-Unique: VUUfauH9NCS-I9FSWJUynQ-1
Received: by mail-yb1-f200.google.com with SMTP id g67so32854236ybb.9
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 00:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XVHoHcZUlpfO8fsRtNSQpb12jjwgTuAAeCPfSuOyKo=;
 b=udpS9/PWPebd26T2NvXl9ogTyOTlpEpiZU4WUWMpKJjMHgpOn+9z7wpbMOf6Q/fpGL
 Oxyf/9QWJI2WqRkevP9ZxX1PCpouumrgTz8HPMd78JUk39oCQS2b06SzAxmQzx0C9S31
 X2cnqSKnMPPiMhpeqUjHmXxwFJegaRcdxVW3lcL8LsF04P2euOl8ZGJ+LuPogV1HSnHA
 S5/hxUhZv/Tq8dx56c1p5lCE+foMuWG35lFE7VF6yA6CT/VlEN6WF4numvDSxP4Mfl2d
 //lkUv9577hL0N8ccCzfwuiMQqncmmp8IZR+zzgTzgjd+Jlg5OIXnrnw5m5+/9jVIGXQ
 PxTw==
X-Gm-Message-State: AOAM530NyjWiMuhSnDg2MFJXUhPKe9TAAAL+XSlhsMY+tfFJN7dKy76z
 ADieOIHNVlYepJwQ12MTto8CvZO1yEqGXRHJ0j3caCYsNqWDypxN7FcYDcgQFO/LqoTg+G99a0M
 Q73Kl5ondmdFHHQu03IHJ/appzdg=
X-Received: by 2002:a25:d288:: with SMTP id
 j130mr82428948ybg.286.1609402501127; 
 Thu, 31 Dec 2020 00:15:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5Y3+2v8gkgQtXlMj4ny0NrVy4DZPu6MypBQ6n71sz93RP4HKwo0Kcgu8knsLmYtW5h5YVjWRYLSzhYX9zPH4=
X-Received: by 2002:a25:d288:: with SMTP id
 j130mr82428926ybg.286.1609402500885; 
 Thu, 31 Dec 2020 00:15:00 -0800 (PST)
MIME-Version: 1.0
References: <049a750ca35c6adc18e8aa6bc1f97d91c05d3429.1608274686.git.viresh.kumar@linaro.org>
In-Reply-To: <049a750ca35c6adc18e8aa6bc1f97d91c05d3429.1608274686.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Dec 2020 16:14:49 +0800
Message-ID: <CAEemH2fb3KDieYwrhWdc35B53A4HoaT2YkAGmz-6V9ZkfU=kbA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: init_module: Print test's name in
 messages
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0794693647=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0794693647==
Content-Type: multipart/alternative; boundary="0000000000005dc8d105b7be38be"

--0000000000005dc8d105b7be38be
Content-Type: text/plain; charset="UTF-8"

Pushed, thanks!

-- 
Regards,
Li Wang

--0000000000005dc8d105b7be38be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_default" st=
yle=3D"font-size:small">Pushed, thanks!</div></div><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--0000000000005dc8d105b7be38be--


--===============0794693647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0794693647==--

